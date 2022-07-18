Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4332F578784
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 18:37:52 +0200 (CEST)
Received: from localhost ([::1]:48196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDTkj-0002WH-V6
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 12:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oDTh8-0006Pd-0l
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 12:34:06 -0400
Received: from mout.gmx.net ([212.227.15.18]:51165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oDTh6-0002Ve-17
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 12:34:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658162041;
 bh=Dr/F/gcBm/jm5lvvn1OamHqJ+/SagIFHp5Xo2zjupfo=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=fno2zCmlh5cR8COayGBsRBDPo4jgWaPckszZRtFWuIqFerzQb0qUI0yCuiTpXEC/J
 jGAXNtNjfYjjfFhrmpm1iomsVkiSjvj5R0yMfAl/iIaIjuewRjaQIJ0Yq0hRVclQDP
 gLqhvS48tm+SAmon7/ue3rJ+FM17cAl/JbcPu2gc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.165.57]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3DO3-1oEIVQ2Uhx-003ccr; Mon, 18
 Jul 2022 18:34:01 +0200
Date: Mon, 18 Jul 2022 18:34:00 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] linux-user: Unconditionally use pipe2() syscall
Message-ID: <YtWLeE8C4uutvgwP@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:SlO2ADaLGXWgu7sR+9clbMxv6nLcAXFlojbYZhmSribhAlxRexV
 FTCyUD+6TEhIUFXu9ZjTFVCDvJg4qPriXSeA6ZhhXQnQydD5WUbN9/VksccNQYejJXTgUMF
 GNojSaL2rxgMmU4P/3JRKPz1UOX7/vzBu+664sY0xEAPgJMShg2GCNwuXqf69BWuwhQD/51
 dcV7+1URZT6Tlf8ed0Ahw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+GJaghCC2oU=:TD6sXfun5czhCwdmloXQTl
 x5b6cijlaPbi/BL+NggzbXV63Y8iG0NtfFKsjgXYra7Jc1lbd+MUbfN/3UTRFGTUTOkkmgpfn
 gM5BisycB9lfX0gPt2fAZXjoyUcHwgqFXEpcDOxN8dfpe9Gqm2w0vh9JLk8fNeOWTsSMdep39
 41GM3G4ySFIJxXdatKfgkBqhkUXl/cRo8Gf9iCBqQpUd3IakfKvtjjgx/VdsYMgdnJ4oM1veG
 rXyVILdad/vBXgwZ1zx1qiYoHniODMA50vqMkK7malGnnhi0VcIv4zmicAalYcRhB1VGNfKS7
 PmPNPiAA08LQ0IxQec7KPLfSss7W9XFkBIusXtVGgCXedA7UYQC2BLTJYxKpSsNKAVk5LkIIP
 QJEWdGN3I5y065AI+Qh2RMrpfQM1DoPcrLuzwhmOIpJqyjtAP97fRvvuS3ixgd6YpssHsHKNq
 Sxj7QXOCfDfC2iEpARF/8EmQAcHjQ1wD1YnQ3J5INuLjtTvGTX/g3P+qZx6rAFlQN9GgArDGI
 ijl05oy5gFExbfAb67RDedHXb12RP3H9YWwzhOFOwYRYxH/0MrLeU8Xw2PbjRDWuGzafmUIMt
 5iYog+XB28ZK1dipw56MmfXgHRYzoK0a+yHWmpkoUpT37lV/e8mhVMLRdMiuhHrhmYTrqwlm+
 02SPPmduLDXIGZ5RDQ+ravcJo04G4AV/qrJg8ZSr/iu50XhwMDiQ2zYes2JhgqxUryukvDkEN
 RUSxs1qNLy1K0PWZJ84+aGurEiprJRVtYXwFXLOIKQNmLllmadxe2MALZU2xaxuvUSMgRBf61
 WiSyMLAyl7dAcuw8EhyMsn79a2N3gxIznAWDiY4mntnqfTgbSB7EC4GqUzcqAMPUm6+bTsgE/
 Zkv3uGilrrbVsYYyZlV3jEb/ie97L7zID8oMXjOePKYisdVD/Fw/bs2uNfnNxUch8/cOfBLc7
 ngaCHrtt8C/otjiIJMYkP7buR22/6gSTepUTiTLtMXSYD3zpbBznfjfLWsteFjnLATvUJ3jIi
 5yMmexXKZ5titAdsxe4bBQlEuyTWrTnc0iesYJ1QRD4x/4PQl1VkwE3Cl+2E6Vo1dlboQdsg3
 XU/Unc3qa7kTUgg7g7TBgnoPKBtRDTYEFQA3LMPVPn559i5W1j1mOFbLQ==
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

The pipe2() syscall is available on all Linux platforms since kernel
2.6.27, so use it unconditionally to emulate pipe() and pipe2().

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index dbebfa4a8b..b27a6552aa 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1586,21 +1586,12 @@ static abi_long do_ppoll(abi_long arg1, abi_long a=
rg2, abi_long arg3,
 }
 #endif

-static abi_long do_pipe2(int host_pipe[], int flags)
-{
-#ifdef CONFIG_PIPE2
-    return pipe2(host_pipe, flags);
-#else
-    return -ENOSYS;
-#endif
-}
-
 static abi_long do_pipe(CPUArchState *cpu_env, abi_ulong pipedes,
                         int flags, int is_pipe2)
 {
     int host_pipe[2];
     abi_long ret;
-    ret =3D is_pipe2 ? do_pipe2(host_pipe, flags) : pipe(host_pipe);
+    ret =3D pipe2(host_pipe, flags);

     if (is_error(ret))
         return get_errno(ret);
diff --git a/meson.build b/meson.build
index 8a8c415fc1..75aaca8462 100644
=2D-- a/meson.build
+++ b/meson.build
@@ -2026,15 +2026,6 @@ config_host_data.set('CONFIG_OPEN_BY_HANDLE', cc.li=
nks(gnu_source_prefix + '''
   #else
   int main(void) { struct file_handle fh; return open_by_handle_at(0, &fh=
, 0); }
   #endif'''))
-config_host_data.set('CONFIG_PIPE2', cc.links(gnu_source_prefix + '''
-  #include <unistd.h>
-  #include <fcntl.h>
-
-  int main(void)
-  {
-      int pipefd[2];
-      return pipe2(pipefd, O_CLOEXEC);
-  }'''))
 config_host_data.set('CONFIG_POSIX_MADVISE', cc.links(gnu_source_prefix +=
 '''
   #include <sys/mman.h>
   #include <stddef.h>

