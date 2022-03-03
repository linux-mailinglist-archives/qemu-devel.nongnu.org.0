Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C62FE4CBBAE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 11:48:35 +0100 (CET)
Received: from localhost ([::1]:51702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPj0c-0002gH-8G
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 05:48:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nPixm-0001s3-91
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 05:45:38 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.222]:52147
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nPixj-0002b1-K0
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 05:45:37 -0500
HMM_SOURCE_IP: 172.18.0.218:43456.1888134411
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 7F0712800C0;
 Thu,  3 Mar 2022 18:45:17 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id d917d34589874f8ebcade52580c6e7b0 for
 qemu-devel@nongnu.org; Thu, 03 Mar 2022 18:45:22 CST
X-Transaction-ID: d917d34589874f8ebcade52580c6e7b0
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH] introduce dirty ring size for guestperf tool
Date: Thu,  3 Mar 2022 18:45:05 +0800
Message-Id: <cover.1646300129.git.huangy81@chinatelecom.cn>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Hyman Huang <huangy81@chinatelecom.cn>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Dirtylimit implementation has been reviewed in the past few months, if
things go well, it will be merged in the near future, which is the first
step to implement a new live migration feature. For more details refer to: 
https://lore.kernel.org/qemu-devel/cover.1646247968.git.huangy81@chinatelecom.cn/

The second step is to implement the "dirtylimit" capability of live
migration basing on the implementation in first step, and the main
logic is almost done, refer to: 
https://github.com/newfriday/qemu/commits/migration_dirtylimit_v1

Since "dirtylimit" capability of live migration is basing on dirty
ring, so if we want compare live migration used "dirtylimit" capability 
with other capabilities such as "auto-converge" in performance, set
dirty ring size when start vm using guestperf tool is an convenient way.

So let's introduce dirty ring size for guestperf tool. 

Hyman Huang (1):
  tests/migration: Introduce dirty-ring-size option into guestperf

 tests/migration/guestperf/engine.py   | 6 +++++-
 tests/migration/guestperf/hardware.py | 8 ++++++--
 tests/migration/guestperf/shell.py    | 6 +++++-
 3 files changed, 16 insertions(+), 4 deletions(-)

-- 
1.8.3.1


