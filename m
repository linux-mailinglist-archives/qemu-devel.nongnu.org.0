Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A2A6922E9
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:06:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQVui-0001Ij-3J; Fri, 10 Feb 2023 11:06:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1pQVuY-0001Dt-Lh
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:06:07 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1pQVuS-0002Oa-Jy
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:06:06 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.95) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1pQVuO-001iFv-TU; Fri, 10 Feb 2023 17:05:56 +0100
Received: from p57bd9464.dip0.t-ipconnect.de ([87.189.148.100]
 helo=[192.168.178.81]) by inpost2.zedat.fu-berlin.de (Exim 4.95)
 with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1pQVuO-001iZQ-MX; Fri, 10 Feb 2023 17:05:56 +0100
Message-ID: <1a2aea7c31f58c9df9dca7c5293471cb961d496f.camel@physik.fu-berlin.de>
Subject: Re: Byte-swapping issue on qemu-user for sparc64 guest
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Date: Fri, 10 Feb 2023 17:05:56 +0100
In-Reply-To: <c57510bd-07e8-ab3e-279b-d9730872a1c0@redhat.com>
References: <d7002aa7ea4bc165e51b84fc5e591f03d8a9d29d.camel@physik.fu-berlin.de>
 <c57510bd-07e8-ab3e-279b-d9730872a1c0@redhat.com>
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

Hi Thomas!

On Fri, 2023-02-10 at 16:52 +0100, Thomas Huth wrote:
> On 10/02/2023 16.23, John Paul Adrian Glaubitz wrote:
> > Hi!
> >=20
> > There is an unaddressed issue in qemu-user [1] which results in getresu=
id()
> > returning an incorrect UID due to a byte-swapping issue on sparc64.
>=20
> Oh, there are still people out there using qemu-user on sparc64 hosts? ..=
.=20

This is about running sparc64 binaries on x86_64.

> that reminds me of another outstanding issue which might occur there:
>=20
>   https://mail.gnu.org/archive/html/qemu-devel/2021-02/msg04240.html
>=20
> ... in case someone has time for fixing this ... (I unfortunately never=
=20
> found enough spare time again to revisit the issue).

We're still maintaining a sparc64 port in Debian, FWIW.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

