Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DCB2F03BA
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 22:11:49 +0100 (CET)
Received: from localhost ([::1]:49108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyLWT-00026T-Pt
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 16:11:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan-guix@vodafonemail.de>)
 id 1kyJSo-0008JW-0c; Sat, 09 Jan 2021 13:59:50 -0500
Received: from smtpout2.vodafonemail.de ([145.253.239.133]:49188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan-guix@vodafonemail.de>)
 id 1kyJSi-0001of-TM; Sat, 09 Jan 2021 13:59:49 -0500
Received: from smtp.vodafone.de (unknown [10.2.0.35])
 by smtpout2.vodafonemail.de (Postfix) with ESMTP id BD66B123E39;
 Sat,  9 Jan 2021 19:59:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vodafonemail.de;
 s=vfde-smtpout-mb-15sep; t=1610218779;
 bh=wDKD71gbdhcf7PdQSEhdacQIjUWSF0Uo35+WpJtyu5M=;
 h=From:Subject:Date:Cc:To;
 b=iuNw+Mt1WzimIHjVgrnpDTBel+vMvxCmsUEAhY+yEAtxM4CCXl6c4IofdCmgrY4Z+
 aPlLM2peTMfpSq/Zctj9DlL1Hj3LUmlpLfgMQyAeVyawaerQR0RkAdG0xk3InNTcro
 lNiC+LvhofDzVR9FQ2fVnxG7E2yLpieodmV+2JYc=
Received: from macbook-pro.kuh-wiese.my-router.de
 (dslb-002-206-141-230.002.206.pools.vodafone-ip.de [2.206.141.230])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by smtp.vodafone.de (Postfix) with ESMTPSA id 7C05F140248;
 Sat,  9 Jan 2021 18:59:39 +0000 (UTC)
From: Stefan <stefan-guix@vodafonemail.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH 1/1] linux-user/syscall: Fix do_ioctl_ifconf() for 64 bit
 targets.
Date: Sat, 9 Jan 2021 19:59:42 +0100
Message-Id: <60AA0765-53DD-43D1-A3D2-75F1778526F6@vodafonemail.de>
To: qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Mailer: Apple Mail (2.3124)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1895
X-purgate-ID: 155817::1610218779-0000239E-4442BE00/0/0
Received-SPF: pass client-ip=145.253.239.133;
 envelope-from=stefan-guix@vodafonemail.de; helo=smtpout2.vodafonemail.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 09 Jan 2021 16:06:25 -0500
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
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sizeof(struct ifreq) is 40 for 64 bit and 32 for 32 bit =
architectures.
This structure contains a union of other structures, of which struct =
ifmap
is the biggest for 64 bit architectures. Calling ioclt(=E2=80=A6, =
SIOCGIFCONF, =E2=80=A6)
fills a struct sockaddr of that union, and do_ioctl_ifconf() only =
considered
that struct sockaddr for the size of the union, which has the same size =
as
struct ifmap on 32 bit architectures. So do_ioctl_ifconf() assumed a =
wrong
size of 32 for struct ifreq instead of the correct size of 40 on 64 bit
architectures.

The fix makes do_ioctl_ifconf() handle struct ifmap as the biggest part =
of
the union, treating struct ifreq with the correct size.

Signed-off-by: Stefan <stefan-guix@vodafonemail.de>
---
  linux-user/syscall.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index d182890ff0..15a6abadc1 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -4902,6 +4902,7 @@ static abi_long do_ioctl_ifconf(const IOCTLEntry =
*ie, uint8_t *buf_temp,
      struct ifconf *host_ifconf;
      uint32_t outbufsz;
      const argtype ifreq_arg_type[] =3D { =
MK_STRUCT(STRUCT_sockaddr_ifreq) };
+    const argtype ifreq_max_type[] =3D { MK_STRUCT(STRUCT_ifmap_ifreq) =
};
      int target_ifreq_size;
      int nb_ifreq;
      int free_buf =3D 0;
@@ -4925,7 +4926,7 @@ static abi_long do_ioctl_ifconf(const IOCTLEntry =
*ie, uint8_t *buf_temp,
 =20
      host_ifconf =3D (struct ifconf *)(unsigned long)buf_temp;
      target_ifc_buf =3D (abi_long)(unsigned long)host_ifconf->ifc_buf;
-    target_ifreq_size =3D thunk_type_size(ifreq_arg_type, 0);
+    target_ifreq_size =3D thunk_type_size(ifreq_max_type, 0);
 =20
      if (target_ifc_buf !=3D 0) {
          target_ifc_len =3D host_ifconf->ifc_len;
--=20
2.29.2


