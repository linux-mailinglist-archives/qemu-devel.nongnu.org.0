Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31513171895
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 14:22:46 +0100 (CET)
Received: from localhost ([::1]:59486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7J7l-0005pl-8Q
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 08:22:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58756)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1j7J6x-0005M6-53
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 08:21:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1j7J6w-0005PQ-60
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 08:21:55 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48935
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1j7J6w-0005P9-2i
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 08:21:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582809713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d37p1uqBBnkUUGRvuZE8lZCw5fBoHp3l8/kWIztcokY=;
 b=XyCoURoDmKgOUOEvklls7opMX6J9pkJk63dYQjpOISTxXMj3qiZWKoeJFP4qyAU0LXqdax
 sfpvcordsRr4npazFAsENYS2t3soqdiKmMkDGsOXVTeFWINLnXIvbu8EV2JW1TH9HU4V9y
 yxWRdzS+lQHQoWsB5VyBR9ZrC/JhOw0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-s3aKHT7sMX69liXgx3ciEQ-1; Thu, 27 Feb 2020 08:21:50 -0500
X-MC-Unique: s3aKHT7sMX69liXgx3ciEQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05EB88017DF;
 Thu, 27 Feb 2020 13:21:49 +0000 (UTC)
Received: from [10.3.116.57] (ovpn-116-57.phx2.redhat.com [10.3.116.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A5111BC6D;
 Thu, 27 Feb 2020 13:21:48 +0000 (UTC)
Subject: Re: [PATCH v4 08/10] nbd/server: introduce NBDExtentArray
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20200205112041.6003-1-vsementsov@virtuozzo.com>
 <20200205112041.6003-9-vsementsov@virtuozzo.com>
 <6396ff32-16a3-62fe-1001-fde8b5a4f431@redhat.com>
 <f23161d4-0bff-30aa-6700-70c532ff8db5@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <18b6e7e8-c4a0-0c9e-e4f1-aa5d460f3592@redhat.com>
Date: Thu, 27 Feb 2020 07:21:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <f23161d4-0bff-30aa-6700-70c532ff8db5@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/27/20 6:46 AM, Vladimir Sementsov-Ogievskiy wrote:
> 26.02.2020 18:06, Eric Blake wrote:
>> On 2/5/20 5:20 AM, Vladimir Sementsov-Ogievskiy wrote:
>>> Introduce NBDExtentArray class, to handle extents list creation in more
>>> controlled way and with fewer OUT parameters in functions.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>> =A0 nbd/server.c | 210 +++++++++++++++++++++++++++++-------------------=
---
>>> =A0 1 file changed, 118 insertions(+), 92 deletions(-)
>>>
>>
>>> +
>>> +/* Further modifications of the array after conversion are abandoned *=
/
>>> +static void nbd_extent_array_convert_to_be(NBDExtentArray *ea)
>>> +{
>>> +=A0=A0=A0 int i;
>>> +
>>> +=A0=A0=A0 assert(!ea->converted_to_be);
>>
>> Comment is stale - further modifications after conversion are a bug=20
>> that aborts the program, not abandoned.
>=20
> I always thought that "abandoned" is something that must not be done, so=
=20
> the word works here. But I don't know English well).

Rephrasing my comment, further modifications are "a bug that aborts the=20
program", rather than "an ignored action that gets abandoned".

> May be:
>=20
> "No further modifications of the array allowed after converting to BE."?=
=20

Yes, that wording is better.

> Is it better?
>=20
> Or just drop the comment.

That's also viable; the code reads fairly well even without the comment.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


