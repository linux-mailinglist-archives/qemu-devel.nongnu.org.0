Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 248B832D79C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 17:24:26 +0100 (CET)
Received: from localhost ([::1]:34078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHqm0-0002qe-Vg
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 11:24:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lHqky-00027U-QC
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 11:23:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lHqkt-0001Fm-RW
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 11:23:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614874994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PWGUAXknK1ca9OXZGe51sUsXa9B53rXC9rWm3iW30Tc=;
 b=g85KfsErgqO3sBKZgPFgeepnJ+YhMG2p0j7AMszywxBgCeK3YB7eQcQdLwam4ZGmR5gtJ5
 v7iWPMIYqDbVCfKnDD2RSLSOxiTPuTk36NgwB327YJ27RYSGSZk5hJ7beeM+2pCT/jyLon
 pScg5/KsMuAZrpu+F1cq8XcmFSgO7Vc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-EeHR6DIRMNuQVGJonwoyhQ-1; Thu, 04 Mar 2021 11:23:12 -0500
X-MC-Unique: EeHR6DIRMNuQVGJonwoyhQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A61A0760C0;
 Thu,  4 Mar 2021 16:23:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-73.ams2.redhat.com
 [10.36.112.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AB711002393;
 Thu,  4 Mar 2021 16:23:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CB8881132C12; Thu,  4 Mar 2021 17:23:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 1/3] fdc: Drop deprecated floppy configuration
References: <20210304100059.157158-1-armbru@redhat.com>
 <20210304100059.157158-2-armbru@redhat.com>
 <YEC74LYdmj2p8IyY@redhat.com> <87v9a7dmfk.fsf@dusky.pond.sub.org>
 <YEDv5l/tGdnDtiHh@redhat.com>
Date: Thu, 04 Mar 2021 17:23:05 +0100
In-Reply-To: <YEDv5l/tGdnDtiHh@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 4 Mar 2021 14:34:14 +0000")
Message-ID: <87k0qmdh1y.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Mar 04, 2021 at 03:26:55PM +0100, Markus Armbruster wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>=20
>> > On Thu, Mar 04, 2021 at 11:00:57AM +0100, Markus Armbruster wrote:
>> >> Drop the crap deprecated in commit 4a27a638e7 "fdc: Deprecate
>> >> configuring floppies with -global isa-fdc" (v5.1.0).
>> >>=20
>> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> >> ---
>> >>  docs/system/deprecated.rst       |  26 --
>> >>  docs/system/removed-features.rst |  26 ++
>> >>  hw/block/fdc.c                   |  54 +--
>> >>  tests/qemu-iotests/172           |  31 +-
>> >>  tests/qemu-iotests/172.out       | 562 +----------------------------=
--
>> >>  5 files changed, 30 insertions(+), 669 deletions(-)
>> >>=20
>> >> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
>> >> index 2fcac7861e..6a22bc07e2 100644
>> >> --- a/docs/system/deprecated.rst
>> >> +++ b/docs/system/deprecated.rst
>> >> @@ -94,32 +94,6 @@ QEMU 5.1 has three options:
>> >>        to the user to load all the images they need.
>> >>   3. ``-bios <file>`` - Tells QEMU to load the specified file as the =
firmwrae.
>> >> =20
>> >> -``Configuring floppies with ``-global``
>> >> -'''''''''''''''''''''''''''''''''''''''
>> >> -
>> >> -Use ``-device floppy,...`` instead:
>> >> -::
>> >> -
>> >> -    -global isa-fdc.driveA=3D...
>> >> -    -global sysbus-fdc.driveA=3D...
>> >> -    -global SUNW,fdtwo.drive=3D...
>> >> -
>> >> -become
>> >> -::
>> >> -
>> >> -    -device floppy,unit=3D0,drive=3D...
>> >> -
>> >> -and
>> >> -::
>> >> -
>> >> -    -global isa-fdc.driveB=3D...
>> >> -    -global sysbus-fdc.driveB=3D...
>> >> -
>> >> -become
>> >> -::
>> >> -
>> >> -    -device floppy,unit=3D1,drive=3D...
>> >> -
>> >>  ``-drive`` with bogus interface type
>> >>  ''''''''''''''''''''''''''''''''''''
>> >> =20
>> >> diff --git a/docs/system/removed-features.rst b/docs/system/removed-f=
eatures.rst
>> >> index c8481cafbd..b0e7350408 100644
>> >> --- a/docs/system/removed-features.rst
>> >> +++ b/docs/system/removed-features.rst
>> >> @@ -38,6 +38,32 @@ or ``-display default,show-cursor=3Don`` instead.
>> >>  QEMU 5.0 introduced an alternative syntax to specify the size of the=
 translation
>> >>  block cache, ``-accel tcg,tb-size=3D``.
>> >> =20
>> >> +``Configuring floppies with ``-global`` (removed in 6.0)
>> >> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>> >> +
>> >> +Use ``-device floppy,...`` instead:
>> >> +::
>> >> +
>> >> +    -global isa-fdc.driveA=3D...
>> >> +    -global sysbus-fdc.driveA=3D...
>> >> +    -global SUNW,fdtwo.drive=3D...
>> >
>> > It looks like we're not actually removing the use of -global, rather
>> > we're removing the driveA=3D and driveB=3D properties entirely, which
>> > simply means there's nothing to be set via -global. The distinction
>> > is important, because IIUC, it means that libvirt's use of these
>> > properties via -device is also impacted eg
>> >
>> >   -device isa-fdc,driveA=3Ddrive-fdc0-0-0,bootindexA=3D1,driveB=3Ddriv=
e-fdc0-0-1
>> >
>> > will no longer work too ?
>>=20
>> Correct.
>>=20
>> This was deprecated in commit 4a27a638e7 "fdc: Deprecate configuring
>> floppies with -global isa-fdc" (v5.1.0).  Since then, its use triggers a
>> warning:
>>=20
>>     $ qemu-system-x86_64 -nodefaults -M q35 -display none -drive if=3Dno=
ne,id=3Ddrive-fdc0-0-0 -device isa-fdc,driveA=3Ddrive-fdc0-0-0,bootindexA=
=3D1
>>     qemu-system-x86_64: -device isa-fdc,driveA=3Ddrive-fdc0-0-0,bootinde=
xA=3D1: warning: warning: property isa-fdc.driveA is deprecated
>>     Use -device floppy,unit=3D0,drive=3D... instead.
>>=20
>> Note the -M q35.  Needed because the default machine type has an onboard
>> isa-fdc, which cannot be configured this way.
>>=20
>> Sadly, the commit's update of docs/system/deprecated.rst neglects to
>> cover this use.  Looks the series overtaxed my capacity to juggle
>> details; my apologies.
>>=20
>> Is libvirt still using these properties?
>
> Unfortunately yes, but it seems like it ought to be fairly easy to
> change the syntax. Just need to figure out what the right way to
> detect the availability of the new syntax is. Presumably just look
> for existance of the 'floppy' device type ?

Yes.  The device type was added in merge commit fd209e4a7, v2.8.0.

> Can you confirm that switching from -global to the new -device floppy
> does /not/ have any live migration impact ?

Yes, it must not affect migration.

When Kevin split the floppy device type off the floppy controller, he
had to add some moderately ugly hackery to keep the old qdev properties
working.  Think propagate property values to floppy from controller,
which otherwise ignores them.

The way you get the values into the floppy device cannot affect the
migration data.  Only different values can.

This patch removes a deprecated way.


