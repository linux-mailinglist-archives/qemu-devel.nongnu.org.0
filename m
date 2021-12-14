Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF634743E2
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 14:52:42 +0100 (CET)
Received: from localhost ([::1]:39438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx8ET-0003RJ-Pl
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 08:52:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mx8B7-0007xc-4v
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:49:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mx8B4-0006g5-0t
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:49:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639489749;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Br1ww2WLBgeSAWOTJDdZ2ywV1bp2CHBpBqaJJvVT0k0=;
 b=jC2IWR578Zfv3cQSfXhXjBjN5SD595aK6mhm0dDdgbYPnsrTFOmBN99LBOcSTBItQYUP6d
 /7yT+shZBPFNubSmfdjEBftf/HRIrdvpJ3U8xuRNE0P+d0Y2jWHwlZ4/PDoHe3p5Z8tXKo
 sK6z1Df9AsAc+zPI/F/UpN2xs/IH3Sk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-cXJicdrSN5-EI2_fGuMpZA-1; Tue, 14 Dec 2021 08:48:57 -0500
X-MC-Unique: cXJicdrSN5-EI2_fGuMpZA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A2368015CD;
 Tue, 14 Dec 2021 13:48:56 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.122])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69381100EBAD;
 Tue, 14 Dec 2021 13:48:42 +0000 (UTC)
Date: Tue, 14 Dec 2021 13:48:39 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Mark Burton <mark.burton@greensocs.com>
Subject: Re: Redesign of QEMU startup & initial configuration
Message-ID: <Ybigt8LMt20L1AqS@redhat.com>
References: <87czm47a77.fsf@dusky.pond.sub.org> <YbN0zLsDVr3B/s3+@redhat.com>
 <87ilvszg52.fsf@dusky.pond.sub.org>
 <edbfff5c-65df-980c-acee-05055c254636@redhat.com>
 <YbeJ/zTV/n+l2CmH@redhat.com>
 <9AF99888-A4BF-4459-92C1-71E5B76A2C79@greensocs.com>
 <YbiWh8nQDWpMegER@redhat.com>
 <4AED38B2-E2DD-46F7-93AA-622D5F6BB570@greensocs.com>
 <YbiaYnPTUZ70hC1j@redhat.com>
 <E52F9A8B-A66C-4E54-8F74-F4F45E3FD7A8@greensocs.com>
MIME-Version: 1.0
In-Reply-To: <E52F9A8B-A66C-4E54-8F74-F4F45E3FD7A8@greensocs.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 14, 2021 at 02:36:26PM +0100, Mark Burton wrote:
> 
> 
> > On 14 Dec 2021, at 14:21, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > 
> > On Tue, Dec 14, 2021 at 02:11:11PM +0100, Mark Burton wrote:
> >> 
> >> 
> >>> On 14 Dec 2021, at 14:05, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >>> 
> >>> On Mon, Dec 13, 2021 at 09:22:14PM +0100, Mark Burton wrote:
> >>>> 
> >>>> 
> >>>>> On 13 Dec 2021, at 18:59, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >>>>> 
> >>>>> …. we no longer have to solve everything
> >>>>> Ourselves. 
> >>>> 
> >>>> I support this sentiment.
> >>>> 
> >>>> Lets re-factor the code so people can build what they need using an API.
> >>>> Actually, ‘QEMU’ only need support the existing CLI, and provide a suitable internal API.
> >>>> If that API was relatively stable, that would help those (few) who maintain a different startup mechanism (but its only a ’nice to have’). (Making that convenient, as Paolo has show, would also be ’nice to have’).
> >>> 
> >>> To be clear I do strongly believe that the QEMU project needs
> >>> to deliver the higher level simplified interface too. I just
> >>> want that higher level interface to be flexible enough to
> >>> let end users expand on what it offers, without having to
> >>> write C code nor having to switch entirely to the low level
> >>> interface like we do today.
> >>> 
> >>> IOW, QEMU needs to deliver more than just a low level building
> >>> block API.
> >> 
> >> Why?
> >> Clearly it would be nice if “higher level” interfaceS existed in
> >> the world. Clearly QEMU could provide one, two, or many. But, why
> >> do you think QEMU ‘must’ provide them?
> > 
> > To serve our users who are not all wanting to be use a management
> > layer. They want to be using a simple binary to spin up adhoc
> > VMs. This is the reason why we've kept most of the short option
> > CLI args in the existing QEMU binaries, despite having more
> > comprehensive low level replacement args. 
> 
> So - there are
> a) uses today that use the CLI as it exists.
> b) users who might prefer a better interface if that was made available - but, again, that doesn’t require QEMU itself to do anything. If we provide a low-level API, and somebody else (you for instance) provides a ’nice’ ‘friendly’ CLI or config file reader - those users would be happy.
> 
> I still dont see why QEMU itself needs to provide this ‘high level’ thing.

The QEMU project has provided this high level CLI itself historically.
In previous discussions about dropping the simplified options, leaving
only the QAPI based options, that idea has always been rejected by a
non-trivial number of QEMU maintainers who consider it a core part of
our deliverable as a project.

> 
> I think we all agree (correct me if I’m wrong) :
> * We all want a low level interface
> * We all want the current CLI to be supported (at least for now, though it could change in time)
> * We all want the CLI to be based on the low level interface
> 
> I’m just asking why we ALSO want to support “yet another high level interface”….

You're arguing for a significant change in the scope of what QEMU
delivers to its users, punting a bunch of functionality to be
someone else's problem.


> > If we just declare we're not going to provide this simple binary
> > any more, then we're just casting these users adrift. This in
> 
> “Any more” - Are you talking about the existing CLI users?

Yes.

> > effect means they'll just carry on existing the historical QEMU
> > binaries and we'll never be able to eliminate them, so we'll be
> > maintaining two things forever.
> 
> A CLI and the low level interface? - Yes? Can we remove the CLI
> and only support the low-level interface ? But here you seem to
> be arguing against yourself, so I guess I misunderstood.

The current qemu-system-$TARGET emulators have a variety of
CLI args, some low level QAPI driven, and some higher level
simplified args. Mgmt app consumers tend to use the former,
while our humans userbase tends to use the latter.  I'm
saying we need to carry on serving both userbases, unless
we get the QEMU maintainers in general to agree to a pretty
significant change in what the project delivers. Based on
previous discussions, I'm doubtful we'll get agreement to
do that.

So if we're going to successfully introduce replacement
for qemu-system-$TARGET, we need to cater for both userbases,
albeit we can do so with separate binaries, rather than trying
to cram low level and high level into the same.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


