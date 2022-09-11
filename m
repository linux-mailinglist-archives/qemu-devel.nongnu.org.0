Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8B95B509B
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 20:33:06 +0200 (CEST)
Received: from localhost ([::1]:57110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXRlR-00036g-5k
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 14:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oXRXW-0002Rx-94
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 14:18:43 -0400
Received: from mout.gmx.net ([212.227.15.15]:47099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oXRXS-0002lp-DL
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 14:18:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662920315;
 bh=xI95ZtW2YAxB1bA4cBpkjh3a9HRqZTZ0Mu1f3lPFvkc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=PCqcJkgO8feKm/2wv63/DYfJEWxicJ/nG9xv0SR/XQDK7Cyy38RPU4KGA3HdKjYhl
 nDR4LlVtPcCRRTYmBfKfIm2Xbc/To6kd8FC4UBCbU52gzT7SGwVTQrs7endvxW/r9x
 CSLLj+NYd4FzRZrpfm9b1VQj1VnsgZUJI/xq5u/U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.178.88]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MSKyI-1ovgTj0Ziq-00SgTN; Sun, 11
 Sep 2022 20:18:35 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Cc: deller@gmx.de,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 12/12] linux-user: Add parameters of getrandom() syscall
 for strace
Date: Sun, 11 Sep 2022 20:18:30 +0200
Message-Id: <20220911181830.15851-13-deller@gmx.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911181830.15851-1-deller@gmx.de>
References: <20220911181830.15851-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:v6XiL6IY3YlyZnnm7dO/Yj5/PIE1nxAVQIbOTTCXamIn2vYGngZ
 xvsNIcUtsm6rif7EdMtqPDrDispUE9pcRm4KuFj6f703fPy4cqVqwD7Cs16Ynxb2pMb8eJD
 wqoCyZMj186p6ZWho2d/Z1kz5QyVLBI3TlsoWHh6ghttULpYWf7ykL9+bR7zBBjW2kjCPab
 0PenIOBcQUDE1MGNJv3NA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jyO6kFyeEj4=:StVUR55hSFZo6j4oTR6qSI
 Le2lFJBye4wshuLUkpKJhpubcYrx3dGlbFXm5SHnQx9p7oxaQiy6iQdmyvTYBVXNXUMkEQQem
 kakKNuaeXypy1wX6qmCsAffCvG/JygKcCoeOyIMMrD8P+4AwLWoB9M2ZTVrJQcSGnduk3dV9I
 BZvbmTln6X7HbJr+RunTbo1zpoHIICtu2p+U4dgdoeF25LIA90fA2/7LpAIKeFRt5LZ2cVJ6Z
 l1m3+11zU5oKFrh1mGxqS8DXUPTwjU/2QTlzSAtnOtczsOqrRgZGZVaHve4A05DWGaUzTICGG
 s4m/v0iczXk5DZDzicXLeW4f3JCjoSdG7zaPsCJdQBdBHIwGzZOCh36zT/PUTYZM26Qq9HHYG
 5DNGzJrNM+SvobaYu6kFUs/jy+FIuWifUwpP41z5v9+tSNtP3j8Rb38GgPx0MS5VCq9NM5Iwp
 EWxxkvGqQou4uXmeSSCbq9Crmu0RqS4f3G2v2UeYtuq73A3xn458YywcOwGjoWOli4VVu3HvW
 h7/TNbfp8nPCLDTyU94FhRJ/44U0WFi3h0rOAwPdk+LA6NUkY+3o34/ky57H+KSPpC16rK0hy
 FsVPO9fHi6aeyRLJvCO6sOFuiH8pvWINw8ivouv9fYbd26LURf4B7u3GBSM8QMNsSS5M+vmcG
 yx/QB0d+uCCtvwpZFJedBJrXHCsLHZCNUauVLFrSgYNAZ19DWyk12nERbHqbD0aL662uxSLKZ
 fM83IIT40IjUzqGzUzs8m1hhp/3TK0FuQkACYNUN1+6kUS9KsWm+L03YR8T0nhfhl55XOCMyh
 fVWLwcuY1JO0QY+RCg68ZUs8HSy0bJ2OX1X/fDcOmLfJaJ0BGxAzsJnu8KlvZy7l05PQdczOH
 s93yUjqVAvbVw9QpkUOOIXhBMg2GhNSdG2IJ4nWAvAPDwWAjnUt9en8D2MjzCaQGI3b+o9RJp
 5+lZqucIhd3SwA36RELxRNmOj6Ayh5AEsO6qJFW/rl4kvVkT26C+3wndI2GyHRhVPjqIOaUeG
 JnopQ6h8Z5gIB+svvadpmzH2KTrM2DYvaWAVKn9coJXg7m3jmL7UO63pVBoVya63u6YrDruGX
 ZRVrHlkV3+OdELZ8lIk5dDdw9L9EpEKT4nZRM+DlObSf1ciV6qVme5o2T6ZHjVZgBCTgH/oGW
 s6bRnfha8CTHUhGQo6xmu+h7Ef
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/strace.list | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index ad9ef94689..97d8ccadac 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -355,7 +355,7 @@
 { TARGET_NR_getpriority, "getpriority", "%s(%#x,%#x)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getrandom
-{ TARGET_NR_getrandom, "getrandom", NULL, NULL, NULL },
+{ TARGET_NR_getrandom, "getrandom", "%s(%p,%u,%d)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getresgid
 { TARGET_NR_getresgid, "getresgid" , NULL, NULL, NULL },
=2D-
2.37.2


