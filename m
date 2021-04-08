Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB69357F7E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 11:41:12 +0200 (CEST)
Received: from localhost ([::1]:51172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUR9z-0007mf-MU
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 05:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lUR7R-0006Zm-CI
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:38:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lUR7G-00047p-2r
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:38:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617874700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AI+rRgCFbYnX2FjobTqeo/QFZfz1KDGogsYXPAXWCTk=;
 b=F5ni9V060bkSRnyf/3glD8BGQscP0Gw0ph+5KWic7/72jfNZTxqcL3AfDobjeUZNtu86wY
 cess+iz1tUk8YgcabeA4Mr/TPlda1DYbgOt0eszKH6o4F/pX4NbXLMC28UydR3YEoZhTbo
 sj8X/E3CCRsJSPbpJ/XOK/ov4oEkplI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-h9onpz09NLuyl8HqhZpiRg-1; Thu, 08 Apr 2021 05:38:18 -0400
X-MC-Unique: h9onpz09NLuyl8HqhZpiRg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0B18802B40;
 Thu,  8 Apr 2021 09:38:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5439A60C0F;
 Thu,  8 Apr 2021 09:38:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BE9D5113865F; Thu,  8 Apr 2021 11:38:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-6.0?] hw/block/fdc: Fix 'fallback' property on
 sysbus floppy disk controllers
References: <20210407133742.1680424-1-f4bug@amsat.org>
Date: Thu, 08 Apr 2021 11:38:15 +0200
In-Reply-To: <20210407133742.1680424-1-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 7 Apr 2021 15:37:42
 +0200")
Message-ID: <87ft01ce0o.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>,
 =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Setting the 'fallback' property corrupts the QOM instance state
> (FDCtrlSysBus) because it accesses an incorrect offset (it uses
> the offset of the FDCtrlISABus state).
>
> Fixes: a73275dd6fc ("fdc: Add fallback option")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/block/fdc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
> index 82afda7f3a7..a825c2acbae 100644
> --- a/hw/block/fdc.c
> +++ b/hw/block/fdc.c
> @@ -2893,7 +2893,7 @@ static Property sysbus_fdc_properties[] =3D {
>      DEFINE_PROP_SIGNED("fdtypeB", FDCtrlSysBus, state.qdev_for_drives[1]=
.type,
>                          FLOPPY_DRIVE_TYPE_AUTO, qdev_prop_fdc_drive_type=
,
>                          FloppyDriveType),
> -    DEFINE_PROP_SIGNED("fallback", FDCtrlISABus, state.fallback,
> +    DEFINE_PROP_SIGNED("fallback", FDCtrlSysBus, state.fallback,
>                          FLOPPY_DRIVE_TYPE_144, qdev_prop_fdc_drive_type,
>                          FloppyDriveType),
>      DEFINE_PROP_END_OF_LIST(),
> @@ -2918,7 +2918,7 @@ static Property sun4m_fdc_properties[] =3D {
>      DEFINE_PROP_SIGNED("fdtype", FDCtrlSysBus, state.qdev_for_drives[0].=
type,
>                          FLOPPY_DRIVE_TYPE_AUTO, qdev_prop_fdc_drive_type=
,
>                          FloppyDriveType),
> -    DEFINE_PROP_SIGNED("fallback", FDCtrlISABus, state.fallback,
> +    DEFINE_PROP_SIGNED("fallback", FDCtrlSysBus, state.fallback,
>                          FLOPPY_DRIVE_TYPE_144, qdev_prop_fdc_drive_type,
>                          FloppyDriveType),
>      DEFINE_PROP_END_OF_LIST(),

Reviewed-by: Markus Armbruster <armbru@redhat.com>

On whether to pick this into 6.0...

The patch has no effect unless someone or something uses "fallback" with
a non-ISA FDC.  There it fixes a bug.  The bug's exact impact is
unknown.  I figure I could find out, but it doesn't seem to be worth the
bother.

Commit a73275dd6fc:

    Currently, QEMU chooses a drive type automatically based on the inserte=
d
    media. If there is no disk inserted, it chooses a 1.44MB drive type.
   =20
    Change this behavior to be configurable, but leave it defaulted to 1.44=
.
   =20
    This is not earnestly intended to be used by a user or a management
    library, but rather exists so that pre-2.6 board types can configure it
    to be a legacy value.

We do so only for "isa-fdc", in hw/core/machine.c.

I don't understand why we don't for the other devices, but that's
outside this patch's scope.

Downstreams could do it, but it wouldn't work.  They need this commit to
make it work.

Users (human or management application) should not use it, but of course
they might anyway.  This commit makes such (unadvisable) usage safe.

The reward is low, but so is the risk.  If I was the maintainer, I'd be
tempted to take it up to rc3.


