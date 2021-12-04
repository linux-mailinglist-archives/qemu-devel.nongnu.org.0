Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A944683C1
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 10:49:02 +0100 (CET)
Received: from localhost ([::1]:51358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtRfB-0007op-Fu
	for lists+qemu-devel@lfdr.de; Sat, 04 Dec 2021 04:49:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mtRNa-0004oI-Tx
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 04:30:50 -0500
Received: from mail.loongson.cn ([114.242.206.163]:38414 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mtRNJ-0003sI-Hh
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 04:30:50 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx78r1NKthpt0CAA--.6875S27; 
 Sat, 04 Dec 2021 17:29:53 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 25/26] target/loongarch: 'make check-tcg' support
Date: Sat,  4 Dec 2021 17:29:24 +0800
Message-Id: <1638610165-15036-26-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638610165-15036-1-git-send-email-gaosong@loongson.cn>
References: <1638610165-15036-1-git-send-email-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx78r1NKthpt0CAA--.6875S27
X-Coremail-Antispam: 1UD129KBjvdXoWrZry3Cw13trW5KFWkJF43ZFb_yoWfXrc_A3
 WSkr1kCF4YyF1xGr1rWFs5Gr1rW3y2vFyagF1DAw1fX39Fvan8ta1xAFsrXF15Zw45ZrnI
 qa97Aw4I9w18AjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, richard.henderson@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/configure.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 9b76f58..49a05ec 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -51,6 +51,7 @@ fi
 : ${cross_cc_cflags_armeb="-mbig-endian"}
 : ${cross_cc_hexagon="hexagon-unknown-linux-musl-clang"}
 : ${cross_cc_cflags_hexagon="-mv67 -O2 -static"}
+: ${cross_cc_loongarch64="loongarch64-unknown-linux-gnu-gcc"}
 : ${cross_cc_hppa="hppa-linux-gnu-gcc"}
 : ${cross_cc_i386="i686-linux-gnu-gcc"}
 : ${cross_cc_cflags_i386="-m32"}
-- 
1.8.3.1


