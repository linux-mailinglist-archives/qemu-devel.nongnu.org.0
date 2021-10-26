Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AF843AE49
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 10:44:28 +0200 (CEST)
Received: from localhost ([::1]:48142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfI4I-0000S9-Ha
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 04:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mfI2T-00089q-IV
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 04:42:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mfI2R-0001F1-G2
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 04:42:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635237750;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n2eU8FWqkWNlOBo4IFuR74qIfzhjij1b5OHJEFj9dOM=;
 b=gDHsF5cfza22dbwCrEv/NpF9yAOtpk63mu6mOTUpP5omYdCtE7yHI+tyDbj1aT4K5p9iGl
 6OSFkLsMHGQKDwoXKeW67dX502V2pNSl7ohUgnVC1h48AbpCdqdJSDVTk5TBgc0VEywqbw
 92+U58CaKsPamxbnMe+RNA9fPZXjh8M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-CvNCg-HGM-mc29H8ogalsw-1; Tue, 26 Oct 2021 04:42:13 -0400
X-MC-Unique: CvNCg-HGM-mc29H8ogalsw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27904657;
 Tue, 26 Oct 2021 08:42:12 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EA051002D6A;
 Tue, 26 Oct 2021 08:42:07 +0000 (UTC)
Date: Tue, 26 Oct 2021 09:42:05 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v4] isa-applesmc: provide OSK forwarding on Apple hosts
Message-ID: <YXe/SpwH8Kk96M/g@redhat.com>
References: <20211022161448.81579-1-yaroshchuk2000@gmail.com>
 <394b94ad-3de6-2dfb-4aaf-344dcef8ec18@csgraf.de>
 <YXa9sCG+crLWnK29@redhat.com>
 <cab92a49-f382-355b-5b93-19b6c94741b9@csgraf.de>
 <YXbDmlw8GqdBtFc2@redhat.com>
 <81e13473-7bfc-4e32-98ef-c0df717f3b0f@csgraf.de>
 <YXbI/SrmRLrvKPZR@redhat.com>
 <d1f2f7d5-5376-f7c3-73d4-c7df95f94206@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <d1f2f7d5-5376-f7c3-73d4-c7df95f94206@csgraf.de>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Pedro =?utf-8?Q?To=CC=82rres?= <t0rr3sp3dr0@gmail.com>,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, suse@csgraf.de,
 f4bug@amsat.org, qemu-devel@nongnu.org, r.bolshakov@yadro.com,
 "Gabriel L. Somlo" <gsomlo@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 25, 2021 at 09:45:35PM +0200, Alexander Graf wrote:
> 
> On 25.10.21 17:10, Daniel P. Berrangé wrote:
> > On Mon, Oct 25, 2021 at 04:53:57PM +0200, Alexander Graf wrote:
> > > On 25.10.21 16:47, Daniel P. Berrangé wrote:
> > > > On Mon, Oct 25, 2021 at 04:42:22PM +0200, Alexander Graf wrote:
> > > > > On 25.10.21 16:22, Daniel P. Berrangé wrote:
> > > > > > On Mon, Oct 25, 2021 at 12:13:32PM +0200, Alexander Graf wrote:
> > > > > > > On 22.10.21 18:14, Vladislav Yaroshchuk wrote:
> > > > > > > > On Apple hosts we can read AppleSMC OSK key directly from host's
> > > > > > > > SMC and forward this value to QEMU Guest.
> > > > > > > > 
> > > > > > > > Usage:
> > > > > > > > `-device isa-applesmc,hostosk=on`
> > > > > > > > 
> > > > > > > > Apple licence allows use and run up to two additional copies
> > > > > > > > or instances of macOS operating within virtual operating system
> > > > > > > > environments on each Apple-branded computer that is already running
> > > > > > > > the Apple Software, for purposes of:
> > > > > > > > - software development
> > > > > > > > - testing during software development
> > > > > > > > - using macOS Server
> > > > > > > > - personal, non-commercial use
> > > > > > > > 
> > > > > > > > Guest macOS requires AppleSMC with correct OSK. The most legal
> > > > > > > > way to pass it to the Guest is to forward the key from host SMC
> > > > > > > > without any value exposion.
> > > > > > > > 
> > > > > > > > Based on https://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter7/tpmdrmmyth/
> > > > > > > > 
> > > > > > > > Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> > > > > > > > @@ -331,6 +464,25 @@ static void applesmc_isa_realize(DeviceState *dev, Error **errp)
> > > > > > > >          isa_register_ioport(&s->parent_obj, &s->io_err,
> > > > > > > >                              s->iobase + APPLESMC_ERR_PORT);
> > > > > > > > +    if (s->hostosk_flag) {
> > > > > > > > +        /*
> > > > > > > > +         * Property 'hostosk' has higher priority than 'osk'
> > > > > > > > +         * and shadows it.
> > > > > > > > +         * Free user-provided 'osk' property value
> > > > > > > > +         */
> > > > > > > > +        if (s->osk) {
> > > > > > > > +            warn_report("isa-applesmc.osk is shadowed "
> > > > > > > > +                        "by isa-applesmc.hostosk");
> > > > > > > > +            g_free(s->osk);
> > > > > > > > +        }
> > > > > > > > +
> > > > > > > > +        if (!applesmc_read_host_osk(&s->osk, &err)) {
> > > > > > > > +            /* On host OSK retrieval error report a warning */
> > > > > > > > +            error_report_err(err);
> > > > > > > > +            s->osk = default_osk;
> > > > > > > > +        }
> > > > > > > > +    }
> > > > > > > This part is yucky. A few things:
> > > > > > > 
> > > > > > > 1) QEMU in general does not fail user requested operations silently. If the
> > > > > > > user explicitly asked to read the host OSK and we couldn't, it must
> > > > > > > propagate that error.
> > > > > > > 2) In tandem to the above, I think the only consistent CX is to make both
> > > > > > > options mutually exclusive. The easiest way to achieve that IMHO would be to
> > > > > > > overload the "osk" property. If it is "host", then use the host one.
> > > > > > > 3) Should we make "osk"="host" the default on macOS as well then? Of course,
> > > > > > > that one should *not* fail hard when it can't read the key, because it's an
> > > > > > > implicit request rather than an explicit one.
> > > > > > The problem with using a magic string value for the existing "osk"
> > > > > > parameter is that this is not introspectable by management apps.
> > > > > What introspectability would you like to have?
> > > > Essentially to answer the question
> > > > 
> > > >     "Does this QEMU support OSK passthrough from the host"
> > > > 
> > > > Mgmt apps like libvirt introspect using various query-XXX QMP commands.
> > > > For devices, the typical approach is to ask for the list of properties
> > > > the device supports. If we're just accepting a new magic value on an
> > > > existing property there is no way to query for existance of that feature.
> > > > If we add a "host-osk=bool" parameter introspectability is trivially
> > > > satisfied.
> > > 
> > > Ok, the only flow that remains sensible in that case to me sounds like the
> > > following:
> > Just need an extra check upfront:
> > 
> >   if (s->osk && s->use_hoist_osk)
> >       error_setg(errp, ...)
> >   else
> > > if (s->osk) {
> > >      /* Use osk */
> > This should fail hard if the provided value is the wrong length - currently
> > it falls back with a warning IIUC.
> > 
> > > } else if (s->use_host_osk) {
> > >      /* Use host OSK. Fail hard if we can't find it */
> > > } else if (can_use_host_osk) {
> > >      /* See if we can extract the key from the host. If not, fall back to old
> > > behavior */
> > > } else {
> > >      /* Old fallback behavior */
> > Was this old fallback behaviour actually useful ? IIUC it means it is using
> > 
> > 
> >    static char default_osk[64] = "This is a dummy key. Enter the real key "
> >                                  "using the -osk parameter";
> > 
> > which obviously isn't a valid key that will work with any gust OS that
> > cares. I guess it at least let QEMU startup, but any the guest OS that
> > checks the key will be unhappy.
> > 
> > If if don't think default_osk is actually useful, then we could simplify
> > further to
> > 
> >   if (s->osk && s->use_host_osk) {
> >       error_setg(errp, ...)
> >   } else if (s->osk) {
> >      /* Use osk. Fail hard if invalid (ie wrong length) */
> >   } else if (s->use_host_osk) {
> >      /* Use host OSK. Fail hard if we can't find it */
> >   } else {
> >      /* try to use host OSK, fail hard if we can't find it or non-OS-X build */
> >   }
> 
> 
> In the example above, use_host_osk=on and use_host_osk=off yield the exact
> same behavior, so we don't need the switch, no?

Hmm, I forgot about machine type back compat. From a strict pov, if we
change the default it should only be for the 6.2.0 machine type, with
old machines keeping the current 'default_osk' behaviour.

IOW, for 6.2.0 machine use_host_osk=on as default, and for < 6.2.0,
use_host_osk=off as default .

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


