Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5BD30700C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 08:50:13 +0100 (CET)
Received: from localhost ([::1]:37704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l524C-00048g-2B
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 02:50:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l520G-00085J-5t
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 02:46:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l520D-0001Tv-E9
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 02:46:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611819964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Uq4bIqIjoKbHjYROsHa+mHaUDR6lYjc6x7zHbofqSMo=;
 b=PHk7hgGyeDYX/O6pBWYyTtM5xchI3hQLzncc+SndAD2qaHswr+UF/YkhGJUxdsIcBVMbxl
 suEhfaG8BxGkNUkLs38a7tXxOuSka1KFDQiYlfpoIDLG2zFtZW74GtiIQATvqUeEL9mgMn
 W+cM59xsqVXjElXjsY9m6EQq/xjTauo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-JtktDMkOM-eLDaemg3za7A-1; Thu, 28 Jan 2021 02:46:02 -0500
X-MC-Unique: JtktDMkOM-eLDaemg3za7A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9555B1966322;
 Thu, 28 Jan 2021 07:46:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C0FA6F80A;
 Thu, 28 Jan 2021 07:45:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B7D92113865F; Thu, 28 Jan 2021 08:45:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v4 5/5] qapi: More complex uses of QAPI_LIST_APPEND
References: <20210113221013.390592-1-eblake@redhat.com>
 <20210113221013.390592-6-eblake@redhat.com>
 <87mtww59jp.fsf@dusky.pond.sub.org>
 <077d9364-ceb5-8cb8-c008-0ef74289fdc2@redhat.com>
Date: Thu, 28 Jan 2021 08:45:51 +0100
In-Reply-To: <077d9364-ceb5-8cb8-c008-0ef74289fdc2@redhat.com> (Eric Blake's
 message of "Wed, 27 Jan 2021 12:12:25 -0600")
Message-ID: <87ft2lfqs0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 Eduardo Habkost <ehabkost@redhat.com>,
 "open list:GLUSTER" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 "open list:GLUSTER" <integration@gluster.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On 1/26/21 3:31 AM, Markus Armbruster wrote:
>> Eric Blake <eblake@redhat.com> writes:
>> 
>>> These cases require a bit more thought to review; in each case, the
>>> code was appending to a list, but not with a FOOList **tail variable.
>>>
>>> Signed-off-by: Eric Blake <eblake@redhat.com>
>>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>
>>> ---
>>> fix qmp_guest_network_get_interfaces [Vladimir]
>> 
>> Fails tests/test-qga.  I should've double-checked earlier.
>
> I ran 'make check', but I'll check again.  In the meantime,
>
>
>> 
>> Dropping this part unbreaks the test.
>> 
>> I'd like to drop just this part, and merge the rest.  You can then
>> respin just this part as a follow-up patch.  Okay?
>
> this plan is okay with me.

Done.  Thanks!


