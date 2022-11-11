Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF575625B1D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 14:25:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otU1G-00040w-TO; Fri, 11 Nov 2022 08:24:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1otU1D-0003wD-EM
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 08:24:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1otU19-0007be-N1
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 08:24:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668173058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FN4llIktQruR8o/mA9ahMl88xicscCFTQ41w0NbxnSI=;
 b=RfHajMZMXOeQA8fQxHh/y0ad4JC/DPm7GvfRkqq9Gd7/RGQFDUnhsddAlJ4RU5Iol/lQPu
 eFDEk8Uxg/brl5XPtBcfkgyccmC803NQE+jWntga5SehYK23ijldTe0pvWFjbCsdIya8bx
 GtZbchvM6k9P8ooBSFrp+2jMyT3LFoc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-528-t3ndBRfzMWaMQjm7Gym3ew-1; Fri, 11 Nov 2022 08:24:17 -0500
X-MC-Unique: t3ndBRfzMWaMQjm7Gym3ew-1
Received: by mail-qv1-f71.google.com with SMTP id
 mo15-20020a056214330f00b004b96d712bccso3676861qvb.22
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 05:24:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FN4llIktQruR8o/mA9ahMl88xicscCFTQ41w0NbxnSI=;
 b=occ/qMG9URdRYFznMvd+Rk6zs3gtxjH0bFCe48BJB/wcdVNpVGjVZcXwCk6+Y4lGIO
 0z/dtgl2CdB5FX3YDtnm7lAA8F5C3qIJg5or165Oud/h7lJQNVIGtT0MVIr78dWFpuDW
 GuQ3vwFGxJB1UNXd8IY9mXNgtqT/8gVbGgVfwUj3YFqmqX+zoCntka7NRUObzjbFlsF7
 ZSRTrdIpRC84QXYVmfxAKwxHe+/rvTqkXOvo7T6xXwaLS/w3a5mq9oSdJ50MNGAn1DUh
 owM26FVNItgLsOoZW7/VJjonqMg30f7EfRgh8+DWTaT7ogg8b5KtyQ7Sfra5PlCQja3X
 Qp+Q==
X-Gm-Message-State: ANoB5pk0ISUE0WSdHFQot7kcHzgMf+dHNVhaguX7HXfuzKAuyeXot8Ft
 W1FMfGN/92rZTLpDXLiSxZ8WuOTASMVXQzFvm6nU7mtI1FrRMs61T2QHXg2y4b1T77KuVry3aSM
 5IgGUCgzRppvhEtc=
X-Received: by 2002:a05:622a:114b:b0:3a5:8185:5b1b with SMTP id
 f11-20020a05622a114b00b003a581855b1bmr1182837qty.319.1668173057029; 
 Fri, 11 Nov 2022 05:24:17 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4VzuAFrUl814CjbaS2CvkYSRC10AyorTm5jDhZus4p9FTIuTBecIKjL75sptJ4lREPts/a6A==
X-Received: by 2002:a05:622a:114b:b0:3a5:8185:5b1b with SMTP id
 f11-20020a05622a114b00b003a581855b1bmr1182809qty.319.1668173056800; 
 Fri, 11 Nov 2022 05:24:16 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 az17-20020a05620a171100b006f3e6933bacsm1345238qkb.113.2022.11.11.05.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 05:24:15 -0800 (PST)
Date: Fri, 11 Nov 2022 14:24:11 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, Gregory Price <gourry.memverge@gmail.com>,
 qemu-devel@nongnu.org, mst@redhat.com, marcel.apfelbaum@gmail.com,
 jonathan.cameron@huawei.com, linux-cxl@vger.kernel.org,
 alison.schofield@intel.com, dave@stgolabs.net, a.manzanares@samsung.com,
 bwidawsk@kernel.org, gregory.price@memverge.com,
 hchkuo@avery-design.com.tw, cbrowy@avery-design.com, ira.weiny@intel.com
Subject: Re: [BUG] hw/i386/pc.c: CXL Fixed Memory Window should not reserve
 e820 in bios
Message-ID: <20221111142411.41220086@imammedo.users.ipa.redhat.com>
In-Reply-To: <20221111114059.4eilz452nmfttp3a@sirius.home.kraxel.org>
References: <20221017234001.53297-1-gregory.price@memverge.com>
 <CAARzgwxEO5rr=b_QjiG7RoEdV=9yOgj9gxUxNvuaUnNtUEnhtw@mail.gmail.com>
 <CAD3UvdTWLXf_OecWbtP9wfAvO2+xdWiAUjQHONrgB4AAAjwdHQ@mail.gmail.com>
 <CAARzgwyCTaNoiqtVPS394Nk9LAS05116Dvc2GxifHpO01+ZN4g@mail.gmail.com>
 <20221108112111.czqldmb7wemhqy6f@sirius.home.kraxel.org>
 <20221111115123.2f9bc8b6@imammedo.users.ipa.redhat.com>
 <20221111114059.4eilz452nmfttp3a@sirius.home.kraxel.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
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

On Fri, 11 Nov 2022 12:40:59 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

> On Fri, Nov 11, 2022 at 11:51:23AM +0100, Igor Mammedov wrote:
> > On Tue, 8 Nov 2022 12:21:11 +0100
> > Gerd Hoffmann <kraxel@redhat.com> wrote:
> >   
> > > > >> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > > > >> > index 566accf7e6..5bf5465a21 100644
> > > > >> > --- a/hw/i386/pc.c
> > > > >> > +++ b/hw/i386/pc.c
> > > > >> > @@ -1061,7 +1061,6 @@ void pc_memory_init(PCMachineState *pcms,
> > > > >> >          hwaddr cxl_size = MiB;
> > > > >> >
> > > > >> >          cxl_base = pc_get_cxl_range_start(pcms);
> > > > >> > -        e820_add_entry(cxl_base, cxl_size, E820_RESERVED);    
> > > 
> > > Just dropping it doesn't look like a good plan to me.
> > > 
> > > You can try set etc/reserved-memory-end fw_cfg file instead.  Firmware
> > > (both seabios and ovmf) read it and will make sure the 64bit pci mmio
> > > window is placed above that address, i.e. this effectively reserves
> > > address space.  Right now used by memory hotplug code, but should work
> > > for cxl too I think (disclaimer: don't know much about cxl ...).  
> > 
> > As far as I know CXL impl. in QEMU isn't using etc/reserved-memory-end
> > at all, it' has its own mapping.  
> 
> This should be changed.  cxl should make sure the highest address used
> is stored in etc/reserved-memory-end to avoid the firmware mapping pci
> resources there.

    if (pcmc->has_reserved_memory && machine->device_memory->base) {             
[...]
                                                             
        if (pcms->cxl_devices_state.is_enabled) {                                
            res_mem_end = cxl_resv_end;

that should be handled by this line

        }                                   
                                     
        *val = cpu_to_le64(ROUND_UP(res_mem_end, 1 * GiB));                      
        fw_cfg_add_file(fw_cfg, "etc/reserved-memory-end", val, sizeof(*val));   
    }  

so SeaBIOS shouldn't intrude into CXL address space
(I assume EDK2 behave similarly here)
 
> > so dropping reserved entries looks reasonable from ACPI spec point of view.  
> 
> Yep, I don't want dispute that.
> 
> I suspect the reason for these entries to exist in the first place is to
> inform the firmware that it should not place stuff there, and if we
       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
just to educate me, can you point out what SeaBIOS code does with reservations.

> remove that to conform with the spec we need some alternative way for
> that ...

with etc/reserved-memory-end set as above,
is E820_RESERVED really needed here?

(my understanding was that E820_RESERVED weren't accounted for when
initializing PCI devices)

> 
> take care,
>   Gerd
> 


