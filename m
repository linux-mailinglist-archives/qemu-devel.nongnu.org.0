Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D92B33B13C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:37:48 +0100 (CET)
Received: from localhost ([::1]:57920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLlXf-0006Oe-5C
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:37:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lLlWO-0005V6-3Q
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:36:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lLlWJ-0000It-Iz
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:36:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615808182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wp72eH2147N/TafXsULHYG4pbRNP/DUJfAcKkRb+b98=;
 b=GGL8F+2Cuz4o2PLuLCZcOmnxXNOXlPCftuMEwtmwndE38kKhSYv4njbyI2VO5FpFK1WO6D
 P2BqKhAxzKAiRRgH5rLDYB0xsNNIYA9f0jeHUoDEzcKw80AnbhZsaKX/rMscYBykqrr6RO
 4ZJ1AstExgzmjkojqXvwn8/S2aV63cI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-q5dMQINXP5CKplbIHRfqGQ-1; Mon, 15 Mar 2021 07:36:17 -0400
X-MC-Unique: q5dMQINXP5CKplbIHRfqGQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B8DC184F563;
 Mon, 15 Mar 2021 11:36:16 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-128.ams2.redhat.com [10.36.115.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F09C5C8AA;
 Mon, 15 Mar 2021 11:36:05 +0000 (UTC)
Date: Mon, 15 Mar 2021 12:36:04 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 00/30] qapi/qom: QAPIfy --object and object-add
Message-ID: <YE9GpKMDzzBMu1lQ@merkur.fritz.box>
References: <20210308165440.386489-1-kwolf@redhat.com>
 <YEjWQnWKbr5teciB@angien.pipo.sk>
 <90130a0c-7f96-f344-b185-b790c5d6b78a@redhat.com>
 <20210310173044.GF6076@merkur.fritz.box>
 <87ft12q8kf.fsf@dusky.pond.sub.org>
 <e98a5eb7-4716-a0f4-0ad2-adaa4cd9cefa@redhat.com>
 <87h7lhbx6b.fsf@dusky.pond.sub.org>
 <10fd7cbf-9ee5-3869-22fd-352e42a980ba@redhat.com>
 <871rck7pqw.fsf@dusky.pond.sub.org>
 <87lfarrx37.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87lfarrx37.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: lvivier@redhat.com, thuth@redhat.com, Peter Krempa <pkrempa@redhat.com>,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 jasowang@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 kraxel@redhat.com, Paolo Bonzini <pbonzini@redhat.com>, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13.03.2021 um 14:40 hat Markus Armbruster geschrieben:
> Markus Armbruster <armbru@redhat.com> writes:
> 
> > Paolo Bonzini <pbonzini@redhat.com> writes:
> >
> >> On 11/03/21 15:08, Markus Armbruster wrote:
> >>>> I would rather keep the OptsVisitor here.  Do the same check for JSON
> >>>> syntax that you have in qobject_input_visitor_new_str, and whenever
> >>>> you need to walk all -object arguments, use something like this:
> >>>>
> >>>>      typedef struct ObjectArgument {
> >>>>          const char *id;
> >>>>          QDict *json;    /* or NULL for QemuOpts */
> >>>>          QSIMPLEQ_ENTRY(ObjectArgument) next;
> >>>>      }
> >>>>
> >>>> I already had patches in my queue to store -object in a GSList of
> >>>> dictionaries, changing it to use the above is easy enough.
> >>> 
> >>> I think I'd prefer following -display's precedence.  See my reply to
> >>> Kevin for details.
> >>
> >> Yeah, I got independently to the same conclusion and posted patches
> >> for that.  I was scared that visit_type_ObjectOptions was too much for 
> >> OptsVisitor but it seems to work...
> >
> > We have reason to be scared.  I'll try to cover this in my review.
> 
> The opts visitor has serious limitations.  From its header:
> 
>  * The Opts input visitor does not implement support for visiting QAPI
>  * alternates, numbers (other than integers), null, or arbitrary
>  * QTypes.  It also requires a non-null list argument to
>  * visit_start_list().
> 
> This is retro-documentation for hairy code.  I don't trust it.  Commit
> eb7ee2cbeb "qapi: introduce OptsVisitor" hints at additional
> restrictions:
> 
>     The type tree in the schema, corresponding to an option with a
>     discriminator, must have the following structure:
>     
>       struct
>         scalar member for non-discriminated optarg 1 [*]
>         list for repeating non-discriminated optarg 2 [*]
>           wrapper struct
>             single scalar member
>         union
>           struct for discriminator case 1
>             scalar member for optarg 3 [*]
>             list for repeating optarg 4 [*]
>               wrapper struct
>                 single scalar member
>             scalar member for optarg 5 [*]
>           struct for discriminator case 2
>             ...

Is this a long-winded way of saying that it has to be flat, except that
it allows lists, i.e. there must be no nested objects on the "wire"?

The difference between structs and unions, and different branches inside
the union isn't visible for the visitor anyway.

>     The "type" optarg name is fixed for the discriminator role. Its schema
>     representation is "union of structures", and each discriminator value must
>     correspond to a member name in the union.
>     
>     If the option takes no "type" descriminator, then the type subtree rooted
>     at the union must be absent from the schema (including the union itself).
>     
>     Optarg values can be of scalar types str / bool / integers / size.
> 
> Unsupported visits are treated as programming error.  Which is a nice
> way to say "they crash".

The OptsVisitor never seems to crash explicitly by calling something
like abort().

It may crash because of missing callbacks that are called without a NULL
check, like v->type_null. This case should probably be fixed in
qapi/qapi-visit-core.c to do the check and simply return an error.

Any other cases?

> Before this series, we use it for -object as follows.
> 
> user_creatable_add_opts() massages the QemuOpts into a QDict containing
> just the properties, then calls user_creatable_add_type() with the opts
> visitor wrapped around the QemuOpts, and the QDict.
> 
> user_creatable_add_type() performs a virtual visit.  The outermost
> object it visits itself.  Then it visits members one by one by calling
> object_property_set().  It uses the QDict as a list of members to visit.
> 
> As long as the object_property_set() only visit scalars other than
> floating-point numbers, we safely stay with the opts visitors'
> limitations.

Minor addition: This visits inside object_property_set() are
non-virtual, of course.

> After this series, we use the opts visitor to convert the option
> argument to a ObjectOption.  This is a non-virtual visit.  We then
> convert the ObjectOption to a QDict, and call user_creatable_add_type()
> with the QObject input visitor wrapped around the QDict, and the QDict.
> 
> Here's the difference in opts visitor use: before the patch, we visit
> exactly the members in the optarg that actually name QOM properties (for
> the ones that don't, object_property_set() fails without visiting
> anything).  Afterwards, we visit the members of ObjectOption, i.e.
> all QOM properties, by construction of ObjectOption.
> 
> As long as ObjectOption's construction is correct, the series does not
> add new visits, i.e. we're no worse off than before.
> 
> However, there is now a new way to mess things up: you can change (a
> branch of union) ObjectOption in a way that pushes it beyond the opts
> visitors limitations.  QMP and tools --object will continue to work, but
> qemu-system-FOO -object will crash.

I don't think this is very concerning because the primary way to test
changes to objects is probably -object in the system emulator. So I
think we're lucky enough to have the problem in the most obvious place.

> As is, HMP object_add doesn't crash, because it doesn't use the opts
> visitor anymore, which breaks backward compatibility.  If we rever to
> the opts visitor there, it'll crash as well.
> 
> New ways to mess things up are always kind of unwelcome.  This one
> doesn't sound *too* dangerous; we "only" have to ensure -object is
> tested thoroughly.  Still, comments next to the QAPI definitions that
> must not be messed up would be nice.
> 
> Paolo, Kevin, any comments?

We probably agree that using QemuOpts and the OptsVisitor is only a
stopgap solution for 6.0 anyway. Instead of investing a lot of thought
into how we can make this maintainable for the long term (which isn't
something we want to do anyway), let's put that work into making the
keyval visitor work for the system emulator.

Kevin


