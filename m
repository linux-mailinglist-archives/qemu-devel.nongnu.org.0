Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B4A3AE7E7
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 13:08:28 +0200 (CEST)
Received: from localhost ([::1]:47368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHn1-0000IZ-BU
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 07:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lvHjb-0002tp-Ko
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 07:04:55 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:47679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lvHjZ-0003xf-Ir
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 07:04:55 -0400
Received: from quad ([82.142.1.74]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MsqMq-1l6lY13DNQ-00t9uv; Mon, 21
 Jun 2021 13:04:49 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 7/9] linux-user: Check for ieee128 fpbits in PPC64 HWCAP2
 feature list
Date: Mon, 21 Jun 2021 13:04:43 +0200
Message-Id: <20210621110445.231771-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210621110445.231771-1-laurent@vivier.eu>
References: <20210621110445.231771-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PIwb6DNOfopOaQrbAnvm93XkwkVVkcGckwDMH0vcWJdJkm2Tnbq
 KuGwqD/CrQR8TYyxcFdKdWxlRgqvdTPR3B3MgDlKF4sWUPAxfQKKzyzkedaHjz2N3kQauKk
 07m52XWAP/XJSJUbdsMvtiWJsektEQGSjYknq21iuST+uGokHgJGIYTs9Cg50QbWjyQImGw
 fk4xu5HyKuL8/Q+14P9nQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:38uxI1WHtSw=:dXl0vNMatlCPs/7fs4v/jk
 oeYWYqzHcn//08K1NtAvLbpUFxCKilkUXjNaN6TDbdapjzMkX/OGPPcQA8c/y5+YRNtgBCBki
 euDmED4ucBVCUOXRKK73LOI6hN2lkW5MhOGX7WbletrfjHkBPe2s1xYuXnnTlQRW2OWOui7Qb
 BEZEInYG3HdEN5zRGf7JhBC1dMEpll7C5gozsZRxfBHjI+tteJpJEbtzLa34/rcQfH4p7VwzM
 +zPBiGYEuBGVqsFNFTMTxrfhm2dJ9XRkCOuEUPD9TtJjcfnJrj3gTnaMmqZ/YV1JqYu8xLYGy
 bgp6+dNSExw7mb/vqIQNL1kdtUu/QHqqzjnrChQ1kSBragScyhXNjY5L0FNoKnwZH0K8l2DIG
 I2dJsSJARvu7IF/zc5LxKRRAnMFZ5t1ifPSg4VZwqXaa1a+tsyK3KL/KBbrtJhAUr9qLxrXrj
 LQAjYMR9n92dWVLdpEooBPrGF+ac/kEp4psYEssm4E3r8UkZ7fOIA3CxpLveWDl3M0FoTIl4K
 xVIX26fzX3D07oEnpVofvc=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Florian Weimer <fweimer@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Khem Raj <raj.khem@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Khem Raj <raj.khem@gmail.com>

glibc 2.34 is now checking for this in hwcaps at
runtime [1] and failing to run the binary if machine
does not support 128bit IEEE fp

Fixes
Fatal glibc error: CPU lacks float128 support (POWER 9 or later required)

[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=d337345ce145e23c5f3a956f349d924fdf54ce2d;hp=eb24865637a271ab7dad13190330105eab0d478d

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Florian Weimer <fweimer@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210614191729.2981488-1-raj.khem@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 17ab06f612dd..e7dd18fd40bf 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -830,7 +830,7 @@ static uint32_t get_elf_hwcap2(void)
                   PPC2_ISA207S), QEMU_PPC_FEATURE2_ARCH_2_07 |
                   QEMU_PPC_FEATURE2_VEC_CRYPTO);
     GET_FEATURE2(PPC2_ISA300, QEMU_PPC_FEATURE2_ARCH_3_00 |
-                 QEMU_PPC_FEATURE2_DARN);
+                 QEMU_PPC_FEATURE2_DARN | QEMU_PPC_FEATURE2_HAS_IEEE128);
 
 #undef GET_FEATURE
 #undef GET_FEATURE2
-- 
2.31.1


