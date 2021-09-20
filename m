Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF5C4111AD
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 11:10:49 +0200 (CEST)
Received: from localhost ([::1]:53672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSFK4-0003gW-AT
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 05:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mSFIi-0002Lk-Vm
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 05:09:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mSFIg-0003XA-CD
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 05:09:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632128961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=on+SPAtEhXvJ6kgJ6pbERiPzZeokYSRmi7KebKJfi8Y=;
 b=d7WARY8cv7J+dvU6G4iEAdSuHUSMSJ+MXcNcpB427CLO/9dHrI5GCWj+o4ivRp7trb5Eha
 4IkbeV97DnKlzczkZ/wIwsiQchi3aNJDf11PvWmPTSboLea8hcgKE8/fOP/4SChM8vB4EB
 daq0VLw2UmqI88mo5osHbbw55GEQ9pE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-epUPhuzrNaKFOH3edUIdmg-1; Mon, 20 Sep 2021 05:09:17 -0400
X-MC-Unique: epUPhuzrNaKFOH3edUIdmg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA9A0800FF3;
 Mon, 20 Sep 2021 09:09:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46D7B60C17;
 Mon, 20 Sep 2021 09:09:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D1882113865F; Mon, 20 Sep 2021 11:08:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Krempa <pkrempa@redhat.com>
Subject: Re: [PATCH RFC 1/5] qapi: Enable enum member introspection to show
 more than name
References: <20210915192425.4104210-1-armbru@redhat.com>
 <20210915192425.4104210-2-armbru@redhat.com>
 <YUSq/ZDfLPInPIc8@angien.pipo.sk>
Date: Mon, 20 Sep 2021 11:08:59 +0200
In-Reply-To: <YUSq/ZDfLPInPIc8@angien.pipo.sk> (Peter Krempa's message of
 "Fri, 17 Sep 2021 16:49:33 +0200")
Message-ID: <87zgs7bolw.fsf@dusky.pond.sub.org>
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
 libvir-list@redhat.com, eblake@redhat.com, mdroth@linux.vnet.ibm.com,
 qemu-devel@nongnu.org, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Krempa <pkrempa@redhat.com> writes:

> On Wed, Sep 15, 2021 at 21:24:21 +0200, Markus Armbruster wrote:
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
> I prefer this one. While the schema output grows, nobody is really
> reading it manually.

True, but growing schema output can only slow down client startup.
Negligible for libvirt, I presume?

> The implementation in libvirt is very straightforward:
>
> https://gitlab.com/pipo.sk/libvirt/-/commit/24f1709cfae72cd765d02dc2124d6c954554ea55
> https://gitlab.com/pipo.sk/libvirt/-/commit/5909db9d4994327b3f64d5c329edd4b175495bfe
>
>> 2. Like 1, but omit "boring" elements of @member, and empty @member.
>> 
>>    @values does not become redundant.  Output of query-qmp-schema
>>    grows only as we make enum members non-boring.
>
> This has 2 drawbacks:
> - we would never get rid of either of those
> - clients would have to check both, one for whether the member is
>   present and second whether it's non-boring.
>
> IMO it's simpler for clients just to prefer the new approach when
> present as the old is simply a subset.

Noted.

>> 3. Versioned query-qmp-schema.
>> 
>>    query-qmp-schema provides either @values or @members.  The QMP
>>    client can select which version it wants.
>
> At least for libvirt this poses a chicken & egg problem. We'd have to
> query the schema to see that it has the switch to do the selection and
> then probe with the modern one.

The simplest solution is to try the versions the management application
can understand in order of preference (newest to oldest) until one
succeeds.  I'd expect the first try to work most of the time.  Only when
you combine new libvirt with old QEMU, the fallback has to kick in.

Other parts of the management application should remain oblivous of the
differences.

We could of course try to reduce the number of roundtrips, say by
putting sufficient information into the QMP greeting (one roundtrip), or
the output of query-qmp-schema (try oldest to find the best one, then
try the best one unless it's the oldest).  I doubt that's worthwhile.

I'm not trying to talk you into this solution.  We're just exploring the
solution space together, and with an open mind.


