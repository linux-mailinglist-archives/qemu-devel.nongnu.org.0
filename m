Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0A632D542
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 15:29:03 +0100 (CET)
Received: from localhost ([::1]:39016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHoyM-0000AZ-QY
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 09:29:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lHowZ-0007PX-9b
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:27:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lHowR-0006FD-Q9
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:27:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614868022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lGmsZMK9SyKFJIGIRo6jrprXKl0Mvl0Ve55xdyVItEk=;
 b=TQy+T0J0N8ZmkBnSKbRtHwwSXNKT2OzZdcX+IAkipUTG72gXDUfV2xKjZAuoaBiYuPH46S
 jbEiohvcDhkhXmxKytk4cn5EyArWJhdHIEPAPFC3nuqv5Hv84dEcfxwMzijLurCwWss2nH
 AqNUdkLo3IWZDqu/jtBeCuRH8NFit9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-hmdDtLR1O1CCMEMa3EzhXQ-1; Thu, 04 Mar 2021 09:27:01 -0500
X-MC-Unique: hmdDtLR1O1CCMEMa3EzhXQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B070804331;
 Thu,  4 Mar 2021 14:27:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-73.ams2.redhat.com
 [10.36.112.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 932E9226FD;
 Thu,  4 Mar 2021 14:26:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2B0661132C12; Thu,  4 Mar 2021 15:26:55 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 1/3] fdc: Drop deprecated floppy configuration
References: <20210304100059.157158-1-armbru@redhat.com>
 <20210304100059.157158-2-armbru@redhat.com>
 <YEC74LYdmj2p8IyY@redhat.com>
Date: Thu, 04 Mar 2021 15:26:55 +0100
In-Reply-To: <YEC74LYdmj2p8IyY@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 4 Mar 2021 10:52:16 +0000")
Message-ID: <87v9a7dmfk.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

> On Thu, Mar 04, 2021 at 11:00:57AM +0100, Markus Armbruster wrote:
>> Drop the crap deprecated in commit 4a27a638e7 "fdc: Deprecate
>> configuring floppies with -global isa-fdc" (v5.1.0).
>>=20
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  docs/system/deprecated.rst       |  26 --
>>  docs/system/removed-features.rst |  26 ++
>>  hw/block/fdc.c                   |  54 +--
>>  tests/qemu-iotests/172           |  31 +-
>>  tests/qemu-iotests/172.out       | 562 +------------------------------
>>  5 files changed, 30 insertions(+), 669 deletions(-)
>>=20
>> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
>> index 2fcac7861e..6a22bc07e2 100644
>> --- a/docs/system/deprecated.rst
>> +++ b/docs/system/deprecated.rst
>> @@ -94,32 +94,6 @@ QEMU 5.1 has three options:
>>        to the user to load all the images they need.
>>   3. ``-bios <file>`` - Tells QEMU to load the specified file as the fir=
mwrae.
>> =20
>> -``Configuring floppies with ``-global``
>> -'''''''''''''''''''''''''''''''''''''''
>> -
>> -Use ``-device floppy,...`` instead:
>> -::
>> -
>> -    -global isa-fdc.driveA=3D...
>> -    -global sysbus-fdc.driveA=3D...
>> -    -global SUNW,fdtwo.drive=3D...
>> -
>> -become
>> -::
>> -
>> -    -device floppy,unit=3D0,drive=3D...
>> -
>> -and
>> -::
>> -
>> -    -global isa-fdc.driveB=3D...
>> -    -global sysbus-fdc.driveB=3D...
>> -
>> -become
>> -::
>> -
>> -    -device floppy,unit=3D1,drive=3D...
>> -
>>  ``-drive`` with bogus interface type
>>  ''''''''''''''''''''''''''''''''''''
>> =20
>> diff --git a/docs/system/removed-features.rst b/docs/system/removed-feat=
ures.rst
>> index c8481cafbd..b0e7350408 100644
>> --- a/docs/system/removed-features.rst
>> +++ b/docs/system/removed-features.rst
>> @@ -38,6 +38,32 @@ or ``-display default,show-cursor=3Don`` instead.
>>  QEMU 5.0 introduced an alternative syntax to specify the size of the tr=
anslation
>>  block cache, ``-accel tcg,tb-size=3D``.
>> =20
>> +``Configuring floppies with ``-global`` (removed in 6.0)
>> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>> +
>> +Use ``-device floppy,...`` instead:
>> +::
>> +
>> +    -global isa-fdc.driveA=3D...
>> +    -global sysbus-fdc.driveA=3D...
>> +    -global SUNW,fdtwo.drive=3D...
>
> It looks like we're not actually removing the use of -global, rather
> we're removing the driveA=3D and driveB=3D properties entirely, which
> simply means there's nothing to be set via -global. The distinction
> is important, because IIUC, it means that libvirt's use of these
> properties via -device is also impacted eg
>
>   -device isa-fdc,driveA=3Ddrive-fdc0-0-0,bootindexA=3D1,driveB=3Ddrive-f=
dc0-0-1
>
> will no longer work too ?

Correct.

This was deprecated in commit 4a27a638e7 "fdc: Deprecate configuring
floppies with -global isa-fdc" (v5.1.0).  Since then, its use triggers a
warning:

    $ qemu-system-x86_64 -nodefaults -M q35 -display none -drive if=3Dnone,=
id=3Ddrive-fdc0-0-0 -device isa-fdc,driveA=3Ddrive-fdc0-0-0,bootindexA=3D1
    qemu-system-x86_64: -device isa-fdc,driveA=3Ddrive-fdc0-0-0,bootindexA=
=3D1: warning: warning: property isa-fdc.driveA is deprecated
    Use -device floppy,unit=3D0,drive=3D... instead.

Note the -M q35.  Needed because the default machine type has an onboard
isa-fdc, which cannot be configured this way.

Sadly, the commit's update of docs/system/deprecated.rst neglects to
cover this use.  Looks the series overtaxed my capacity to juggle
details; my apologies.

Is libvirt still using these properties?


