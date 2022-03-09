Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 713704D351F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 18:09:20 +0100 (CET)
Received: from localhost ([::1]:32782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRzoN-0008CK-IY
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 12:09:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nRyhm-0000XL-M3
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 10:58:26 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.222]:53222
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nRyhj-0006VD-QW
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 10:58:26 -0500
HMM_SOURCE_IP: 172.18.0.188:50874.599439676
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.138.180.164 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 06D50280029;
 Wed,  9 Mar 2022 23:58:06 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id 6cd8ea9dbbf34f65a57bf602ae17e33d for
 qemu-devel@nongnu.org; Wed, 09 Mar 2022 23:58:08 CST
X-Transaction-ID: 6cd8ea9dbbf34f65a57bf602ae17e33d
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [RFC PATCH 0/2] Add dirty page rate limit qtest
Date: Wed,  9 Mar 2022 23:57:59 +0800
Message-Id: <cover.1646840370.git.huangy81@chinatelecom.cn>
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
Cc: Markus Armbruster <armbru@redhat.com>, Hyman <huangy81@chinatelecom.cn>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

This patchset is dirtylimit qtest and plan to be a supplement
for patch series "support dirty restraint on vCPU".

Dirtylimit qtest use the existing bootsect in tests/migration/i386
to start test vm. The x86.bootsect repeatedly increments the
first byte of each page in a 100MB range, so it can be a workload
for dirtylimit test.

We limit dirtyrate at one-third of origin workload to check if
dirtylimit take effect, then query the dirtylimit info and cancel
it, so all the qmp interface can be covered.  

Since the dirtylimit has not been merged yet, this patchset is
posted for RFC.

Please review, thanks !

Yong.

Hyman Huang (2):
  migration-test: Export migration-test util funtions
  tests: Add dirty page rate limit test

 tests/qtest/dirtylimit-test.c   | 288 ++++++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build         |   2 +
 tests/qtest/migration-helpers.c |  95 +++++++++++++
 tests/qtest/migration-helpers.h |  15 +++
 tests/qtest/migration-test.c    | 102 --------------
 5 files changed, 400 insertions(+), 102 deletions(-)
 create mode 100644 tests/qtest/dirtylimit-test.c

-- 
1.8.3.1


