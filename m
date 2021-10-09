Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA3B427807
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 10:11:15 +0200 (CEST)
Received: from localhost ([::1]:57750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZ7Rp-0007ub-RQ
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 04:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mZ7Pi-0007E6-Mx
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 04:09:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mZ7Pc-0000Jt-Ou
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 04:09:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633766935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fhdSnnAmnjlhd3Y6GOKhLf1rHBJybDytntcujvwvaS0=;
 b=RdtAfV4reqFCdprrgyXWs5mP4UxR1X2ew4/gW+Qk313PR29XnS5haGQFsJE75ThbAJlvZ7
 nybnmsI37hjR1+EwtipRVvo0Ye9La7/lIQY9d/xig+fCMe8DUv8jADgYwiZTSduyMpWHmY
 7X7NNF0I4E6uSA12/+kqU/LgJkIXUZ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-JCXuCb7jODiOo6DTPkhGvA-1; Sat, 09 Oct 2021 04:08:54 -0400
X-MC-Unique: JCXuCb7jODiOo6DTPkhGvA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF7EF100C609;
 Sat,  9 Oct 2021 08:08:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 84E075C1C5;
 Sat,  9 Oct 2021 08:08:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0D950113865F; Sat,  9 Oct 2021 10:08:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Krempa <pkrempa@redhat.com>
Subject: Re: [PATCH RFC 1/5] qapi: Enable enum member introspection to show
 more than name
References: <20210915192425.4104210-1-armbru@redhat.com>
 <20210915192425.4104210-2-armbru@redhat.com>
 <YUSq/ZDfLPInPIc8@angien.pipo.sk> <87zgs7bolw.fsf@dusky.pond.sub.org>
 <YUha7xwblG1cqeNx@angien.pipo.sk>
Date: Sat, 09 Oct 2021 10:08:40 +0200
In-Reply-To: <YUha7xwblG1cqeNx@angien.pipo.sk> (Peter Krempa's message of
 "Mon, 20 Sep 2021 11:57:03 +0200")
Message-ID: <87r1cu39iv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.051,
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

> On Mon, Sep 20, 2021 at 11:08:59 +0200, Markus Armbruster wrote:
>> Peter Krempa <pkrempa@redhat.com> writes:
>> 
>> > On Wed, Sep 15, 2021 at 21:24:21 +0200, Markus Armbruster wrote:
>> >> The next commit will add feature flags to enum members.  There's a
>> >> problem, though: query-qmp-schema shows an enum type's members as an
>> >> array of member names (SchemaInfoEnum member @values).  If it showed
>> >> an array of objects with a name member, we could simply add more
>> >> members to these objects.  Since it's just strings, we can't.
>> >> 
>> >> I can see three ways to correct this design mistake:
>> >> 
>> >> 1. Do it the way we should have done it, plus compatibility goo.
>> >> 
>> >>    We want a ['SchemaInfoEnumMember'] member in SchemaInfoEnum.  Since
>> >>    changing @values would be a compatibility break, add a new member
>> >>    @members instead.
>> >> 
>> >>    @values is now redundant.  We should be able to get rid of it
>> >>    eventually.
>> >> 
>> >>    In my testing, output of qemu-system-x86_64's query-qmp-schema
>> >>    grows by 11% (18.5KiB).
>> >
>> > I prefer this one. While the schema output grows, nobody is really
>> > reading it manually.
>> 
>> True, but growing schema output can only slow down client startup.
>> Negligible for libvirt, I presume?
>
> Libvirt employs caching, so unless it's the first VM started after a
> qemu/libvirt upgrade, the results are already processed and cached.

Good!

> In fact we don't even keep the full schema around, we just extract
> information and store them as capability bits. For now we didn't run
> into the need to have the full schema around when starting a VM.
>
> [...]
>
>> >> 3. Versioned query-qmp-schema.
>> >> 
>> >>    query-qmp-schema provides either @values or @members.  The QMP
>> >>    client can select which version it wants.
>> >
>> > At least for libvirt this poses a chicken & egg problem. We'd have to
>> > query the schema to see that it has the switch to do the selection and
>> > then probe with the modern one.
>> 
>> The simplest solution is to try the versions the management application
>> can understand in order of preference (newest to oldest) until one
>> succeeds.  I'd expect the first try to work most of the time.  Only when
>> you combine new libvirt with old QEMU, the fallback has to kick in.
>> 
>> Other parts of the management application should remain oblivous of the
>> differences.
>
> That would certainly work and be reasonably straightforward for libvirt
> to implement, but:
>  1) libvirt's code for using the QMP schema would be exactly the same as
>     with approach 1), as we need to handle old clients too and the new
>     way is simply a superset of what we have

Yes, libvirt would need the same code for processing old and new.  The
only difference would be how it decides which method to use.  With 1,
it's "if @members is present, use it, else @values".  With 2, it's "if
the version we use is new enough, use @members, else @values".

>  2) qemu's deprecation approach itself wouldn't be any easier in either
>     of those scenarios
>
> Basically the only thing this would gain us is that if the deprecation
> period is over old clients which were not fixed could fail silently:
>
> Assuming that 'query-qmp-schema' gains a boolean option such as
> 'fancier-enums' and setting that to true returns the new format of
> schema, after the deprecation is over you could simply return an error
> if a caller omits 'fancier-enums' or sets it to false, which creates a
> clean cut for the removal.

Yes.

> With approach 1) itself, clients which were not adapted would start
> lacking information based on enum values.
>
> Now for those it depends on how they actually handled it until now. E.g.
> old libvirt would report that the QMP schema is broken if 'values' would
> be missing.

Which I consider the sensible thing to do.

> Whether that's a worthwhile thing to do? I'm not really persuaded. (And
> I'm biased since libvirt handles it correctly).

I think 3 has the following advantages over 1:

* As you noted, it ensures outmoded clients fail cleanly.  Not much of
  an advantage for clients that handle missing @values sensibly.
  Perhaps it could enable better error messages.

* It avoids duplicated contents in old an new format.  Not much of an
  advantage for clients that cache their schema interrogation.

* It can enable more radical introspection changes.  Without versioning,
  the common rules for compatible evolution apply (section
  "Compatibility considerations" in qapi-code-gen.rst).  With
  versioning, they don't.

I agree this is not really compelling just for the problem at hand.  We
can reconsider when we run into more problems.

>> We could of course try to reduce the number of roundtrips, say by
>> putting sufficient information into the QMP greeting (one roundtrip), or
>> the output of query-qmp-schema (try oldest to find the best one, then
>> try the best one unless it's the oldest).  I doubt that's worthwhile.
>
> In this particular scenario, I'd doubt that it's worthwhile as the
> change isn't really fundamental and issuing one extra QMP call isn't as
> problematic as other cases, e.g probing of CPU features which results in
> a QMP call per feature when starting a VM.
>
> Currently libvirt issues 50 + 5 QMP commands(kvm, and non-kvm) for
> probing capabilities.
>
>> I'm not trying to talk you into this solution.  We're just exploring the
>> solution space together, and with an open mind.
>
> The idea of unconditionally trying a newer approach is a good one to
> hold onto when we'll need it in the future!

Only where the failure modes are simple enough to make misinterpretation
basically impossible.


