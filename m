Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F482B939A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 14:25:35 +0100 (CET)
Received: from localhost ([::1]:33724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfjwM-0004gf-St
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 08:25:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfjoq-00070k-5Q
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 08:17:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfjom-0006Fx-P7
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 08:17:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605791862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p7MrvKuEP78zZW4x/TcnHTWjzl+6TSllxIe5BZ1Sjzo=;
 b=Tdu+ay85FRYGqUT8xz/0PcC0eAYsQ0qmjZkPnUKm43amNubtSUIN4dGpNSX5D67NUvg5+l
 Y2Mmv81NwWRtYEiefa1fX/RYzDEiS2Xp8Xj+xETE2F+PwYo+a8oFgMOBE9phHHM51Yszqo
 o8o4B8U51THw0C3KfkK1J0CPyp77E1g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-3gCWuz5WOUqUggyBUc66IA-1; Thu, 19 Nov 2020 08:17:41 -0500
X-MC-Unique: 3gCWuz5WOUqUggyBUc66IA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F75A107ACE6;
 Thu, 19 Nov 2020 13:17:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC22B5C1D1;
 Thu, 19 Nov 2020 13:17:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CA66F11358BA; Thu, 19 Nov 2020 14:17:37 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH for-6.0 1/6] qapi: Add query-accel command
References: <2d934855-ad11-9f61-28a1-7c0a35347a66@redhat.com>
 <20201116211352.GC1235237@habkost.net>
 <87mtzgbc29.fsf@dusky.pond.sub.org>
 <20201118011917.GB10041@SPB-NB-133.local>
 <87ft57oycu.fsf@dusky.pond.sub.org>
 <20201118112845.GA11988@merkur.fritz.box>
 <20201118115612.GD229461@redhat.com>
 <87blfukbzd.fsf@dusky.pond.sub.org>
 <20201118154507.GI1509407@habkost.net>
 <c411d2ac-fafe-872b-cc34-9c7b5901120d@redhat.com>
 <20201118162319.GK1509407@habkost.net>
Date: Thu, 19 Nov 2020 14:17:37 +0100
In-Reply-To: <20201118162319.GK1509407@habkost.net> (Eduardo Habkost's message
 of "Wed, 18 Nov 2020 11:23:19 -0500")
Message-ID: <87a6vdbi4u.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 03:44:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Wed, Nov 18, 2020 at 09:56:28AM -0600, Eric Blake wrote:
>> On 11/18/20 9:45 AM, Eduardo Habkost wrote:
>> > On Wed, Nov 18, 2020 at 02:53:26PM +0100, Markus Armbruster wrote:
>> > [...]
>> >> Another way to skin this cat:
>> >>
>> >>       {"available": {"kvm": { extra properties... },
>> >>                      "tcg": ...,
>> >>                      "xen": ...},
>> >>        "active": "kvm"}
>> > 
>> > How would this structure be represented in the QAPI schema?
>> > 
>> > In other words, how do I say "Dict[str, AccelInfo]" in QAPIese?
>> 
>> {'type':'AvailAccel', 'data': {
>>   '*kvm': 'KvmExtraProps',
>>   '*tcg': 'TcgExtraProps',
>>   '*xen': 'XenExtraProps',
>>   '*hax': 'HaxExtraProps' } }
>> {'command':'query-accel', 'returns': {
>>    'available': 'AvailAccel', 'active': 'strOrEnum' } }
>> 
>> where adding a new accelerator then adds a new optional member to
>> AvailAccel as well as possibly a new enum member if 'active' is driving
>> by an enum instead of 'str'.
>
> Is it possible to represent this if we don't enumerate all
> possible dictionary keys in advance?  (I'm not suggesting we
> should/shouldn't do that, just wondering if it's possible)

Mostly no.

The definition of a complex type (struct or union) specifies all
members.  There is no way to say "and whatever else may be there".

We actually have such types anyway.  Consider command device_add: it
takes arguments 'driver', 'bus', 'str', and properties.  Its arguments
type is "struct of driver, bus, str, and whatever else may be there".

Since the schema language can't express this, we cheat:

    { 'command': 'device_add',
      'data': {'driver': 'str', '*bus': 'str', '*id': 'str'},
      'gen': false } # so we can get the additional arguments

With 'gen': false, 'data' is at best a statement of intent.  In this
case, it's correct, just incomplete[*].

Introspection takes 'data' at face value.  It's exactly as accurate as
'data' is.

We could extend the schema language so we can say

    { 'command': 'device_add',
      'data': {'driver': 'str', '*bus': 'str', '*id': 'str',
               '**props': 'dict'}

where 'props' receives any remaining arguments.  Fairly common language
feature, e.g. &rest in Lisp, ** in Python, ...

Removed the need for 'gen': false, and enables more accurate
introspection.

Type 'dict' doesn't exist, yet.  I think it could.  We got 'any'
already.


[*] There have been uses of 'gen': false where 'data' was actually
wrong.  For an example, see commit b8a98326d5 "qapi-schema: Fix up
misleading specification of netdev_add".


