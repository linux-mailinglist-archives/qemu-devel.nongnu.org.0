Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A69A6457DD
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 11:30:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2rgS-0005pF-9z; Wed, 07 Dec 2022 05:29:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p2rgO-0005oq-Sg
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 05:29:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p2rgM-0001xb-LF
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 05:29:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670408981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dGsbFEnZDm4pvQLlnvOX9os8dqV9Iwrqp0K6vsDurYg=;
 b=cMCF4oKPJCAZ79gR6ldsI+yw7DmWISkDhshtPa9yaHiMPuJtm8r56pMw1wUdLZmnFWuVxA
 PXMDU5IiJavSfkyWyPbfBEYmTLVgOIqgPuvkKAmYN+MfxOo0IMWdEAsTopLVrz4bmAk3c7
 VDSuXx1scB7wAQiRLJWoytJMijVLQnM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-595-YZZL3yqzMBeVIRez_mzn1g-1; Wed, 07 Dec 2022 05:29:40 -0500
X-MC-Unique: YZZL3yqzMBeVIRez_mzn1g-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay19-20020a05600c1e1300b003cf758f1617so595285wmb.5
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 02:29:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dGsbFEnZDm4pvQLlnvOX9os8dqV9Iwrqp0K6vsDurYg=;
 b=I++RZs/f8reCpaVc06al/yTsoprqFf4AuSeY6h3CAX9ZxuJh3NDhNgTQV/nQGuQOX+
 oaCWT83Pd56AoafxWtdqEfZu2jKz+hWl4UNH+A52yt9KhqW1qA10xam3gMLLwc62bavG
 JcapSTYgDEn7bt3orVyCAsAJ7bdZjjgDJsLoGRoDtt+eOjbJn0Vr28LfTYLL7oVuPhd6
 839F1pA6yFDU3If3xaz6hSK+2Lpl6xWlFinJVGQePwhXiyjxI4eyuJoWmvZWeobA0ADL
 j01ZJwCa+0NJZuUFbqMXFADl9wBEaI2PlpoqmHMQbhYaUQYRkPLEyS0eE4c3/010pXL2
 6Z5w==
X-Gm-Message-State: ANoB5pnTF7N+NVN2tf3ybmLayfTIXedb1BeTBVQ9zgw8VD65eGv/MeIr
 TTxneG/g8z1BCTYVTvWngH9cEuQFZxe69xOqaoUyTzWDO/aeMnMpnaTXRj69rzTlcLbRXiKEiB6
 Wki3B3Y5YrQI1VBw=
X-Received: by 2002:adf:fcc8:0:b0:242:453f:fd14 with SMTP id
 f8-20020adffcc8000000b00242453ffd14mr13256049wrs.468.1670408979045; 
 Wed, 07 Dec 2022 02:29:39 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4XfxRR9rasglAJzyNLcy+lELl11xTq1fj3BGhiOfS0Rtrx216tWDjEohi+/5VKwN4Mo1xUDA==
X-Received: by 2002:adf:fcc8:0:b0:242:453f:fd14 with SMTP id
 f8-20020adffcc8000000b00242453ffd14mr13256035wrs.468.1670408978749; 
 Wed, 07 Dec 2022 02:29:38 -0800 (PST)
Received: from redhat.com ([2.52.154.114]) by smtp.gmail.com with ESMTPSA id
 l42-20020a05600c1d2a00b003b4a699ce8esm1433923wms.6.2022.12.07.02.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 02:29:38 -0800 (PST)
Date: Wed, 7 Dec 2022 05:29:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel@redhat.com>
Subject: Re: How to best make include/hw/pci/pcie_sriov.h self-contained
Message-ID: <20221207052308-mutt-send-email-mst@kernel.org>
References: <87bkofivbm.fsf@pond.sub.org>
 <1184b1ab-c38a-b38b-b08c-637bc6b23bb5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1184b1ab-c38a-b38b-b08c-637bc6b23bb5@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Wed, Dec 07, 2022 at 10:02:53AM +0100, Philippe Mathieu-Daudé wrote:
> On 7/12/22 07:25, Markus Armbruster wrote:
> > pcie_sriov.h needs PCI_NUM_REGIONS from pci.h, but doesn't include it.
> > pci.h must be included before pcie_sriov.h or else compile fails.
> > 
> > Adding #include "pci/pci.h" to pcie_sriov would be wrong, because it
> > would close an inclusion loop: pci.h includes pcie.h (for
> > PCIExpressDevice) includes pcie_sriov.h (for PCIESriovPF) includes pci.h
> > (for PCI_NUM_REGIONS).
> > 
> > The obvious solution is to move PCI_NUM_REGIONS pci.h somewhere
> > pcie_sriov.h can include without creating a loop.
> > 
> > We already have a few headers that don't include anything: pci_ids.h,
> > pci_regs.h (includes include/standard-headers/linux/pci_regs.h, which
> > doesn't count), pcie_regs.h.  Moving PCI_NUM_REGIONS to one of these
> > would work, but it doesn't feel right.
> > 
> > We could create a new one, say pci_defs.h.  Just for PCI_NUM_REGIONS
> > feels silly.  So, what else should move there?
> 
> Sounds good to me. Eventually name it pci_standard_defs.h?

standard is not a good name for PCI_NUM_REGIONS. It falls out of
how QEMU represents things not directly out of the standard.
QEMU supports up to 6 BAR registers + 1 expansion ROM.
That's where the number comes from.
Same with PCI_ROM_SLOT - that's a QEMU convention.



> We can move the first 100 lines of pci.h there, PCI_ROM_SLOT,
> PCI_NUM_REGIONS, PCI HEADER_TYPE, PCI_NUM_PINS, cap_present, and eventually
> PCIINTxRoute & PCIReqIDType.

It's a good point that PCI_ROM_SLOT should live with PCI_NUM_REGIONS.

> > 
> > Any other ideas?
> > 
> > In case you wonder why I bother you with this...
> > 
> > Back in 2016, we discussed[1] rules for headers, and these were
> > generally liked:
> > 
> > 1. Have a carefully curated header that's included everywhere first.  We
> >     got that already thanks to Peter: osdep.h.
> > 
> > 2. Headers should normally include everything they need beyond osdep.h.
> >     If exceptions are needed for some reason, they must be documented in
> >     the header.  If all that's needed from a header is typedefs, put
> >     those into qemu/typedefs.h instead of including the header.
> > 
> > 3. Cyclic inclusion is forbidden.
> > 
> > I'm working on patches to get include/ closer to obeying 2.
> > 
> > [1] Message-ID: <87h9g8j57d.fsf@blackfin.pond.sub.org>
> >      https://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg03345.html
> > 
> > 


