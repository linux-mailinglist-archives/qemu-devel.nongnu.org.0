Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AA93D5A5E
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 15:32:02 +0200 (CEST)
Received: from localhost ([::1]:53444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m80i9-0003GC-1y
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 09:32:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m80fj-0001at-P4
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 09:29:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m80ff-0002JC-JS
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 09:29:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627306165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CttLLMzQWSSt/Mi3NSgrESjj8R5H22rGiqWDsCsNwZE=;
 b=Mh1Cg+vSkVUB6h7PZsxAAv0jXrM/TYslDe7dA4Z/qoU3UfJ2YOB2aye2m0D8LmwaWQPHik
 396HYC8ki+yJT7WUgCsxVN7jr3Ws5R+U5mHMSCJC84Oju7UOa36+ztMWpkPc4b9PiKQ8Ic
 BECvGaS3yaCUIV+d1otsspJBMFBLgmg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-7swnyQyoOj2ZWWoAbYLQRQ-1; Mon, 26 Jul 2021 09:29:24 -0400
X-MC-Unique: 7swnyQyoOj2ZWWoAbYLQRQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 o11-20020a5d474b0000b02901533f8ed22cso3271798wrs.22
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 06:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CttLLMzQWSSt/Mi3NSgrESjj8R5H22rGiqWDsCsNwZE=;
 b=j1027xy2/721rz1OSf9+AK8YJzLRGw+XHwoe6HoDPb4PICEssDrIcxyrile7TL5+XL
 xXncWzpoFQYolkuPu3wrdPq6QrP77IB6QearLLvJTcmv6EBarcoVwRVEGN/WkXJ3yK9P
 4/o6Yzf243Kq40AmxWHl4DwaqGC/daIy6uTZOlH1jUWO6wBWESRpMHy53dcU+x+hc6OC
 1n0Mc1pijuBQr+G/JTDuQodbohyH3j3BkaligVmKDLluE5Y1jfqYOrQNGiBgh8qggTmj
 Yb+3VQefJZ07DRjUKhaZcm+TdqQyWjEVzYupHNwK7lxkYrof7fCfQ56w/0c2/D6Dt1t+
 aNbg==
X-Gm-Message-State: AOAM532dX+Wow6lX1SX01PbQGjGiwn3OVTxwFGp/iQ/YsUu623FZAUw5
 KBv+J5a5O0NAD3IV8YaZ6kI/pgC0V0Qtq/Xb2hkn0jDe3+YPynpUxCtt66T95lzrSfLFpUP5uzY
 LtXFvBebSfLv/2Lg=
X-Received: by 2002:a5d:610b:: with SMTP id v11mr19441279wrt.58.1627306163235; 
 Mon, 26 Jul 2021 06:29:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4lNhbcId5m+yKoqeXfPlmxeVzMC44DrkoVRSqt3qMhhuwU3cQtasjMoKeBueR9cdtlGSGAg==
X-Received: by 2002:a5d:610b:: with SMTP id v11mr19441262wrt.58.1627306163004; 
 Mon, 26 Jul 2021 06:29:23 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id j14sm6565367wru.58.2021.07.26.06.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 06:29:22 -0700 (PDT)
Date: Mon, 26 Jul 2021 15:29:21 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] hw/acpi: some cosmetic improvements to existing code
Message-ID: <20210726152921.4faedd39@redhat.com>
In-Reply-To: <alpine.DEB.2.22.394.2107261823010.37646@anisinha-lenovo>
References: <20210721141610.139310-1-ani@anisinha.ca>
 <20210726135949.6e55593b@redhat.com>
 <alpine.DEB.2.22.394.2107261823010.37646@anisinha-lenovo>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: jusual@redhat.com, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Jul 2021 18:26:28 +0530 (IST)
Ani Sinha <ani@anisinha.ca> wrote:

> On Mon, 26 Jul 2021, Igor Mammedov wrote:
> 
> > On Wed, 21 Jul 2021 19:46:10 +0530
> > Ani Sinha <ani@anisinha.ca> wrote:
> >  
> > > All existing code using acpi_get_i386_pci_host() checks for a non-null
> > > return from this function call. This change brings the same check to
> > > acpi_pcihp_disable_root_bus() function. Also adds a comment describing
> > > why we unconditionally pass a truth value to the last argument when calling
> > > acpi_pcihp_reset() from ich9 platform.
> > >
> > > Fixes: c0e427d6eb5fef ("hw/acpi/ich9: Enable ACPI PCI hot-plug")
> > >
> > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > ---
> > >  hw/acpi/ich9.c  | 1 +
> > >  hw/acpi/pcihp.c | 5 +++++
> > >  2 files changed, 6 insertions(+)
> > >
> > > diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> > > index 778e27b659..58d8430eb9 100644
> > > --- a/hw/acpi/ich9.c
> > > +++ b/hw/acpi/ich9.c
> > > @@ -281,6 +281,7 @@ static void pm_reset(void *opaque)
> > >      pm->smi_en_wmask = ~0;
> > >
> > >      if (pm->use_acpi_hotplug_bridge) {
> > > +        /* on root PCIE bus, we always use native or SHPC based hotplug */  
> > I had an impression that root bus doesn't support hotplug at all,
> > and to have hotplug there one should attach a root-port to root bus at
> > start up time.  
> 
> I think you are right. However, I will let others confirm this and update
> the comment accordingly in a separate patch.
> 
> 
> >  
> > >          acpi_pcihp_reset(&pm->acpi_pci_hotplug, true);
> > >      }
> > >
> > > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > > index f4d706e47d..856c6e1b47 100644
> > > --- a/hw/acpi/pcihp.c
> > > +++ b/hw/acpi/pcihp.c
> > > @@ -136,6 +136,11 @@ static void acpi_pcihp_disable_root_bus(void)
> > >          return;
> > >      }
> > >
> > > +    if (!host) {
> > > +        root_hp_disabled = true;
> > > +        return;
> > > +    }  
> > It should be a separate patch,
> > when this could return NULL?
> > If it should never be null then assert here would be better.  
> 
> I have sent a v2 without the comment addition. I left the code this way
> because everywhere else, the code checking host for NULL value is similar.
> I wanted to keep the symmetry. However, if you strongly feel about the
> assertion, I will send a v3.

So the first thing is to confirm if NULL return value is valid or not.
When it clear we can decide whether copy existing check like you do or
replace all such checks with asserts.

> 
> 
> >  
> > > +
> > >      bus = PCI_HOST_BRIDGE(host)->bus;
> > >      if (bus) {
> > >          /* setting the hotplug handler to NULL makes the bus non-hotpluggable */  
> >
> >  
> 


