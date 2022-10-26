Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2FA60EA14
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 22:14:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onmkj-0007RR-KL; Wed, 26 Oct 2022 16:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onmkW-0007Hr-Vx
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:11:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onmkT-0002RI-RZ
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:11:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666815096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GeIO3TvXxBNLJo8k9Zu03Bqp0yX7uTBWxx6wAWPOdts=;
 b=Cab4vb+JKMRBw270GzpGCO5dC7Bbv2jOZiLQco4b0rjii3GdzMttHDJKsZkslZ7lBnXacH
 RrOYym7RlrfOg9kUE7QCIl0FNz4mVM4iMC3FUURJSwhsYATQeeWxKw7NiVGtuvy+Wuzd9z
 LTVbTIEZmfWqlDcMnRonfy1DgH7DQv4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-589-3bC9CkNoOqqorIEM7umRdQ-1; Wed, 26 Oct 2022 16:11:34 -0400
X-MC-Unique: 3bC9CkNoOqqorIEM7umRdQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 u13-20020adfa18d000000b00236566b5b40so5983219wru.9
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 13:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GeIO3TvXxBNLJo8k9Zu03Bqp0yX7uTBWxx6wAWPOdts=;
 b=ZI9fSRksi/jQpvJsxyTWhRNaaK76AeCgqezIFFuF7kT8ksOMUGfnj+UKxunL/aEvtr
 XDcF1vlQ+tt6zvhDPAPVNdpDvVfkMqqJ7/YhjMDLUZcXpW4fWxk49bVHup75zfGiXYDF
 Me7ZImxXRpFq3exAphkthjOK6SMgK2CuDmCieX2DE8+TyvmovwYhhrH8lQOK+B2Kcv6T
 7c6HGfXvJKLySDrBoi1ybkLNUCveoixNC8rAv0kff5qG99UBdjELjg0dbprGeOngtA1A
 n/XNHkfXN6HTsC5X5aXqBP3QXaejTrbzzjMhxjlc9Kl33mTAST9c11AWT7HH1AKIhfqh
 85Pg==
X-Gm-Message-State: ACrzQf3Niv3sdKrRXaYloYVcfAka4c50ZvTbItb9WMMn9G8dO7lakLc9
 ADRGmUZu4WYVU42OBvYlWOy47mljuWhoexXwPsphv7uzSFypWhEUmvR9UFW9fPrzgR4lB0RMJ/c
 zipnfwUvhVg11Gho=
X-Received: by 2002:a05:600c:34d4:b0:3c6:f695:b5f8 with SMTP id
 d20-20020a05600c34d400b003c6f695b5f8mr3648430wmq.203.1666815093213; 
 Wed, 26 Oct 2022 13:11:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6CS8Tr7wOvHoo39iV9b5DoLqex6rQUxR4kFpq4RgwYrklE7Gvb+z7MHd0rpAaqpyYi+4ECHA==
X-Received: by 2002:a05:600c:34d4:b0:3c6:f695:b5f8 with SMTP id
 d20-20020a05600c34d400b003c6f695b5f8mr3648426wmq.203.1666815092998; 
 Wed, 26 Oct 2022 13:11:32 -0700 (PDT)
Received: from redhat.com ([2.52.15.7]) by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c304900b003cd9c26a0basm2474934wmh.40.2022.10.26.13.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:11:32 -0700 (PDT)
Date: Wed, 26 Oct 2022 16:11:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gregory Price <gregory.price@memverge.com>
Cc: Gregory Price <gourry.memverge@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
 "alison.schofield@intel.com" <alison.schofield@intel.com>,
 "dave@stgolabs.net" <dave@stgolabs.net>,
 "a.manzanares@samsung.com" <a.manzanares@samsung.com>,
 "bwidawsk@kernel.org" <bwidawsk@kernel.org>
Subject: Re: [PATCH 1/2] hw/cxl: set cxl-type3 device type to
 PCI_CLASS_MEMORY_CXL
Message-ID: <20221026161044-mutt-send-email-mst@kernel.org>
References: <20221006233702.18532-1-gregory.price@memverge.com>
 <20221026160545-mutt-send-email-mst@kernel.org>
 <BN6PR17MB312197C4CA958ED267BB576683309@BN6PR17MB3121.namprd17.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN6PR17MB312197C4CA958ED267BB576683309@BN6PR17MB3121.namprd17.prod.outlook.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

He does but in the end he sends patches not pull requests.
I don't care really as long as someone will send it up.


On Wed, Oct 26, 2022 at 08:09:45PM +0000, Gregory Price wrote:
> I believe this was dropped from my line because Jonathan carried a similar commit on his branch.
> 
> Happy to push it up again as a separate commit if that is what you want.
> 
> Noted for the future on upstreams
> 
> -----Original Message-----
> From: Michael S. Tsirkin <mst@redhat.com> 
> Sent: Wednesday, October 26, 2022 4:06 PM
> To: Gregory Price <gourry.memverge@gmail.com>
> Cc: qemu-devel@nongnu.org; jonathan.cameron@huawei.com; linux-cxl@vger.kernel.org; alison.schofield@intel.com; dave@stgolabs.net; a.manzanares@samsung.com; bwidawsk@kernel.org; Gregory Price <gregory.price@memverge.com>
> Subject: Re: [PATCH 1/2] hw/cxl: set cxl-type3 device type to PCI_CLASS_MEMORY_CXL
> 
> On Thu, Oct 06, 2022 at 07:37:01PM -0400, Gregory Price wrote:
> > Current code sets to STORAGE_EXPRESS and then overrides it.
> > 
> > Signed-off-by: Gregory Price <gregory.price@memverge.com>
> 
> If you expect me to merge it you need to CC me.
> Also, do we need this separately from the series?
> 
> > ---
> >  hw/mem/cxl_type3.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c index 
> > ada2108fac..1837c1c83a 100644
> > --- a/hw/mem/cxl_type3.c
> > +++ b/hw/mem/cxl_type3.c
> > @@ -146,7 +146,6 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
> >      }
> >  
> >      pci_config_set_prog_interface(pci_conf, 0x10);
> > -    pci_config_set_class(pci_conf, PCI_CLASS_MEMORY_CXL);
> >  
> >      pcie_endpoint_cap_init(pci_dev, 0x80);
> >      cxl_cstate->dvsec_offset = 0x100; @@ -335,7 +334,7 @@ static void 
> > ct3_class_init(ObjectClass *oc, void *data)
> >  
> >      pc->realize = ct3_realize;
> >      pc->exit = ct3_exit;
> > -    pc->class_id = PCI_CLASS_STORAGE_EXPRESS;
> > +    pc->class_id = PCI_CLASS_MEMORY_CXL;
> >      pc->vendor_id = PCI_VENDOR_ID_INTEL;
> >      pc->device_id = 0xd93; /* LVF for now */
> >      pc->revision = 1;
> > --
> > 2.37.3
> > 
> > 


