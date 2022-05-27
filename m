Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4E45365CE
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:16:04 +0200 (CEST)
Received: from localhost ([::1]:60188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucdA-0006Ai-0M
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nucAh-0007iS-J5
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:46:39 -0400
Received: from mout.gmx.net ([212.227.15.18]:59553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nucAf-0004Vm-Cv
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:46:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1653666394;
 bh=lb6AfMnF5QsVZU0TeMbKS3Aei46S9dmDNUs13+6NAko=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=Ys4v1FbzU46H0rX13FIB+tbTDTbJIHHnsP4ju/6+HLAu5DP/YMauSE599TRdZSK6e
 nbJ2gO+hR8sPSj5h9sBxRve1isk5FGaf8PHUuYbndVf6ns0V1K7KjQbOrREQOnIua3
 B8FDUneBvUJZsQji+nAmcWytAhAe2neQpWrl6Y7k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.153.1]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUXpK-1oKuSn3Sng-00QSFe; Fri, 27
 May 2022 17:46:33 +0200
Date: Fri, 27 May 2022 17:46:32 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: dave.anglin@bell.net
Subject: [PATCH] linux-user: Adjust child_tidptr on set_tid_address() syscall
Message-ID: <YpDyWAr/MYl3mizU@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:Ostij1QK1RaH+U3bpGsbafiKT7lVwUgdMvbAwjzkKrNQoXPlLw3
 yLeRk4S0dumTgb4jJDiXVCozfYpEvXEpElips29SedenKLAJc5YnqqKoLcx6A16x9U5xCFh
 6aNAUscv5SwK5+3zvEEs59X7fnxOZ5bYtnkBW4zFeAy8k9JcD+Tqb4cNOyWsb8YuWIIkiCO
 ukxUybv1tinc+m6wM4XxA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7N5G3soUaAw=:VAPt1A6ORN3CQsXt9V1M9T
 3OPQXKbwSvpD5AMd7teYy1YUbMr7ZHVGuw4cVZPmtddEFEQQ65JjA/2BRwH0KXpmkkxPakBvb
 j0LfHYs03PkF41pRZKjlzZKI6tTZZfs0ceESLEnKMdqWD1S1e1zF9udiG3F6XOIGEkUEQ/M38
 hPaqzldCRYDQ9uyTtWSgXanYb96JkNaktC7uA8tL2PNd2Ox4cn7uFG/IH4jRkVR4kY5+vd8Ux
 uiMnxzFxYvMOsO6zhJwh+CwCya3qKXetPP3NAPp23Xm5w9pATHYWMRds4LY/bDb0PBfcWGvWn
 bK40wVzKlz+vOKBdT5Q8tu9A5bwZecjWzkptzHIG/Edsi05F3cc3e5pmjk1OOwLNOu6lFhcE8
 d8mjaQARMR6qZq5rjoZYtN3JLpIDBEJWyw4WKBh7C15StyeNgA+pl9Xg4I5wMyCaHThTnAAib
 dEO2nci45i6FWRsLU/WZzPf/deYqca9qXI1UATsmIAz3jHaephc+i4cWY4LMJ/qnvqJenxEv6
 luwYvjU+egNzosr6k5fp3Xtugo2QZiEAbVi8Ve7CDrxNJS5DkHfS7C2Vj//YPNXJ++FUpDJJH
 6KzPeKDD8CAEIw9BznOV83bF6QdLYG0S9YVkAIj49JCeQEnWJuFJS4AmQbye1ORDYuW07/ijU
 S0hWKQaxA7JsaZlrMRv5kRZmJq53vSoQdf/1YHsWaITwnXdaGx6UIw6X4axRLdcuFNSlN6zbo
 qKvudLMQ3/pG8FmrWPBZkzAMlSl7P8G0/xGAUq/ZVeUTgI/hsEoxUigut5kDIhKVgINpJfXiP
 Ipb5B7cqbW3PABAZ+f3LFx+aiUMteyP/KoCArOncrT7aQxLrhd9KJRutXnG5gHvCb7sBrgdFx
 2Vct0U5YPrZL5DjCXYDBRVlCy2LrrVsByu6insinfwNPk+TCS0jy5eGuPfHMOvLtEPE4PIITQ
 XGjqr3BeASRtMxlqan821LDeIdX1aUfbPj2SeeKu1nH39ePG9eeEAGixaUROwEMGcp/Pss5kH
 CJ9hwoH4AVqLc13GEgzooEVKC2SmgFqmgw2H6XVCwbK46nyW04Jx7vUAPfYu9mbB8NSqqoVm9
 abLhvlYqXWTOAw5Ylhv73Gz/A0igNR19J2k5F6bWkJ2s5JyyJRlsGjg+Q==
Content-Transfer-Encoding: quoted-printable
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

Keep track of the new child tidptr given by a set_tid_address() syscall.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f65045efe6..fdf5c1c03e 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -12202,7 +12202,11 @@ static abi_long do_syscall1(void *cpu_env, int nu=
m, abi_long arg1,

 #if defined(TARGET_NR_set_tid_address) && defined(__NR_set_tid_address)
     case TARGET_NR_set_tid_address:
-        return get_errno(set_tid_address((int *)g2h(cpu, arg1)));
+    {
+        TaskState *ts =3D cpu->opaque;
+        ts->child_tidptr =3D arg1;
+        return get_errno(set_tid_address((int *)g2h(cpu, ts->child_tidptr=
)));
+    }
 #endif

     case TARGET_NR_tkill:

