Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 328AB6258BB
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 11:51:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otRdI-0000qp-KL; Fri, 11 Nov 2022 05:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1otRdE-0000qJ-Sf
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:51:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1otRdB-0000Ok-W0
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:51:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668163889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f6qOicsVWEFuMRUDI3g87ppm3RRuKfipWDoA7+vDt8k=;
 b=SoMFreVyB/tYyeY3zasmE8HdamktfodxL/zMdjAScAcHV6lNX++upSohApt+02kwWycoyE
 59hfyqtwqvGN6Qf1MrIovtCQIVBIVYdPnlu5FTyfGIXorHvGvkHERckiW7YBUlCUjWNOVO
 Jtk4n9DSdWvmqTm/10ulHVMk1yCJO6o=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-189--xpddZQ8P_i6Xdz7ORFUaw-1; Fri, 11 Nov 2022 05:51:27 -0500
X-MC-Unique: -xpddZQ8P_i6Xdz7ORFUaw-1
Received: by mail-qk1-f197.google.com with SMTP id
 ay43-20020a05620a17ab00b006fa30ed61fdso4449126qkb.5
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 02:51:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f6qOicsVWEFuMRUDI3g87ppm3RRuKfipWDoA7+vDt8k=;
 b=5nptM6SMjkeR8mBzMtrFdUYzfz1MOyqdDe0ccUwQJMxM/M3YI+Jza0HA5eNXZz9DaF
 Y/Nnh6dCegvE50wmbHiZ6aML/wxTVUxjfiwlmv1MDvY+nv8Bku23u4AhO8lbkNXpTr4d
 N50x4G2+XkLjxbWcHdca9Yer24jFptaXw4zKSzdhn1UMn87rgSKjkjER39K7pP/TuwhP
 r063+vEASHICPQr/EhAelZjqH6fkBGSZGunHGCfTvXbrFRXAqtIRZ6xQTxyCzuqWSLtn
 pxzO3m4F7VehDygZlceBy5AZLCWp/mHqwQYfosozEQr0kAJ88rzeaMjkUHkWy0kUUuP3
 g2dg==
X-Gm-Message-State: ANoB5pnolps/9DbYpYaxOpZIi1c1iLYP23hOeNRUEmXQ9pJB+6ZVteAN
 A+TxcBkv9XhtM8Y/tEusYAAU1OlkSMPWmJOG/W2IT7A+OLoW+IY+ltfoK262pt95d88S8+5WJel
 sT3dhzwYfamf+1TU=
X-Received: by 2002:a05:6214:5c83:b0:4bb:781e:6231 with SMTP id
 lj3-20020a0562145c8300b004bb781e6231mr1297928qvb.106.1668163887498; 
 Fri, 11 Nov 2022 02:51:27 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7JtwSKvEgmfA00qHUBJi5YLLzr+MU/yo/aCIkxuuCIwJv8syhvMKtrnG8vgid+Cmdz0jMaxw==
X-Received: by 2002:a05:6214:5c83:b0:4bb:781e:6231 with SMTP id
 lj3-20020a0562145c8300b004bb781e6231mr1297920qvb.106.1668163887120; 
 Fri, 11 Nov 2022 02:51:27 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 a14-20020ac8108e000000b003a57004313fsm1097259qtj.3.2022.11.11.02.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 02:51:26 -0800 (PST)
Date: Fri, 11 Nov 2022 11:51:23 +0100
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
Message-ID: <20221111115123.2f9bc8b6@imammedo.users.ipa.redhat.com>
In-Reply-To: <20221108112111.czqldmb7wemhqy6f@sirius.home.kraxel.org>
References: <20221017234001.53297-1-gregory.price@memverge.com>
 <CAARzgwxEO5rr=b_QjiG7RoEdV=9yOgj9gxUxNvuaUnNtUEnhtw@mail.gmail.com>
 <CAD3UvdTWLXf_OecWbtP9wfAvO2+xdWiAUjQHONrgB4AAAjwdHQ@mail.gmail.com>
 <CAARzgwyCTaNoiqtVPS394Nk9LAS05116Dvc2GxifHpO01+ZN4g@mail.gmail.com>
 <20221108112111.czqldmb7wemhqy6f@sirius.home.kraxel.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
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

On Tue, 8 Nov 2022 12:21:11 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

> > >> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > >> > index 566accf7e6..5bf5465a21 100644
> > >> > --- a/hw/i386/pc.c
> > >> > +++ b/hw/i386/pc.c
> > >> > @@ -1061,7 +1061,6 @@ void pc_memory_init(PCMachineState *pcms,
> > >> >          hwaddr cxl_size = MiB;
> > >> >
> > >> >          cxl_base = pc_get_cxl_range_start(pcms);
> > >> > -        e820_add_entry(cxl_base, cxl_size, E820_RESERVED);  
> 
> Just dropping it doesn't look like a good plan to me.
> 
> You can try set etc/reserved-memory-end fw_cfg file instead.  Firmware
> (both seabios and ovmf) read it and will make sure the 64bit pci mmio
> window is placed above that address, i.e. this effectively reserves
> address space.  Right now used by memory hotplug code, but should work
> for cxl too I think (disclaimer: don't know much about cxl ...).

As far as I know CXL impl. in QEMU isn't using etc/reserved-memory-end
at all, it' has its own mapping.

Regardless of that, reserved E820 entries look wrong, and looking at
commit message OS is right to bailout on them (expected according
to ACPI spec).
Also spec says 

"
E820 Assumptions and Limitations
 [...]
 The platform boot firmware does not return a range description for the memory mapping of
 PCI devices, ISA Option ROMs, and ISA Plug and Play cards because the OS has mechanisms
 available to detect them.
"

so dropping reserved entries looks reasonable from ACPI spec point of view.
(disclaimer: don't know much about cxl ... either)
> 
> take care & HTH,
>   Gerd
> 


