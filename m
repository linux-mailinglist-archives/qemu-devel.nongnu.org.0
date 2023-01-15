Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF19466B014
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 10:07:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGyxD-0001Dv-6t; Sun, 15 Jan 2023 04:05:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pGyx7-0001Cz-5J
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 04:05:21 -0500
Received: from mout.gmx.net ([212.227.17.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pGyx5-0002AV-DQ
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 04:05:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1673773513; bh=CsiAc2NAzRFgaC0W+xrzTrNaN0M0M2ye13il39hPp5s=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=gSFTVx868uA6dsIKTLdPX7j2ANHJHoh0HfhHGz3aH9EOUKEDD9BF4OnojmpuJ+h2U
 HpfC0YgUf4NVdO3gMe2NBWIpFJkq3CoKjkpQrRvWmoPK4aYvMNfOoFuuiM5HbGnAeI
 +3Zqw3zQRwnU8JIM51YQogYUBWqo+RCEZKKzguXYMZoEkQkbf2zMHNJLS754njtquh
 8eflaRdd6zG6cfpi9L8MKxF6UYsWu6ZfYXgIrpFF3lKhJTgX0rTENNvxceqYceZuph
 FB8rPe6goM5PfRhlZy1CkUsi/LHxfknuW78uCsiyXrLFdjGYBy9NejdZJ7CrThvEgu
 gZxl6OdERYicQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.161.25]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEV3C-1pVtSt1tpC-00G0JI; Sun, 15
 Jan 2023 10:05:13 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH] linux-user: Improve strace output of pread64() and pwrite64()
Date: Sun, 15 Jan 2023 10:04:17 +0100
Message-Id: <20230115090415.6936-1-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1RdhQIiOEsKZdtPu3pj+Y1run/lvGk0YBYzkJ6Gp9Bmj6Rv5rtx
 +fC+CVqLz7sYli9Qpse+9tT3eCKxqgp3UTWjKlasHMFQHMLjj5n7BVIHitNsUsEz50s21iE
 i2OhWxYu0JO8gxZsFr7cXC74DjYjsAXr2QA+mUqSJsJwqCTj3mkK678T0acnGS7d4LGRriT
 o1BDTc58L8qcKRhCeGtjQ==
UI-OutboundReport: notjunk:1;M01:P0:R9KPZDWk0nw=;6v/Y+L0Qtxrz+yN5a/0zhLrtQxC
 aBAjEGo++fIWNSi9yTDFinyC75RtbLSWt9xQPiGqwldthsiy0zkDeU8Zg3Uf/VVr1j7rXSx7T
 Ig8PdsQ0MM92g2tKDi7mF2qKPGheQRLe+dUA1bOuY+YSEER4sy5vIAdwqa/F6KVSy6EC54Y8V
 RAexgASBjUNAK4VHUPahVAD7FgeLmg8Jy84+Z10+VYjX76tuz4xYrNWs9C3Af3thaxpW0GT81
 wjRRBw3YeTVIbgMxt90b7dnGRGygxr2GzuAZfWGgoNVPR2EExM35kNqL9W2qsTTQXpGUGs79L
 MkPHGMdxYhI+W3M05CaUQ3utp22ccMKBt0B8RtPm/kGGybNdR3RwDCPVciKq4dLgpGNotdAoo
 pkwFVvI3omJvBRF+Q09jWdjU1d1OTQfDYnyAR3FIWHCHuA1BMBZV5TK7n2Hu8sOfHoCfuVJuu
 uuXMe3+FkwpN6mM0+GtPpB4FeUcT70GliMgxBZWpX3rWTsY+F1VK82Ae/TkIexBpJjiLt3R74
 t3Hj/yzGaQHgRvJ490h6fy1ZMHjOhCkedLeLTzNthZYO1A27mRoDI4depikQj16wFRN5IWUMz
 r3gp9UaIua/RLuJX8UFDwHzuxJ5RwJvapAl2vTpSQx95npUN+kRFf9fnHLyNrGGSf327IcNWG
 xrqcUqDq9gEoePTtYoc/B+GYRBJVHyad7CbAZgua07/oJBVU9+fXkO4+nHAkx9RSG8g5M1pMY
 fFK3/DMMoEDg7QCXUAA00qJTewn+im1UqOGofq/9ddaAMoy5z8uf2nFmRPDBj4Pn1hjQi66wr
 JRsVh9hmdg2NTmWJbT4dN5RYP18Kia2LfD+hT1RzyyrQtAuBJ5jHWRHz+fC+qrHan1iRkcSsA
 2HFUGvYUnHxgAB3G99gBjQ6Hf/nd9YVllepRVWCptN0rYumYRdep1y2Ra9q4alWEklzkDqB9o
 5CulSQ==
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
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

Make the strace look nicer for those two syscalls.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/strace.list | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index 909298099e..41bb6bbfbc 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -1061,7 +1061,7 @@
 { TARGET_NR_prctl, "prctl" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_pread64
-{ TARGET_NR_pread64, "pread64" , NULL, NULL, NULL },
+{ TARGET_NR_pread64, "pread64" , "%s(%d,%p,%d,%u,%u)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_preadv
 { TARGET_NR_preadv, "preadv" , NULL, NULL, NULL },
@@ -1092,7 +1092,7 @@
 { TARGET_NR_putpmsg, "putpmsg" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_pwrite64
-{ TARGET_NR_pwrite64, "pwrite64" , NULL, NULL, NULL },
+{ TARGET_NR_pwrite64, "pwrite64" , "%s(%d,%p,%d,%u,%u)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_pwritev
 { TARGET_NR_pwritev, "pwritev" , NULL, NULL, NULL },
=2D-
2.38.1


