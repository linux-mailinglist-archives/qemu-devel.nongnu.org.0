Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DA228F4D7
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 16:35:42 +0200 (CEST)
Received: from localhost ([::1]:38220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kT4M1-000318-6T
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 10:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kT4Io-0008CY-SG
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 10:32:22 -0400
Received: from mx2.suse.de ([195.135.220.15]:55968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kT4In-0007cc-3C
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 10:32:22 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AC76CAC3C;
 Thu, 15 Oct 2020 14:32:19 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 0/3] tcg-cpus: split into 3 tcg variants
Date: Thu, 15 Oct 2020 16:32:14 +0200
Message-Id: <20201015143217.29337-1-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 01:21:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The purpose of this series is to split the tcg-cpus into
3 variants:

tcg_cpus_mttcg    (multithreaded tcg vcpus)
tcg_cpus_rr       (single threaded round robin vcpus)
tcg_cpus_icount   (same as RR, but using icount)

Ciao,

Claudio

v2 -> v3:

* comments: remove some, replace "vcpu" with "vCPU" (Philippe)
* tcg_cpus_mttcg.h: remove include completely after the last export is gone.
  (Richard)

v1 -> v2:

* fixed file preambles to be clearer (Philippe)
* reworked includes (Philippe)

* made a few symbols static, as they are private now.
* added a rename patch at the end to make naming more consistent.

* added Suggested-by: Richard, since it is his idea originally.

Claudio Fontana (3):
  accel/tcg: split CpusAccel into three TCG variants
  accel/tcg: split tcg_start_vcpu_thread
  accel/tcg: rename tcg-cpus functions to match module name

 accel/tcg/meson.build       |   9 +-
 accel/tcg/tcg-all.c         |  13 +-
 accel/tcg/tcg-cpus-icount.c | 147 +++++++++++
 accel/tcg/tcg-cpus-icount.h |  17 ++
 accel/tcg/tcg-cpus-mttcg.c  | 140 ++++++++++
 accel/tcg/tcg-cpus-rr.c     | 305 ++++++++++++++++++++++
 accel/tcg/tcg-cpus-rr.h     |  21 ++
 accel/tcg/tcg-cpus.c        | 504 +-----------------------------------
 accel/tcg/tcg-cpus.h        |  12 +-
 softmmu/icount.c            |   2 +-
 10 files changed, 669 insertions(+), 501 deletions(-)
 create mode 100644 accel/tcg/tcg-cpus-icount.c
 create mode 100644 accel/tcg/tcg-cpus-icount.h
 create mode 100644 accel/tcg/tcg-cpus-mttcg.c
 create mode 100644 accel/tcg/tcg-cpus-rr.c
 create mode 100644 accel/tcg/tcg-cpus-rr.h

-- 
2.26.2


