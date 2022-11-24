Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A34637EC1
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 19:02:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyGWr-0007NQ-2d; Thu, 24 Nov 2022 13:00:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@ziepe.ca>) id 1oyGWo-0007Ml-GP
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 13:00:50 -0500
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jgg@ziepe.ca>) id 1oyGWm-00010J-Vp
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 13:00:50 -0500
Received: by mail-qv1-xf34.google.com with SMTP id e15so1348889qvo.4
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 10:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vR6T1WWc3XpWCUQ2N8sVBEgP3FzOAv7MN1ehO7+huGU=;
 b=D7LsK4acFJ49jpYVEYKFSg3MHiaBtGzrWFuScsC4O+6HJ3TdKzB/j6B6WQg1Ih5cr9
 95sxRCnTnksUeoCLzn5L2O5RtUmzg8gAtYsxn7KamEhRMsHbrFs2ahJfn1skyEj9ulKL
 ZcjQE9bqJUsQWwH/jcFAu6MMMYyU5XEY9lN16Yf/sy1Zlc7CKpWqtt5o5VFWxph6kiBd
 Weh2wZaquSUfHwJAe0EgOPyExSiMltaHSaWhip9bo7v0EjODxirdbRMgM9ytYuAbAHRT
 e4CXnKSEl5NE5Gl8NdohMxUpc399b8543wMIhma1NQ7H+q/Fnj4Msi9+nJ/+/UFlKbB+
 hb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vR6T1WWc3XpWCUQ2N8sVBEgP3FzOAv7MN1ehO7+huGU=;
 b=xDaSIGU+D9INlS9bBWpP9k6cv1FMf4pUQrQHpPirz4BjJ7QHFz6FcSKh6AS8f9mUHa
 pknjP94DWYNp7EO5fjQmDf84rA4es7Kb0p9waJGBbQST+zfZovsXBi3LNmZJH9vc3uRC
 +Kfjt87kxlIIyAmTt3Y22KpeyshXqjHNEd4jQswD+K9T8Bl9AMBtBmZ4PN7l3Sqq89OX
 SEVHoxF9p0Ww/IbDHl5IBojHDcudtcHBYNfpG6VkVUX8/k1zj9mOatcNr2J/xuX0DGJ9
 BOhqq8F0zAoiY5H8YaK7nswyi8i0by/ToVcEN9pNettOHrC1pRlVa9cx7S0LJPWTlJ2H
 ZypQ==
X-Gm-Message-State: ANoB5pnD5nZ8JRCa+GYz8juare+hIM5P0Fi5mlpniM4K1U1olhmHt3F2
 ZApImBBI4Zbnvsxgp+Tg7U0x3A==
X-Google-Smtp-Source: AA0mqf4wypyeB304r429FtI4J+qSzL+Fdag5hFRpLI6tfvk5NFbqP2z9vWEmzynU76/MBi6x3l9N2g==
X-Received: by 2002:a0c:e70d:0:b0:496:6092:9f0f with SMTP id
 d13-20020a0ce70d000000b0049660929f0fmr13465607qvn.32.1669312846495; 
 Thu, 24 Nov 2022 10:00:46 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.122.23]) by smtp.gmail.com with ESMTPSA id
 k23-20020ac86057000000b00399b73d06f0sm895955qtm.38.2022.11.24.10.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 10:00:45 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1oyGWi-00CKo4-EL;
 Thu, 24 Nov 2022 14:00:44 -0400
Date: Thu, 24 Nov 2022 14:00:44 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: chenxiang <chenxiang66@hisilicon.com>
Cc: alex.williamson@redhat.com, maz@kernel.org, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, linuxarm@huawei.com
Subject: Re: [PATCH v2] vfio/pci: Verify each MSI vector to avoid invalid MSI
 vectors
Message-ID: <Y3+xTLC0io6wvPpf@ziepe.ca>
References: <1669167756-196788-1-git-send-email-chenxiang66@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1669167756-196788-1-git-send-email-chenxiang66@hisilicon.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34; envelope-from=jgg@ziepe.ca;
 helo=mail-qv1-xf34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Wed, Nov 23, 2022 at 09:42:36AM +0800, chenxiang via wrote:
> From: Xiang Chen <chenxiang66@hisilicon.com>
> 
> Currently the number of MSI vectors comes from register PCI_MSI_FLAGS
> which should be power-of-2 in qemu, in some scenaries it is not the same as
> the number that driver requires in guest, for example, a PCI driver wants
> to allocate 6 MSI vecotrs in guest, but as the limitation, it will allocate
> 8 MSI vectors. So it requires 8 MSI vectors in qemu while the driver in
> guest only wants to allocate 6 MSI vectors.
> 
> When GICv4.1 is enabled, it iterates over all possible MSIs and enable the
> forwarding while the guest has only created some of mappings in the virtual
> ITS, so some calls fail. The exception print is as following:
> vfio-pci 0000:3a:00.1: irq bypass producer (token 000000008f08224d) registration
> fails:66311

With Thomas's series to make MSI more dynamic this could spell future
problems, as future kernels might have different ordering.

It is just architecturally wrong to tie the MSI programming at the PCI
level with the current state of the guest's virtual interrupt
controller.

Physical hardware doesn't do this, virtual emulation shouldn't either.

People are taking too many liberties with trapping the PCI MSI
registers through VFIO. :(

Jason

