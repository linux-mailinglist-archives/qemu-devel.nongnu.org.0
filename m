Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBB96726EF
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 19:30:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIDAx-0001Mk-Vr; Wed, 18 Jan 2023 13:28:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pIDAu-0001D3-Mo
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 13:28:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pIDAs-00036r-Os
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 13:28:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674066517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f9KS7R1x10CMzAxJaOTFUeOc5S6HXKD2Ro1VbHy0e5g=;
 b=M7kiU9y+3HkmlN4ofdHEiR6Zut8rP8/vAFxr69ok9/b42+M6Rq5qj2K1sRMGYlLcBFDbEc
 vc79Zx834r9AI//FzAV+WE/ynLnYTarLZBTi1Aaon3dtPRMR7eLeDiI2YG6RHDnn8zWhvD
 WBsYoKOjWPndb4yeOvxXncSdW+HnNCM=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-240-suyM2XXpPrygNV_MGcumsw-1; Wed, 18 Jan 2023 13:28:36 -0500
X-MC-Unique: suyM2XXpPrygNV_MGcumsw-1
Received: by mail-io1-f70.google.com with SMTP id
 b21-20020a5d8d95000000b006fa39fbb94eso21609912ioj.17
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 10:28:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f9KS7R1x10CMzAxJaOTFUeOc5S6HXKD2Ro1VbHy0e5g=;
 b=TnsONHhtPxlI1PJxpdzuXjPxQGi6cHqcLVx7KGJLDn62U6PnZxwzLd6QBCe/9ELkO6
 oWHwqPzlLBwReV2RkPdAKbjXfMOdNMMSHtha/Kl//DRkmNp2QgNJgXV/7lAW92a2AsVD
 ks28gxVjgD/maCuBVt2356olJ2mgdal2qrVvFc0oF1BTd5i92E/SqcaDjvf25b7gXDSM
 RABesusZLyJk0pu+N+Z4G63hMmWQNxmokHrfuwC8cAmv6uvlq4qKVez4v+F74z0G7tSH
 Bv5DIaJud1gxFt/u2fgZcxomVPis8pcrXJAZadwYRK+lYPs/g/IHt/mnOWA7w9uciU93
 1Gtg==
X-Gm-Message-State: AFqh2kqu70Iajs0BKmbykMDTiJjhXmMN1CStWWp4FVBosOpqxVZRSCWz
 3b8PRD5Q6wZYsSA9r4Xbrxn91km6gKlQW4RHcvisn8v5ONwz5qUvP/kdUIFiyKGxFUCnFlE8i2a
 pXJtpAPyWxCs/2JY=
X-Received: by 2002:a05:6e02:de6:b0:30e:f36a:f24e with SMTP id
 m6-20020a056e020de600b0030ef36af24emr5296578ilj.11.1674066515608; 
 Wed, 18 Jan 2023 10:28:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuLj62tOElyy7B+s2iODwkulqqWPQ89Wpy8Dzudo+HzYaNYmuYhGjXqF05r6KImfvJ5DomDlg==
X-Received: by 2002:a05:6e02:de6:b0:30e:f36a:f24e with SMTP id
 m6-20020a056e020de600b0030ef36af24emr5296565ilj.11.1674066515358; 
 Wed, 18 Jan 2023 10:28:35 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 r27-20020a02aa1b000000b00346a98b0a76sm10398396jam.77.2023.01.18.10.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 10:28:33 -0800 (PST)
Date: Wed, 18 Jan 2023 11:28:32 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: Eric Auger <eauger@redhat.com>, qemu list <qemu-devel@nongnu.org>, Peter
 Xu <peterx@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Subject: Re: virtio-iommu issue with VFIO device downstream to a PCIe-to-PCI
 bridge: VFIO devices are not assigned any iommu group
Message-ID: <20230118112832.261d6bea.alex.williamson@redhat.com>
In-Reply-To: <Y8g0YQ4NylOUzeUW@myrica>
References: <0bc2f2e5-630e-e721-254d-f224d1a3bdcd@redhat.com>
 <0eb96eb5-703d-dacd-49ff-f61e02d98eb9@redhat.com>
 <Y8FQ9li7gQ+bPiRe@myrica>
 <20230113105700.2d860fbe.alex.williamson@redhat.com>
 <Y8g0YQ4NylOUzeUW@myrica>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
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

On Wed, 18 Jan 2023 18:03:13 +0000
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> On Fri, Jan 13, 2023 at 10:57:00AM -0700, Alex Williamson wrote:
> > On Fri, 13 Jan 2023 12:39:18 +0000
> > Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:
> >   
> > > Hi,
> > > 
> > > On Mon, Jan 09, 2023 at 10:11:19PM +0100, Eric Auger wrote:  
> > > > > Jean, do you have any idea about how to fix that? Do you think we have a
> > > > > trouble in the acpi/viot setup or virtio-iommu probe sequence. It looks
> > > > > like virtio probe and attach commands are called too early, before the
> > > > > bus is actually correctly numbered.    
> > > > 
> > > > So after further investigations looks this is not a problem of bus
> > > > number, which is good at the time of the virtio cmd calls but rather a
> > > > problem related to the devfn (0 was used when creating the IOMMU MR)
> > > > whereas the virtio-iommu cmds looks for the non aliased devfn. With that
> > > > fixed, the probe and attach at least succeeds. The device still does not
> > > > work for me but I will continue my investigations and send a tentative fix.    
> > > 
> > > If I remember correctly VIOT can deal with bus numbers because bridges are
> > > assigned a range by QEMU, but I haven't tested that in detail, and I don't
> > > know how it holds with conventional PCI bridges.  
> > 
> > In my reading of the virtio-iommu spec,  
> 
> Hm, is that the virtio-iommu spec or ACPI VIOT/device tree spec?
> The virtio-iommu spec shouldn't refer to PCI buses at the moment. The
> intent is that for PCI, the "endpoint ID" passed in an ATTACH request
> corresponds to PCI segment and RID of PCI devices at the time of the
> request (so after the OS renumbered the buses). If you found something in
> the spec that contradicts this, it should be fixed. Note that "endpoint"
> is a misnomer, it can refer to PCI bridges as well, anything that can
> issue DMA transactions.

Sorry, the ACPI spec defining the VIOT table[1]:

	Each node identifies one or more devices using either their PCI
	Handle or their base MMIO (Memory-Mapped I/O) address. A PCI
	Handle is a PCI Segment number and a BDF (Bus-Device-Function)
	with the following layout:

	* Bits 15:8 Bus Number

	* Bits 7:3 Device Number

	* Bits 2:0 Function Number

	This identifier corresponds to the one observed by the
	operating system when parsing the PCI configuration space for
	the first time after boot.

> > I noted that it specifies the
> > bus numbers *at the time of OS handoff*, so it essentially washes its
> > hands of the OS renumbering buses while leaving subtle dependencies on
> > initial numbering in the guest and QEMU implementations.  
> 
> Yes we needed to describe in the firmware tables (device-tree and ACPI
> VIOT) which devices the IOMMU manages. And at the time we generate the
> tables, if we want to refer to PCI devices behind bridges, we can either
> use catch-all ranges for any possible bus numbers they will get, or
> initialize bus numbers in bridges and pass those to the OS.
> 
> But that's only to communicate the IOMMU topology to the OS, because we
> couldn't come up with anything better. After it sets up PCI the OS should
> be able to use its own configuration of the PCI topology in virtio-iommu
> requests.

The VT-d spec[2](8.3.1) has a more elegant solution using a path
described in a device scope, based on a root bus number (not
susceptible to OS renumbering) and a sequence of devfns to uniquely
describe a hierarchy or endpoint, invariant of OS bus renumbering.
Thanks,

Alex

[1]https://uefi.org/specs/ACPI/6.5/05_ACPI_Software_Programming_Model.html#virtual-i-o-translation-viot-table-header
[2]https://cdrdv2-public.intel.com/671081/vt-directed-io-spec.pdf


