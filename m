Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E44164554A1
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 07:13:15 +0100 (CET)
Received: from localhost ([::1]:41984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnafZ-0007cS-SF
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 01:13:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1mnabA-0005E7-9I
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 01:08:40 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.222]:51566
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1mnab7-0000Hd-8n
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 01:08:40 -0500
HMM_SOURCE_IP: 172.18.0.48:38028.1063050567
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id C19342800D5;
 Thu, 18 Nov 2021 14:08:12 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 6711e49758b5428d9108d42e9a0b0e8b for
 qemu-devel@nongnu.org; Thu, 18 Nov 2021 14:08:22 CST
X-Transaction-ID: 6711e49758b5428d9108d42e9a0b0e8b
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v1 0/3] support dirty restraint on vCPU
Date: Thu, 18 Nov 2021 14:07:19 +0800
Message-Id: <cover.1637214721.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.222;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: David Hildenbrand <david@redhat.com>, Hyman <huangy81@chinatelecom.cn>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

this patchset introduce a mechanism to impose dirty restraint
on vCPU, aiming to keep the vCPU running in a certain dirtyrate
given by user. dirty restraint on vCPU maybe an alternative
method to implement convergence logic for live migration,
which could improve guest memory performance during migration
compared with traditional method in theory.

For the current live migration implementation, the convergence
logic throttles all vCPUs of the VM, which has some side effects. 
-'read processes' on vCPU will be unnecessarily penalized
- throttle increase percentage step by step, which seems
  struggling to find the optimal throttle percentage when
  dirtyrate is high. 
- hard to predict the remaining time of migration if the
  throttling percentage reachs 99%

to a certain extent, the dirty restraint machnism can fix these
effects by throttling at vCPU granularity during migration.

the implementation is rather straightforward, we calculate
vCPU dirtyrate via the Dirty Ring mechanism periodically
as the commit 0e21bf246 "implement dirty-ring dirtyrate calculation"
does, for vCPU that be specified to impose dirty restraint,
we throttle it periodically as the auto-converge does, once after
throttling, we compare the quota dirtyrate with current dirtyrate,
if current dirtyrate is not under the quota, increase the throttling
percentage until current dirtyrate is under the quota.

this patchset is the basis of implmenting a new auto-converge method
for live migration, we introduce two qmp commands for impose/cancel
the dirty restraint on specified vCPU, so it also can be an independent
api to supply the upper app such as libvirt, which can use it to
implement the convergence logic during live migration, supplemented
with the qmp 'calc-dirty-rate' command or whatever. 

we post this patchset for RFC and any corrections and suggetions about
the implementation, api, throttleing algorithm or whatever are very
appreciated!

Please review, thanks !

Best Regards ! 

Hyman Huang (3):
  migration/dirtyrate: implement vCPU dirtyrate calculation periodically
  cpu-throttle: implement vCPU throttle
  cpus-common: implement dirty restraint on vCPU

 cpus-common.c                   |  45 ++++++
 include/exec/memory.h           |   5 +-
 include/hw/core/cpu.h           |   7 +
 include/sysemu/cpu-throttle.h   |  21 +++
 include/sysemu/dirtyrestraint.h |  22 +++
 migration/dirtyrate.c           | 125 +++++++++++++++++
 migration/dirtyrate.h           |   2 +
 qapi/misc.json                  |  44 ++++++
 softmmu/cpu-throttle.c          | 304 ++++++++++++++++++++++++++++++++++++++++
 softmmu/trace-events            |   5 +
 softmmu/vl.c                    |   1 +
 11 files changed, 580 insertions(+), 1 deletion(-)
 create mode 100644 include/sysemu/dirtyrestraint.h

-- 
1.8.3.1


