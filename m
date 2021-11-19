Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5DE456A7A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 07:55:07 +0100 (CET)
Received: from localhost ([::1]:40884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnxne-0000Rm-7b
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 01:55:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mnxA8-0004VT-Iv
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 01:14:16 -0500
Received: from mail.loongson.cn ([114.242.206.163]:47026 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mnxA5-0004aq-St
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 01:14:16 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj8+KQJdhSG0AAA--.1952S27; 
 Fri, 19 Nov 2021 14:13:57 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 25/26] target/loongarch: 'make check-tcg' support
Date: Fri, 19 Nov 2021 14:13:29 +0800
Message-Id: <1637302410-24632-26-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxj8+KQJdhSG0AAA--.1952S27
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


