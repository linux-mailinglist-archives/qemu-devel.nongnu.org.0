Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBC244DBC6
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 19:48:26 +0100 (CET)
Received: from localhost ([::1]:52232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlF7Z-0002uJ-4T
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 13:48:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mlF3M-0001kQ-AB
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 13:44:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mlF3I-000192-KT
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 13:44:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636656239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YUsqgb5XiSnGX7rNzmkURR9BCZwscM5pXaiurVnEGf8=;
 b=MywSH1QXOUX9v2mVuQpK73IOQ+HAxXc/LKA7ZnUXneME/QuINsh6JiThpURAQTfLUIMToD
 KbaA5rrSD664XIKJzJ7+RdRMvj+rOGUshLo5qjZXIOxwdFQozEcdiQwYulCahZ12B4V3tF
 BKDYceRt0fbD2pIRhRDaztwruiLpHk4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-hfMu8cvxMwOsDULTMlKjjQ-1; Thu, 11 Nov 2021 13:43:55 -0500
X-MC-Unique: hfMu8cvxMwOsDULTMlKjjQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 f4-20020a50e084000000b003db585bc274so6116893edl.17
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 10:43:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=YUsqgb5XiSnGX7rNzmkURR9BCZwscM5pXaiurVnEGf8=;
 b=0vH/4uUTJ364B/ynf3Vnrt8GElBr6W+xQVTZu6QkJAFufQ2cxPQYitYwF4oCPj7yZ8
 dEMWq9W3cScQM4jkYoDIsAzNDsM0j1vFwZLmVohhu4jVifAh3kRB7nnblrxn6qwmUvft
 6K4NM7RlLMNKyXrJ96fOkhEaWe0Onr9XCCcO8ccULuDESjwdg3B8suIeEaAy394p6/JL
 gLE94x3l7z5MeaX+6V0/vYmGqOss0iBYnvrHF/HmsWYuvFALCI4yrg6/rn3DhEeTJoLg
 yBPoPUajHXyojgwKZ0DUhy7/Nu7r8YdfU/7vtjBYbF2KbnjRgpnzCB7jZuZVk4FJIvvh
 Wbbg==
X-Gm-Message-State: AOAM532ljCPwWGMF2YLZ5Y63vA3q+FMFDAW2aNi9vquCrDJBplsq9Vbt
 D2u3kHDgcFTnA3TT5s30ZGuswyFU0IESGPLWvtHjo9BuU566dMlo8lewMUiJNYONesfuduNxfaf
 P4lqhMmoQBG0B4YI=
X-Received: by 2002:a17:906:6b13:: with SMTP id
 q19mr12138498ejr.221.1636656234143; 
 Thu, 11 Nov 2021 10:43:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYgzc0envECG6Lc1k8Fxa/qtiUmQj/wI5injgD0i4sEhVW3aVLbqp90uuC5LKAbdGCOifNcw==
X-Received: by 2002:a17:906:6b13:: with SMTP id
 q19mr12138467ejr.221.1636656233867; 
 Thu, 11 Nov 2021 10:43:53 -0800 (PST)
Received: from redhat.com ([2.55.135.246])
 by smtp.gmail.com with ESMTPSA id e7sm2161312edk.3.2021.11.11.10.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 10:43:51 -0800 (PST)
Date: Thu, 11 Nov 2021 13:43:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 0/6] RfC: try improve native hotplug for pcie root ports
Message-ID: <20211111131530-mutt-send-email-mst@kernel.org>
References: <20211011120504.254053-1-kraxel@redhat.com>
 <20211110065942-mutt-send-email-mst@kernel.org>
 <20211111075306.7dvpzewgclsddku6@sirius.home.kraxel.org>
 <20211111031646-mutt-send-email-mst@kernel.org>
 <YYzj6Yizd+ESnoOE@redhat.com>
 <20211111120439-mutt-send-email-mst@kernel.org>
 <YY1cC/F2bmhj2MQa@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YY1cC/F2bmhj2MQa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11, 2021 at 06:08:11PM +0000, Daniel P. Berrangé wrote:
> On Thu, Nov 11, 2021 at 12:11:19PM -0500, Michael S. Tsirkin wrote:
> > On Thu, Nov 11, 2021 at 09:35:37AM +0000, Daniel P. Berrangé wrote:
> > > On Thu, Nov 11, 2021 at 03:20:07AM -0500, Michael S. Tsirkin wrote:
> > > > On Thu, Nov 11, 2021 at 08:53:06AM +0100, Gerd Hoffmann wrote:
> > > > >   Hi,
> > > > > 
> > > > > > Given it's a bugfix, and given that I hear through internal channels
> > > > > > that QE results so far have been encouraging, I am inclined to bite the
> > > > > > bullet and merge this for -rc1.
> > > > > 
> > > > > Fine with me.
> > > > > 
> > > > > > I don't think this conflicts with Julia's patches as users can still
> > > > > > disable ACPI hotplug into bridges.  Gerd, agree?  Worth the risk?
> > > > > 
> > > > > Combining this with Julia's patches looks a bit risky to me and surely
> > > > > needs testing.  I expect the problematic case is both native and acpi
> > > > > hotplug being enabled.
> > > > >  When the guest uses acpi hotplug nobody will
> > > > > turn on slot power on the pcie root port ...
> > > > 
> > > > I'm not sure I understand what the situation is, and how to trigger it.
> > > > Could you clarify pls?
> > > > 
> > > > > I'd suggest to just revert to pcie native hotplug for 6.2.
> > > > 
> > > > Hmm that kind of change seems even riskier to me. I think I'll try with
> > > > Igor's patches.
> > > 
> > > Why would it be risky ? PCIE native hotplug is what we've used in
> > > QEMU for years & years, until 6.1 enabled the buggy ACPI hotplug.
> > > The behaviour of the current PCIE native hotplug impl is a known
> > > quantity.
> > > 
> > > Regards,
> > > Daniel
> > 
> > For example we might regress some of the bugs that the switch to ACPI fixed back to
> > 6.0 state. There were a bunch of these. For example it should be
> > possible for guests to disable native and use ACPI then, but isn't.
> 
> Of course there were bugs fixed by switching to ACPI, but we'd
> lived with native hotplug in production and the majority of
> the time it worked as users needed. The bugs were edge cases
> essentially only affecting a small subset of users.
> 
> The switch to ACPI broke the out of the box configuration for
> used by OpenStack. That's not an edge case, that's a serious
> impact.

Right. It's pretty easy for downstreams to switch back if they want to,
though.

> > I'm very willing to consider the switch back to native by default
> > but given the timing doing big changes like that at the last
> > minute seems unusual.
> 
> I consider it to be fixing a serious regression by going back
> to a known working safe impl, that has been used in production
> successfully for a long time. We know there are bugs with
> native hotplug, but they're *known* problems.

Are you familiar with the issues or are just arguing generally?  From my
POV they made native too unreliable to be useful.  It's great that the
narrow usecase of openstack managed not to hit any of the races
involved, but I think it's more a question of luck.  This until these
specific patches, but they are only in v2 out of rfc status just today.

> The unsual thing about timing is having a major functional
> regression identified in the previous release and then not
> even having patches propposed to fix it until after soft
> freeze for the next release arrives :-(
> 
> It doesn't give a feeling of confidence, but makes me
> wonder what other *unknown* problems we're liable to hit
> still.
> 
> Regards,
> Daniel

Right. And this applies to both approaches.  So I thought hard about the
balance here, and am inclined to go with a rough consensus opinion.

I don't see any reasons or in fact anyone objecting strongly to Igor's
patches, so I'm taking these. These are just bugfixes.

But if we also reach a rough consensus on others and e.g. Igor acks
Gerd's patch to revert to native then I think I'll merge it, it's
a close thing.

> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


