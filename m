Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E34C51C6AE
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 20:03:39 +0200 (CEST)
Received: from localhost ([::1]:33574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfpC-0006Xf-5n
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 14:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nmfAc-0000wu-EU
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:21:42 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:26717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nmfAZ-0003vq-RR
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:21:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651771296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x+lSRVIzqwP4f9F0rCcIC5vAqIsCT6BV5YIBVfJmWwU=;
 b=eHqrraZznZeRmzrJlCste70yOgAXA6j2WOEBCX7gwkY/YXdX943hN1l2bvE960XavvMfu9
 fuAIKyfIlvRS0+6hH6MU/sIcxjkM8LL7qafWnqHuUFRZIShv4APxtQBYAU3lr5pHxP586O
 CHZ9zad5YtWTIn0zAv/vWszrJM7h9ew=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-JYITGtrPNYWxMM-zQILY6g-1; Thu, 05 May 2022 13:21:29 -0400
X-MC-Unique: JYITGtrPNYWxMM-zQILY6g-1
Received: by mail-wr1-f72.google.com with SMTP id
 u26-20020adfb21a000000b0020ac48a9aa4so1713004wra.5
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 10:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=x+lSRVIzqwP4f9F0rCcIC5vAqIsCT6BV5YIBVfJmWwU=;
 b=hISR+8ArfOmGjLIgVtM5zpe9OK8vsmSOiOrJXzlcaOY9WgnIVM15RzJeUC9SjYP9CH
 WgIVyt0DRHjIQXLNv+sky24ItEThHk7NPM686zPe9+ViFvNtQR8ta/aHNCMck4G6Lv+p
 DgK2DDL/dWoagkLQQBYgwsz8/slrCJbhOPm0ti5JmIUPophqQXdN5Mct3VQEopUrlwMR
 Vi7Y4pkwOI/zMBYQ2z2sgxP2eS15aHw07ClM0rQ7bYahy7vI8fJ879sYxisXbofQwa7i
 cLMdCDKDZkbeFCWAq2jHKeN/FkCu1LlDwug/YBqk8CSsVeD0GmHBmMB/4Ozz1lWQeZui
 az+A==
X-Gm-Message-State: AOAM533BcAL+Gjn9vjqj2+mic1scIQM1vnNG3rL+DuogQMd2fcd5MWzG
 NCFPhIZXya3rEgxvyU4vpkgBrHL4X1hiB/INkyGAgr/5Mk/5Pg1gU5xDlKLYjE1beOdnmyiu4Rq
 m2p/cjs0aUm4Hd6Y=
X-Received: by 2002:adf:e942:0:b0:20a:c907:90d6 with SMTP id
 m2-20020adfe942000000b0020ac90790d6mr22017499wrn.163.1651771287780; 
 Thu, 05 May 2022 10:21:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCHIOVgLc0DOOjcEytEcLzE0MPW7FMP4L41kBsuS1r3J/p1DzvLItspaMfSFq4WzdPrVgLmQ==
X-Received: by 2002:adf:e942:0:b0:20a:c907:90d6 with SMTP id
 m2-20020adfe942000000b0020ac90790d6mr22017489wrn.163.1651771287584; 
 Thu, 05 May 2022 10:21:27 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 d7-20020adffbc7000000b0020c66310845sm1619282wrs.55.2022.05.05.10.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 10:21:26 -0700 (PDT)
Date: Thu, 5 May 2022 18:21:24 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 mark.kanda@oracle.com
Subject: Re: [PATCH 1/8] qmp: Support for querying stats
Message-ID: <YnQHlN19Vuft1+/H@work-vm>
References: <20220426141619.304611-1-pbonzini@redhat.com>
 <20220426141619.304611-2-pbonzini@redhat.com>
 <87sfpp3018.fsf@pond.sub.org>
 <41B27AED-A9E0-4666-AEBB-0F3C9F436DF1@redhat.com>
 <87v8ukt8g8.fsf@pond.sub.org> <YnPTeO8PvfpH4jMQ@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YnPTeO8PvfpH4jMQ@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.74; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Thu, May 05, 2022 at 03:28:23PM +0200, Markus Armbruster wrote:
> > Paolo Bonzini <pbonzini@redhat.com> writes:
> > 
> > > Il 4 maggio 2022 15:22:27 CEST, Markus Armbruster <armbru@redhat.com> ha scritto:
> > >>Can you point to existing uses of KVM binary stats introspection data?
> > >
> > > There's none, but Google is using it in house. The same data was available before in debugfs and available via the kvm_stat script, so you could also refer to Christian Borntraeger's KVM Forum 2019 talk. The problems with debugfs are basically that it's only available to root and is disabled by secure boot (both issues are not fixable on general because they are Linux policy).
> > 
> > I keep bothering you about use cases, because I'm habitually opposed to
> > adding features without credible use cases.
> > 
> > For small features, a bit of plausible hand-waving can suffice, but this
> > one isn't small enough for that.
> > 
> > Plausible hand-waving can sometimes suffice for *experimental* features.
> > Say when the use case can't really materialize without the feature.
> > 
> > Double-checking (pardon my ignorance): we're basically exposing the host
> > kernel's KVM stats via QMP, with the option of extending it to other
> > sources of stats in the future.  Correct?
> > 
> > I think the argument for accepting the interface is basically "if it's
> > good enough for the kernel, it's good enough for us".  Valid point.
> > 
> > This means we'll acquire yet another introspection system, unrelated to
> > the introspection systems we already have in QEMU.
> 
> The second introspection system was the bit I disliked the most.
> 
> The inherant tension we have in that respect is that traditionally
> with QMP we explicitly /want/ the developer to have todo design+coding
> work to expose every new piece of data. Similarly on the client side
> we are expecting work to consume any new piece of data.
> 
> With this command we explicitly do NOT want the developer to do
> any new design+coding work, but instead allow almost arbitrary
> passthrough of whatever data the kernel decides to expose, and
> consumption of arbitrary data without writing new code.

The developer is going to have had to made that design when they put it
in the kernel; they don't really want to repeat the bikeshedding at each
further layer up the stack.  We have to be able to accept that we're
dealing with another (open) interface which has already gone through
review.

Dave

> There is some appeal in why we want todo that, but it is certainly
> a divergance from our historical approach to QMP, so we shouldn't
> make this decision lightly.
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


