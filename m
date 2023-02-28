Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C42976A5D54
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 17:41:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX31L-0001Io-Ji; Tue, 28 Feb 2023 11:40:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pX31J-0001Ig-1k
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 11:40:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pX31G-000600-OT
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 11:40:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677602400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K3kmnjAdOU2sAUeEtuMayZbAszKgU6fFwBUZFSXi2a4=;
 b=g42AinoW4UUj4m6Ye8FoK31/Am/DDmF4DL5aybWGwX6cDSGMD10bA9Qs77z497yYnmT9VK
 vTPPLjYfBYIB7tIKVTC6iiDLEpgx0mklUd5FQ6sAXs8ukxZRJeQiov2QQL4MAIgba80ewj
 p+kGjZFoPvBM8d2kFdXKT2SB0QgF72k=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-499-0GdoIFaTNXKCmRQrBekZMg-1; Tue, 28 Feb 2023 11:39:58 -0500
X-MC-Unique: 0GdoIFaTNXKCmRQrBekZMg-1
Received: by mail-qt1-f200.google.com with SMTP id
 k13-20020ac8074d000000b003bfd04a3cbcso3721679qth.16
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 08:39:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K3kmnjAdOU2sAUeEtuMayZbAszKgU6fFwBUZFSXi2a4=;
 b=q63YyP+K45IAasvaH5WZQQGX1iZXTpaYjroE2VE5HHkFsGYNUmDYcDm9QuWe0vRb9O
 HtPz+CzMEFAQSEgRpwL2JBLY1MtMXU0ITo1EHtwei87xJSBV3Kwye/BigCIy5Y0Ilbuk
 Pr4bGONO0VIWqZIx7S1vxXlp1BdQxcfgnpcC/y6d5JIHoscvzYyoVez7gmc0C/vFHToY
 K/6XO3AAo3RER/jfyC0BpeNo1DXWIy5MrJ1Cx5GiHNKkUmZqpInKtX6rsPgwfWNvKwm/
 lNheyPIlqwdwceYCSC+/UMjyNNaPKjoiqXqh7NDbdVED56SztK5s/T50rLdSOhCgcwWE
 fAow==
X-Gm-Message-State: AO0yUKU39mXNfp2RxF4JQvh4I3ozajXHsA/1F53ouGqu2Qgq9vT49Bme
 YdFHaRW9D3lWaUVul95c74OYYX7dPYz+/d8Qv5XtmwM3LGmCDx2WZVP1B+acUBja5QJ11I+nNVz
 s0PdGt3XBOcqcQI0=
X-Received: by 2002:a05:6214:248f:b0:56e:a3a2:1a1c with SMTP id
 gi15-20020a056214248f00b0056ea3a21a1cmr7110386qvb.33.1677602398230; 
 Tue, 28 Feb 2023 08:39:58 -0800 (PST)
X-Google-Smtp-Source: AK7set84IhXKzcHEdfufPhYHZe9ZjEMDAU5nkdGkByH6oIv1E8EWOPzXwqMDc47JmGhbb+jsl9mdGg==
X-Received: by 2002:a05:6214:248f:b0:56e:a3a2:1a1c with SMTP id
 gi15-20020a056214248f00b0056ea3a21a1cmr7110361qvb.33.1677602398003; 
 Tue, 28 Feb 2023 08:39:58 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a05620a136300b0073ba2c4ee2esm7000582qkl.96.2023.02.28.08.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 08:39:57 -0800 (PST)
Date: Tue, 28 Feb 2023 17:39:54 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bui Quang Minh <minhquangbui99@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, "Michael S . Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 1/4] apic: add support for x2APIC mode
Message-ID: <20230228173954.6a7b6c4f@imammedo.users.ipa.redhat.com>
In-Reply-To: <f24683be-f3a7-34fe-279a-11d01e696bbc@gmail.com>
References: <20230221160500.30336-1-minhquangbui99@gmail.com>
 <20230221160500.30336-2-minhquangbui99@gmail.com>
 <20230224152932.1de436cb@imammedo.users.ipa.redhat.com>
 <ee3d42c1-9e52-57f9-eba8-a5dc3a45d14f@gmail.com>
 <20230227170759.12297901@imammedo.users.ipa.redhat.com>
 <f24683be-f3a7-34fe-279a-11d01e696bbc@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
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

On Tue, 28 Feb 2023 21:34:33 +0700
Bui Quang Minh <minhquangbui99@gmail.com> wrote:

> On 2/27/23 23:07, Igor Mammedov wrote:
> > On Sat, 25 Feb 2023 17:15:17 +0700
> > Bui Quang Minh <minhquangbui99@gmail.com> wrote:
> >   
> >> On 2/24/23 21:29, Igor Mammedov wrote:  
> >>> On Tue, 21 Feb 2023 23:04:57 +0700
> >>> Bui Quang Minh <minhquangbui99@gmail.com> wrote:
> >>>      
> >>>> This commit refactors APIC registers read/write function to support both
> >>>> MMIO read/write in xAPIC mode and MSR read/write in x2APIC mode. Also,
> >>>> support larger APIC ID, self IPI, new IPI destination determination in
> >>>> x2APIC mode.
> >>>>
> >>>> Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>
> >>>> ---
> >>>>    hw/intc/apic.c                  | 211 +++++++++++++++++++++++++-------
> >>>>    hw/intc/apic_common.c           |   2 +-
> >>>>    include/hw/i386/apic.h          |   5 +-
> >>>>    include/hw/i386/apic_internal.h |   2 +-
> >>>>    4 files changed, 172 insertions(+), 48 deletions(-)
> >>>>
> >>>> diff --git a/hw/intc/apic.c b/hw/intc/apic.c
> >>>> index 2d3e55f4e2..205d5923ec 100644
> >>>> --- a/hw/intc/apic.c
> >>>> +++ b/hw/intc/apic.c
> >>>> @@ -30,6 +30,7 @@
> >>>>    #include "hw/i386/apic-msidef.h"
> >>>>    #include "qapi/error.h"
> >>>>    #include "qom/object.h"
> >>>> +#include "tcg/helper-tcg.h"
> >>>>    
> >>>>    #define MAX_APICS 255  
> >>>
> >>> I'm curious how does it work without increasing ^^^?  
> >>
> >> Hmm, my commit message is not entirely correct. In this series, some
> >> operations (send IPI, IPI destination determination) have been updated
> >> to support x2APIC mode. However, the emulated APIC still doesn't support
> >> APIC ID larger than 255 because currently, we use a fixed length (255 +
> >> 1) array to manage local APICs. So to support larger APIC ID, I think we
> >> need to find any way to manage those, as the possible allocated APIC ID
> >> range is large and maybe the allocated APIC ID is sparse which makes
> >> fixed length array so wasteful.  
> > how much sparse it is?  
> 
> As far as I know, QEMU allows to set CPU's APIC ID, so user can pass a 
> very sparse APIC ID array.

I don't think that it does permit this (if it does it's a bug that should be fixed).

As far as I'm aware QEMU derives apic_id from '-smp' and possibly cpu type
(there was some differences between Intel and AMD in how apic id was encoded
notably AMD having threads or cores that lead to sparse apic id), though I don't
remember current state of affairs in x86 cpu topo code.

> > benefits of simple static array is simplicity in management and O(1) access time.
> > QEMU does know in advance max apic id so we can size array by dynamically
> > allocating it when 1st apic is created. Or if IDs are too sparse
> > switch to another structure to keep mapping.  
> 
> I totally agree with this.
> 
> I admit that my main focus on this series is to make x2APIC mode 
> function correctly with TCG accelerator, so I skip the part of extending 
> the support for higher APIC ID.
the tricky part in such half approach is making sure that the code is
'correct' and won't lead to exploits.
It would be easier to review if it was completed solution instead of partial.  


> Thanks,
> Quang Minh.
> 


