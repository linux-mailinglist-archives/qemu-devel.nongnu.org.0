Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3422E168D97
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Feb 2020 09:25:04 +0100 (CET)
Received: from localhost ([::1]:40126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5Q5v-0000Vn-9m
	for lists+qemu-devel@lfdr.de; Sat, 22 Feb 2020 03:25:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33161)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j5Q58-0008Qs-Cb
 for qemu-devel@nongnu.org; Sat, 22 Feb 2020 03:24:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j5Q56-00050d-Hp
 for qemu-devel@nongnu.org; Sat, 22 Feb 2020 03:24:14 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60354
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j5Q56-00050E-ED
 for qemu-devel@nongnu.org; Sat, 22 Feb 2020 03:24:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582359851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T45vrP9XIhTb9vS7RjFPPl1JpkYIOutb0fUu3RFTTrw=;
 b=Ibknjp5yCD9t8t8M1bLmQSxRwMfGL24Jt/+owGZ9h5EqoQ24qkat4Tr6Rwln85defxydlu
 ffKxfpWGYsQ6H0UTCWxUjW5DqwfcGv5Khgun91oUtol/h82gp9FTvZvjEHzEvN0UWOJONJ
 IftnMcfhyMG6bv0kjqgqkg2xesXmQ40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-52XP2uA5M1qKR3W2VghM7A-1; Sat, 22 Feb 2020 03:24:09 -0500
X-MC-Unique: 52XP2uA5M1qKR3W2VghM7A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4A4C189F760;
 Sat, 22 Feb 2020 08:24:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F176391;
 Sat, 22 Feb 2020 08:24:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A616511386A6; Sat, 22 Feb 2020 09:23:59 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v7 01/11] qapi/error: add (Error **errp) cleaning APIs
References: <20200131130118.1716-1-vsementsov@virtuozzo.com>
 <20200131130118.1716-2-vsementsov@virtuozzo.com>
 <87d0a88k6d.fsf@dusky.pond.sub.org>
 <7856fcbb-8c01-aba3-a11b-63058c117362@virtuozzo.com>
 <875zfz6gsh.fsf@dusky.pond.sub.org>
 <064ca8e9-458e-c780-92a0-05f40cf0975b@virtuozzo.com>
Date: Sat, 22 Feb 2020 09:23:59 +0100
In-Reply-To: <064ca8e9-458e-c780-92a0-05f40cf0975b@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 21 Feb 2020 20:31:55 +0300")
Message-ID: <87sgj31140.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>, qemu-devel@nongnu.org,
 Laszlo Ersek <lersek@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Greg Kurz <groug@kaod.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> 21.02.2020 19:34, Markus Armbruster wrote:
>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>>
>>> 21.02.2020 10:38, Markus Armbruster wrote:
>>>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>>>>
>>>>> Add functions to clean Error **errp: call corresponding Error *err
>>>>> cleaning function an set pointer to NULL.
>>>>>
>>>>> New functions:
>>>>>     error_free_errp
>>>>>     error_report_errp
>>>>>     warn_report_errp
>>>>>
>>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com=
>
>>>>> Reviewed-by: Greg Kurz <groug@kaod.org>
>>>>> Reviewed-by: Eric Blake <eblake@redhat.com>
>>>>> ---
>>>>>
>>>>> CC: Eric Blake <eblake@redhat.com>
>>>>> CC: Kevin Wolf <kwolf@redhat.com>
>>>>> CC: Max Reitz <mreitz@redhat.com>
>>>>> CC: Greg Kurz <groug@kaod.org>
>>>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>>>> CC: Anthony Perard <anthony.perard@citrix.com>
>>>>> CC: Paul Durrant <paul@xen.org>
>>>>> CC: Stefan Hajnoczi <stefanha@redhat.com>
>>>>> CC: "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>
>>>>> CC: Laszlo Ersek <lersek@redhat.com>
>>>>> CC: Gerd Hoffmann <kraxel@redhat.com>
>>>>> CC: Stefan Berger <stefanb@linux.ibm.com>
>>>>> CC: Markus Armbruster <armbru@redhat.com>
>>>>> CC: Michael Roth <mdroth@linux.vnet.ibm.com>
>>>>> CC: qemu-block@nongnu.org
>>>>> CC: xen-devel@lists.xenproject.org
>>>>>
>>>>>    include/qapi/error.h | 26 ++++++++++++++++++++++++++
>>>>>    1 file changed, 26 insertions(+)
>>>>>
>>>>> diff --git a/include/qapi/error.h b/include/qapi/error.h
>>>>> index ad5b6e896d..d34987148d 100644
>>>>> --- a/include/qapi/error.h
>>>>> +++ b/include/qapi/error.h
>>>>> @@ -309,6 +309,32 @@ void warn_reportf_err(Error *err, const char *fm=
t, ...)
>>>>>    void error_reportf_err(Error *err, const char *fmt, ...)
>>>>>        GCC_FMT_ATTR(2, 3);
>>>>>    +/*
>>>>> + * Functions to clean Error **errp: call corresponding Error *err cl=
eaning
>>>>> + * function, then set pointer to NULL.
>>>>> + */
>>>>> +static inline void error_free_errp(Error **errp)
>>>>> +{
>>>>> +    assert(errp && *errp);
>>>>> +    error_free(*errp);
>>>>> +    *errp =3D NULL;
>>>>> +}
>>>>> +
>>>>> +static inline void error_report_errp(Error **errp)
>>>>> +{
>>>>> +    assert(errp && *errp);
>>>>> +    error_report_err(*errp);
>>>>> +    *errp =3D NULL;
>>>>> +}
>>>>> +
>>>>> +static inline void warn_report_errp(Error **errp)
>>>>> +{
>>>>> +    assert(errp && *errp);
>>>>> +    warn_report_err(*errp);
>>>>> +    *errp =3D NULL;
>>>>> +}
>>>>> +
>>>>> +
>>>>>    /*
>>>>>     * Just like error_setg(), except you get to specify the error cla=
ss.
>>>>>     * Note: use of error classes other than ERROR_CLASS_GENERIC_ERROR=
 is
>>>>
>>>> These appear to be unused apart from the Coccinelle script in PATCH 03=
.
>>>>
>>>> They are used in the full "[RFC v5 000/126] error: auto propagated
>>>> local_err" series.  Options:
>>>>
>>>> 1. Pick a few more patches into this part I series, so these guys come
>>>>      with users.
>>>
>>> It needs some additional effort for this series.. But it's possible. St=
ill,
>>> I think that we at least should not pull out patches which should be in
>>> future series (for example from ppc or block/)..
>>
>> Yes, we want to keep related stuff together.
>>
>>> Grepping through v5:
>>>   for x in {warn_report_errp,error_report_errp,error_free_errp}; do ech=
o =3D=3D $x =3D=3D; git grep -l $x | grep -v coccinelle | grep -v 'error\.h=
'; echo; done
>>> =3D=3D warn_report_errp =3D=3D
>>> block/file-posix.c
>>> hw/ppc/spapr.c
>>> hw/ppc/spapr_caps.c
>>> hw/ppc/spapr_irq.c
>>> hw/vfio/pci.c
>>> net/tap.c
>>> qom/object.c
>>>
>>> =3D=3D error_report_errp =3D=3D
>>> hw/block/vhost-user-blk.c
>>> util/oslib-posix.c
>>>
>>> =3D=3D error_free_errp =3D=3D
>>> block.c
>>> block/qapi.c
>>> block/sheepdog.c
>>> block/snapshot.c
>>> blockdev.c
>>> chardev/char-socket.c
>>> hw/audio/intel-hda.c
>>> hw/core/qdev-properties.c
>>> hw/pci-bridge/pci_bridge_dev.c
>>> hw/pci-bridge/pcie_pci_bridge.c
>>> hw/scsi/megasas.c
>>> hw/scsi/mptsas.c
>>> hw/usb/hcd-xhci.c
>>> io/net-listener.c
>>> migration/colo.c
>>> qga/commands-posix.c
>>> qga/commands-win32.c
>>> util/qemu-sockets.c
>>>
>>> What do you want to add?
>>
>> PATCH v5 032 uses both error_report_errp() and error_free_errp().
>> Adding warn_report_errp() without a user is okay with me.  What do you
>> think?
>>
>> If there are patches you consider related to 032, feel free to throw
>> them in.
>
> 032 is qga/commands-win32.c and util/oslib-posix.c
>
> Seems that they are wrongly grouped into one patch.
>
> qga/commands-win32.c matches qga/ (Michael Roth)
> and  util/oslib-posix.c matches POSIX (Paolo Bonzini)
>
> So, it should be two separate patches anyway.
>
> For [1.] I only afraid that we'll have to wait for maintainers, who were
> not interested in previous iterations, to review these new patches..

We won't.

We should and we will give every maintainer a chance to review these
patches, even though the changes are mechanical.  Maintainers are free
to decline or ignore this offer.  I will feel free to interpret that as
"go ahead and merge this through your tree".

In fact, I fully expect the bulk of the changes to go through my tree.
Chasing umpteen maintainers for each one to merge a trivial part of this
massive tree-wide change would take ages and accomplish nothing.

[...]


