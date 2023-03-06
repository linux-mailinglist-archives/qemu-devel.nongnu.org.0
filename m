Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AE46ABD24
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 11:44:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ8Jj-0003Au-5P; Mon, 06 Mar 2023 05:43:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pZ8Jh-0003Am-Hu
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 05:43:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pZ8Jf-0008PC-Hs
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 05:43:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678099417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZB/InglhwNwIJG1WeiMSsZpctgRvOdQUB5CnJc2vCZU=;
 b=cKEpNCzKIuAtOvZPmaGviikGfZXsouC2zZFCiaoNhNXzt2/H/7M4MjiYfUVUeUK0V364FG
 ytpZ3ZF07XcUIiucctcaHqUADKFW8Vk9W4t1iwW+P7AatZsiiP6AWzEi1hXxHWjF1G8hn4
 AJz1VTwGsLmNTd4qnTqLOh7S7CT7Fnc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-C1rwMn2BMG6V2zw7ThLExQ-1; Mon, 06 Mar 2023 05:43:35 -0500
X-MC-Unique: C1rwMn2BMG6V2zw7ThLExQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 ea22-20020a05620a489600b00742cec04043so5171091qkb.7
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 02:43:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678099415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZB/InglhwNwIJG1WeiMSsZpctgRvOdQUB5CnJc2vCZU=;
 b=bI+vfaaRZfZPoJleT7RLGxawpzb/StRF/Syfq0M8uXgegnbf0PoUkbFhG1MtuN/GMD
 bRI7FJKmzQdD3SyeA+XMZHprlgEnzcj1c33aowjomz+nW8X3SxNWJr/v4gvQHwKcUusD
 R8R3Hpc5o/+ux3aR69YEMXS91OOLCzaGxdJsTBI/yltgHQ2AnVTog1WGjZjuK4tYCsaA
 l3h3s6JivB7Uzqhj2q53N1+NblSpLFZ+XqW6hCDkiBQ2bfiA2iKqHZpshnFgJsOSxbex
 iUKxxqzfCqUT8XA4aW/KbLDUT4IJ9IQcTZLiEz+X5L13vQ0CZkzpiJP/z518JJpOBtMh
 DzmQ==
X-Gm-Message-State: AO0yUKVP8TYRGELFBTPH2VGwG6gO03wndoIIU4hiEKo7VxogxsamHOR9
 NnFWjHe9fTuLlWtwtSB4hZy5ktEIUGMR/S7e7A1ppcIO02USzOsYs8NfXVjVz26dUARr098ntTr
 9nY2WxQoBBmaUQ/s=
X-Received: by 2002:ac8:5b85:0:b0:3bf:d0d2:142d with SMTP id
 a5-20020ac85b85000000b003bfd0d2142dmr15268223qta.24.1678099415453; 
 Mon, 06 Mar 2023 02:43:35 -0800 (PST)
X-Google-Smtp-Source: AK7set9kKMv7+PKlZ5IXPsM52rdoAecY75YxjUZ/R5Kb0Z4lHTdnPF7K4u3qFa0fn+2ETGZg0zh15Q==
X-Received: by 2002:ac8:5b85:0:b0:3bf:d0d2:142d with SMTP id
 a5-20020ac85b85000000b003bfd0d2142dmr15268210qta.24.1678099415207; 
 Mon, 06 Mar 2023 02:43:35 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 b6-20020ac801c6000000b003bd1a798f76sm7273645qtg.37.2023.03.06.02.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 02:43:34 -0800 (PST)
Date: Mon, 6 Mar 2023 11:43:31 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bui Quang Minh <minhquangbui99@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, "Michael S . Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 1/4] apic: add support for x2APIC mode
Message-ID: <20230306114331.531c9cd2@imammedo.users.ipa.redhat.com>
In-Reply-To: <71d9e801-80b2-d5ed-4c02-b328f0b175d4@gmail.com>
References: <20230221160500.30336-1-minhquangbui99@gmail.com>
 <20230221160500.30336-2-minhquangbui99@gmail.com>
 <20230224152932.1de436cb@imammedo.users.ipa.redhat.com>
 <ee3d42c1-9e52-57f9-eba8-a5dc3a45d14f@gmail.com>
 <20230227170759.12297901@imammedo.users.ipa.redhat.com>
 <f24683be-f3a7-34fe-279a-11d01e696bbc@gmail.com>
 <20230228173954.6a7b6c4f@imammedo.users.ipa.redhat.com>
 <71d9e801-80b2-d5ed-4c02-b328f0b175d4@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
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

On Sat, 4 Mar 2023 21:10:54 +0700
Bui Quang Minh <minhquangbui99@gmail.com> wrote:

> On 2/28/23 23:39, Igor Mammedov wrote:
> > On Tue, 28 Feb 2023 21:34:33 +0700
> > Bui Quang Minh <minhquangbui99@gmail.com> wrote:
> >   
> >> On 2/27/23 23:07, Igor Mammedov wrote:  
> >>> On Sat, 25 Feb 2023 17:15:17 +0700
> >>> Bui Quang Minh <minhquangbui99@gmail.com> wrote:
> >>>      
> >>>> On 2/24/23 21:29, Igor Mammedov wrote:  
> >>>>> On Tue, 21 Feb 2023 23:04:57 +0700
> >>>>> Bui Quang Minh <minhquangbui99@gmail.com> wrote:
> >>>>>         
> >>>>>> This commit refactors APIC registers read/write function to support both
> >>>>>> MMIO read/write in xAPIC mode and MSR read/write in x2APIC mode. Also,
> >>>>>> support larger APIC ID, self IPI, new IPI destination determination in
> >>>>>> x2APIC mode.
> >>>>>>
> >>>>>> Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>
> >>>>>> ---
> >>>>>>     hw/intc/apic.c                  | 211 +++++++++++++++++++++++++-------
> >>>>>>     hw/intc/apic_common.c           |   2 +-
> >>>>>>     include/hw/i386/apic.h          |   5 +-
> >>>>>>     include/hw/i386/apic_internal.h |   2 +-
> >>>>>>     4 files changed, 172 insertions(+), 48 deletions(-)
> >>>>>>
> >>>>>> diff --git a/hw/intc/apic.c b/hw/intc/apic.c
> >>>>>> index 2d3e55f4e2..205d5923ec 100644
> >>>>>> --- a/hw/intc/apic.c
> >>>>>> +++ b/hw/intc/apic.c
> >>>>>> @@ -30,6 +30,7 @@
> >>>>>>     #include "hw/i386/apic-msidef.h"
> >>>>>>     #include "qapi/error.h"
> >>>>>>     #include "qom/object.h"
> >>>>>> +#include "tcg/helper-tcg.h"
> >>>>>>     
> >>>>>>     #define MAX_APICS 255  
> >>>>>
> >>>>> I'm curious how does it work without increasing ^^^?  
> >>>>
> >>>> Hmm, my commit message is not entirely correct. In this series, some
> >>>> operations (send IPI, IPI destination determination) have been updated
> >>>> to support x2APIC mode. However, the emulated APIC still doesn't support
> >>>> APIC ID larger than 255 because currently, we use a fixed length (255 +
> >>>> 1) array to manage local APICs. So to support larger APIC ID, I think we
> >>>> need to find any way to manage those, as the possible allocated APIC ID
> >>>> range is large and maybe the allocated APIC ID is sparse which makes
> >>>> fixed length array so wasteful.  
> >>> how much sparse it is?  
> >>
> >> As far as I know, QEMU allows to set CPU's APIC ID, so user can pass a
> >> very sparse APIC ID array.  
> > 
> > I don't think that it does permit this (if it does it's a bug that should be fixed).
> > 
> > As far as I'm aware QEMU derives apic_id from '-smp' and possibly cpu type
> > (there was some differences between Intel and AMD in how apic id was encoded
> > notably AMD having threads or cores that lead to sparse apic id), though I don't
> > remember current state of affairs in x86 cpu topo code.
> >   
> >>> benefits of simple static array is simplicity in management and O(1) access time.
> >>> QEMU does know in advance max apic id so we can size array by dynamically
> >>> allocating it when 1st apic is created. Or if IDs are too sparse
> >>> switch to another structure to keep mapping.  
> >>
> >> I totally agree with this.
> >>
> >> I admit that my main focus on this series is to make x2APIC mode
> >> function correctly with TCG accelerator, so I skip the part of extending
> >> the support for higher APIC ID.  
> > the tricky part in such half approach is making sure that the code is
> > 'correct' and won't lead to exploits.
> > It would be easier to review if it was completed solution instead of partial.  
> 
> I looked around and found the way to dynamically allocate local_apics array
> 
> 	void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
> 	{
> 		if (!kvm_irqchip_in_kernel()) {
>          		apic_set_max_apic_id(x86ms->apic_id_limit);
>      		}
> 
> 	}
> 
> We already calculated apic_id_limit before creating CPU and local APIC 
> so we can use that number to dynamically allocated local_apics.
> 
> However, there are still problems while trying to extending support to 
> APIC ID larger than 255 because there are many places assume APIC ID is 
> 8-bit long.
that's what I was concerned about (i.e. just enabling x2apic without fixing
with all code that just assumes 8bit apicid).

> One of that is interrupt remapping which returns 32-bit 
> destination ID but uses MSI (which has 8-bit destination) to send to 
> APIC. I will look more into this.

Thanks!

> 
> Thanks,
> Quang Minh.
> 


