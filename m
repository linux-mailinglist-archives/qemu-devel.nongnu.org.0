Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B735436FEF
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 04:26:34 +0200 (CEST)
Received: from localhost ([::1]:59620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdkGP-0001d7-5h
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 22:26:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mdkEm-0000tT-CE
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 22:24:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mdkEj-0004TZ-Uu
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 22:24:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634869488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hKbyP9D16zHC4xRclQHjV5/Jkrsd4zK+3sxcDsYAsYw=;
 b=N99bUi/bBsQtacI2casYdSGGmEjzpEdcn6HhN4IqzjvcyBOgETDiyvLVr++9du3yD49LWi
 s3nqCNuMvr2dLjwmwPf7WMU41RuGH3zFcxrZ0GrS4b+3F9/EAb+p5PeeKSZcBwv+FO4hs6
 HI5DppllobpojB7ci03KXN8mZ0pUCRU=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-XZ62Ns6mPSuY5afBBgtDSg-1; Thu, 21 Oct 2021 22:24:47 -0400
X-MC-Unique: XZ62Ns6mPSuY5afBBgtDSg-1
Received: by mail-pf1-f199.google.com with SMTP id
 d10-20020a621d0a000000b0044ca56b97f5so1466892pfd.2
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 19:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hKbyP9D16zHC4xRclQHjV5/Jkrsd4zK+3sxcDsYAsYw=;
 b=RzRMI/FcPQVqDyP+8dyrJv7gdQsMRn8oWFXZELhbzUSunTv9F2oRwKFoqXNoyJk1sN
 +SXYUfSXXBdiZHvwEhFtjGF1hFYM8RCV5jDBY99d03L0gWpg1bKtHLeFa8BvKH73VpHb
 kMTGevA6b+akNDD7xmyMGvGzMY2cZ/QsO8NJTdEqZsuDoXmyaTXkwc/oUUuVVdAoirey
 gIIWpM6u3UbSkLUKK1bzPhfd3lWUAE4IquYO0bGTL/uXXFErxR3CXQoMfeyJiFguTR5W
 Ey0YQWdPv1ovg35YwuKIWXA/Ub2SvBLmnC2GHVU6PiRPv9ciOeGKH6V0f4mBOjRljr+4
 8twQ==
X-Gm-Message-State: AOAM530hk343+yQ4gda2coiyIZYjAvwsnFQ+ImWcETQ66F+sGr0yWms4
 LeAGBfPN5FYabbEXVcXM5l18EjlJQxQ14pHK6Da+CjjE0PmPkf3oqVQlt8TDS+GBV3QeV7/OnXu
 oKgkDvpVax5DPMRw=
X-Received: by 2002:a63:3e4b:: with SMTP id l72mr7231463pga.438.1634869485896; 
 Thu, 21 Oct 2021 19:24:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVuLD9wBW0a8QtrOH4IfeYowTJ3nO8YA/2w9LU7R4PbvTXMq27K9gBzz0peVmExciRJ3y1ZQ==
X-Received: by 2002:a63:3e4b:: with SMTP id l72mr7231439pga.438.1634869485514; 
 Thu, 21 Oct 2021 19:24:45 -0700 (PDT)
Received: from xz-m1.local ([94.177.118.50])
 by smtp.gmail.com with ESMTPSA id b6sm8792843pfv.171.2021.10.21.19.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 19:24:44 -0700 (PDT)
Date: Fri, 22 Oct 2021 10:24:34 +0800
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 4/8] pci: Define pci_bus_fn/pci_bus_ret_fn type
Message-ID: <YXIg4si2q6E3Sf0w@xz-m1.local>
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-5-peterx@redhat.com>
 <f7062eed-3040-0ba2-1d8f-0cb002640acc@redhat.com>
 <c9f5420e-c2d2-9332-8780-c8bb07827609@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c9f5420e-c2d2-9332-8780-c8bb07827609@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 21, 2021 at 02:54:44PM +0200, Philippe Mathieu-Daudé wrote:
> On 10/21/21 13:44, Philippe Mathieu-Daudé wrote:
> > On 10/21/21 12:42, Peter Xu wrote:
> >> The pci_bus_fn is similar to pci_bus_dev_fn that only takes a PCIBus* and an
> >> opaque.  The pci_bus_ret_fn is similar to pci_bus_fn but it allows to return a
> >> void* pointer.
> >>
> >> Use them where proper in pci.[ch], and to be used elsewhere.
> >>
> >> Signed-off-by: Peter Xu <peterx@redhat.com>
> >> ---
> >>  hw/pci/pci.c         |  6 ++----
> >>  include/hw/pci/pci.h | 12 +++++-------
> >>  2 files changed, 7 insertions(+), 11 deletions(-)
> > 
> >> --- a/include/hw/pci/pci.h
> >> +++ b/include/hw/pci/pci.h
> >> @@ -402,6 +402,8 @@ OBJECT_DECLARE_TYPE(PCIBus, PCIBusClass, PCI_BUS)
> >>  #define TYPE_PCIE_BUS "PCIE"
> >>  
> >>  typedef void (*pci_bus_dev_fn)(PCIBus *b, PCIDevice *d, void *opaque);
> >> +typedef void (*pci_bus_fn)(PCIBus *b, void *opaque);
> >> +typedef void* (*pci_bus_ret_fn)(PCIBus *b, void *opaque);
> 
> Now looking at patch #8, I wonder if it wouldn't be cleaner to have
> a single:
> 
> /*
>  * pci_bus_fn:
>  * @bus: PCI bus
>  * @opaque: Pointer to opaque pointer,
>             can be used as input *and* output
>  * Return #true on success, #false on failure
>  */
> typedef bool (*pci_bus_fn)(PCIBus *bus, void **opaque);

Having the errp could be better imho for patch 8 so we can allow the per-device
hook to set the exact error message.  That could be useful when we extend the
list of devices to scan (besides vfio-pci) so we can set different error
messages rather than return "false" for all.

I'll stole the rb and I'll adjust the "void* ()".  Thanks for looking, Phil.

-- 
Peter Xu


