Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 651EE387174
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:53:13 +0200 (CEST)
Received: from localhost ([::1]:41142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisfH-0003zB-Ug
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKs-0007sT-Ru
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:06 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:47325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKn-0007Ab-3b
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:06 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mi4un-1lDvEl0z6f-00e2Fr; Tue, 18
 May 2021 07:31:58 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 49/59] linux-user: Fix erroneous conversion in copy_file_range
Date: Tue, 18 May 2021 07:31:21 +0200
Message-Id: <20210518053131.87212-50-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2m66dtMcqhEvW3FNDh7Ye8Qhx7Nr2Ml7J22/uiW+dWCKjCYiX8F
 7WBt5OXG71vgCi2FvEvSGJ4O8uWBFUAKLz4edz/3lZ+e1Q20fa0UkfB6LniCs2XvCdZSr9g
 YthOUsB3nt9TwntAMrG3LklOon9Q22JmgueAEcajZOWxMWrsL3XpcJAdb1X12ty9x9gBQWo
 theXAsbMhjp4aqYNHJCpQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:r6sq6qhVhR4=:zIEYJvBNmKXYHhfWzvHYzX
 hDFq26l2awy8xtD/VYW2d0k0comP/3Jpr8Sz84ZMor3wYZwOwGUfjXsAYbY4eUEWcWRtZjPNa
 60xxkLHWJ5IHq/bON9tF/i+E1l9p83yTAXx18c/H/rao3MTX2f37DOU2dluLIUmOTi6DgmmOZ
 wxyf+xmQz6z2iVerEDYOom3AYlSeDg6QNj9ajTytS5X8xwqcFs4bWYx/XMOn5OeGHVowqidZA
 G2C7GzqtztBlksS6mupKLdlBEhT0OeYvFeyTEBIEQt11ym+HirOF56ycR/hmpdwJkWMfY8BhC
 TuUlK2vG/uZGqJpQuI7Aao8uIcrYhFTm3a0czc8DhbIEwMiehSMG0p7Rt5JSZ3IyBwXD/of27
 sMwDsfnyt5Jm0GDy9+iCoLFkiLXpn3icQe07LbWqwikKb2sMccQovPECSD9kT69SfbH2CUdO3
 AZFxCJtthT5krD1WU+3UkgGs2qd0Xb1lhSvUPJWPs88WEUu3b9Sq2uurAqj0O49t6AFecXuNa
 YOuSYZSy4Xql7Rdq4m427I=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Giuseppe Musacchio <thatlemon@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Giuseppe Musacchio <thatlemon@gmail.com>

The implicit cast from abi_long to size_t may introduce an intermediate
unwanted sign-extension of the value for 32bit targets running on 64bit
hosts.

Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210503174159.54302-3-thatlemon@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 4d52b2cfe36d..e05870c33884 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -13244,8 +13244,9 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 }
                 poutoff = &outoff;
             }
+            /* Do not sign-extend the count parameter. */
             ret = get_errno(safe_copy_file_range(arg1, pinoff, arg3, poutoff,
-                                                 arg5, arg6));
+                                                 (abi_ulong)arg5, arg6));
             if (!is_error(ret) && ret > 0) {
                 if (arg2) {
                     if (put_user_u64(inoff, arg2)) {
-- 
2.31.1


