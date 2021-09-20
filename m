Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B688241117D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 10:59:54 +0200 (CEST)
Received: from localhost ([::1]:43184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSF9V-0004kE-RS
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 04:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mSF8N-00041r-Kq
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:58:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mSF8I-0002h5-N4
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:58:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632128316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FPg+qrZzaH0NnWro1nmCUHNqxk85qu4bQmqOBig2+Bw=;
 b=GJtwITtUPxAV8WetxnQziBSB9AZ54SCGAcft4JL3XRdLoM/snGDlACJqV/Ddu1gnmfjurv
 yKKwksoQNIMia8hObfGW2O7xqGHafV79Hd+EpECE6ywqLqtKcZvuYRGLSg+PxwZzKZI4ro
 nXUiRRG/0rojusnfVZq0YQ4bv9PwlsY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-5TLppg3jOumNrT28vjRgcg-1; Mon, 20 Sep 2021 04:58:35 -0400
X-MC-Unique: 5TLppg3jOumNrT28vjRgcg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E56D824FB1;
 Mon, 20 Sep 2021 08:58:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7EF260C17;
 Mon, 20 Sep 2021 08:57:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 799DA113865F; Mon, 20 Sep 2021 10:57:46 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH RFC 1/5] qapi: Enable enum member introspection to show
 more than name
References: <20210915192425.4104210-1-armbru@redhat.com>
 <20210915192425.4104210-2-armbru@redhat.com>
 <20210917135644.m37z2kpbel4lk6zn@redhat.com>
Date: Mon, 20 Sep 2021 10:57:46 +0200
In-Reply-To: <20210917135644.m37z2kpbel4lk6zn@redhat.com> (Eric Blake's
 message of "Fri, 17 Sep 2021 08:56:44 -0500")
Message-ID: <87bl4nd3p1.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.476,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berrange@redhat.com,
 qemu-devel@nongnu.org, mdroth@linux.vnet.ibm.com,
 Markus Armbruster <armbru@redhat.com>, libvir-list@redhat.com,
 pkrempa@redhat.com, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On Wed, Sep 15, 2021 at 09:24:21PM +0200, Markus Armbruster wrote:
>> The next commit will add feature flags to enum members.  There's a
>> problem, though: query-qmp-schema shows an enum type's members as an
>> array of member names (SchemaInfoEnum member @values).  If it showed
>> an array of objects with a name member, we could simply add more
>> members to these objects.  Since it's just strings, we can't.
>> 
>> I can see three ways to correct this design mistake:
>> 
>> 1. Do it the way we should have done it, plus compatibility goo.
>> 
>>    We want a ['SchemaInfoEnumMember'] member in SchemaInfoEnum.  Since
>>    changing @values would be a compatibility break, add a new member
>>    @members instead.
>> 
>>    @values is now redundant.  We should be able to get rid of it
>>    eventually.
>> 
>>    In my testing, output of qemu-system-x86_64's query-qmp-schema
>>    grows by 11% (18.5KiB).
>
> This makes sense if we plan to deprecate @values - if so, that
> deprecation would make sense as part of this series, although we may
> drag our feet for how long before we actually remove it.

Yes.  Changing query-qmp-schema requires extra care, as it is the very
means for coping with change.

>> 
>> 2. Like 1, but omit "boring" elements of @member, and empty @member.
>> 
>>    @values does not become redundant.  Output of query-qmp-schema
>>    grows only as we make enum members non-boring.
>
> Does not change whether libvirt would have to learn to query the new
> members, but adds a mandatory fallback step for learning about boring
> members (although the fallback step will have to be there anyway for
> older qemu).  Peter probably has a better idea of which version is
> nicer.
>
>> 
>> 3. Versioned query-qmp-schema.
>> 
>>    query-qmp-schema provides either @values or @members.  The QMP
>>    client can select which version it wants.
>
> Sounds more complicated to implement.  I'm not opposed to it, but am
> leaning towards 1 or 2 myself.

More on this in my reply to Peter.

>
>> 
>> This commit implements 1. simply because it's the solution I thought
>> of first.  I'm prepared to implement one of the others if we decide
>> that's what we want.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  qapi/introspect.json       | 20 ++++++++++++++++++--
>>  scripts/qapi/introspect.py | 18 ++++++++++++++----
>>  2 files changed, 32 insertions(+), 6 deletions(-)
>> 
>> diff --git a/qapi/introspect.json b/qapi/introspect.json
>> index 39bd303778..250748cd95 100644
>> --- a/qapi/introspect.json
>> +++ b/qapi/introspect.json
>> @@ -142,14 +142,30 @@
>>  #
>>  # Additional SchemaInfo members for meta-type 'enum'.
>>  #
>> -# @values: the enumeration type's values, in no particular order.
>> +# @members: the enum type's members, in no particular order.
>
> Missing a '(since 6.2)' tag.

Yes.

>> +#
>> +# @values: the enumeration type's member names, in no particular order.
>> +#          Redundant with @members.  Just for backward compatibility.
>
> Worth marking as deprecated in this patch, or in a followup?

If we intend to deprecate, we can just as well do it right away.

>>  #
>>  # Values of this type are JSON string on the wire.
>>  #
>>  # Since: 2.5
>>  ##
>>  { 'struct': 'SchemaInfoEnum',
>> -  'data': { 'values': ['str'] } }
>> +  'data': { 'members': [ 'SchemaInfoEnumMember' ],
>> +            'values': ['str'] } }
>> +
>> +##
>> +# @SchemaInfoEnumMember:
>> +#
>> +# An object member.
>> +#
>> +# @name: the member's name, as defined in the QAPI schema.
>> +#
>> +# Since: 6.1
>
> 6.2

Whoops!

>> +##
>> +{ 'struct': 'SchemaInfoEnumMember',
>> +  'data': { 'name': 'str' } }
>>
>
> Definitely more flexible.


