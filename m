Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF63425FB2
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 00:15:50 +0200 (CEST)
Received: from localhost ([::1]:53312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYbg4-0004zX-2N
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 18:15:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mYbdG-0002oD-6F
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 18:12:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mYbdC-0006Va-BN
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 18:12:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633644768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2bw72VYprGWYnocFYSmhzXCiC2zvnzKVwxD7wjxP7m0=;
 b=BymQW7RDtjOqckJvELnB9f+ueWgjMkopxdwSi+c4+j7FWV+CPd7gdSvO/P5bFcBtdqNSI+
 RcjoQ/6sIxNGDTkHcuSe2XtyDVUnheHLj8mfnD8e/D4gtwA3hQ4nBup/tu5IN8amPmRfcw
 16TSdrACaTrbV4lYU8wLCJhdIS9qKqE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-MySpWNLMM-KStr6Cc_hRWg-1; Thu, 07 Oct 2021 18:12:47 -0400
X-MC-Unique: MySpWNLMM-KStr6Cc_hRWg-1
Received: by mail-ed1-f69.google.com with SMTP id
 v2-20020a50f082000000b003db24e28d59so7294006edl.5
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 15:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2bw72VYprGWYnocFYSmhzXCiC2zvnzKVwxD7wjxP7m0=;
 b=xVp8+btoKg3ZV7+mQ9tDI6NNbQaHgYtkuPL7GqdC3bzI7wxJsi8BcZaCzF8yevUZYe
 KlFec9ARE0G4Nmzp9zL7vzxESZvz6t0YmwOCoyFdR9SpIfi67lO0XiqSW/+fZd5vWGY9
 QWOKHM7mc9iTFAm0cEycPhssmC4m1OVPj1wSL1z8EG5EiTTCEHykBuGff/UanKrqbVLJ
 1kBLWdd0hq94GyJfWa9tODeTLtAjaEGqTbRx/dcHs5dmp5Er4minjO+KZrQlA0bvvT9X
 ll7gLA+b4AtKxU42p0n/UFFAz4fsC5ERDM3fwlk1HeC34iS/cFTiRj+p8ho7yZ9kVfxP
 bXLA==
X-Gm-Message-State: AOAM532aaitscnAoCN6/oAA9RtlBOvPe58xFFcJbDtiLYVzg4a9F+p2e
 hmkTzLa78HrvRBPHV/tZWeKboF2KSaR7XyWE42lE3MZywHvufqxu18M3CzjL1InC0SxrpQRA93R
 SVuS2q56ReCwnf2c=
X-Received: by 2002:a17:906:3693:: with SMTP id
 a19mr8822392ejc.237.1633644766028; 
 Thu, 07 Oct 2021 15:12:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpPS9mbc1APaIlqXaKuAde/H4RioT0wgTY+YzrzonmnG6NZKTCN+/+wPgMbAQJ7GhUNSfBrw==
X-Received: by 2002:a17:906:3693:: with SMTP id
 a19mr8822367ejc.237.1633644765826; 
 Thu, 07 Oct 2021 15:12:45 -0700 (PDT)
Received: from redhat.com ([2.55.132.170])
 by smtp.gmail.com with ESMTPSA id n24sm270585edb.28.2021.10.07.15.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 15:12:45 -0700 (PDT)
Date: Thu, 7 Oct 2021 18:12:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH 01/15] pcie: Set default and supported MaxReadReq to 512
Message-ID: <20211007181056-mutt-send-email-mst@kernel.org>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
 <20211007162406.1920374-2-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20211007162406.1920374-2-lukasz.maniak@linux.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: qemu-block@nongnu.org,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 Knut Omang <knut.omang@oracle.com>, qemu-devel@nongnu.org,
 Knut Omang <knuto@ifi.uio.no>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 07, 2021 at 06:23:52PM +0200, Lukasz Maniak wrote:
> From: Knut Omang <knut.omang@oracle.com>
> 
> Make the default PCI Express Capability for PCIe devices set
> MaxReadReq to 512.

code says 256

> Tyipcal modern devices people would want to


typo

> emulate or simulate would want this. The previous value would
> cause warnings from the root port driver on some kernels.


which specifically?

> 
> Signed-off-by: Knut Omang <knuto@ifi.uio.no>

we can't make changes like this unconditionally, this will
break migration across versions.
Pls tie this to a machine version.

Thanks!
> ---
>  hw/pci/pcie.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index 6e95d82903..c1a12f3744 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -62,8 +62,9 @@ pcie_cap_v1_fill(PCIDevice *dev, uint8_t port, uint8_t type, uint8_t version)
>       * Functions conforming to the ECN, PCI Express Base
>       * Specification, Revision 1.1., or subsequent PCI Express Base
>       * Specification revisions.
> +     *  + set max payload size to 256, which seems to be a common value
>       */
> -    pci_set_long(exp_cap + PCI_EXP_DEVCAP, PCI_EXP_DEVCAP_RBER);
> +    pci_set_long(exp_cap + PCI_EXP_DEVCAP, PCI_EXP_DEVCAP_RBER | (0x1 & PCI_EXP_DEVCAP_PAYLOAD));
>  
>      pci_set_long(exp_cap + PCI_EXP_LNKCAP,
>                   (port << PCI_EXP_LNKCAP_PN_SHIFT) |
> @@ -179,6 +180,8 @@ int pcie_cap_init(PCIDevice *dev, uint8_t offset,
>      pci_set_long(exp_cap + PCI_EXP_DEVCAP2,
>                   PCI_EXP_DEVCAP2_EFF | PCI_EXP_DEVCAP2_EETLPP);
>  
> +    pci_set_word(exp_cap + PCI_EXP_DEVCTL, PCI_EXP_DEVCTL_READRQ_256B);
> +
>      pci_set_word(dev->wmask + pos + PCI_EXP_DEVCTL2, PCI_EXP_DEVCTL2_EETLPPB);
>  
>      if (dev->cap_present & QEMU_PCIE_EXTCAP_INIT) {
> -- 
> 2.25.1


