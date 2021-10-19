Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA4C432D64
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 07:48:35 +0200 (CEST)
Received: from localhost ([::1]:45206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mchzG-0003Nq-56
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 01:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mchxQ-0001vx-Cl
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 01:46:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mchxN-00070w-Ja
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 01:46:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634622396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0XvH4hNWsAmOpAaQZkUXxSrwQWSbMsx5Tzirc/y0g6k=;
 b=hG3usrAQHr4l4FehT7TbAuB6jdapT7dcu7Jjvxn4N66BxACswNUfZ1nvvIB8LmSORdNJnV
 i+izxzQxQhH+j0XiNQ0UbPttsqxFfJehm6u0I4PW0jwGCOf5w/KoLGZUTxSrJclorINk/X
 u5irnYzC82a5b1ma2QvtysHR2giUmYI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-g6vrOvhsOh69E2jHrSOtnA-1; Tue, 19 Oct 2021 01:46:31 -0400
X-MC-Unique: g6vrOvhsOh69E2jHrSOtnA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DCAE800685;
 Tue, 19 Oct 2021 05:46:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE6105F4EE;
 Tue, 19 Oct 2021 05:46:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8765B11380A7; Tue, 19 Oct 2021 07:46:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Reiter <s.reiter@proxmox.com>
Subject: Re: [PATCH v4 2/2] monitor: refactor set/expire_password and allow
 VNC display id
References: <20210928090326.1056010-1-s.reiter@proxmox.com>
 <20210928090326.1056010-3-s.reiter@proxmox.com>
 <87zgrebnod.fsf@dusky.pond.sub.org>
 <69473cd0-b01b-a189-e4e8-fcb02738b7b1@proxmox.com>
 <87bl3skrib.fsf@dusky.pond.sub.org>
 <83d76057-8b43-8a21-18c6-6565ea87bf72@proxmox.com>
Date: Tue, 19 Oct 2021 07:46:18 +0200
In-Reply-To: <83d76057-8b43-8a21-18c6-6565ea87bf72@proxmox.com> (Stefan
 Reiter's message of "Thu, 14 Oct 2021 16:52:42 +0200")
Message-ID: <87y26p36tx.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefan Reiter <s.reiter@proxmox.com> writes:

> On 10/14/21 9:14 AM, Markus Armbruster wrote:
>> Stefan Reiter <s.reiter@proxmox.com> writes:
>> 
>>> On 10/12/21 11:24 AM, Markus Armbruster wrote:

[...]

>>>> I'd split this patch into three parts: item 1., 2.+3., 4.-6., because
>>>> each part can stand on its own.
>>>
>>> The reason why I didn't do that initially is more to do with the C side.
>>> I think splitting it up as you describe would make for some awkward diffs
>>> on the qmp_set_password/hmp_set_password side.
>>>
>>> I can try of course.
>> 
>> It's a suggestion, not a demand.  I'm a compulsory patch splitter.
>
> I'll just have a go and see what falls out. I do agree that this patch is a
> bit long on its own.

Thanks!

>>>                       Though I also want to have it said that I'm not a fan
>>> of how the HMP functions have to expand so much to accommodate the QAPI
>>> structure in general.
>> 
>> Care to elaborate?
>
> Well, before this patch 'hmp_set_password' was for all intents and purposes a
> single function call to 'qmp_set_password'. Now it has a bunch of parameter
> parsing and even validation (e.g. enum parsing).

Yes, HMP requires us to do more work manually than QMP does.  Raising
HMP's level of automation to QMP's would be nice, but it would also be a
big project.

>                                                  That's why I asked in the
> v3 patch (I think?) if there was a way to call the QAPI style parsing from
> there, since the parameters are all named the same and in a qdict already..
>
> Something like:
>
>    void hmp_set_password(Monitor *mon, const QDict *qdict)
>    {
>      ExpirePasswordOptions opts = qapi_magical_parse_fn(qdict);
>      qmp_set_password(&opts, &err);
>      [error handling]
>    }

Same structure as qmp_marshal_set_password(), where the "magical parse"
part uses a visitor function generated from the QAPI schema for its
argument type.

HMP works differently.  There, we only have .args_type in
hmp-commands.hx.  Since this is much less expressive than the QAPI
schema, generic code can do much less work for us.  Which means we get
to write more code by hand.

By converting QMP from 'str' to enum, we lift parsing from the
qmp_set_password() to its callers.  qmp_marshal_set_password() does it
for free.  hmp_set_password() needs handwritten code.  It wouldn't with
a QAPI-schema-based HMP, but as I said, that's a big project.

> That being said, I don't mind the current form enough to make this a bigger
> discussion either, so if there isn't an easy way to do the above, let's just
> leave it like it is.

There is no easy way to do the above.


