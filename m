Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A97985BBFB1
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 21:55:49 +0200 (CEST)
Received: from localhost ([::1]:55102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa0OK-0006EJ-Q4
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 15:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oa0Et-00071Z-SL
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 15:46:13 -0400
Received: from mout.gmx.net ([212.227.17.21]:44415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oa0Ep-0007aj-Rh
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 15:46:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663530357;
 bh=/gVeQ5FY1ri9znOnzbjiflH84LDpU0qJIjCnWz3aFc0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=U/T18sZRWl0/aSPS8c6h9kUQRtKvAtvn4y2FOkFlNqyxN9XfOPODqXSqL7xjjFXY1
 ms7auHsk3F40umM+/f3j+zhzrbsQ0Hr3fq6fIN49oXyxmaAn2/YMcpYN8mY/wtkBkL
 p67VuXzs7rQJn6kba86g3cajqzbBo/DYVxoaxWBA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.165.224]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhD6g-1pDAnu3tic-00eLcT; Sun, 18
 Sep 2022 21:45:56 +0200
From: Helge Deller <deller@gmx.de>
To: Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: deller@gmx.de
Subject: [PATCH v3 04/12] linux-user: Log failing executable in EXCP_DUMP()
Date: Sun, 18 Sep 2022 21:45:47 +0200
Message-Id: <20220918194555.83535-5-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220918194555.83535-1-deller@gmx.de>
References: <20220918194555.83535-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yshcvZX/wtCLDBJnx1VT/0UYof/njximycHTnezHSKD4eiWfsbE
 Q25qPM0aK8PoCdd6gHqG6b6yQ4zLm/GGZ+Dmnto3By9cTMTzOC/CG1ZVQ4Y0i+I5mVEuaBS
 i8mj96KyHRyG7vsG36ByHOmSmZ9woiXJpw5t918w9l/qLi06+D7L06TDbBlDzoU2vQ2UUkp
 3ZTr9dtsH2uIUuyfPSCzw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:W2Rp+si1Olc=:jPmmll5SlhRYfGS1pjypjW
 5515PEJL5VS8oUEbmyFI1hKnkYKM9a3v8A2650FUtfKnFUpLAgw1pzwKNs9iNJQ85AB6eKSCZ
 BWutH1yQslB45Ss6cRLrNKFKalfwDmjzk4kSzm5qKNLg+fP9N7PLWyD2xpMQWt1AATiqxjjNx
 VFrGM0LTcMpAEPLnlFgvT4I14GKKI8XYS3GgyfdhhjHbZgSGU0hMn9SfcCb2ZIy08Op7TXVOV
 0TfLqoGOSi/HGwCQ4Xf1C/DnaT6pjP2DmE5VTxbBoE6J2eMw4XiTOt7mQqRZNA1rX+jgMd2JB
 p8zszv9FHSSetsXPlnS+n9IttmOGGLS9CLSHZ3Pshd/1kiWu708NVl1UeBrqBt9/WTfEP1xE3
 Zup2f/5D1SWuUl3HZhuIJPDfDpmjblY87aPcTqKrQugCjpOZpLoOrm9vleWT+nBdKNndT8p9z
 Hl7ATcchwBYrA07p8yco1dIRb1TUmjLcSti7Buq4ts4YgeGwPIaQf7/thQZuDL3GjfK964N3l
 1w/A9Sb/q+ZIteui3I+2lHuVEPZYp0wdJ6GyP5QQx2rGRS9vfNbYhsxFFUcPuwfvNjHpLAJJE
 cdZ4Ny/edSuCfhCfgDiyPku9odhtT1oxo4THeLGCTD7oTjcd+YBqxGWJ4HuaXAjXdBI3ptiYO
 ntGJKOCH+yLwo0I0UJeLG8xqzcvXaGcF7srJrX2w17WYR1UFNpblPgEa5Uf2KlXOegUIk6Q2f
 20N8utYQyf9rePa35RVMjXNhOa1BiGWsZl8faLleZnVW8qQzDodJfTLUaiTBPA7tPbRgU70B0
 oAA9LpRHx8rMG2Gm/nqAOV5EnvrIv2pPjBRTap96RrjcerlSY8ebEM9FDsFKyOOZLPVdJPCgu
 qroNzmP5hkUrasrE0T2Dabrm9ooNm2jF7+k7PwlJcky0Y5S3JOusqvgaAPC4rd4CqEceRU03l
 zt3EnTuc21LeMRPXUFvO1+Kv+b8XjQUtBuVH86swNzYimH46KNZ7wdp6e+axmGfzH/Cn002eV
 m3hppyfc69AYMWonrXoKnfvyeiKwpn9SyBKnnBA+CQmrPQy662aGOSa3krgSBfBHFmwLxZoKS
 aR72f1Cis2gjhnVt3bJF/bhA1jGgI1114XLW9ildQjwPCTck4WsmzvEutoH05FaFbsW83g4Jb
 zMAkutBGKs9iZZSZi1C2pjBWt5
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enhance the EXCP_DUMP() macro to print out the failing program too.
During debugging it's sometimes hard to track down the actual failing
program if you are e.g. building a whole debian package.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/cpu_loop-common.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/cpu_loop-common.h b/linux-user/cpu_loop-common.h
index dc0042e4de..36ff5b14f2 100644
=2D-- a/linux-user/cpu_loop-common.h
+++ b/linux-user/cpu_loop-common.h
@@ -27,9 +27,11 @@
 do {                                                                    \
     CPUState *cs =3D env_cpu(env);                                       =
 \
     fprintf(stderr, fmt , ## __VA_ARGS__);                              \
+    fprintf(stderr, "Failing executable: %s\n", exec_path);             \
     cpu_dump_state(cs, stderr, 0);                                      \
     if (qemu_log_separate()) {                                          \
         qemu_log(fmt, ## __VA_ARGS__);                                  \
+        qemu_log("Failing executable: %s\n", exec_path);                \
         log_cpu_state(cs, 0);                                           \
     }                                                                   \
 } while (0)
=2D-
2.37.3


