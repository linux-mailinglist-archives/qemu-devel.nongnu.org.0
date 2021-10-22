Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E682E4373E7
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 10:48:09 +0200 (CEST)
Received: from localhost ([::1]:38520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdqDh-0007nT-31
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 04:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mdq9e-0003tK-Mj
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 04:44:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mdq9a-0003KH-Vv
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 04:43:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634892233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k6Arl1tXr9qKaVkSU0ANwZ0Muxyyy/sff2JeE3Ue/Uc=;
 b=EPAUtG/hFRuKQa/F6wgOqEes+HOmowL1tB5WIJ15D+s987xNqG4YCsbqgx5xQawj0q5Sb+
 I9yGWu+7lpVro/DuK114GR/Qg1HdsiUx9cteCd7hqYiNCObRJcK888ptFmMC/VMJAqAh5Y
 wk0oAAhoGNFkcKmnFnxJxhK3YvbWSg8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-9lSiI6wpMP6LKNFYG3IU0A-1; Fri, 22 Oct 2021 04:43:51 -0400
X-MC-Unique: 9lSiI6wpMP6LKNFYG3IU0A-1
Received: by mail-wr1-f72.google.com with SMTP id
 y12-20020a056000168c00b00160da4de2c7so743165wrd.5
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 01:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=k6Arl1tXr9qKaVkSU0ANwZ0Muxyyy/sff2JeE3Ue/Uc=;
 b=jlwJpVD/5/zEI4/JgXbsc5aVs58WWmA8QHqKSk1ofurPPPdSGCPNUvBn+MPFSRKyBi
 FRMQyegw2+obPd5yRp7FxwyYv3zjxTZTag544RtZB3/qX8vFSBe2i+fSzalk1lsF9mF4
 7FLaPMyTMkx+8jGy2qo9jssUyOQ7mUoIsI9pGhliHwRAWll596yNTFgxQo5y6Jhm8gkq
 skg31PrhoSoeZwFh/tGGlrFQhrnbmNtwME8mkGAahWqRBEDIOfMPWkOZjFIXm3XJGqcf
 Bo4AHSfgFM92dZm7TgYNJJ6OsheuyidrfsPM/xAKmNAguzrt/YLBlkpFIf4X9BlnAxon
 ixgQ==
X-Gm-Message-State: AOAM530YjPQtoB+kSvsyNAvrt567k3x+0xp+YRTjGSKxRdSLKy4DvR2Q
 yJQxGKuIzCLWELUM1FdHn4+g87mF/m5YR5L0FLTeFZfyKMgVeEO5SRcOPWemzSjJeILnHprLn3o
 mnvn+QFbFicRoI+s=
X-Received: by 2002:a5d:504b:: with SMTP id h11mr14775892wrt.109.1634892230684; 
 Fri, 22 Oct 2021 01:43:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJzyf8gcooYLcvejoN4IWxX5UpK6IFsDvPz71Wa1LuaXuYaTX9sbA1OVJGF22DKbh2QLhLHg==
X-Received: by 2002:a5d:504b:: with SMTP id h11mr14775863wrt.109.1634892230494; 
 Fri, 22 Oct 2021 01:43:50 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id u13sm7625076wri.50.2021.10.22.01.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 01:43:49 -0700 (PDT)
Date: Fri, 22 Oct 2021 04:43:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 7/8] pci: Add pci_for_each_device_all()
Message-ID: <20211022042642-mutt-send-email-mst@kernel.org>
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-8-peterx@redhat.com>
 <20211021064948-mutt-send-email-mst@kernel.org>
 <YXIi65J4XiVcdYeZ@xz-m1.local>
MIME-Version: 1.0
In-Reply-To: <YXIi65J4XiVcdYeZ@xz-m1.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 22, 2021 at 10:33:15AM +0800, Peter Xu wrote:
> Hi, Michael,
> 
> On Thu, Oct 21, 2021 at 06:54:59AM -0400, Michael S. Tsirkin wrote:
> > > +typedef struct {
> > > +    pci_bus_dev_fn fn;
> > > +    void *opaque;
> > > +} pci_bus_dev_args;
> > 
> > code style violation. CamelCase for structs pls.
> 
> OK.
> 
> > > +/* Call 'fn' for each pci device on the system */
> > > +void pci_for_each_device_all(pci_bus_dev_fn fn, void *opaque);
> > 
> > Instead of hacking pci making initialization o(N^2),
> 
> Why it's O(N^2)?  One vIOMMU walks O(N), and we only have one vIOMMU, or am I
> wrong?

What I meant is this is O(N) and if called M times will be O(N * M)
yes your patches only call once so O(N), still we can do better.

> > can't we add a variant of object_resolve_path_type ?
> 
> Could you elaborate?  Here what we want to do is to make sure there're no
> specific PCI devices registered, and potentially it can be more than one type
> of device in the future.
> 
> Thanks,

All you seem to care about is checking there's no VFIO
(why - should really be documented in a code comment much more clearly).
Looks like object_resolve_path_type does that with O(1) complexity.
If we need a variant that checks for multiple types we can add that.

> -- 
> Peter Xu


