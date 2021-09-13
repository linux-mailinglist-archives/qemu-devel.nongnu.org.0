Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C10F40867A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 10:27:40 +0200 (CEST)
Received: from localhost ([::1]:59372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPhJT-00042a-2J
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 04:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mPhHd-0002f7-JW
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 04:25:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mPhHa-0001xE-0m
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 04:25:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631521535;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=9YcbepJxBegvuDnY7oS5kJ2xJu9C8Krnq0rgKiniiQs=;
 b=S1F5m4t4jwlxgUCjxSt8xTjHCkRm/9MJJO7SOc+AH+Drq9logRX7Fj+fopzjaqt941Vbvx
 uP814U9iTijsoeOGiKj5IRdn/bpafU3GfjBzEDpDCOMPbTcinAq56Lox4Ph1K0VHrWmmii
 +//z3UzCV56jD+hlZd/g9obSxapg1b0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-sRgqM_wmOhOlmxmTC7iT0g-1; Mon, 13 Sep 2021 04:25:31 -0400
X-MC-Unique: sRgqM_wmOhOlmxmTC7iT0g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3408491273
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 08:25:30 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E49A5F706;
 Mon, 13 Sep 2021 08:25:29 +0000 (UTC)
Date: Mon, 13 Sep 2021 09:25:26 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] qapi: define cleanup function for g_autoptr(Error)
Message-ID: <YT8K5CIZ9NPz/730@redhat.com>
References: <20210912124834.503032-1-pbonzini@redhat.com>
 <87fsu959rr.fsf@dusky.pond.sub.org>
 <7337ee08-cc7d-4ef1-dcc4-3b0facc8b7b1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7337ee08-cc7d-4ef1-dcc4-3b0facc8b7b1@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 13, 2021 at 09:30:07AM +0200, Paolo Bonzini wrote:
> On 13/09/21 07:23, Markus Armbruster wrote:
> > Paolo Bonzini <pbonzini@redhat.com> writes:
> > 
> > > Allow replacing calls to error_free() with g_autoptr(Error)
> > > declarations.
> > > 
> > > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > > ---
> > >   include/qapi/error.h | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/include/qapi/error.h b/include/qapi/error.h
> > > index 4a9260b0cc..8564657baf 100644
> > > --- a/include/qapi/error.h
> > > +++ b/include/qapi/error.h
> > > @@ -437,6 +437,8 @@ Error *error_copy(const Error *err);
> > >    */
> > >   void error_free(Error *err);
> > > +G_DEFINE_AUTOPTR_CLEANUP_FUNC(Error, error_free);
> > > +
> > >   /*
> > >    * Convenience function to assert that *@errp is set, then silently free it.
> > >    */
> > 
> > I'd like to see at least one actual use.
> 
> I'll have one soon, I'll Cc you on that one.  (I wrote this because Dan
> suggested using g_autoptr(Error) in a review, but it doesn't work yet).

Actually on reflection we probably don't need that because I forgot
that error_report_err free's the error object.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


