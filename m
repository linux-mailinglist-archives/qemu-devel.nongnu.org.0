Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD42C690BAA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 15:26:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ7rr-0000Oy-Cw; Thu, 09 Feb 2023 09:25:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1pQ7ri-0000Nk-Fa
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 09:25:34 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1pQ7rf-0003no-K0
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 09:25:34 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.95) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1pQ7rZ-002IKL-Ai; Thu, 09 Feb 2023 15:25:25 +0100
Received: from p57bd9464.dip0.t-ipconnect.de ([87.189.148.100]
 helo=[192.168.178.81]) by inpost2.zedat.fu-berlin.de (Exim 4.95)
 with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1pQ7rZ-0028mB-0d; Thu, 09 Feb 2023 15:25:25 +0100
Message-ID: <97f27a5278d031978b0c1ec777d24eb495fe0084.camel@physik.fu-berlin.de>
Subject: Re: Linker failures trying to build static qemu-user binary
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Date: Thu, 09 Feb 2023 15:25:24 +0100
In-Reply-To: <CAFEAcA8=L-S+41wCZ7z-JUzt5Cg_CQH_ruOTCUeWud6vfy1F4w@mail.gmail.com>
References: <f71df8f625e4110b84b6c4fefd9e95619b3ab92e.camel@physik.fu-berlin.de>
 <CAFEAcA-Le_YbaYn6i15EesDMan+OF0S7uteanSXrWYK37HbdvQ@mail.gmail.com>
 <48f42e259498adc7953853572eb481279ee06e71.camel@physik.fu-berlin.de>
 <CAFEAcA8=L-S+41wCZ7z-JUzt5Cg_CQH_ruOTCUeWud6vfy1F4w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.148.100
Received-SPF: pass client-ip=130.133.4.66;
 envelope-from=glaubitz@zedat.fu-berlin.de; helo=outpost1.zedat.fu-berlin.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

On Thu, 2023-02-09 at 14:23 +0000, Peter Maydell wrote:
> > So, just include "-ldl" in LD_FLAGS?
>=20
> If this is necessary, then pkg-config should tell us to do it :-)
>=20
> But in the usual situation that you put the statically linked
> QEMU binary into a chroot, the dlopen() that libdw is going to
> try to do won't work anyway...

FWIW, passing --extra-ldflags=3D"-ldl" fixes the issue for me.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

