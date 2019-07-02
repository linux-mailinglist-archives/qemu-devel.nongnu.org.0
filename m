Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A26715CE3D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 13:17:25 +0200 (CEST)
Received: from localhost ([::1]:51738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiGmq-0008JR-DL
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 07:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52264)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ppandit@redhat.com>) id 1hiGRy-0006Ld-4x
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 06:55:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ppandit@redhat.com>) id 1hiGRx-0003cR-1H
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 06:55:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49454)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ppandit@redhat.com>) id 1hiGRw-0003CA-Qy
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 06:55:48 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 03A4B8A004;
 Tue,  2 Jul 2019 10:55:30 +0000 (UTC)
Received: from kaapi (ovpn-116-87.phx2.redhat.com [10.3.116.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF200608BA;
 Tue,  2 Jul 2019 10:55:23 +0000 (UTC)
Date: Tue, 2 Jul 2019 16:25:18 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@kaapi
To: =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>
In-Reply-To: <20190701175010.GN3573@redhat.com>
Message-ID: <nycvar.YSQ.7.76.1907021539350.23656@xnncv>
References: <20190701123558.30512-1-ppandit@redhat.com>
 <20190701123558.30512-4-ppandit@redhat.com>
 <20190701175010.GN3573@redhat.com>
MIME-Version: 1.0
Content-ID: <nycvar.YSQ.7.76.1907021550090.23656@xnncv>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Tue, 02 Jul 2019 10:55:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH v3 3/3] net: tap: refactor
 net_bridge_run_helper routine
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
Cc: Riccardo Schirone <rschiron@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hello Dan,

+-- On Tue, 2 Jul 2019, Daniel P. Berrang=E9 wrote --+
| The original code was passing through to the shell to handle the case
| where the user requested
|=20
|    -netdev bridge,helper=3D"/path/to/helper myarg otherarg"
|=20
| In theory any parts could contain shell meta characters, but even if
| they don't we'll have slightly broken compat with this change.

I wonder if anybody uses it like that. Because of the 3 arguments that=20
qemu-bridge-helper takes

  --use-vnet --fd=3Dsv[1] --br=3Dbridge

only bridge name is supplied by user; Which is anyway comming without 'he=
lper'=20
having to include '--br=3Dbridge' argument, as is looked for before shell=
=20
invocation

  if (strstr(helper, "--br=3D") =3D=3D NULL) {
      snprintf(br_buf, sizeof(br_buf), "%s%s", "--br=3D", bridge);
  }

'--br=3Dbridge' has limited scope to use shell meta characters, ie. other=
 than=20
space(' ') and tab('\t').


| The QEMU man page has never documented that you can pass a command
| and args, which get sent via the shell though. It only ever documented
| the helper arg as being a plain qualified binary path.
|=20
| So the question is how strictly we need to consider compatibility.
|=20
| The "if it isn't documented it never existed" option is to use your
| patch here.

We don't know if "/path/to/helper arg1 arg2" usage exists in practice. An=
d=20
considering user would still be able to supply 'bridge' argument, I wonde=
r if=20
we are breaking compatibility.

| The safest option is to put in a place a deprecation saying we'll
| drop use of shell in future, only implementing the aggressive
| option in a later release.

ie. for Qemu > v4.0.0? How do we do this?

| Perhaps from your POV, the easy thing is to avoid this entire
| question - just leave the code calling shell, but switch to
| g_strdup_printf instead of snprintf.

Okay, this will be for Qemu <=3D v4.0.0?


Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
