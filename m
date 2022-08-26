Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F535A2A09
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:52:30 +0200 (CEST)
Received: from localhost ([::1]:56318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRahB-0002aW-8e
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRaAo-0000eY-Q3
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:19:03 -0400
Received: from mout.gmx.net ([212.227.15.18]:56667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRaAk-00055R-MW
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:19:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1661523535;
 bh=lPtKkG9XisVFJUR1ll9RmaJAtOBuQapADhw77JY1SiM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=MgYDuyEJ2ZWhtap8uKPtEJ+jyGXJsy7lZ1iUsEjHcqyFllnb7sgFRuElkm3kiOteD
 i60pg9XUWmaHSUD+Nvspm7I3ldxMvfyUk3JrElXGAwtGbOopBJTrbMvicqDHdDcmW6
 xJgmNkCjtB5etPnJjSnXOZw0AvjIPqIbvff7DzBg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.171.190]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mjj8D-1p86rc2cPL-00lDQ1; Fri, 26
 Aug 2022 16:18:55 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 12/13] linux-user: Add close_range() syscall
Date: Fri, 26 Aug 2022 16:18:52 +0200
Message-Id: <20220826141853.419564-13-deller@gmx.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826141853.419564-1-deller@gmx.de>
References: <20220826141853.419564-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Jdmq421NWoMoQ952udopVyleCDzoMI2KUxEcjOxBzbPiDpfFG2x
 /RkHNtUNNy14ANzqg3hXOVNVpSQex5ZEAHIa8a9Gk5D6sk7pnaMbU7Z7bomb8uulElnQH1z
 Imm2hwwu1DNG6eb4rqJpE5ob9wjvpSHiQHF48oRc5AGUF/KthkAKUdXyIq8f5aagVEDSJH2
 DB1Qws5da5gj9a0NTc1CA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+Dhq8rLWZLU=:IoTUdA80Dxq99IaLlxqemC
 Tf99NCf/huGRqKJzuqD5ie8sFc9ot9eEf4CMPQbZNfifnnbVKpjaVDOG44cvUQ5uiV7ibkj7E
 Em9i/wAsz12FKnw9+BBqLf1Szs8Fhw07/AscFPFBmOcgJ0YSwSwoAuRUixItKvibBUcsNnMok
 BUubzKB89bGoh5cclw9TQnh1Ueqm71Ok62s5cNIyUm0eHpFTJB8WclC+pdEjcCIkh7Ay/+8eW
 H1c1oJKNs9pOI81mQm70bpnz9KFGuzUQAkii2K4PiVtG9UWr3Evti+W3D8GzGyDcq1+xyl7Wf
 bCN/znnIZjDGjbaYATg7kdi3EdjHb/bMluIt+ShPFYj6vsymDWAQ3XQPfbfpx5dgtFqwhzGOA
 ayCJqeaAszMbBMYO12qN0qhubk/sTVXodVD02QVxBcz/xgXXFSSCrzxnEG0E48J7Vu6YZ6KY4
 dTuqSZ40cO7l68bu0FTSpBV9c75boqwlkXlQd47JkEZU6eEjmRXYvs0D0luEIcs7LmtBS0ezr
 +BP71tUcEXwvTklXwNLARcAro7Sw49VtNsKjmchqCglBu53hdS9aj+ewkADdt2VKUn1QUlwfY
 SoiN42JHNwTCfhLGTgD6AHwqxjgrhGtiUWDgK5x7ZNpuEmA0l6kPXZ0FCP2WUhTMBah3WXdwL
 OUYrBU2Oi5JcB2GfTd2P1Y/aSJo0EICx5Ub6nHRdXcg3b0mGBDCTqal5NRuU/uE0oWvYEJrgW
 4qAFhWEO5i5S2ck4ww5I342/xoH3wyX7+kQ3fHifhE+tmtq7NK5wIzbdGr3IEKQxE1W6OuXCs
 cksdmjzXaQNv8g87T1l3b1TYcGf0r6ZdMbPiri2UqZAEBwQlvkawGMk+F8bwqbiJ5obapRzJw
 urhisxT5OdIOceL44km1Sp/9phQPLqXgogdmdLATMoa9L0s9vYpW7k78MKf5DD1BFGMRyTuLh
 88zxQ7LCyx72QaEeDEiXiwKhtoT3FNqhWNggX/3WlfKofgIBm8PfLOQ4m7vCkRlL23e6B4a0S
 jrG/vTJJ1b9C5N+CzwiwBKMScsEIkoVDR9rK/A8GFzskWlR1XzAkGi9GrNy9jCLmPbnAPghmU
 JVi2C87fUOTWwA9Zvz+c0ZQmaW4cwN7ra4IDYDVst0pAI0X4WlFzoaVaA==
Received-SPF: pass client-ip=212.227.15.18; envelope-from=deller@gmx.de;
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
 linux-user/strace.list |  3 +++
 linux-user/syscall.c   | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index 0463415902..4560a01d88 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -103,6 +103,9 @@
 #ifdef TARGET_NR_close
 { TARGET_NR_close, "close" , "%s(%d)", NULL, NULL },
 #endif
+#ifdef TARGET_NR_close_range
+{ TARGET_NR_close_range, "close_range" , "%s(%d,%d,%d)", NULL, NULL },
+#endif
 #ifdef TARGET_NR_connect
 { TARGET_NR_connect, "connect" , "%s(%d,%#x,%d)", NULL, NULL },
 #endif
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index a1e6d4ad53..0becaad74c 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8724,6 +8724,18 @@ static abi_long do_syscall1(CPUArchState *cpu_env, =
int num, abi_long arg1,
     case TARGET_NR_close:
         fd_trans_unregister(arg1);
         return get_errno(close(arg1));
+#ifdef TARGET_NR_close_range
+    case TARGET_NR_close_range:
+        {
+            abi_long fd;
+            abi_long maxfd =3D (arg2 =3D=3D (abi_long)-1) ? target_fd_max=
 : arg2;
+
+            for (fd =3D arg1; fd <=3D maxfd; fd++) {
+                fd_trans_unregister(fd);
+            }
+        }
+        return get_errno(close_range(arg1, arg2, arg3));
+#endif

     case TARGET_NR_brk:
         return do_brk(arg1);
=2D-
2.37.1


