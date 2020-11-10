Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBB02ADC96
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 18:07:01 +0100 (CET)
Received: from localhost ([::1]:49788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcX6f-0005j3-El
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 12:06:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcX3e-0004Jp-Mc
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:03:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcX3b-0007UE-Au
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:03:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605027824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ewDw1UDKjuXqsq5cw78Z7CdNPHwoffvqiu5NLor7eTU=;
 b=TLKdoERabW9h9kwResHQb1yECGJXrAUbQBDSqO/5ctiSD7t5MC4eWv33bznqoyI8n0IJYH
 8uxiFLNYr2vEv4ZeBrPszC3fvfgSTEvmEDXkSO3dv90z497fU8i0gRjUn5N/89RpIAnKX4
 qSRavdPjAHBOGggUDvFa0bTshKvFr9Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-o1MQw4RHNlyRZj2dxsJBuA-1; Tue, 10 Nov 2020 12:03:39 -0500
X-MC-Unique: o1MQw4RHNlyRZj2dxsJBuA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A97D18B9F07;
 Tue, 10 Nov 2020 17:03:38 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04C7A5DA33;
 Tue, 10 Nov 2020 17:03:33 +0000 (UTC)
Date: Tue, 10 Nov 2020 12:03:33 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 00/44] Make qdev static property API usable by any QOM
 type
Message-ID: <20201110170333.GG5733@habkost.net>
References: <20201109113404.GA24970@merkur.fritz.box>
 <3b711053-e67a-86fb-59e7-c06948dd8928@redhat.com>
 <20201109152125.GZ5733@habkost.net>
 <2300fd53-afa1-b957-b33b-cff2986fcb93@redhat.com>
 <20201109171618.GA5733@habkost.net>
 <098ca211-3ad5-b194-e9f5-678291fe641e@redhat.com>
 <20201109185558.GB5733@habkost.net>
 <9659e726-7948-4e02-f303-abcbe4c96148@redhat.com>
 <20201109202855.GD5733@habkost.net>
 <c501a54d-4e8a-52bf-14fa-cfce3eafe57f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c501a54d-4e8a-52bf-14fa-cfce3eafe57f@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 10, 2020 at 11:58:29AM +0100, Paolo Bonzini wrote:
> On 09/11/20 21:28, Eduardo Habkost wrote:
> > I don't know yet what's the best solution for the x86 feature
> > case.  Maybe duplicating the list of feature names would be a
> > small price to pay to get a static list of properties defined at
> > compilation time?  Maybe we can replace
> > FeatureWordInfo.feat_names[] with property introspection code
> > that will find the property name for a given struct field?
> 
> The problem is associating the names with the metadata (feature word/bit).
> Right now we do that by placing the names in the feat_names[] arrays, which
> are indexed by feature word and bit.

Right, that would require an introspection interface letting us
get the property name for a given struct field + bit.

Anyway, let's get back to this later.

> 
> > > > If object*_property_add*() is hidden behind a function call or a
> > > > `if` statement, it's already too much complexity to me.
> > > You want to remove hiding behind a function call, but why is it any better
> > > to hide behind layers of macros?  Just the example you had in your email
> > > included DEFINE_PROP, DEFINE_FIELD_PROP, DEFINE_PROP_UINT32.  It's still
> > > impossible to figure out without either parsing or executing C code.
> > 
> > Because we can be absolutely sure the macros (and the property
> > array) will be constant expressions evaluated at compilation
> > time.
> 
> That's not entirely true.  You can always build Property objects manually in
> a for loop.  (Though at that point you might as well use the existing API
> and not the new one).

This is true if the property array is always declared as static
const.

> 
> I think we agree on where _to go_ (schema described outside C code, and
> possibly integrated with the QAPI schema).  I think neither of us has a
> clear idea of how to get there. :)  I don't see this series as a step
> towards that; I see it more as a worthwhile way to remove boilerplate from
> QOM objects.

My first goal here is to facilitate (3) below, and allow it to be
done with less effort and less churn.  This series is not
essential to do (3), but I'd like to avoid porting the same code
to a different API 2 or 3 times because we keep introducing new
mechanisms.

> 
> In my opinion the next steps for QOM (in general, not necessarily related to
> the goal) should be to:
> 
> 1) audit the code and ensure that there are no conditional properties
> 
> 2) figure out if it makes sense to provide run-time (not compile-time)
> introspection of QOM class properties, as either a stable or an experimental
> interface, and how it works together with the QAPI introspection.  In
> particular, whether compound QAPI types can be matched across QOM and QAPI
> introspection.

Can you clarify this item?  Do you mean an external interface, or
internal APIs?

> 
> 3) figure out if there are any instance properties that can be easily
> extended to class properties.  In particular, figure out if we can do
> class-level property aliasing.

Most of them need to be moved to class properties somehow,
because they are externally visible.  The only exceptions I see
are read-only link properties and child properties.

The trickiest ones are object_property_add_alias() (no
class-level equivalent) and object_property_add_*_ptr() (no
usable class-level equivalent).

object_property_add_*_ptr() is what prompted the creation of this
series.  See
https://lore.kernel.org/qemu-devel/20201009160122.1662082-1-ehabkost@redhat.com

-- 
Eduardo


