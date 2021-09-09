Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F67340481F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 11:57:13 +0200 (CEST)
Received: from localhost ([::1]:45644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOGnw-0003wu-0Q
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 05:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOGmA-0002uE-I3
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 05:55:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOGm8-0003XA-O1
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 05:55:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631181319;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dvg2eo5FyupTRcDpAdAW3z/jdRse5fRbUckfzSISs8Y=;
 b=MngapUQgKnkzzKWmEtycEaJgvOem2Uol0xFivKoD8SoVqNEDxx87ZGSh3l7lKpP1O6OFvT
 kcpw2Qss4v6rXzbg8f87iBHfDq7TLJS+NxsCKFg4XllxYL9+1htBqHh9koTuqpF7dhAVwZ
 wdfI4xiq5EuZLTzdxKeUB+hPetnRhAQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-UnosHztAPBW3gq6daqpn5A-1; Thu, 09 Sep 2021 05:55:18 -0400
X-MC-Unique: UnosHztAPBW3gq6daqpn5A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16E4F84A5E8
 for <qemu-devel@nongnu.org>; Thu,  9 Sep 2021 09:55:18 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1FC45453A;
 Thu,  9 Sep 2021 09:55:16 +0000 (UTC)
Date: Thu, 9 Sep 2021 10:55:14 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 3/5] target/i386: convert to use format_state instead of
 dump_state
Message-ID: <YTnaAkNFWzjuGHzs@redhat.com>
References: <20210908103711.683940-1-berrange@redhat.com>
 <20210908103711.683940-4-berrange@redhat.com>
 <20210908180513.6pvaonrzmq2gchfa@redhat.com>
 <YTkz6UpDAs4qPrUZ@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YTkz6UpDAs4qPrUZ@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 11:06:33PM +0100, Daniel P. Berrangé wrote:
> On Wed, Sep 08, 2021 at 01:05:13PM -0500, Eric Blake wrote:
> > On Wed, Sep 08, 2021 at 11:37:09AM +0100, Daniel P. Berrangé wrote:
> > > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > > ---
> > >  target/i386/cpu-dump.c | 325 ++++++++++++++++++++++-------------------
> > >  target/i386/cpu.c      |   2 +-
> > >  target/i386/cpu.h      |   2 +-
> > >  3 files changed, 174 insertions(+), 155 deletions(-)
> > > 
> > > diff --git a/target/i386/cpu-dump.c b/target/i386/cpu-dump.c
> > > index 02b635a52c..8e19485a20 100644
> > > --- a/target/i386/cpu-dump.c
> > > +++ b/target/i386/cpu-dump.c
> > > @@ -94,41 +94,45 @@ static const char *cc_op_str[CC_OP_NB] = {
> > >  };
> > >  
> > >  static void
> > > -cpu_x86_dump_seg_cache(CPUX86State *env, FILE *f,
> > > +cpu_x86_dump_seg_cache(CPUX86State *env, GString *buf,
> > >                         const char *name, struct SegmentCache *sc)
> > >  {
> > >  #ifdef TARGET_X86_64
> > >      if (env->hflags & HF_CS64_MASK) {
> > > -        qemu_fprintf(f, "%-3s=%04x %016" PRIx64 " %08x %08x", name,
> > > -                     sc->selector, sc->base, sc->limit,
> > > -                     sc->flags & 0x00ffff00);
> > > +        g_string_append_printf(buf, "%-3s=%04x %016" PRIx64 " %08x %08x", name,
> > > +                               sc->selector, sc->base, sc->limit,
> > > +                               sc->flags & 0x00ffff00);
> > 
> > Did you consider using open_memstream() to get a FILE* that can then
> > be passed into these callbacks unchanged, rather than rewriting all
> > the callbacks to a new signature?
> 
> That is certainly an option, but it wouldn't eliminate the need to do
> a rewrite. I would still want to replace qemu_fprintf with fprintf in
> that scenario. It is desirable to be able to eliminate the QEMU
> specific printf wrappers which only exist because they need to treat
> a NULL FILE* object as an indication to output to the HMP chardev.
> Admittedly that would result in shorter lines than today.
> 
> > Then again, I like the GString signature better than FILE*, even if it
> > makes for longer lines.
> 
> Yes, the verbosity is not ideal. I like the GString API as a general
> purpose API for formatting text output to a buffer overall.
> 
> I don't feel too strongly either way though, as long as we get to a place
> where we eliminate the custom QEMU printf wrappers that integrate with
> the monitor APIs.

I forgot that open_memstream is not portable. The portable alternative
is fmemopen but that needs to know the buffer size upfront which is
too unpleasant to use.  So GString is the better portable option.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


