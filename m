Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAF64A7777
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 19:07:13 +0100 (CET)
Received: from localhost ([::1]:52676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFK2D-0000xw-25
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 13:07:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nFIuA-00023i-5p
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 11:54:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nFIu7-00006T-CF
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 11:54:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643820844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dcZHG7u4cLShf2RUjPUU6ow1X09GSdL+vPy7K6VyXW4=;
 b=JWOxt4ybYWqzdegEQYg+ecXJKztW5J3eNF9JQQMjseKaIN+npYtSfFthpqPVrQ3dmNLAe7
 hXDa10cmGDSCl7Wt9fP3piz4Q66w12wD+JX3BfpFoRAa2rFSz5UWbXgzByjHfAikWg1PaX
 5HRqUDSj2Wo5nl166Uxx9ldpKN3a0RU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-NLdw4Y0RN56SeTAnLAYQ8Q-1; Wed, 02 Feb 2022 11:54:03 -0500
X-MC-Unique: NLdw4Y0RN56SeTAnLAYQ8Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 q125-20020a1c4383000000b003503e10c027so4665402wma.2
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 08:54:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dcZHG7u4cLShf2RUjPUU6ow1X09GSdL+vPy7K6VyXW4=;
 b=ICvzWYkIo2slGYTrcS5Gp7VUvcQCO1FCpDnrEGS0zH6R+FjOq/nj8oVq1U3+eNeuZ/
 5ynlVWlF0qtO41NzUdeDlnX1MT5ix6fD7JzgF5V8E05mXERopKyi5LaiwpJwbwxDaO29
 yz1bBEUrRuKXSBuY0I3l4LHnCkDX9wOGx9Pgs+xIyqfGQp3HowQFirEAr8v1hNroEsj9
 RfIsb8qJR0WQMWchXjW59+qri/+91W643kCLhaQMvgTnLRgEIhUjUmusOjvpSgBjQkNz
 LDn0mm9qtCn0OQSV3IyZ1urVF0WmzpEEK9BEM+IvsGUKeAYl56n2WwU7Ye3HdJAXCQl/
 W8rg==
X-Gm-Message-State: AOAM530GEkfgG+o7QxaJ5sAWowm6qTJOAFxNBwjBCbvAWS9sii3NDqmz
 GIks6xQsdPu1YRUNz71/OxVsgtHHxk2QVW6++3jNvoWOTNj0lZeqgs7LKv9GsdHAV96k2S5jCao
 SCJnD0Ukjrq0/Y40=
X-Received: by 2002:a05:600c:358d:: with SMTP id
 p13mr6746665wmq.107.1643820842517; 
 Wed, 02 Feb 2022 08:54:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzn8totxOXq/WklxVxFGiKY5P1FcOlev71vwC71jaMefqsPvBUUYFqU31k91SPqO3L8M2XI+w==
X-Received: by 2002:a05:600c:358d:: with SMTP id
 p13mr6746637wmq.107.1643820842264; 
 Wed, 02 Feb 2022 08:54:02 -0800 (PST)
Received: from redhat.com ([2.52.5.34])
 by smtp.gmail.com with ESMTPSA id y8sm5283195wrd.32.2022.02.02.08.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 08:54:01 -0800 (PST)
Date: Wed, 2 Feb 2022 11:53:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Message-ID: <20220202115156-mutt-send-email-mst@kernel.org>
References: <20220127142253.21ab0025.alex.williamson@redhat.com>
 <YfO00O4sT2UgaW31@stefanha-x1.localdomain>
 <20220131091623.6739464e.alex.williamson@redhat.com>
 <Yfj9u26F6/RdlhoB@stefanha-x1.localdomain>
 <20220201082437.7dd940eb.alex.williamson@redhat.com>
 <9BD98DD7-CC28-49E1-8150-BDECF0324FFA@oracle.com>
 <20220201154736.576e2a7e.alex.williamson@redhat.com>
 <CAFEAcA-f6ZBgAtKr-nUFTR8nfMGVWF=uExoRaMajN7t6wU7f7g@mail.gmail.com>
 <20220202050526-mutt-send-email-mst@kernel.org>
 <20220202084933.6a7dc35f.alex.williamson@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220202084933.6a7dc35f.alex.williamson@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Peter Maydell <peter.maydell@linaro.org>, Jag Raman <jag.raman@oracle.com>,
 Beraldo Leal <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 02, 2022 at 08:49:33AM -0700, Alex Williamson wrote:
> > Alex, what did you refer to?
> 
> My evidence is largely by omission, but that might be that in practice
> it's not used rather than explicitly forbidden.  I note that the bus
> master enable bit specifies:
> 
> 	Bus Master Enable - Controls the ability of a Function to issue
> 		Memory and I/O Read/Write Requests, and the ability of
> 		a Port to forward Memory and I/O Read/Write Requests in
> 		the Upstream direction.
> 
> That would suggest it's possible, but for PCI device assignment, I'm
> not aware of any means through which we could support this.  There is
> no support in the IOMMU core for mapping I/O port space, nor could we
> trap such device initiated transactions to emulate them.  I can't spot
> any mention of I/O port space in the VT-d spec, however the AMD-Vi spec
> does include a field in the device table:
> 
> 	controlIoCtl: port I/O control. Specifies whether
> 	device-initiated port I/O space transactions are blocked,
> 	forwarded, or translated.
> 
> 	00b=Device-initiated port I/O is not allowed. The IOMMU target
> 	aborts the transaction if a port I/O space transaction is
> 	received. Translation requests are target aborted.
> 	
> 	01b=Device-initiated port I/O space transactions are allowed.
> 	The IOMMU must pass port I/O accesses untranslated. Translation
> 	requests are target aborted.
> 	
> 	10b=Transactions in the port I/O space address range are
> 	translated by the IOMMU page tables as memory transactions.
> 
> 	11b=Reserved.
> 
> I don't see this field among the macros used by the Linux driver in
> configuring these device entries, so I assume it's left to the default
> value, ie. zero, blocking device initiated I/O port transactions.
> 
> So yes, I suppose device initiated I/O port transactions are possible,
> but we have no support or reason to support them, so I'm going to go
> ahead and continue believing any I/O port address space from the device
> perspective is largely irrelevant ;)  Thanks,
> 
> Alex

Right, it would seem devices can initiate I/O space transactions but IOMMUs
don't support virtualizing them and so neither does VFIO.


-- 
MST


