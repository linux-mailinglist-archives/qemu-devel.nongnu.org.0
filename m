Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F844ECA59
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 19:14:19 +0200 (CEST)
Received: from localhost ([::1]:43372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZbtj-0006kH-03
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 13:14:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZbsd-0005kj-HQ
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 13:13:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZbsa-0004Yh-Fg
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 13:13:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648660387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=atmD6INaNepSjRwGDrj7z7GXK7PzqtJINZVZtxNiiSo=;
 b=Olu8FU/TUogM9OvlVrrSksFn2xneRUSHbX1CE2xLcPQ5i0jJb4q2PD/r/KQZsoESpC1kKJ
 B8iaBHcpPmwCdPsJlMywkqLT3QG+M3w1DPS1z4oAX3TWg+E2Aj82GOQ9QBLR7Q5klP8eL1
 Q9P+jNloXLAtqi02TRw2zl4k2Gjx2GU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-NfG_90OTPfu7PYIFihyHpA-1; Wed, 30 Mar 2022 13:13:05 -0400
X-MC-Unique: NfG_90OTPfu7PYIFihyHpA-1
Received: by mail-qv1-f71.google.com with SMTP id
 q4-20020a0cf5c4000000b0044346ee3627so8373776qvm.16
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 10:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=atmD6INaNepSjRwGDrj7z7GXK7PzqtJINZVZtxNiiSo=;
 b=k11ooSqZ+jwxDV5//evi5ajW7lgFydpo29PBr3nHiwGA4HPfZY/GMzcWtxC7reIEeN
 hYxJ+2iQIRueZHsdk4bJAOklMBDQe2iXXXBLkA+RJaSUQNU4y4lOYMvcMrqrugN7eNE3
 0ZZ74Dc7f7u9LHk6CG9eB+p8HWXomxpvwplLa0N66XJ5Z5G4LkS0R0SQBJ2x4NpKu/CK
 MBM2m0GX76dRIQ1P0nZvRNXDF5GlXm5mWqXM/svSkDIZwSptc0q29APKqrZ2MBWOBNLZ
 E1jE6Bzz5OX+Td2uGCO6vKeI+D30t6wIrN3Od2Whu9F4w3smJRzkduCS7U3mfu1RZmOC
 D2sA==
X-Gm-Message-State: AOAM532voKP4XosLHLpRH/LLlNlbpyvtNABRJN3aZbtozPD2Hhq3uhjn
 YnkIRch8BtbrsheacWNpFqyBusn9SPyI/GsTYsNDNJKICEvCG3tR8lC/3VD8GfaBqQaMLNwjutm
 O+RAYP2nUf0y/g3Q=
X-Received: by 2002:a05:622a:1742:b0:2e1:ecf4:900c with SMTP id
 l2-20020a05622a174200b002e1ecf4900cmr491220qtk.473.1648660385259; 
 Wed, 30 Mar 2022 10:13:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxirauhqDDiZbRf6bZi3KFm/nncrcCk1n+7rkXq1bW/cmAimQdtyyggimcpj7rnO8jyaEwl7A==
X-Received: by 2002:a05:622a:1742:b0:2e1:ecf4:900c with SMTP id
 l2-20020a05622a174200b002e1ecf4900cmr491181qtk.473.1648660384984; 
 Wed, 30 Mar 2022 10:13:04 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 x18-20020a05622a001200b002eb856d7786sm6527953qtw.84.2022.03.30.10.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 10:13:04 -0700 (PDT)
Date: Wed, 30 Mar 2022 13:13:03 -0400
From: Peter Xu <peterx@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v7 12/17] vfio-user: IOMMU support for remote device
Message-ID: <YkSPnw2Z+980+dhF@xz-m1.local>
References: <cover.1648234157.git.jag.raman@oracle.com>
 <2fdb90acd40a1f79d571d4e68c56e6b08aded60d.1648234157.git.jag.raman@oracle.com>
 <YkL9C+oMUSav9y95@stefanha-x1.localdomain>
 <AC3FD7EB-773E-4684-9A86-176EDDAC135D@oracle.com>
 <YkMcJDFVFu/fW/a5@stefanha-x1.localdomain>
 <7022E4C4-D71A-4A6E-A5D8-222A9462654C@oracle.com>
 <YkQrKI0Az/k8Hc8g@stefanha-x1.localdomain>
 <YkRSvDscyY+c+9yM@xz-m1.local>
 <YkSAeJTGAdYkYC09@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YkSAeJTGAdYkYC09@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>, Jag Raman <jag.raman@oracle.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "quintela@redhat.com" <quintela@redhat.com>,
 "f4bug@amsat.org" <f4bug@amsat.org>, qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 30, 2022 at 05:08:24PM +0100, Stefan Hajnoczi wrote:
> On Wed, Mar 30, 2022 at 08:53:16AM -0400, Peter Xu wrote:
> > On Wed, Mar 30, 2022 at 11:04:24AM +0100, Stefan Hajnoczi wrote:
> > > This makes me wonder whether there is a deeper issue with the
> > > pci_setup_iommu() API: the lack of per-device cleanup callbacks.
> > > Per-device IOMMU resources should be freed when a device is hot
> > > unplugged.
> > > 
> > > From what I can tell this is not the case today:
> > > 
> > > - hw/i386/intel_iommu.c:vtd_find_add_as() allocates and adds device
> > >   address spaces but I can't find where they are removed and freed.
> > >   VTDAddressSpace instances pointed to from vtd_bus->dev_as[] are leaked.
> > > 
> > > - hw/i386/amd_iommu.c has similar leaks.
> > 
> > AFAICT it's because there's no device-specific data cached in the
> > per-device IOMMU address space, at least so far.  IOW, all the data
> > structures allocated here can be re-used when a new device is plugged in
> > after the old device unplugged.
> > 
> > It's definitely not ideal since after unplug (and before a new device
> > plugged in) the resource is not needed at all so it's kind of wasted, but
> > it should work functionally.  If to achieve that, some iommu_unplug() or
> > iommu_cleanup() hook sounds reasonable.
> 
> I guess the question is whether PCI busses can be hotplugged with
> IOMMUs. If yes, then there is a memory leak that matters for
> intel_iommu.c and amd_iommu.c.

It can't, and we only support one vIOMMU so far for both (commit
1b3bf13890fd849b26).  Thanks,

-- 
Peter Xu


