Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 003305B7B51
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 21:32:09 +0200 (CEST)
Received: from localhost ([::1]:44042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYBdg-0004Wt-Uv
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 15:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oYBLn-0008LX-G2
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 15:13:39 -0400
Received: from mout.gmx.net ([212.227.17.20]:39223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oYBLf-0007ed-Ty
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 15:13:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663096404;
 bh=+t9TnZiLd8rHKtd7DNCL/ZYGAwF3CfcJ9/nMiBzejt8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=DSDpEQ7Sr8U/xZtjFj93gvLfVgZhWETOBGUphKKjUWxzYZDmbpy0eG1vOdCpA4CUe
 YcZ20jqDEY1fhVeTX8lRBE5zYUTHRyIaLTASekbLTk7/ljSgnPcs0dTvczsFQQz6+H
 ObciT2rk9K5zXgbBHJPjv0FxwG8cVmjqxszBP8N0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.190.164]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MOA3F-1owZx72Yen-00OaW8; Tue, 13
 Sep 2022 21:13:24 +0200
From: Helge Deller <deller@gmx.de>
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: deller@gmx.de
Subject: [PULL 04/12] linux-user: Log failing executable in EXCP_DUMP()
Date: Tue, 13 Sep 2022 21:13:13 +0200
Message-Id: <20220913191321.96747-5-deller@gmx.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220913191321.96747-1-deller@gmx.de>
References: <20220913191321.96747-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JKdiBZwCbpVwUNA/U+LHoz0/LNlYh7olXYexNV1cdWzB2j29pLp
 H62uYnoogSk7evxISPbbc/VpIQdpBARnXtp7c6Hi1OwbwkJu7UNQoz4Zvy6ZD5bJbQJthoe
 PynnUmUulBH7MMVz5cNvK1WoucAljursLLTQZl19ezsilQWE5j0zsQzQlSIQZmbsQ9CSlZ6
 riewzuOswGf2P7tJvBikg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CzzVpX012Us=:qmv4AyfXvSEMD/AmXYOyso
 oG8DdrRqv84ZHPopV00kS6oYDOtki5VdXeFABKgIqXDm8zW9+5kSAD9GTNZ03X4gUQ6d1Z8+m
 3PZcsR8yA5SuQzbI72FctlaehTFOKvEiphZEWJoXBoyfFRbpIcz5C3AhgFrRo5pj19baYVouO
 CsMVC/sp2GOJWB0DCKAOkjV6VS1+nYmBLlVuJx66lB6SEq1ek96BhjU3gqvvQ2DeZK+ohfHqw
 oDWkHPJLKKkFBYS37cjJ3TCBMKU+dBFWCoYHvgky2LWVWnXYZnKQcY98BFHKDg1CjUO90pWOj
 fqbUjrjpo5Iws7if/06v+hQT8rqTQcHjL3Qud0U/CcXfZnYFlTDEETuWpz+iGf1xdGrXce897
 uS5Ofz7i4tSvwbpe7MdZ2Ho19tK4k0kkOYRh7iaumMdhT1RKOrScZWycquRzvwGxc/KAEfTe9
 3vTmwmbuU9iM1dGJkYJaNh9sJf16J9+iPqA/vRM8BDVg+4dKKAJls+QjHQXFI8DjKwf93Y02q
 /o7ZD0zr7HaIGbVFnDXKN2+1fgh+M0YNbk2dma/07il2GWKBAkLW+mpIDXxvGk4OA9zuOvwzw
 NhvZ8ViwI6nVN7YiEL9qWxcUZPMSTkXkuk5CKkJkAlPWK1VvOCZrKT/E66I+ui46okodhRxZB
 JNvha7zSnUj23sfT5+i3kBz6z60wdDUK5HXy78FVETmHF5xPMmOc3CX9UyxH1s4d3mry2yicf
 xhKLC4fknHBhJ12yjbvsBOVAVCAN5a7KYJsY21eKs/Zr0TEhQpO8atFTW5foXqnWNNMiciaKg
 gguLawJrGBvNLmzqYAzgpvOEFQHtYgzHwXfPTAwJyGRe5tn0CkjGnrVjoo2xwEpYtg20VgyB0
 1z4IngXGM3cApvpx7Rt/SZ8qIpNiMdEaJJtuIdSHdVeQnI+fGeUQ5wKtyp6DS6flPoO7sOPG0
 yYM8IxNPc3y9RdJppgW4VVPB6z2yfq6juVTmiNevNCibA8K6zqdySq2kODDw8btYcKeZjdwQe
 MxlGTKd2yJEW7+K5/UXA0HYLAHZdU6/Pr7SLMi7LWgxImgQNGhE4po8XI5lr9Y0WAPYxKHwcp
 +nQah3jPvoFCTGBvOu07X0N8FZwJRRBAt5NO8aMCFOHPGqVgy/Hr+wIcWdm5LxOkFnAp9i0SI
 6WhvwM5D1DIn+wo22bE7/zCn40
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
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
2.37.2


