Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 378596D780A
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 11:25:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjzNX-0001iU-Ol; Wed, 05 Apr 2023 05:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pjzNV-0001iL-ED
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 05:24:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pjzNR-0003yu-Cg
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 05:24:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680686661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i4+ahpAj46gmdxeDCFCdW1zGIDK6z8dbUqWRxz/oUzY=;
 b=hx1g6roz8gmP41jnkW+9GLCSaCrJvw86YSnA2E9HNkhKKyWm19Nvk4MyOIrgGR3PWEsHln
 1Y3CZ3tgQHyROvuKOyvzbGUfnbYf35439im97KtuTXhm6jSXYf1TO6iWIycKLdUB3bLS4J
 iagAsm4rCNPVKt+h2/9s1kjLz2gD9ng=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-vHcQqn7lP86pjPRNlAQPLQ-1; Wed, 05 Apr 2023 05:24:19 -0400
X-MC-Unique: vHcQqn7lP86pjPRNlAQPLQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-502621dce2cso250808a12.1
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 02:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680686658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i4+ahpAj46gmdxeDCFCdW1zGIDK6z8dbUqWRxz/oUzY=;
 b=m4A5/11ZJm4Wq7R5ZyIHNKNNC1ng/pisKkBd0wyQBZ/ZhL/yDV04nE//64rv9QAnBW
 ocpgQegZohXX46liYAPvb8F6TCXf8udOhFNGDJEE7aV9NAYUJPQogxfpVpQESLRdjRhz
 m5p0J7e2wOXMbE6iv5lQPrg5cFAWcmk5WJJtXK0BFmuNnW2Kz4lcUD4IRcyM791mLk9L
 UlUFDntNF1REUshv+jokMumXhmqtftCnzvk7jDJYlSi2Q8RDIp2e3lav0r9Sy5AW3v8P
 tcLJMPGVoEh84jvgx1ZFl7X/yY468OSQoHO+K8vSLCRxA52AVACkbVAmIvCYuZ7D/+Ny
 gvUQ==
X-Gm-Message-State: AAQBX9fi9ngqeG1vKLI3W4x2sCsk4V0qQdCUoSeu7JWhkee5HuBitkdL
 wIRn0IoqtLB3nPAuhGvYpd0XVcFwOfBnX4ovxqk7sIb6oLvxrwGzzsYjDdjavO1g6fyXCMszN+2
 EYLYLihTZla644uU=
X-Received: by 2002:aa7:de0f:0:b0:502:91c6:fa8f with SMTP id
 h15-20020aa7de0f000000b0050291c6fa8fmr1051572edv.42.1680686658362; 
 Wed, 05 Apr 2023 02:24:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350YXWK5jliGl3gerfORuNCsuRR2Isr85kySnM4t7pxfWBS3vbwFWCkZTudRvjWSto6WFkUGdNA==
X-Received: by 2002:aa7:de0f:0:b0:502:91c6:fa8f with SMTP id
 h15-20020aa7de0f000000b0050291c6fa8fmr1051553edv.42.1680686658053; 
 Wed, 05 Apr 2023 02:24:18 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 oz16-20020a170906cd1000b008b17de9d1f2sm7306177ejb.15.2023.04.05.02.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 02:24:17 -0700 (PDT)
Date: Wed, 5 Apr 2023 11:24:16 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, anisinha@redhat.com, jusual@redhat.com,
 kraxel@redhat.com, pbonzini@redhat.com
Subject: Re: [PATCH] acpi: pcihp: make pending delete expire in 5sec
Message-ID: <20230405112416.38e83b0c@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230405043026-mutt-send-email-mst@kernel.org>
References: <20230403161618.1344414-1-imammedo@redhat.com>
 <20230403131833-mutt-send-email-mst@kernel.org>
 <20230404102807.4626b0be@imammedo.users.ipa.redhat.com>
 <20230404084603-mutt-send-email-mst@kernel.org>
 <20230404160435.45c2513d@imammedo.users.ipa.redhat.com>
 <20230404104122-mutt-send-email-mst@kernel.org>
 <20230405093020.3cbcd6e7@imammedo.users.ipa.redhat.com>
 <20230405043026-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Wed, 5 Apr 2023 04:32:16 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, Apr 05, 2023 at 09:30:20AM +0200, Igor Mammedov wrote:
> > On Tue, 4 Apr 2023 10:42:04 -0400
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >   
> > > On Tue, Apr 04, 2023 at 04:04:35PM +0200, Igor Mammedov wrote:  
> > > > On Tue, 4 Apr 2023 08:46:15 -0400
> > > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > >     
> > > > > On Tue, Apr 04, 2023 at 10:28:07AM +0200, Igor Mammedov wrote:    
> > > > > > On Mon, 3 Apr 2023 13:23:45 -0400
> > > > > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > > >       
> > > > > > > On Mon, Apr 03, 2023 at 06:16:18PM +0200, Igor Mammedov wrote:      
> > > > > > > > with Q35 using ACPI PCI hotplug by default, user's request to unplug
> > > > > > > > device is ignored when it's issued before guest OS has been booted.
> > > > > > > > And any additional attempt to request device hot-unplug afterwards
> > > > > > > > results in following error:
> > > > > > > > 
> > > > > > > >   "Device XYZ is already in the process of unplug"
> > > > > > > > 
> > > > > > > > arguably it can be considered as a regression introduced by [2],
> > > > > > > > before which it was possible to issue unplug request multiple
> > > > > > > > times.
> > > > > > > > 
> > > > > > > > Allowing pending delete expire brings ACPI PCI hotplug on par
> > > > > > > > with native PCIe unplug behavior [1] which in its turn refers
> > > > > > > > back to ACPI PCI hotplug ability to repeat unplug requests.
> > > > > > > > 
> > > > > > > > PS:        
> > > > > > > > >From ACPI point of view, unplug request sets PCI hotplug status        
> > > > > > > > bit in GPE0 block. However depending on OSPM, status bits may
> > > > > > > > be retained (Windows) or cleared (Linux) during guest's ACPI
> > > > > > > > subsystem initialization, and as result Linux guest looses
> > > > > > > > plug/unplug event (no SCI generated) if plug/unplug has
> > > > > > > > happend before guest OS initialized GPE registers handling.
> > > > > > > > I couldn't find any restrictions wrt OPM clearing GPE status
> > > > > > > > bits ACPI spec.
> > > > > > > > Hence a fallback approach is to let user repeat unplug request
> > > > > > > > later at the time when guest OS has booted.
> > > > > > > > 
> > > > > > > > 1) 18416c62e3 ("pcie: expire pending delete")
> > > > > > > > 2)
> > > > > > > > Fixes: cce8944cc9ef ("qdev-monitor: Forbid repeated device_del")
> > > > > > > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>        
> > > > > > > 
> > > > > > > A bit concerned about how this interacts with failover,
> > > > > > > and 5sec is a lot of time that I hoped we'd avoid with acpi.
> > > > > > > Any better ideas of catching such misbehaving guests?      
> > > > > > 
> > > > > > It shouldn't affect affect failover, pending_delete is not
> > > > > > cleared after all (only device removal should do that).
> > > > > > So all patch does is allowing to reissue unplug request
> > > > > > in case it was lost, delay here doesn't mean much
> > > > > > (do you have any preference wrt specific value)?      
> > > > > 
> > > > > I'd prefer immediately.    
> > > > 
> > > > ok, lets use 1ms then, I'd rather reuse the preexisting
> > > > pending_deleted_expires_ms machinery instead of
> > > > special-casing immediate repeat.    
> > > 
> > > And just to make sure, are you working on fixing this in Linux
> > > at least? Because the work around is ok but it still causes
> > > latency.  
> > 
> > 
> > Fixing what, clearing GPE status bits during ACPI subsystem
> > initialization?
> > 
> > Well at this point I'm not seeing a good justification for
> > removing GPE clearing (spec does not mandate that).
> > (but there is no harm in trying to send a patch, though
> > even if idea is accepted it won't do a dime for all current
> > and older distributions history show it was the thing even
> > since 2.6 kernels).
> > 
> > As for workaround, well it's not a workaround, but expected
> > behavior. 
> > ACPI hotplug expects functioning OSPM on guest side to work
> > properly. It's user's mistake to ask for unplug before that 
> > and user shall repeat request once guest is booted. What is
> > broken on QEMU side is that 'repeat' thingy (as it's noted
> > in commit message).  
> 
> I don't see how you can claim it's user's mistake.  All users want is
> device to be removed. How is our problem.  Guest can reboot at any time
> and there's no indication to user that guest booted, blaming
> users won't help if we do not have a fix for them.
ACPI hot-unplug requires cooperating guest, it doesn't matter what user
wants if guest is not able or not willing to unplug device.

User however can watch for DEVICE_DELETED event and repeat
request again in hope that guest would cooperate.

With CPU/DIMMs guest is able to tell user more exact status
of unplug request (using ACPI _OST method), I don't recall
if PCI subsystem is capable of using _OST as well.
But then again it requires functioning OSPM.

As for reboot, pcihp machinery does remove devices with pending
unplug requests at hw reset time (though it's QEMU specific
ACPI PCI hotplug quirk, not something that happens on baremetal).

So it's up to management tools to decide whether to repeat
or abandon/report error of unplug attempt.

> > PS:
> > See commit message, Windows is not affected as it doesn't
> > clear GPE status bits during ACPI initialization
> > (at least the one version I've tested with, and I won't bet
> > on this with other versions or staying this way)  
> 
> So I am saying linux should match windows. Clearing GPE
> is a bad idea as you then miss events.

I'd say it depends on if guest OS is able to handle hot[un]plug
at boot time when it enables GPE handlers (or any other time).
(My point of view here, it's a guest OS policy and management
layer should know what installed guest is capable of and what
quirks to use with it)

I'll try to send a kernel patch to remove GPEx.status clearing,
though it might be more complex than it seems,
hence I'm quite sceptical about it.

> > >   
> > > > >     
> > > > > > As for 'misbehaving' - I tried to find justification
> > > > > > for it in spec, but I couldn't.
> > > > > > Essentially it's upto OSPM to clear or not GPE status
> > > > > > bits at startup (linux was doing it since forever),
> > > > > > depending on guest's ability to handle hotplug events
> > > > > > at boot time.
> > > > > > 
> > > > > > It's more a user error, ACPI hotplug does imply booted
> > > > > > guest for it to function properly. So it's fine to
> > > > > > loose unplug event at boot time. What QEMU does wrong is
> > > > > > preventing follow up unplug requests.  
> > > > > >       
> > > > > > > 
> > > > > > > Also at this point I do not know why we deny hotplug
> > > > > > > pending_deleted_event in qdev core.  
> > > > > > > Commit log says:
> > > > > > > 
> > > > > > >     Device unplug can be done asynchronously. Thus, sending the second
> > > > > > >     device_del before the previous unplug is complete may lead to
> > > > > > >     unexpected results. On PCIe devices, this cancels the hot-unplug
> > > > > > >     process.
> > > > > > > 
> > > > > > > so it's a work around for an issue in pcie hotplug (and maybe shpc
> > > > > > > too?). Maybe we should have put that check in pcie/shpc and
> > > > > > > leave acpi along?
> > > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > >       
> > > > > > > > ---
> > > > > > > > CC: mst@redhat.com
> > > > > > > > CC: anisinha@redhat.com
> > > > > > > > CC: jusual@redhat.com
> > > > > > > > CC: kraxel@redhat.com
> > > > > > > > ---
> > > > > > > >  hw/acpi/pcihp.c | 2 ++
> > > > > > > >  1 file changed, 2 insertions(+)
> > > > > > > > 
> > > > > > > > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > > > > > > > index dcfb779a7a..cd4f9fee0a 100644
> > > > > > > > --- a/hw/acpi/pcihp.c
> > > > > > > > +++ b/hw/acpi/pcihp.c
> > > > > > > > @@ -357,6 +357,8 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
> > > > > > > >       * acpi_pcihp_eject_slot() when the operation is completed.
> > > > > > > >       */
> > > > > > > >      pdev->qdev.pending_deleted_event = true;
> > > > > > > > +    pdev->qdev.pending_deleted_expires_ms =
> > > > > > > > +        qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 5000; /* 5 secs */
> > > > > > > >      s->acpi_pcihp_pci_status[bsel].down |= (1U << slot);
> > > > > > > >      acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
> > > > > > > >  }
> > > > > > > > -- 
> > > > > > > > 2.39.1        
> > > > > > >       
> > > > >     
> > >   
> 


