Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A87F6D7C5B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 14:23:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk2AW-0006D0-MK; Wed, 05 Apr 2023 08:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pk2AQ-0006Bn-UM
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 08:23:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pk2AM-0005NF-R0
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 08:23:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680697386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w6/Vl34EWUw83ML3u4Rtvm/f2on6NJLMp0a17oxliqg=;
 b=dsxc0aNlv66tAfybtmt6c+Bcy25HemmncCNw0zDnf8bI665RtsVVOfjM12T1Zee/h6o671
 3/t9CAcp9lETAJ2saeuCgaIwSqpst9RkUv7rg9UD9vx/jcaYbs4FhIaYnJyjyiZK4DvhcY
 MEphcM/5L/SbiTnfm1l4Hfdy2B5Xmj8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-BRdiUtPjMUyB2qkYX2D0kg-1; Wed, 05 Apr 2023 08:23:04 -0400
X-MC-Unique: BRdiUtPjMUyB2qkYX2D0kg-1
Received: by mail-qv1-f69.google.com with SMTP id
 g6-20020ad45426000000b005a33510e95aso16175612qvt.16
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 05:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680697384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w6/Vl34EWUw83ML3u4Rtvm/f2on6NJLMp0a17oxliqg=;
 b=Rurkqn2tUSdDxSsfxCUgrB+1+pN0iiCn+rTNWlZPcf2+zzRAN5UXH6sWOZ71/U7zTL
 u5cPVj1+rq70LyRq9CJS4SgKo99BHU6mUp3Uyugw+WzXJkLhQhAYPfhhN4Ga2PHemXTD
 ql1zHHyeOMGV7hCZkS9JiUdQMfQ90h3e+2gYvDd8xP5I5NiZuKVFo8hhjibWJv1i7FO5
 V0UozbfFcHZZq3/B7+JBcoVwh8HQLSCOileGDiDP6ecT+fT+pSvQQxSseZU2Y5qkorMG
 iB0I1qOHH1J5NUENyHquxvq7ep2j9qR7RFTnddUZeassbziUs+IMGYY/qK5/8U5BvO8/
 4/KQ==
X-Gm-Message-State: AAQBX9crKh50EM14PazheOzBXAm5Rx8GXD+5pcFWDUf+gL60J4ao4oia
 Hhs2RasO0g/FFH0gRB4bQnTIy2YH7pPlbqxvE8eltJG7V/ozFQzsaoTuxtNKqLUQcmVOmwMMMYP
 jwakuJYrFrf/xTFs=
X-Received: by 2002:a05:6214:2346:b0:5e0:2d2a:33d7 with SMTP id
 hu6-20020a056214234600b005e02d2a33d7mr8399040qvb.34.1680697384237; 
 Wed, 05 Apr 2023 05:23:04 -0700 (PDT)
X-Google-Smtp-Source: AKy350akypvjrNj9cM/rxBagBcMohAbJ4mNlYIvmVhr7kyk0lZQwdTpTdoT1tCripPLn9hSl3OxDhw==
X-Received: by 2002:a05:6214:2346:b0:5e0:2d2a:33d7 with SMTP id
 hu6-20020a056214234600b005e02d2a33d7mr8399013qvb.34.1680697383943; 
 Wed, 05 Apr 2023 05:23:03 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 jy1-20020a0562142b4100b005dd8b9345ebsm4158628qvb.131.2023.04.05.05.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 05:23:03 -0700 (PDT)
Date: Wed, 5 Apr 2023 14:23:00 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, anisinha@redhat.com, jusual@redhat.com,
 kraxel@redhat.com
Subject: Re: [PATCH v2] acpi: pcihp: make pending delete blocking action expire
Message-ID: <20230405142300.06ceb51b@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230405055946-mutt-send-email-mst@kernel.org>
References: <20230405083444.1536720-1-imammedo@redhat.com>
 <20230405044231-mutt-send-email-mst@kernel.org>
 <20230405113856.72065fd0@imammedo.users.ipa.redhat.com>
 <20230405055946-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Wed, 5 Apr 2023 06:02:29 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, Apr 05, 2023 at 11:38:56AM +0200, Igor Mammedov wrote:
> > On Wed, 5 Apr 2023 04:47:48 -0400
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >   
> > > On Wed, Apr 05, 2023 at 10:34:44AM +0200, Igor Mammedov wrote:  
> > > > with Q35 using ACPI PCI hotplug by default, user's request to unplug
> > > > device is ignored when it's issued before guest OS has been booted.
> > > > And any additional attempt to request device hot-unplug afterwards
> > > > results in following error:
> > > > 
> > > >   "Device XYZ is already in the process of unplug"
> > > > 
> > > > arguably it can be considered as a regression introduced by [2],
> > > > before which it was possible to issue unplug request multiple
> > > > times.
> > > > 
> > > > Allowing pending delete blocking expire brings ACPI PCI hotplug
> > > > on par with native PCIe unplug behavior [1] and allows user
> > > > to repeat unplug requests at propper times.
> > > > Set expire timeout to arbitrary 1msec so user won't be able to
> > > > flood guest with SCI interrupts by calling device_del in tight loop.
> > > > 
> > > > PS:
> > > > ACPI spec doesn't mandate what OSPM can do with GPEx.status
> > > > bits set before it's booted => it's impl. depended.
> > > > Status bits may be retained (I tested with one Windows version)
> > > > or cleared (Linux since 2.6 kernel times) during guest's ACPI
> > > > subsystem initialization.
> > > > Clearing status bits (though not wrong per se) hides the unplug
> > > > event from guest, and it's upto user to repeat device_del later
> > > > when guest is able to handle unplug requests.
> > > > 
> > > > 1) 18416c62e3 ("pcie: expire pending delete")
> > > > 2)
> > > > Fixes: cce8944cc9ef ("qdev-monitor: Forbid repeated device_del")
> > > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>    
> > > 
> > > I feel a real solution is to detect guest handling the
> > > event such as clearing GPE and allowing resending
> > > the interrupt then.  
> > 
> > I did consider preserving(masking clearing attempt) of GPE0.sts[]
> > IF en[] hasn't been enabled ever (i.e. should help with unplug at
> > the 1st boot). But that won't work across reboots (depends on
> > reboot kind) and it's twisting rules wrt spec (platform(QEMU/fw)
> > may set status bits, but it's upto OSPM to decide what to do with
> > them (when and how clear or ignore them). 
> >   
> > > A similar strategy should be possible with the attention
> > > button.
> > >   
> >   
> > > This patch is more of a band-aid - it is possible that guest
> > > rebooted and so user knows a new device_del is required,
> > > and we arbitrarily reject that. Right?  
> > You lost me here. Can you elaborate?  
> 
> I request device deletion but guest was rebooting losing state.
> I want to request deletion again but the request will fail
> until 1ms passes. 1ms is not a lot but I really don't want
> management to learn weird tricks like waiting for 1ms.
There is no actual need to wait 1ms or 5sec if management doesn't
want to, it can bombard QEMU with with requests however it likes
if it can't do something smarter. But it won't affect guest and
management will be getting pending error until that time expires.

The thing that mgmt shall account for is that unplug request is
just that and might not work for various reasons. And mgmt has
to deal with it (i.e. repeat requests for some time then report
transient failure up stack) (any timeouts on QEMU behalf here are
largely irrelevant).

> > > 
> > > This is arguably a regression but not in this release yes?
> > > So I don't think it needs to block qemu release.
> > > 
> > >   
> > > > ---
> > > > v2:
> > > >    * change timeout to 1ms
> > > >    * add comment to expire usage
> > > >    * massage commit message to be a bit more clear
> > > > 
> > > > CC: mst@redhat.com
> > > > CC: anisinha@redhat.com
> > > > CC: jusual@redhat.com
> > > > CC: kraxel@redhat.com    
> > > 
> > > It's helpful to have CC before --- so backporters know whom to CC, too.  
> > 
> > ok, I'll fix it up and respin
> >   
> > >   
> > > > ---
> > > >  hw/acpi/pcihp.c | 10 ++++++++++
> > > >  1 file changed, 10 insertions(+)
> > > > 
> > > > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > > > index dcfb779a7a..5daa732a33 100644
> > > > --- a/hw/acpi/pcihp.c
> > > > +++ b/hw/acpi/pcihp.c
> > > > @@ -357,6 +357,16 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
> > > >       * acpi_pcihp_eject_slot() when the operation is completed.
> > > >       */
> > > >      pdev->qdev.pending_deleted_event = true;
> > > > +    /* if unplug was requested before OSPM is initialized,
> > > > +     * linux kernel will clear GPE0.sts[] bits during boot, which effectively
> > > > +     * hides unplug event. BAnd than followup qmp_device_del() calls remain    
> > > 
> > > BAnd?
> > >   
> > > > +     * blocked by above flag permanently.
> > > > +     * Unblock qmp_device_del() by setting expire limit, so user can
> > > > +     * repeat unplug request later when OSPM has been booted.
> > > > +     */
> > > > +    pdev->qdev.pending_deleted_expires_ms =
> > > > +        qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL); /* 1 msec */
> > > > +
> > > >      s->acpi_pcihp_pci_status[bsel].down |= (1U << slot);
> > > >      acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
> > > >  }
> > > > -- 
> > > > 2.39.1    
> > >   
> 


