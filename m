Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5FC4A4C40
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 17:36:55 +0100 (CET)
Received: from localhost ([::1]:49718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEZfh-00076o-UC
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 11:36:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nEZLy-0008Ag-Ss
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 11:16:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nEZLx-0007QQ-0C
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 11:16:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643645787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iJfsF5okITdGpCnkjP1kIyDMcL5UOjML6gIjoqrjuwY=;
 b=Vqfqtqkv1E3gW1yiSS/DprjPL7RVAFYl7kkpoTzoZWKg5ylZLDoKndHqOqH1BMkwyMotK4
 Z3/hcqf4d1Mlv2tLi5qkMbb6iANvjgouh8a2WZGwc3rD/CM3OAMhww0529u17hYQzs0Gkt
 FaHB7HEsZZPzGp/7txIs8P7XtdBTsWM=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-FK_4WNIOPjmemsHd9vxOWw-1; Mon, 31 Jan 2022 11:16:26 -0500
X-MC-Unique: FK_4WNIOPjmemsHd9vxOWw-1
Received: by mail-oo1-f70.google.com with SMTP id
 f8-20020a4aa688000000b002ede70d37dbso4531057oom.16
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 08:16:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iJfsF5okITdGpCnkjP1kIyDMcL5UOjML6gIjoqrjuwY=;
 b=pNpIJHplRMk9Yi9Vjn03WDlo6YsMcS/RgxnyWac8Ji7Tsq7qexnmLELrcXMHeKPxKM
 Xj3QfVuZWbeALzURkZ0Erv7OV1Mra9Uy1lER9Kvu9+rkxwzktlKAoIpMHXqUAuycDPdl
 MIZSCLhJj/b3Nk5uGqVlarTAlHAWKgNbW1Byger7pzqDDZiMa3fSFRrij3SeqZ+iRbk1
 raITAjIPKgAOk2QAf2Ao5uL/5WORBy8n/98XNZaE4RxPVYnVMcxkAatTgfbO431ppETU
 9rGJ/87c3oES+1Wxkmp165LlKhQBsUO3G6/F2ozcZGl8/dUGxFHW1ItDo4TQKyi7vlBJ
 coxQ==
X-Gm-Message-State: AOAM530gw+IbzLUi6ikRAncsKx4XvNNdChaygh/MaTvJn4bzQnL6xmVW
 CvGoLb+p+EjEwhs0D3CsSszpnaJK6kqM3VOex/3v90x8ioHnuxtu66ty4X6s6KyYHGgq6R29lE3
 KPBiSKM2YNDy18Vc=
X-Received: by 2002:a4a:d44f:: with SMTP id p15mr10449773oos.6.1643645785692; 
 Mon, 31 Jan 2022 08:16:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4aSB3C74BrQokz+kkUn6ECO/u3Gch+o0XhnDbBUEIz8iMNvYn8GtuKH70tpw4HDiG1rOVwQ==
X-Received: by 2002:a4a:d44f:: with SMTP id p15mr10449748oos.6.1643645785446; 
 Mon, 31 Jan 2022 08:16:25 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id v26sm11662812ooq.20.2022.01.31.08.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 08:16:25 -0800 (PST)
Date: Mon, 31 Jan 2022 09:16:23 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Message-ID: <20220131091623.6739464e.alex.williamson@redhat.com>
In-Reply-To: <YfO00O4sT2UgaW31@stefanha-x1.localdomain>
References: <2971c1bec04acaac4eb3c1f2b104cbeabad01e22.1642626515.git.jag.raman@oracle.com>
 <20220119190742-mutt-send-email-mst@kernel.org>
 <1CACFB08-1BBC-4ECC-9C0B-6F377018D795@oracle.com>
 <YfBDqMuO/l/gWzL8@work-vm>
 <AE47B5D2-6515-4BD3-B541-23E5274174AC@oracle.com>
 <YfEYHBhrsdF9Edpp@stefanha-x1.localdomain>
 <YfGqCJeTD9bmkZx6@work-vm>
 <20220126161120-mutt-send-email-mst@kernel.org>
 <YfJYFbBVQzho7mGp@stefanha-x1.localdomain>
 <20220127142253.21ab0025.alex.williamson@redhat.com>
 <YfO00O4sT2UgaW31@stefanha-x1.localdomain>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Jag Raman <jag.raman@oracle.com>,
 Beraldo Leal <bleal@redhat.com>, John Johnson <john.g.johnson@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>, "Daniel
 P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 28 Jan 2022 09:18:08 +0000
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Thu, Jan 27, 2022 at 02:22:53PM -0700, Alex Williamson wrote:
> > If the goal here is to restrict DMA between devices, ie. peer-to-peer
> > (p2p), why are we trying to re-invent what an IOMMU already does?  
> 
> The issue Dave raised is that vfio-user servers run in separate
> processses from QEMU with shared memory access to RAM but no direct
> access to non-RAM MemoryRegions. The virtiofs DAX Window BAR is one
> example of a non-RAM MemoryRegion that can be the source/target of DMA
> requests.
> 
> I don't think IOMMUs solve this problem but luckily the vfio-user
> protocol already has messages that vfio-user servers can use as a
> fallback when DMA cannot be completed through the shared memory RAM
> accesses.
> 
> > In
> > fact, it seems like an IOMMU does this better in providing an IOVA
> > address space per BDF.  Is the dynamic mapping overhead too much?  What
> > physical hardware properties or specifications could we leverage to
> > restrict p2p mappings to a device?  Should it be governed by machine
> > type to provide consistency between devices?  Should each "isolated"
> > bus be in a separate root complex?  Thanks,  
> 
> There is a separate issue in this patch series regarding isolating the
> address space where BAR accesses are made (i.e. the global
> address_space_memory/io). When one process hosts multiple vfio-user
> server instances (e.g. a software-defined network switch with multiple
> ethernet devices) then each instance needs isolated memory and io address
> spaces so that vfio-user clients don't cause collisions when they map
> BARs to the same address.
> 
> I think the the separate root complex idea is a good solution. This
> patch series takes a different approach by adding the concept of
> isolated address spaces into hw/pci/.

This all still seems pretty sketchy, BARs cannot overlap within the
same vCPU address space, perhaps with the exception of when they're
being sized, but DMA should be disabled during sizing.

Devices within the same VM context with identical BARs would need to
operate in different address spaces.  For example a translation offset
in the vCPU address space would allow unique addressing to the devices,
perhaps using the translation offset bits to address a root complex and
masking those bits for downstream transactions.

In general, the device simply operates in an address space, ie. an
IOVA.  When a mapping is made within that address space, we perform a
translation as necessary to generate a guest physical address.  The
IOVA itself is only meaningful within the context of the address space,
there is no requirement or expectation for it to be globally unique.

If the vfio-user server is making some sort of requirement that IOVAs
are unique across all devices, that seems very, very wrong.  Thanks,

Alex


