Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5C57A341
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 10:42:49 +0200 (CEST)
Received: from localhost ([::1]:58818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsNia-0004lr-1q
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 04:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53811)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <Paul.Durrant@citrix.com>) id 1hsNi4-0004Kr-0U
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 04:42:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Paul.Durrant@citrix.com>) id 1hsNi2-0006UA-Ed
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 04:42:15 -0400
Received: from esa3.hc3370-68.iphmx.com ([216.71.145.155]:38189)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Paul.Durrant@citrix.com>)
 id 1hsNi2-0006Tk-2s
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 04:42:14 -0400
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JYJ65E86F17nLfLI3FMQkSI6SJE40gw/lU00m++TpbiCnAKvexQQ6tVWyh/Di3Ue0gHbwM9vzP
 hduZ9Prh/rK4VCQyMQuW9kk2ERiynUFnA2d8hZnVXIvMq3DpPoqxl53wMB9OYvBbo1VwZz749l
 E37i5DZUt+uIREixyraTuKCoL3ZYBEPfCUhsjEMKURPGQAvNkoLL/4o+USUQksqOIKVupR+lxY
 c7Gt3XdvHfgby1iOMEoqnIqhi73OGO7IBUNRLeyvG8CvXRcnPLcAln+hqd2UZqXoey/WFvphYo
 zRQ=
X-SBRS: 2.7
X-MesageID: 3612175
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,326,1559534400"; 
   d="scan'208";a="3612175"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [PATCH] xen: cleanup IOREQ server on exit
Thread-Index: AQHVRkPwYtwm6xiHKUyO/Ltn7zqYNKbi1qZg
Date: Tue, 30 Jul 2019 08:34:57 +0000
Message-ID: <709c0bad95d8471e8c821fceb83a9948@AMSPEX02CL03.citrite.net>
References: <1564428563-1006-1-git-send-email-igor.druzhinin@citrix.com>
In-Reply-To: <1564428563-1006-1-git-send-email-igor.druzhinin@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.71.145.155
Subject: Re: [Qemu-devel] [PATCH] xen: cleanup IOREQ server on exit
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
Cc: Anthony Perard <anthony.perard@citrix.com>, Igor
 Druzhinin <igor.druzhinin@citrix.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> -----Original Message-----
> From: Igor Druzhinin <igor.druzhinin@citrix.com>
> Sent: 29 July 2019 20:29
> To: xen-devel@lists.xenproject.org; qemu-devel@nongnu.org
> Cc: sstabellini@kernel.org; Anthony Perard <anthony.perard@citrix.com>; P=
aul Durrant
> <Paul.Durrant@citrix.com>; mst@redhat.com; Igor Druzhinin <igor.druzhinin=
@citrix.com>
> Subject: [PATCH] xen: cleanup IOREQ server on exit
>=20
> Device model is supposed to destroy IOREQ server for itself.
>=20
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>

Acked-by: Paul Durrant <paul.durrant@citrix.com>

> ---
>  hw/i386/xen/xen-hvm.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> index e8e79e0..30a5948 100644
> --- a/hw/i386/xen/xen-hvm.c
> +++ b/hw/i386/xen/xen-hvm.c
> @@ -1242,6 +1242,8 @@ static void xen_exit_notifier(Notifier *n, void *da=
ta)
>  {
>      XenIOState *state =3D container_of(n, XenIOState, exit);
>=20
> +    xen_destroy_ioreq_server(xen_domid, state->ioservid);
> +
>      xenevtchn_close(state->xce_handle);
>      xs_daemon_close(state->xenstore);
>  }
> --
> 2.7.4


