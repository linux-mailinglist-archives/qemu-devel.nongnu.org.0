Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED3D64B92E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 17:03:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p57jv-00037b-0m; Tue, 13 Dec 2022 11:02:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p57jq-000343-C6
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:02:39 -0500
Received: from mout.gmx.net ([212.227.17.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p57jo-0004g2-F7
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:02:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1670947346; bh=S0pT/CqA3WNkxGQGucpIde/X5Cyu++aoErL3U3gXmHs=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=SvgiGsHu1oi4p4g99VWefFQVKD5jlhDNJ7OIBlWh/JED+RqqzSE+BFIdpcwuve+11
 VvetOs1lCFB+PhmEZWhduMoipK5xETi9oE5CljLQVgFawkFBRfMYxvvFk7xQFMSvIe
 7Rz8m8i2fyo3bfXkXzoY4s+vGZSzkc6nKjjk3Ayl2X6navg/dsq5vXMRkjip9Bkb23
 l4TDrmZ1ztJtYFra190EO2iPDOiGNUDJIPZO1yTj+FTcRDLPUJmsbqV/a0mT9JjPpK
 co7ZoSWTxRJak0SdeUoBKblTVMRiXdqb5Nowf02bhNY+ieJAH4mMMgUgM5SNb+F7py
 LzpEsejpvDksw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([92.116.135.201]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvsJ5-1opNw50Blv-00stYZ; Tue, 13
 Dec 2022 17:02:26 +0100
Date: Tue, 13 Dec 2022 17:02:24 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH] linux-user: Add missing MAP_HUGETLB and MAP_STACK flags in
 strace
Message-ID: <Y5iiED4PpnGAHpyz@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:4WtSw6F28VfWqP8Vqh8QHX2BX8C1f155XJhK9k8NVvZVNW1134x
 TIAuo/+NJgXE7Jc5vCIubm0/kwwBsU7S07H9lQJ12FUkboP440Cbt+zXTPxMT8Gf6Im1bom
 Aw7YZIAnrQJi2AImEBUQDWFHwfKvAVB3ySJ8+wT+vJsiZjWynM9xFt/2hGTAuoKPTZ7S7LW
 oY5DQgybcMwiDrINMe2QA==
UI-OutboundReport: notjunk:1;M01:P0:y3NfjO8zCeY=;jksKTOHzyLj415oY8mA74/zz/Ms
 JIX1QDOih5wq0FT1LL71NJH0OPZvPcVy8NszlARJ5FbNysoAJoRHzzuSpaL+aTAPBeDTstH/M
 Wqwd9c8y+EV23+e8rohLorJC12PnVoL+Nb56KI75z2HQOm6Hb+RBDgXFuGrF9Gk3N7VIx2DIM
 KQ9cOiE5AYEk3RvhTqvXDQ99+v882uQ55gtG/SSNY1vyQBoPZoK7q4CiV6Oz04rUoB5pV5q/B
 W2HNk3OMr5VBgzeZzDYjpQ/XULBkMFrbEaobOFrxxG5xNCabW6vEra1tFgOsINCYt5cg0Fvdb
 zB4hnxCN6sHH1Ft1o1cbrurIQutMow13GxKUoY/JQKKdDeSPF7H94ZfhoXL1zXM22IdyCQB3D
 qjTYewxsSYQhZgaLneKnybv3xvO6qoUzI3ny7aNPWaMR/Msp3RwNBTDq7ys1ajQjpZ0T/r6pG
 eDf9LQ3f+RHVvJ2c3FAV22JjFOMrIdkzAWZRkfhwYHLi5P5yXm6dM1bvFPEleUycxwQqnUlZl
 RJZnyJgeGNbPrmgGv8Pu0c+uYI/UGeZQouIWDdqMQ8DIdAAFzSzYUmwc+bubizxwxPRkZTSab
 ZqwIuZbLRu7invW/M0dUCKkPQFBg6OdQfyPTJSdUq86o2+LKAXG2Q+adwfaE7GJXGz+BiV2mr
 QWZw3uxrdOMPZrDgJztiqaBi9UXSPg/FYROwJzk3Rwa8C92T4A224Xt1/NElYIydRlVSYk/G5
 1gHTWIb4KMrIMFA8DibC8lY0CAe/g/DaSvVtrfAd62aHJdwSMrUJSBY40bmZ1UnMD0f5ILYaA
 KKFXabBxS8c7SnzQmkgbCqG6LMsTmWL5rhAsLXCd3yFzptnQn6VFMhxxFOPJDFN97NL3fvl2F
 KxoJAfL2pXjOh461aPdPt53TEanVlFYoT3KKxkO/sUz/ql9bGjOCy5qxIp+dWOdcd1b5b0R8P
 46wjVw==
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add two missing mmap flags.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 8fa5c1ec3d..3ea91084fb 100644
=2D-- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -1089,6 +1089,8 @@ UNUSED static struct flags mmap_flags[] =3D {
 #ifdef TARGET_MAP_UNINITIALIZED
     FLAG_TARGET(MAP_UNINITIALIZED),
 #endif
+    FLAG_TARGET(MAP_HUGETLB),
+    FLAG_TARGET(MAP_STACK),
     FLAG_END,
 };


