Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79B46F4F5C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 06:10:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu3nh-0003lI-PB; Wed, 03 May 2023 00:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pu3nf-0003l9-HI
 for qemu-devel@nongnu.org; Wed, 03 May 2023 00:09:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pu3nc-0004Zk-LG
 for qemu-devel@nongnu.org; Wed, 03 May 2023 00:09:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683086943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vxtat5E1cmWDKn9E8KGMqHg01f2qTA63YmplyYX0+W0=;
 b=UUdIZ1z7cSoenH8/2b8F01z9nus8nbtCP3s2/1FZp1LNn/zb5fStL3bJgptCyBQdUP85iC
 nZqKt5ctAm0VVpKIqg9X78odoo/vkFlGgCs3QjFAcCyTVHTglC6RaDwfSwEcPmcp7WEs4e
 L0M/6TXYcN0aegqMT/3MR7Inm1Y+x8w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-6zqUKa38PIy6A5yKEguqUQ-1; Wed, 03 May 2023 00:09:01 -0400
X-MC-Unique: 6zqUKa38PIy6A5yKEguqUQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-301110f1756so1376598f8f.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 21:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683086940; x=1685678940;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vxtat5E1cmWDKn9E8KGMqHg01f2qTA63YmplyYX0+W0=;
 b=AJwz+n/WxNeht7CCOgUjgzabfP8e3XTJFf+9heu8CUXuqsRILejV20sf+3x6jyPPVA
 ZY3Ok8pIfvRPOizYeLNwEfdwHT4j9ZdxCisb/PG+0C9iHu7DsED18GIpjNd94pNBfQ1p
 MCTRytFQPvPijGue5KK3mdoN8XFmZ1TsWvywe70gPdJeM0wDDunvuLk0qNk7mKPr07KJ
 rjqTpdHP0fuyw6nv0I0dP/LZw5D4cml8f/c6hL1yeR6yhbfCJ4rAieuTDZGTbsb/j2ys
 brYUqnSdsC9oHJO29Hxb4+UvedeYZd8aLVANgR0J/0O63uRdjt+QYTNosZ9DzjjvmQiT
 gTBA==
X-Gm-Message-State: AC+VfDwq+I50Vw4z0yohkt3Ow97S90JjiWJ3cApxkaAsAhXqhApNEmKq
 S6C4KV5sRxzJLxPtdIb06GF6fTHAdNhlKSI9H2s8ThesBjqzCc1HGYW/jncDc4e4+L+o41Voa8P
 UFw7VhxA5MZoRffA=
X-Received: by 2002:a05:6000:10a:b0:2ef:baa1:f3fc with SMTP id
 o10-20020a056000010a00b002efbaa1f3fcmr11790566wrx.19.1683086940046; 
 Tue, 02 May 2023 21:09:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Oi9nn84A+FGVFtCakPjd0amcWoaaxMCmtYRuPCE3f2wMKSQk3iAif7FCuOMy085AtwcviYw==
X-Received: by 2002:a05:6000:10a:b0:2ef:baa1:f3fc with SMTP id
 o10-20020a056000010a00b002efbaa1f3fcmr11790554wrx.19.1683086939646; 
 Tue, 02 May 2023 21:08:59 -0700 (PDT)
Received: from redhat.com ([2.52.10.43]) by smtp.gmail.com with ESMTPSA id
 p1-20020a05600c204100b003f0a6a1f969sm504254wmg.46.2023.05.02.21.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 21:08:58 -0700 (PDT)
Date: Wed, 3 May 2023 00:08:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Leonardo =?iso-8859-1?Q?Br=E1s?= <leobras@redhat.com>
Cc: quintela@redhat.com, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>, Fan Ni <fan.ni@samsung.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: Re: [PULL 61/73] hw/pci/aer: Implement PCI_ERR_UNCOR_MASK register
Message-ID: <20230503000825-mutt-send-email-mst@kernel.org>
References: <cover.1678237635.git.mst@redhat.com>
 <010746ae1db7f52700cb2e2c46eb94f299cfa0d2.1678237635.git.mst@redhat.com>
 <ZEhzaWpNM+NvZCUw@x1n>
 <20230426021019-mutt-send-email-mst@kernel.org>
 <875y9jglfr.fsf@secure.mitica>
 <109bc1e721e009894bf4b1529fe1904afce1e13e.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <109bc1e721e009894bf4b1529fe1904afce1e13e.camel@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, May 02, 2023 at 09:32:34PM -0300, Leonardo Brás wrote:
> Hello Michael, Juan, Peter,
> 
> On Wed, 2023-04-26 at 09:19 +0200, Juan Quintela wrote:
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > On Tue, Apr 25, 2023 at 08:42:17PM -0400, Peter Xu wrote:
> > > > Hi, Michael, Jonathan,
> > > > 
> > > > On Tue, Mar 07, 2023 at 08:13:53PM -0500, Michael S. Tsirkin wrote:
> > > > This breaks the simplest migration from QEMU 8.0->7.2 binaries on all
> > > > machine types I think as long as the cap is present, e.g. the default
> > > > e1000e provided by the default q35 machine can already hit it with all
> > > > default cmdline:
> > > > 
> > > >   ./qemu-system-x86_64 -M pc-q35-7.2 [-incoming XXX]
> > > > 
> > > > 7.2 binary will have empty wmask for PCI_ERR_UNCOR_MASK, meanwhile I think
> > > > it can also see a non-zero value, then the migration will fail at:
> > > > 
> > > > vmstate_load 0000:00:02.0/e1000e, e1000e                                                   
> > > > qemu-7.2: get_pci_config_device: Bad config data: i=0x10a read: 40 device: 0 cmask: ff wmask: 0 w1cmask:0
> > > > qemu-7.2: Failed to load PCIDevice:config   
> > > > qemu-7.2: Failed to load e1000e:parent_obj                                                
> > > > qemu-7.2: error while loading state for instance 0x0 of device '0000:00:02.0/e1000e'      
> > > > qemu-7.2: load of migration failed: Invalid argument
> > > > 
> > > > We probably at least want to have the default value to be still zero, and
> > > > we'd need to make sure it'll not be modified by the guest, iiuc.
> > > > 
> > > > Below oneliner works for me and makes the migration work again:
> > > > 
> > > > ===8<===
> > > > diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
> > > > index 103667c368..563a37b79c 100644
> > > > --- a/hw/pci/pcie_aer.c
> > > > +++ b/hw/pci/pcie_aer.c
> > > > @@ -113,7 +113,7 @@ int pcie_aer_init(PCIDevice *dev, uint8_t cap_ver, uint16_t offset,
> > > >      pci_set_long(dev->w1cmask + offset + PCI_ERR_UNCOR_STATUS,
> > > >                   PCI_ERR_UNC_SUPPORTED);
> > > >      pci_set_long(dev->config + offset + PCI_ERR_UNCOR_MASK,
> > > > -                 PCI_ERR_UNC_MASK_DEFAULT);
> > > > +                 0/*PCI_ERR_UNC_MASK_DEFAULT*/);
> > > >      pci_set_long(dev->wmask + offset + PCI_ERR_UNCOR_MASK,
> > > >                   PCI_ERR_UNC_SUPPORTED);
> > > > ===8<===
> > > > 
> > > > Anyone could have a look on a solid solution from PCI side?
> > > > 
> > > > Copy Juan and Leonardo.
> > > > 
> > > > Thanks,
> > > 
> > > My bad, I forgot about this 🤦.
> > > So we need a property and tweak it with compat machinery depending on
> > > machine type. Jonathan, can you work on this pls?
> > > Or I can revert for now to relieve the time pressure,
> > > redo the patch at your leasure.
> > 
> > I agree with Michael here, the best option is adding a new property.
> > 
> > Later, Juan.
> > 
> 
> I sent a patch implementing the suggested fix:
> https://lore.kernel.org/qemu-devel/20230503002701.854329-1-leobras@redhat.com/T/#u
> 
> Please let me know of anything to improve.
> 
> Best regards,
> Leo

Weird, didn't get it for some reason. Pulled it from lore now, thanks!

-- 
MST


