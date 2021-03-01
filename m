Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E3332828A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 16:33:36 +0100 (CET)
Received: from localhost ([::1]:46478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGkYB-00025A-NM
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 10:33:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lGkWZ-0001Fs-TW
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 10:31:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lGkWW-00027h-IL
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 10:31:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614612711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jCiCALr1D0k63A7jygbsEpTsP7/1Br5Kksy79n9URyo=;
 b=E6cY1Y2xsuRScqRRvc5+xpRmnqUaN0zgtGWwmES0ng3k7YHDDp5WpmWl9XAUNWatrojBsF
 os5x3amsj0hI0efFyC6aFApUAWhAyQjDmlFzOGXYslTbHF0uzhbhGwq4uK4Bl4rX+F2n1l
 5+PKYHWf4NBpjbj0CcrXcdwajYPtuhI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-NxCDFLCmPbaLSBWI1BDLLA-1; Mon, 01 Mar 2021 10:31:50 -0500
X-MC-Unique: NxCDFLCmPbaLSBWI1BDLLA-1
Received: by mail-ej1-f70.google.com with SMTP id p8so589923ejl.0
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 07:31:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jCiCALr1D0k63A7jygbsEpTsP7/1Br5Kksy79n9URyo=;
 b=SBbULo3vcaBFh7p0o5dIadFwu9+qHLHSiGZW2BOpFoRk+9BKBaoE4+s421dOyJOHoE
 y4l6QIsTTznkdgQoOcQ5945+FsNvvZF+MpYv6TwrfEzvOVj9eZKCRlPZ1PuFTBtKNxXH
 IQ3ywJKnuXheUFoMqYTHIv9FBrCSp9Gb4CqnOO/MTIjYBgytORGtF+ghqwpkKD+scEB5
 hGlKKIw3U7o9sfU/E/sGrk+/tjXX+CAcpxTwqHatvtpvDmDshSaZBjpgd48JlPOpQdu5
 MixvNVJ2MSmekH2mKoPm/uqdeEVq8K23F4Zac7HuRWmL5Yt6LPbX6e3TbWQtovXIF6OB
 Fjxw==
X-Gm-Message-State: AOAM5323wtgUXWwKz1h8jH9YwEdiW6Ek2mkvoi1PPAnKtqCO0HRcqQ/f
 wnL+2oQbNrZh9s4d6WnG0lNPXYeyRWeTY58IwQoynEiHNQJn3pzKbQdEPiJ4Y7Q3sA7C+2Wh9Hs
 MS2DFD+LT04lL0wo=
X-Received: by 2002:a50:e80c:: with SMTP id e12mr17093154edn.229.1614612709026; 
 Mon, 01 Mar 2021 07:31:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWXeJGNOCS8qztkyF/uG1En4b/xC9no2kAELX7K+SAkOLpxH3LailXh6d+yb/4Ii+UXNMvkQ==
X-Received: by 2002:a50:e80c:: with SMTP id e12mr17093126edn.229.1614612708837; 
 Mon, 01 Mar 2021 07:31:48 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id z19sm16349317edr.69.2021.03.01.07.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 07:31:47 -0800 (PST)
Date: Mon, 1 Mar 2021 10:31:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: Re: [PATCH 1/2] i386/acpi: fix inconsistent QEMU/OVMF device paths
Message-ID: <20210301081147-mutt-send-email-mst@kernel.org>
References: <20200730155755.188845-1-mst@redhat.com>
 <5b40e1ac-03ca-7954-4d50-f5f96c339772@proxmox.com>
 <20210228154208-mutt-send-email-mst@kernel.org>
 <967d3e1f-d387-0b33-95b0-6560f49657dd@proxmox.com>
 <20210301021449-mutt-send-email-mst@kernel.org>
 <4b7e58a9-e6bf-818f-b2f1-72600fced210@proxmox.com>
MIME-Version: 1.0
In-Reply-To: <4b7e58a9-e6bf-818f-b2f1-72600fced210@proxmox.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Stefan Reiter <s.reiter@proxmox.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Laszlo Ersek <lersek@redhat.com>, vit9696 <vit9696@protonmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 01, 2021 at 08:45:53AM +0100, Thomas Lamprecht wrote:
> On 01.03.21 08:20, Michael S. Tsirkin wrote:
> > On Mon, Mar 01, 2021 at 08:12:35AM +0100, Thomas Lamprecht wrote:
> >> On 28.02.21 21:43, Michael S. Tsirkin wrote:
> >>> Sure. The way to do that is to tie old behaviour to old machine
> >>> versions. We'll need it in stable too ...
> >>
> >> Yeah, using machine types is how its meant to be with solving migration
> >> breakage, sure.
> >> But that means we have to permanently pin the VM, and any backup restored from
> >> that to that machine type *forever*. That'd be new for us as we always could
> >> allow a newer machine type for a fresh start (i.e., non migration or the like)
> >> here, and mean that lots of other improvements guarded by a newer machine type
> >> for those VMs will.
> > 
> > If you don't do that, that is a bug as any virtual hardware
> > can change across machine types.
> 
> For us a feature, for fresh starts one gets the current virtual HW but for
> live migration or our live snapshot code it stays compatible. Works quite
> well here for many years, as we can simply test the HW changes on existing
> VMs - which failed here due to lack of static IPs in the test bed. So yes,
> it has its problems as it is not really  what an OS considers as HW change
> so big that it makes it a new device, mostly Windows is a PITA here as seen
> in this issue.
> 
> I mean, QEMU deprecates very old machines at some point anyway, so even then
> it is impossible to keep to the old machine forever, but otoh redoing some
> changes after a decade or two can be fine, I guess?
> 
> > 
> >> And yeah, stable is wanted, but extrapolating from the current stable releases
> >> frequency, where normally there's maximal one after 5-6 months from the .0
> >> release, means that this will probably still hit all those distributions I
> >> mentioned or is there something more soon planned?
> >>
> >> Also, is there any regression testing infrastructure around to avoid such
> >> changes in the future? This change got undetected for 7 months, which can be
> >> pretty the norm for QEMU releases, so some earlier safety net would be good? Is
> >> there anything which dumps various default machine HW layouts and uses them for
> >> an ABI check of some sorts?
> > 
> > There are various testing efforts the reason this got undetected is
> > because it does not affect linux guests, and even for windows
> > they kind of recover, there's just some boot slowdown around reconfiguration.
> > Not easy to detect automatically given windows has lots of random
> > downtime during boot around updates etc etc.
> > 
> 
> No, Windows does not reconfigure, this is a permanent change, one is just lucky
> if one has a DHCP server around in the network accessible for the guest.
> As static addresses setup on that virtual NIC before that config is gone,
> no recovery whatsoever until manual intervention.

Right, it so happened no one tested with a static IP.

> I meant more of a "dump HW layout to .txt file, commit to git, and ensure
> there's no diff without and machine version bump" (very boiled down), e.g., like
> ABI checks for kernel builds are often done by distros - albeit those are easier
> as its quite clear what and how the kernel ABI can be used.

Exactly. We have such tests for ACPI which is what changed here.  We
just *do* change ACPI once in a while - it is code after all, and it is
normally fine to change as long as changes are not material.  So what do
we do  when we change it?  All we have right now is inspecting
it manually.

-- 
MST


