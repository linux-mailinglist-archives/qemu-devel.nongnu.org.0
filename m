Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A4467FA64
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 20:15:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLqec-0001Iv-0T; Sat, 28 Jan 2023 14:14:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLqeY-0001IM-Kt
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 14:14:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLqeW-00082S-Iw
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 14:14:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674933255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MmFATCvCv+iLBZCyy08SIeWAIC6kqySCKBlzbfv3tYM=;
 b=JTvBdm4M0wTRBpLMpE3pe7sLBdd6LTJuYQ2Z2J1JrLWqIRqN8mdnDnfRtLDl1Q3OyXa3SY
 VFxjB+/6NUP7mzmcDDEv02LAoKRQu3dJszhzQDuFrlDjdB4PQ0CsZ7gMb4H/B4JqgZifIC
 WSakwQ84foZ1iRzPiXIihwT7298h9ec=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-375-riIkQpzVPq-UOnaL7IJdxQ-1; Sat, 28 Jan 2023 14:14:13 -0500
X-MC-Unique: riIkQpzVPq-UOnaL7IJdxQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 o24-20020a5d58d8000000b002bfe173775aso154124wrf.3
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 11:14:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MmFATCvCv+iLBZCyy08SIeWAIC6kqySCKBlzbfv3tYM=;
 b=3O6bh7weAhbYzqgS97Zv1QATmHi2dFpoMfmHMxpCWHrxuNi4RLxy5oqh0hJRS8KClJ
 Hu+wWpZK/64w8qSu5GqFNmEwr9Y3tp59MZtc9pQL4qaqSFMBopojEh2B0ZCTMlHWudaG
 M5e7SGpYEBddjUVgmtdR1It/uYcMFd+yF8YY6GQy9XLzYW2RV8IMdweViitihG7uwqlp
 Qn0CJ1PNe0V17m/Hgbf/yTxDjnc/6MENOUSe8I/jBRPeXcXsjMY3UiGwY2jHULeIzKDu
 SsqQk/8pqGZFz8WBFcXBqi0NBHMe73QCn6V+iiygr7VKgooOinWCcfrIQD+XPRH5SGV/
 w84Q==
X-Gm-Message-State: AFqh2kr0LRY25d6UKcbFAPeFK0ae5ao+xl2iIio/ZDy5AhETbACfXfx9
 gXks/ACE2uW6AERXWAgQVs3KAwWF//Wi/+q8dS1Tx79JJNp9MnmUk/U0jELYWtMYg3lwiOfHd3y
 hhBZ1DVmLxqNjFAM=
X-Received: by 2002:a05:600c:80f:b0:3d2:3d7b:6118 with SMTP id
 k15-20020a05600c080f00b003d23d7b6118mr44013457wmp.24.1674933251959; 
 Sat, 28 Jan 2023 11:14:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtZq/5Fa79pMXGUpgEHD5tK7b5/hKz9bVKHIk6Rb75fEMgkesIu2SgUqr3h1U+pvAwLyXzQ8g==
X-Received: by 2002:a05:600c:80f:b0:3d2:3d7b:6118 with SMTP id
 k15-20020a05600c080f00b003d23d7b6118mr44013448wmp.24.1674933251763; 
 Sat, 28 Jan 2023 11:14:11 -0800 (PST)
Received: from redhat.com ([2.52.20.248]) by smtp.gmail.com with ESMTPSA id
 v6-20020a05600c444600b003db09692364sm12601249wmn.11.2023.01.28.11.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 11:14:10 -0800 (PST)
Date: Sat, 28 Jan 2023 14:14:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Chuck Zmudzinski <brchuckz@aol.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH] pci: add enforce_slot_reserved_mask_manual property
Message-ID: <20230128141348-mutt-send-email-mst@kernel.org>
References: <ad5f5cf8bc4bd4a720724ed41e47565a7f27adf5.1673829387.git.brchuckz.ref@aol.com>
 <ad5f5cf8bc4bd4a720724ed41e47565a7f27adf5.1673829387.git.brchuckz@aol.com>
 <20230127082240-mutt-send-email-mst@kernel.org>
 <ddac019e-28bc-9e0b-c6d7-5bd54d0239f3@aol.com>
 <20230128052506-mutt-send-email-mst@kernel.org>
 <56643500-7bdd-8204-0529-fa004ab10a44@aol.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56643500-7bdd-8204-0529-fa004ab10a44@aol.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Jan 28, 2023 at 08:20:55AM -0500, Chuck Zmudzinski wrote:
> On 1/28/23 5:26 AM, Michael S. Tsirkin wrote:
> > On Fri, Jan 27, 2023 at 10:39:28PM -0500, Chuck Zmudzinski wrote:
> >> On 1/27/2023 8:28 AM, Michael S. Tsirkin wrote:
> >> > On Sun, Jan 15, 2023 at 07:49:51PM -0500, Chuck Zmudzinski wrote:
> >> > > The current reserved slot check in do_pci_register_device(), added with
> >> > > commit 8b8849844fd6
> >> >
> >> > add ("subject here") please
> >> >
> >> > > ,is done even if the pci device being added is
> >> > > configured manually for a particular slot. The new property, when set
> >> > > to false, disables the check when the device is configured to request a
> >> > > particular slot. This allows an administrator or management tool to
> >> > > override slot_reserved_mask for a pci device by requesting a particular
> >> > > slot for the device. The new property is initialized to true which
> >> > > preserves the existing behavior of slot_reserved_mask by default.
> >> > > 
> >> > > Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> >> >
> >> > Thanks!
> >> > I'm trying to think of the best default for this.
> >> 
> >> I think it would be better for the default value of
> >> enforce_slot_reserved_mask_manual to be false, so that a
> >> user-specified slot will by default override slot_reserved_mask.
> >> But doing that would change the current behavior of
> >> slot_reserved_mask.
> >> 
> >> Currently, this is the only place where slot_reserved_mask is used in all
> >> of the Qemu source (code from hw/sparc64/sun4u.c):
> >> 
> >> ------ snip -------
> >>     /* Only in-built Simba APBs can exist on the root bus, slot 0 on busA is
> >>        reserved (leaving no slots free after on-board devices) however slots
> >>        0-3 are free on busB */
> >>     pci_bus->slot_reserved_mask = 0xfffffffc;
> >>     pci_busA->slot_reserved_mask = 0xfffffff1;
> >>     pci_busB->slot_reserved_mask = 0xfffffff0;
> >> ------ snip -------
> >> 
> >> I think we could safely change the default value of
> >> enforce_slot_reserved_mask_manual to false but set
> >> it to true for the sparc64 sun4u board here to preserve
> >> the current behavior of the only existing board in Qemu
> >> that uses slot_reserved_mask.
> >> 
> >> What do you think?
> > 
> > I guess first can you answer whether this is still needed
> > with the latest Xen patches?
> > 
> 
> It's not really needed except for experimental purposes to allow
> an administrator to test experimental configurations with a device
> other than the igd at slot 2. That might be useful in some cases,
> but it is not really necessary unless someone asks for that capability.
> If libvirt users who ordinarily like to manually specify all the
> settings will be OK with the proposed patch to xen that prevents
> an administrator from being able to override a new setting that
> reserves slot 2 for the igd for type "xenfv" machines configured for
> igd passthrough, then there is no need for this patch. I don't think
> many users need the capability to insert a different device in slot 2 for
> the "xenfv" machine type configured with igd-passthru=on, so I would be
> OK if this patch is not included in qemu.
> 
> Chuck

Pls wait and see if that patch gets picked up. Let me know.


