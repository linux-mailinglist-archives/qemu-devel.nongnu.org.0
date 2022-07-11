Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F55156FFCD
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 13:12:53 +0200 (CEST)
Received: from localhost ([::1]:57196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oArLQ-0003Zd-Dt
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 07:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oArI3-0008RW-L0
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 07:09:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oArHq-0003oi-AH
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 07:09:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657537748;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4A7pSfFON7ys5BQH/RZIJDGQIcBwKDXbGc2X7Ns/bYs=;
 b=LNr2UJee/wzeZ79P8ExOe2pcpIXhEIIt9YrubAo0EUtZxW5q1J5fUftnO7lswZULoD0kHp
 tbzHW2iY33wMzBZhSjbOB3PMDagiCGddfqim8W5WMVm0hHG4f/E1iD959Tk/LHgz3/UJG0
 NJORi/uu9g06/B2fSM82UZ9CQL7FzVE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-LXHRyxWaO6-32qqLKTrF8A-1; Mon, 11 Jul 2022 07:09:05 -0400
X-MC-Unique: LXHRyxWaO6-32qqLKTrF8A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 231323C01DF2;
 Mon, 11 Jul 2022 11:09:05 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47AEB40D2827;
 Mon, 11 Jul 2022 11:09:04 +0000 (UTC)
Date: Mon, 11 Jul 2022 12:09:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 kwolf@redhat.com, hreitz@redhat.com
Subject: Re: [RFC PATCH] qobject: Rewrite implementation of QDict for
 in-order traversal
Message-ID: <YswEzUyQJtxAlylE@redhat.com>
References: <20220705095421.2455041-1-armbru@redhat.com>
 <87wncqmq2t.fsf@pond.sub.org> <YsgOhJLpbyODJCGG@redhat.com>
 <CAFEAcA_pA_K=06chM9xwS8BzK2W6v0g5S5Vr_=YT1A9xqX+tfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA_pA_K=06chM9xwS8BzK2W6v0g5S5Vr_=YT1A9xqX+tfw@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 11, 2022 at 11:32:35AM +0100, Peter Maydell wrote:
> On Fri, 8 Jul 2022 at 12:01, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > What alternative options do we have for addressing this scenario.
> >
> > I can think of
> >
> >   - Auto-create array elements, if seeing an element set before length.
> >
> >     This is based on the theory that 'len-PROP' field is largely
> >     redundant. It is only needed if you want to create a sparse
> >     array, with empty elements /after/ the last one explicitly
> >     set, or if you want to get error reporting for an app setting
> >     element 3 after saying it wanted a 2 element list. IMHO the
> >     error reporting benefit is dubious, because the error scenario
> >     only exists because we made the app set this redundant 'len-PROP'
> >     attribute. Does anything actually need the 'sparse array'
> >     facility ?
> 
> I'm pretty sure that nothing needs sparse array elements like
> that. The major reason for the len-PROP field is an implementation
> one: because there is currently no way for a QOM object to
> say "call this method if somebody tries to set a non-existent
> property", the way array properties work is that the 'set'
> method for the len-PROP property is the place where we then
> add the PROP[0], PROP[1], ... properties.

Ahhh, I see what you mean. I totally missed this subtle detail.

IIUC, there's essentially no such thing as array properties
in QOM. 'prop[0]', 'prop[1]', 'prop[2]', etc are all simply
scalar properties from QOM's, that just happen to follow a
common naming scheme, but QOM doesn't care about that.

> If we either had a "call this for any property set/get attempt
> where there is no specific method set" or else had array
> properties supported by the core QOM code, we could avoid
> having to set len-PROP first.

Techically arrays are already supported at the core QOM level, because
you can use any QAPI type as a property.  The authz/list.c object
has a 'rules' property that is an array of QAuthzListRule objects:

  { 'struct': 'AuthZListProperties',
    'data': { '*policy': 'QAuthZListPolicy',
              '*rules': ['QAuthZListRule'] } }

At the time I wrote that, we couldn't express it on the CLI though,
without using JSON syntax for -object. I don't think we've ever
made it possible to use the opts_visitor with non-scalar properties
though.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


