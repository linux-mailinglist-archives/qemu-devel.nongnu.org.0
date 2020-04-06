Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CF019FD23
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Apr 2020 20:27:26 +0200 (CEST)
Received: from localhost ([::1]:36710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLWSz-00010u-Jy
	for lists+qemu-devel@lfdr.de; Mon, 06 Apr 2020 14:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39897)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jLW3L-0000Ki-0R
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 14:00:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jLW3J-0002Bq-So
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 14:00:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59416
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jLW3J-0002BU-PM
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 14:00:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586196052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lcRHjxwj2IvLYyUdLYq/UMlWvaUXQxQz8jsA6VMuQkI=;
 b=OHCi6burjlJfmKU2Oht6jJEUhCJJ9KTxRa4CUGHoV/SI+TWEVIHhIleEnJ1PbRuKxMyVb9
 GlzC3991kGUIOg67+zwckyvajp9rqEV20nHzAo2JLujB9WDp6u9A8JySsB+TUoCmv7H6gr
 CCYkJZgVPXWwFXDbuO20E5nuxIFoiyw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-UbMHiyz7MBKGZynepQXUNw-1; Mon, 06 Apr 2020 14:00:35 -0400
X-MC-Unique: UbMHiyz7MBKGZynepQXUNw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4322418C35A4;
 Mon,  6 Apr 2020 18:00:34 +0000 (UTC)
Received: from [10.3.114.49] (ovpn-114-49.phx2.redhat.com [10.3.114.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A9385C1B0;
 Mon,  6 Apr 2020 18:00:33 +0000 (UTC)
Subject: Re: [PATCH-for-5.1 v2 03/54] hw/arm/allwinner-a10: Move some code
 from realize() to init()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20200406174743.16956-1-f4bug@amsat.org>
 <20200406174743.16956-4-f4bug@amsat.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <e9eb76ff-b81b-91ad-55c1-62da93ca8cf4@redhat.com>
Date: Mon, 6 Apr 2020 13:00:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200406174743.16956-4-f4bug@amsat.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Allwinner-a10" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/6/20 12:46 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Coccinelle reported:
>=20
>    $ spatch ... --timeout 60 --sp-file \
>      scripts/coccinelle/simplify-init-realize-error_propagate.cocci
>    HANDLING: ./hw/arm/allwinner-a10.c
>    >>> possible moves from aw_a10_init() to aw_a10_realize() in ./hw/arm/=
allwinner-a10.c:77
>=20
> Move the calls using &error_fatal which don't depend of input

s/of/on/ (here, and in many subsequent messages in the series)

> updated before realize() to init().
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>   hw/arm/allwinner-a10.c | 26 +++++++++++++-------------
>   1 file changed, 13 insertions(+), 13 deletions(-)
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


