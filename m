Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66E348DBCA
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 17:30:54 +0100 (CET)
Received: from localhost ([::1]:58974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8301-0006gW-Jo
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 11:30:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n82wx-000599-Ui
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:27:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n82ww-0000LG-CS
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:27:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642091261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XSqO1ydzVsA2+8houQ+c3ONP9N9c3Mlc0iLiDHp7uY4=;
 b=RClQty1E8rMXqfroLTMyv5rKNeteFyVl6RVAT7kk5CmH+MKaBBjsUEHH5Iz1vtP7bp047p
 6P2rfbLD5JW8eARPBEhGxWKdw3sZToFg/wBZJ/K02XvbhPw2MVj4Li2fL8WvDH3nsJCJSx
 hPT7XhnZ5Y6z9WLA1/5xKK+29fnZXF0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-qYgbwOT0M8S5FgnVyi1fsQ-1; Thu, 13 Jan 2022 11:27:38 -0500
X-MC-Unique: qYgbwOT0M8S5FgnVyi1fsQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9902864A7B;
 Thu, 13 Jan 2022 16:27:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-9.ams2.redhat.com [10.36.112.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B32B32E180;
 Thu, 13 Jan 2022 16:27:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5C9C111380A2; Thu, 13 Jan 2022 17:27:08 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 2/2] qapi/ui: introduce change-vnc-listen
References: <20211220154418.1554279-1-vsementsov@virtuozzo.com>
 <20211220154418.1554279-3-vsementsov@virtuozzo.com>
 <YdRJ06CS4qoDJI/F@redhat.com>
Date: Thu, 13 Jan 2022 17:27:08 +0100
In-Reply-To: <YdRJ06CS4qoDJI/F@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 4 Jan 2022 13:21:23 +0000")
Message-ID: <87lezj61pf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, armbru@redhat.com,
 qemu-devel@nongnu.org, kraxel@redhat.com, marcandre.lureau@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, Dec 20, 2021 at 04:44:18PM +0100, Vladimir Sementsov-Ogievskiy wr=
ote:
>> Add command that can change addresses where VNC server listens for new
>> connections. Prior to 6.0 this functionality was available through
>> 'change' qmp command which was deleted.
>>=20
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>  docs/about/removed-features.rst |  3 ++-
>>  qapi/ui.json                    | 12 ++++++++++++
>>  ui/vnc.c                        | 26 ++++++++++++++++++++++++++
>>  3 files changed, 40 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/docs/about/removed-features.rst b/docs/about/removed-featur=
es.rst
>> index d42c3341de..20e6901a82 100644
>> --- a/docs/about/removed-features.rst
>> +++ b/docs/about/removed-features.rst
>> @@ -348,7 +348,8 @@ documentation of ``query-hotpluggable-cpus`` for add=
itional details.
>>  ``change`` (removed in 6.0)
>>  '''''''''''''''''''''''''''
>> =20
>> -Use ``blockdev-change-medium`` or ``change-vnc-password`` instead.
>> +Use ``blockdev-change-medium`` or ``change-vnc-password`` or
>> +``change-vnc-listen`` instead.
>> =20
>>  ``query-events`` (removed in 6.0)
>>  '''''''''''''''''''''''''''''''''
>> diff --git a/qapi/ui.json b/qapi/ui.json
>> index d7567ac866..14e6fe0b4c 100644
>> --- a/qapi/ui.json
>> +++ b/qapi/ui.json
>> @@ -1304,3 +1304,15 @@
>>  { 'command': 'display-reload',
>>    'data': 'DisplayReloadOptions',
>>    'boxed' : true }
>> +
>> +##
>> +# @change-vnc-listen:
>> +#
>> +# Change set of addresses to listen for connections.
>> +#
>> +# Since: 7.0
>> +#
>> +##
>> +{ 'command': 'change-vnc-listen',
>> +  'data': { 'id': 'str', 'addresses': ['SocketAddress'],
>> +            '*websockets': ['SocketAddress'] } }
>
> We already have a general purpose command above 'display-reload'
> for doing live changes to the display backends.
>
> THis should instead be
>
> { 'struct': 'DisplayReloadOptionsVNC',
>   'data': { '*tls-certs': 'bool',
>             '*addresses': ['SocketAddress'],
> =09    '*websockets': ['SocketAddress'] } }
>
> if 'addresses' is non-null then the listener can be updated.

Good point.  Gerd, what do you think?


