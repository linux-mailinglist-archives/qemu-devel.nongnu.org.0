Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC4B4040DF
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 00:08:52 +0200 (CEST)
Received: from localhost ([::1]:55566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO5kR-00067v-9Q
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 18:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mO5iO-0004yl-Ow
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 18:07:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mO5iM-0004gT-6z
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 18:06:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631138801;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BWEDMI48/Pvy0BQasMLnEvkTA/LSO/V6Xqf2OEOMrgk=;
 b=Zk0oa6Sd6ioSOo1hjFMSvz6uokr8Ssw1xBgjUuLsYBmhrlz2O3dSruYybwRXL8f5fL4XY+
 Xpf6PfD3v0l6gS3KbmwV/UVSDp+KH0o82Gl4vIGBMoM3tWQQJnHFRjB3e/DLvuOFEWZfhK
 +ha4oPkatwDGsUsceCuY6p+uAldyG8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-rjm-bNfDM7OKaaSTUEn_AA-1; Wed, 08 Sep 2021 18:06:39 -0400
X-MC-Unique: rjm-bNfDM7OKaaSTUEn_AA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D213718414A1;
 Wed,  8 Sep 2021 22:06:38 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB8511972E;
 Wed,  8 Sep 2021 22:06:35 +0000 (UTC)
Date: Wed, 8 Sep 2021 23:06:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 3/5] target/i386: convert to use format_state instead of
 dump_state
Message-ID: <YTkz6UpDAs4qPrUZ@redhat.com>
References: <20210908103711.683940-1-berrange@redhat.com>
 <20210908103711.683940-4-berrange@redhat.com>
 <20210908180513.6pvaonrzmq2gchfa@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210908180513.6pvaonrzmq2gchfa@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 01:05:13PM -0500, Eric Blake wrote:
> On Wed, Sep 08, 2021 at 11:37:09AM +0100, Daniel P. Berrangé wrote:
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  target/i386/cpu-dump.c | 325 ++++++++++++++++++++++-------------------
> >  target/i386/cpu.c      |   2 +-
> >  target/i386/cpu.h      |   2 +-
> >  3 files changed, 174 insertions(+), 155 deletions(-)
> > 
> > diff --git a/target/i386/cpu-dump.c b/target/i386/cpu-dump.c
> > index 02b635a52c..8e19485a20 100644
> > --- a/target/i386/cpu-dump.c
> > +++ b/target/i386/cpu-dump.c
> > @@ -94,41 +94,45 @@ static const char *cc_op_str[CC_OP_NB] = {
> >  };
> >  
> >  static void
> > -cpu_x86_dump_seg_cache(CPUX86State *env, FILE *f,
> > +cpu_x86_dump_seg_cache(CPUX86State *env, GString *buf,
> >                         const char *name, struct SegmentCache *sc)
> >  {
> >  #ifdef TARGET_X86_64
> >      if (env->hflags & HF_CS64_MASK) {
> > -        qemu_fprintf(f, "%-3s=%04x %016" PRIx64 " %08x %08x", name,
> > -                     sc->selector, sc->base, sc->limit,
> > -                     sc->flags & 0x00ffff00);
> > +        g_string_append_printf(buf, "%-3s=%04x %016" PRIx64 " %08x %08x", name,
> > +                               sc->selector, sc->base, sc->limit,
> > +                               sc->flags & 0x00ffff00);
> 
> Did you consider using open_memstream() to get a FILE* that can then
> be passed into these callbacks unchanged, rather than rewriting all
> the callbacks to a new signature?

That is certainly an option, but it wouldn't eliminate the need to do
a rewrite. I would still want to replace qemu_fprintf with fprintf in
that scenario. It is desirable to be able to eliminate the QEMU
specific printf wrappers which only exist because they need to treat
a NULL FILE* object as an indication to output to the HMP chardev.
Admittedly that would result in shorter lines than today.

> Then again, I like the GString signature better than FILE*, even if it
> makes for longer lines.

Yes, the verbosity is not ideal. I like the GString API as a general
purpose API for formatting text output to a buffer overall.

I don't feel too strongly either way though, as long as we get to a place
where we eliminate the custom QEMU printf wrappers that integrate with
the monitor APIs.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


