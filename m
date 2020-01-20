Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E66C1432EB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 21:28:35 +0100 (CET)
Received: from localhost ([::1]:43884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itdf0-00015x-6L
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 15:28:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41884)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1itdc3-0008F8-EB
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 15:25:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1itdbv-0001ga-RW
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 15:25:27 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26863
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1itdbv-0001fl-Nz
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 15:25:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579551922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JAZ3j8LLjXI7Cw+hjvkVpYriiQjgsHyofGHruYLqvaQ=;
 b=WjzQ8MDZes2cl2IO6BseCUMPqSz3IIjsoz2zUL/bruHPiPjj/2Q9LhhsHhuNtT06Po2tm5
 ifaowPJ6nAghOf24D4VhAyFrgTh02k07apzyaVRNqaNBN8F1bJ8xj4bnf3Numlx4IomHt7
 cWNh0BX3XofYQueUjgE/iSjf0Qyv19I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-0Brm-VEcOa-FpRUrKAW_xw-1; Mon, 20 Jan 2020 15:25:21 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F162D1005512;
 Mon, 20 Jan 2020 20:25:19 +0000 (UTC)
Received: from [10.3.117.16] (ovpn-117-16.phx2.redhat.com [10.3.117.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F24F219756;
 Mon, 20 Jan 2020 20:25:16 +0000 (UTC)
Subject: Re: [PATCH v3 00/10] Further bitmaps improvements
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>
References: <20191219100348.24827-1-vsementsov@virtuozzo.com>
 <063f89d7-2517-f2e2-d8a8-8ff1b417b679@redhat.com>
 <1d0721d7-95e8-7817-86ab-0deb018d5152@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <48ccd95a-f1f2-ec07-4a2a-e2f196aecaf0@redhat.com>
Date: Mon, 20 Jan 2020 14:25:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <1d0721d7-95e8-7817-86ab-0deb018d5152@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 0Brm-VEcOa-FpRUrKAW_xw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
 "jsnow@redhat.com" <jsnow@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Denis Lunev <den@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/20 10:33 AM, Vladimir Sementsov-Ogievskiy wrote:
> 20.01.2020 17:20, Max Reitz wrote:
>> On 19.12.19 11:03, Vladimir Sementsov-Ogievskiy wrote:
>>> Hi!
>>>
>>> The main feature here is improvement of _next_dirty_area API, which I'm
>>> going to use then for backup / block-copy.
>>
>> Looks good to me overall, with a few minor changes.  I=92d rather leave
>> patches 8 and 9 to Eric, though.  (Even though I=92m not exactly the
>> maintainer for the rest of the patches either...)
>>
>> Max
>>
>=20
> Thanks for reviewing! Let's wait for Eric.

I had enough concerns over 8/10 to probably warrant a v4; but I'm also=20
fine taking the entire series through my NBD tree once everyone is happy=20
with it.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


