Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3513D2BB4
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 20:07:05 +0200 (CEST)
Received: from localhost ([::1]:43512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6d68-0002jd-OR
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 14:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m6d0R-0002b7-6k
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 14:01:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m6d0O-0007dt-VU
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 14:01:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626976868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+6aK6RZwB7c2TwC8f67pJFB8gK3lbvoA0tw1I1lKCeo=;
 b=BS1zVhdK2cigxgeAg9FeXz2SuE4pHPfHki9x2LXnFHRRKiHO2pZ6eZFRGvTpyWU/+O1A4y
 RrpJvzJr7n3srGdnD479ya5FcqJlVCnStE9CUPwlMn/c7HjkMCZTm1tWD4yoTjIxglEiJf
 Oowz+VpA8r9HPEHj03lMOXyZESFJHKE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-xDI3ZTmpMG21PTzR5CV44Q-1; Thu, 22 Jul 2021 14:01:03 -0400
X-MC-Unique: xDI3ZTmpMG21PTzR5CV44Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 p11-20020a5d59ab0000b02901526f76d738so2740856wrr.0
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 11:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+6aK6RZwB7c2TwC8f67pJFB8gK3lbvoA0tw1I1lKCeo=;
 b=rridlAXXkM/HC1VRffjgZSOYXTRyv6iDNmDomHf2XpQxM49pDbh7Vqo5Nt7Q1Piv/9
 XUdLS8ya9hNl3KSVkyqXZRaoowe1sCqSGeu6WZxCao4PEioc8nb60DfPXyd8kQF8lbaq
 mg0nrQrRyYVdgAeYy7UWlZjE74G/zb8Ipwjz9w1q29CrHGoiqd1rF5E7WTc2xeDhd6G+
 nvQIB1X+a9e/r9LVJRVEYTRjlk0W6rhr18Aw9pbaZgldGCm9Kx4Jn/Jg26NRjfXXf71s
 AO/T39/sBhru2aX2y9OwR9beVmjv+h+ctdEKt5PiWtOGvIQlKxrm0CUMHrqh+RUiElbi
 x6Gg==
X-Gm-Message-State: AOAM5317bEEk+clqKeC/9kMztDwFlYSi6JnH5z2tUsqOT7yBmXHpYPVM
 fW4jNwt10q1sTf+6QYDXlUMR2grBbBROtUqhZyvezgV7mgEYAq26rqitOsX2mn2Pu2siLbSBLFP
 ouXpFGoLuHGkBqjU=
X-Received: by 2002:a5d:5645:: with SMTP id j5mr1179087wrw.426.1626976861614; 
 Thu, 22 Jul 2021 11:01:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7SNmNMJXL/8J6fipbu83ws0EUAohJV2F9PvnC6GZCFyXfCUPrIyQzpkYQxC5uMZS5nDyvlw==
X-Received: by 2002:a5d:5645:: with SMTP id j5mr1179063wrw.426.1626976861360; 
 Thu, 22 Jul 2021 11:01:01 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id c125sm3660314wme.36.2021.07.22.11.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 11:00:58 -0700 (PDT)
Date: Thu, 22 Jul 2021 19:00:56 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: -only-migrate and the two different uses of migration blockers
Message-ID: <YPmyWFCU45/W4P1z@work-vm>
References: <87tukvaejt.fsf@dusky.pond.sub.org> <YPTj6ml6LoMJkypI@yekko>
 <87lf62ydow.fsf@dusky.pond.sub.org> <YPUn2quWrztTqyML@yekko>
 <875yx6oabe.fsf@dusky.pond.sub.org>
 <87sg0amuuz.fsf_-_@dusky.pond.sub.org> <YPVzURLf5qqwtYsZ@work-vm>
 <87o8axh7rr.fsf@dusky.pond.sub.org> <YPe/fIBuvGgfiyy3@yekko>
MIME-Version: 1.0
In-Reply-To: <YPe/fIBuvGgfiyy3@yekko>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* David Gibson (david@gibson.dropbear.id.au) wrote:
> On Tue, Jul 20, 2021 at 07:30:16AM +0200, Markus Armbruster wrote:
> > "Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:
> > 
> > > * Markus Armbruster (armbru@redhat.com) wrote:
> > >> We appear to use migration blockers in two ways:
> > >> 
> > >> (1) Prevent migration for an indefinite time, typically due to use of
> > >> some feature that isn't compatible with migration.
> > >> 
> > >> (2) Delay migration for a short time.
> > >> 
> > >> Option -only-migrate is designed for (1).  It interferes with (2).
> > >> 
> > >> Example for (1): device "x-pci-proxy-dev" doesn't support migration.  It
> > >> adds a migration blocker on realize, and deletes it on unrealize.  With
> > >> -only-migrate, device realize fails.  Works as designed.
> > >> 
> > >> Example for (2): spapr_mce_req_event() makes an effort to prevent
> > >> migration degrate the reporting of FWNMIs.  It adds a migration blocker
> > >> when it receives one, and deletes it when it's done handling it.  This
> > >> is a best effort; if migration is already in progress by the time FWNMI
> > >> is received, we simply carry on, and that's okay.  However, option
> > >> -only-migrate sabotages the best effort entirely.
> > >
> > > That's interesting; it's the first time I've heard of anyone using it as
> > > 'best effort'.  I've always regarded blockers as blocking.
> > 
> > Me too, until I found this one.
> 
> Right, it may well have been the first usage this way, this fwnmi
> stuff isn't super old.
> 
> > >> While this isn't exactly terrible, it may be a weakness in our thinking
> > >> and our infrastructure.  I'm bringing it up so the people in charge are
> > >> aware :)
> > >
> > > Thanks.
> > >
> > > It almost feels like they need a way to temporarily hold off
> > > 'completion' of migratio - i.e. the phase where we stop the CPU and
> > > write the device data;  mind you you'd also probably want it to stop
> > > cold-migrates/snapshots?
> > 
> > Yes, a proper way to delay 'completion' for a bit would be clearer, and
> > wouldn't let -only-migrate interfere.
> 
> Right.  If that becomes a thing, we should use it here.  Note that
> this one use case probably isn't a very strong argument for it,
> though.  The only problem here is slightly less that optimal error
> reporting in a rare edge case (hardware fault occurs by chance at the
> same time as a migration).

Can you at least put a scary comment in to say why it's so odd.

If you wanted a choice of a different bad way to do this, since you have
savevm_htab_handlers, you might be able to make htab_save_iterate claim
there's always more to do.

> 
> .... and, also, I half-suspect that the whole fwnmi feature exists
> more to tick IBM RAS check boxes than because anyone will actually use
> it.

Ah at least it's always reliable....

Dave

> -- 
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson


-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


