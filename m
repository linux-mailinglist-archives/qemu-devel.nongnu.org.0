Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D0D5A2A1E
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:56:01 +0200 (CEST)
Received: from localhost ([::1]:39618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRakX-0008Dz-8G
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRaAo-0000dg-Kp
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:19:03 -0400
Received: from mout.gmx.net ([212.227.15.18]:43561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRaAk-00055K-KL
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:19:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1661523535;
 bh=2Hc44QhNuDPlyei5sc5czbu6AbH373ie1V6L/xqbjwA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=aSt9K9+Ff1FZNG7tRAUgD/wlIKmCKzxrzjPEkHT3U28I+Nm4t6WmwbpiPtjHqQ+RD
 GQpl5Zna5cXKqrHMX6ABOhyO1xYtVIOjsE2Z4zFBey+37wnPxK+uwyY9hl1WLKt6yY
 64ui9DERHMEvkjSFz8TR7P/G88EVAnHTBZUGIJcc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.171.190]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N5G9n-1pSNXW26K5-011Evv; Fri, 26
 Aug 2022 16:18:55 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 11/13] linux-user: Show timespec on strace for futex()
Date: Fri, 26 Aug 2022 16:18:51 +0200
Message-Id: <20220826141853.419564-12-deller@gmx.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826141853.419564-1-deller@gmx.de>
References: <20220826141853.419564-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:R+qwusMeOSKazhGUbo7iadpTTEgrOEhM7tQyUttLqZ5M66JA1DD
 ILRc2XApGxSHuqvqaztb5uaEHFoTokNMMTqJJHE8XMUQ2+zlGECmBwiR3cTadoYAcgIY82o
 NSVLiNReaUTmqTtsvVRBnaQ7rj3UYmalSVq8t+8I2Gyou1GhJ1Q6yV37TO2wvseiyGH6zDd
 fZ1Hw68Fut0XEz1xki1Kw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7eCaCgPpPhI=:i/XLhxZXqKkCDMOYBqiEKR
 WbFNtawatSl6mwQ0Yl+R705uQM+7mJYHiS4E317ZmcBMTc7nFEzz8zhV5YHBEYLS5kSDEk+Wu
 3KNBcrbVVwvPYjAzvmqKy7ayHIa+fS8AfxTY3ljf/17dzpJzPDK7hFHr1LSumrlCwwHf8tgaT
 OwWzJmIS3HyspFdrYxOuMMSWJc7/9/Lp7wpuc/b1t/2pNQLm56l1DkKgl9IG9b6Zih8kFkboF
 W/SZ7skQHnq4re2Dg5PkBbtsAalaifJSPNF/bGCRnycvqosT9KgshbHtupI4Gf8APeDkPYsN3
 hdHptRSomZad6ExHBIM3fv0TUGpexpWF1gJ3O35FnBXLjToNKPTWSI2UUjvxxa+2Kl7x9xQwb
 uPgYg5LWzZ210RaNoUvmCrgZBS3jW/GXs8qRs0seFV2S5hhMh/sZUR7ETbY4YtgLLLaFdUGzP
 XnQb6ZPx7Cthwch/NcAj/vmPCV+YCyH+oeYEyV9aG/x7kd6Suh0OjbmJd/wBdEprdkYpoyF2R
 eIBDjoTWamPazYPmZiKiK6RU/I0pOGElFYsBOXiQWDpotp7KuImtVKC/x7m5IXN3sQlFo9X/7
 oM/uJ84Kf2T3CsXl+01b+vkurwIK/0xGg9jNLEHIZhB3W2AFIynUORmUn+ecZHkyEWH7TEijr
 4kT6GqFdcd0muHYyGQvvVu9vDGOSYo57L9rT/ab5LNoOdkCHFKDJwL/GsZsmOvRHKFUEAtc0u
 pC4jfuZWIulotGIc7u8MZMDdWdX876XMA6hp/Yv5OKgqZJMCM5HGA47qvMVTmnN0AsRRvoVkP
 BuiOKZwQB0dmVQ1aONjr8uYL+XWjsbEb40acr7Y624VQEos/exDoo8sBPnP1o5OOFSCJifN1Y
 7rSkMQDZ0tY1+FACNV1HRaSEJCGAcRo5VNXTnLhEQhCsp5aJ8GEWQl9T1Blv6CVAm0QnZcmMt
 tjZaEKwWVRuMnaVyUTRrh2Ws5QACTolH/eWT12gvdJUg/ChjMNQJQ7SwdWvjeteVnlSDyumey
 gLkXoth0LbMrK4zrqT4Ii9VLjWSqU5RtmLbs7j0cD8MjUSEXfPH+nDtXkridU59WPAO8IMJ2p
 9PB8ExMHsZzuU3kjkwWqy8xIFYtOvocYvXpARbvpyyAcjhtIiON4rzeWA==
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
 linux-user/strace.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index bac47748bc..a90e719681 100644
=2D-- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -3713,11 +3713,19 @@ print_futex(CPUArchState *cpu_env, const struct sy=
scallname *name,
             abi_long arg0, abi_long arg1, abi_long arg2,
             abi_long arg3, abi_long arg4, abi_long arg5)
 {
+#ifdef FUTEX_CMD_MASK
+    abi_long op =3D arg1 & FUTEX_CMD_MASK;
+#else
+    abi_long op =3D arg1;
+#endif
     print_syscall_prologue(name);
     print_pointer(arg0, 0);
     print_futex_op(arg1, 0);
     print_raw_param(",%d", arg2, 0);
-    print_pointer(arg3, 0); /* struct timespec */
+    if (op =3D=3D FUTEX_WAIT || op =3D=3D FUTEX_WAIT_BITSET)
+        print_timespec(arg3, 0);
+    else
+        print_pointer(arg3, 0); /* struct timespec */
     print_pointer(arg4, 0);
     print_raw_param("%d", arg4, 1);
     print_syscall_epilogue(name);
=2D-
2.37.1


