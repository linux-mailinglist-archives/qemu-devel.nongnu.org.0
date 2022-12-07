Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 386F7645773
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 11:20:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2rW5-0002e2-Jg; Wed, 07 Dec 2022 05:19:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p2rVt-0002ai-RX
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 05:18:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p2rVq-0006ry-Fd
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 05:18:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670408328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CpmrH9oOHkUsCxjQ9JkK8nzhc7IT61unniHcTbE7Dg0=;
 b=QtctpM8zgckXEcrRXolVH+aG6mazNDGYRC3B6N3Gl2y5SKYqa5/V6/lJb6P5oTnVZY8qNR
 +xR4X8JtcBY8wzMWn2WXceY0MGD/XT+XK+R87ZAGar7S35soL5LzhjMXtCs/kX46ewQxBY
 5Ffxo2tGEk/EMHSQF5wRbCiWdJBw390=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-532-sTeWC1rFMpKMkp3FHXcHOw-1; Wed, 07 Dec 2022 05:18:46 -0500
X-MC-Unique: sTeWC1rFMpKMkp3FHXcHOw-1
Received: by mail-wm1-f69.google.com with SMTP id
 bi19-20020a05600c3d9300b003cf9d6c4016so576327wmb.8
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 02:18:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CpmrH9oOHkUsCxjQ9JkK8nzhc7IT61unniHcTbE7Dg0=;
 b=y0eit8KW2FC+EjKN3AMXHwJXBAoCvd75dM1OsYJT/KZzRuZPYHuNKOnPQZB5eiWHn4
 xLNobsSjuUoKezfnb9X4EYEidYJagDVXrGwvXc/7pvGyl+gflxdtPawPSLBrrCow5hCo
 B1mbhqcJ4057xeYUukj7OERvJNfiTjoKG4ctd5EtWa5ujF+kjAi27AGZvvjn+Ef5uh8e
 Zq24y8JYPoInB7oI6WfJMA+q7jVmXvVkEcP+wZ9s4RDUZmYtsANYARWsLUVAgPMHiGEG
 zIoU3NrUyE2ZgE+GqniWVU0E3W/knd10GTY++HaauzOVBJA9JyBMEFMmdl8pcb1y+b/x
 bhVw==
X-Gm-Message-State: ANoB5pltrVH0xLEMWkL+lNJDXS6/MMhODH9jE/cb8tadKRpp7l1DhS/8
 VVfvjS104PS3iQcUpKuK45LURgTwoOPhw9pzKsnoxlT4XFfSJmPqNa4lR+ZxtqgNIv9ja3c5nHp
 oZ+eeeAMH/2QYMZU=
X-Received: by 2002:a5d:4601:0:b0:241:bf7b:b2e5 with SMTP id
 t1-20020a5d4601000000b00241bf7bb2e5mr51961391wrq.626.1670408325458; 
 Wed, 07 Dec 2022 02:18:45 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7iiMiG8UYTJ7g3vDpZykl/WQ7wKHlwa9yOaCgWPDWof+uiDznKXhVAjnbJSMMqhrMxaUAL1w==
X-Received: by 2002:a5d:4601:0:b0:241:bf7b:b2e5 with SMTP id
 t1-20020a5d4601000000b00241bf7bb2e5mr51961375wrq.626.1670408325193; 
 Wed, 07 Dec 2022 02:18:45 -0800 (PST)
Received: from redhat.com ([2.52.154.114]) by smtp.gmail.com with ESMTPSA id
 ay5-20020a05600c1e0500b003c21ba7d7d6sm1179872wmb.44.2022.12.07.02.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 02:18:44 -0800 (PST)
Date: Wed, 7 Dec 2022 05:18:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>
Subject: Re: How to best make include/hw/pci/pcie_sriov.h self-contained
Message-ID: <20221207020305-mutt-send-email-mst@kernel.org>
References: <87bkofivbm.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bkofivbm.fsf@pond.sub.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Wed, Dec 07, 2022 at 07:25:49AM +0100, Markus Armbruster wrote:
> pcie_sriov.h needs PCI_NUM_REGIONS from pci.h, but doesn't include it.
> pci.h must be included before pcie_sriov.h or else compile fails.
> 
> Adding #include "pci/pci.h" to pcie_sriov would be wrong, because it
> would close an inclusion loop: pci.h includes pcie.h (for
> PCIExpressDevice) includes pcie_sriov.h (for PCIESriovPF) includes pci.h
> (for PCI_NUM_REGIONS).
> 
> The obvious solution is to move PCI_NUM_REGIONS pci.h somewhere
> pcie_sriov.h can include without creating a loop.
> 
> We already have a few headers that don't include anything: pci_ids.h,
> pci_regs.h (includes include/standard-headers/linux/pci_regs.h, which
> doesn't count), pcie_regs.h.  Moving PCI_NUM_REGIONS to one of these
> would work, but it doesn't feel right.
> 
> We could create a new one, say pci_defs.h.  Just for PCI_NUM_REGIONS
> feels silly.  So, what else should move there?

I'm ok with pci_defs.h
However, I note that most headers including pci.h don't really
need it. Consider include/hw/virtio/virtio-iommu.h all it needs is
PCIBus typedef this is available from qemu/typedefs.h
So if you are poking at this, want to clean that area up generally?

> Any other ideas?
> 
> In case you wonder why I bother you with this...
> 
> Back in 2016, we discussed[1] rules for headers, and these were
> generally liked:
> 
> 1. Have a carefully curated header that's included everywhere first.  We
>    got that already thanks to Peter: osdep.h.
> 
> 2. Headers should normally include everything they need beyond osdep.h.
>    If exceptions are needed for some reason, they must be documented in
>    the header.  If all that's needed from a header is typedefs, put
>    those into qemu/typedefs.h instead of including the header.
> 
> 3. Cyclic inclusion is forbidden.
> 
> I'm working on patches to get include/ closer to obeying 2.
> 
> [1] Message-ID: <87h9g8j57d.fsf@blackfin.pond.sub.org>
>     https://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg03345.html


