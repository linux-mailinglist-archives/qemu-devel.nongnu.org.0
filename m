Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D0A45A729
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 17:06:42 +0100 (CET)
Received: from localhost ([::1]:44800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpYJd-0004QF-N7
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 11:06:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mpYIE-0003HS-Uc
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 11:05:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mpYIB-00006Q-Tm
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 11:05:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637683511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Di7XWHPbouk60fNGglxlRQAGyHh6CPCwhm37n8DP5y8=;
 b=PG/0P4Ee5bPQb1Bu4cPobofvPhhGckk07O8aMZPaRSr/JFgwdHAf0NVW37eoiboWs5STfQ
 pZJbrUUDyFMxq6vmdW48WBgim4E1SDwoXw/BoVhbEkutSgdg+Jc4TkVa0vGYrWK8GpdZh8
 3muvqWq83YX1PPC0cNPDiFjm5n7kTy4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-wyE_8GIbOTqp22wq2rRDJA-1; Tue, 23 Nov 2021 11:05:04 -0500
X-MC-Unique: wyE_8GIbOTqp22wq2rRDJA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA79D8066EC
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 16:05:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F94D101E58D;
 Tue, 23 Nov 2021 16:05:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B199111380A7; Tue, 23 Nov 2021 17:05:01 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [RFC PATCH 00/12] QOM/QAPI integration part 1
References: <20211103173002.209906-1-kwolf@redhat.com>
Date: Tue, 23 Nov 2021 17:05:01 +0100
In-Reply-To: <20211103173002.209906-1-kwolf@redhat.com> (Kevin Wolf's message
 of "Wed, 3 Nov 2021 18:29:50 +0100")
Message-ID: <871r365042.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 eblake@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> This series adds QOM class definitions to the QAPI schema, introduces
> a new TypeInfo.instance_config() callback that configures the object at
> creation time (instead of setting properties individually) and is
> separate from runtime property setters (which often used to be not
> really tested for runtime use), and finally generates a marshalling
> function for .instance_config() from the QAPI schema that makes this a
> natural C interface rather than a visitor based one.
>
> This is loosely based on Paolo's old proposal in the wiki:
> https://wiki.qemu.org/Features/QOM-QAPI_integration
>
> The series is in a rather early stage and I don't really have any
> automated tests or documentation in this series yet. I'm also only
> converting the class hierarchy for the random number generator backends
> to show what the result looks like, the other objects still need to be
> done.
>
> So the question to you isn't whether this is mergeable (it isn't), but
> whether you think this is the right approach for starting to integrate
> QOM and QAPI better.
>
> You'll also see that this doesn't really remove the duplication between
> property definitions in the code and configuration struct definitions in
> the QAPI schema yet (because we want to keep at least a read-only
> runtime property for every configuration option), but at least they mean
> somewhat different things now (creation vs. runtime) instead of being
> completely redundant.
>
> Possible future steps:
>
> * Define at least those properties to the schema that correspond to a
>   config option. For both setters and getters for each option, we'll
>   probably want to select in the schema between 'not available',
>   'automatically generated function' and 'manually implemented'.
>
>   Other runtime properties could be either left in the code or added to
>   the schema as well. Either way, we need to figure out how to best
>   describe these things in the schema.

Permit me a diversion of sorts.

With QOM, we have properties.  A property is readable if it has a
getter, writable if it has a setter.  There is no real concept of
configuration vs. state.  Writable properties can be written at any
time.

In practice, some properties are to be used only like configuration, and
we check configuration at realize time (for devices), or by a surrogate
like qemu_add_machine_init_done_notifier().  If you set them later,
things may break, and you get to keep the pieces.

In this "QOM/QAPI integration part 1", configuration (expressed in QAPI
schema) makes it into QOM.

Now we have configuration *and* properties.

Do we need the properties?

Note I'm not asking whether we need setters.  I'm asking whether we need
to expose configuration bits via qom-set & friends in addition to the
QAPI schema and query-qmp-schema.

> * Getting rid of the big 'object-add' union: While the union is not too
>   bad for the rather small number of user-creatable objects, it
>   wouldn't scale at all for devices.
>
>   My idea there is that we could define something like this:
>
>   { 'struct': 'ObjectOptions',
>     'data': {
>         'id': 'str',
>         'config': { 'type': 'qom-config-any:user-creatable',
>                     'embed': true } } }
>
>   Obviously this would be an extension of the schema language to add an
>   'embed' option (another hopefully more acceptable attempt to flatten
>   things...), so I'd like to hear opinions on this first before I go to
>   implement it.

'embed': true would splice in the members of a struct type instead of a
single member of that struct type.  Correct?

Stretch goal: make it work for union types, too :)

I've thought of this before.  Plenty of nesting in the wire format
exists pretty much only to let us have the C structs we want.  Right
now, the only way to "splice in" such a struct is the base type.
General splicing could be useful.  It may take an introspection flag
day.

>   Also note that 'qom-config-any:user-creatable' is new, too. The
>   'qom-config:...' types introduced by this series don't work for
>   subclasses, but only for the exact class.
>
>   On the external interface, the new 'qom-config-any:...' type including
>   subclasses would basically behave (and be introspected) like the union
>   we have today, just without being defined explicitly.

I'm not sure I follow.  How is the qom-config-any:user-creatable to be
defined?  QAPI collects all the qom-config:* types into a union
automatically?

>   As for the C representation for configurations that include
>   subclasses, I'm imagining a struct that just contains the qom_type
>   string (so we can call the right handler) and a pointer to the real
>   config (that is treated as opaque by the generic code).

Now you lost me.

> I could probably add more, but let's just start with this for discussion
> now.

I wish we could fill a whiteboard together...


