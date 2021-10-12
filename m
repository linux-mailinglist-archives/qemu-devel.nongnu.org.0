Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 136AA429D69
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 07:58:04 +0200 (CEST)
Received: from localhost ([::1]:56978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maAnb-00042Z-5c
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 01:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1maAmG-0002iI-L4
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 01:56:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1maAmE-0000tg-MG
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 01:56:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634018197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xQ9vxVh7MVZso7gNoF5R7MyZebDFF9kzGxpPlaJZ6EA=;
 b=FeBl/Q3oJMzqeHlox+SDBT5QvVn/FxeEK3y08ghm9B2WKViA54/CqRRO5wm/2pfHmiTxK0
 Xwzue9bYKpZ0S4qN8l70r3MX/RREp3RpGswClOl+JR7rAVH7I/q5DlYD0E9m3Mo1W1qF7A
 N3Ol9miRW3nwJL5iFoH+twLNR+wZ4ww=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-WCwdn_ATPcuoC53giWlBuA-1; Tue, 12 Oct 2021 01:56:36 -0400
X-MC-Unique: WCwdn_ATPcuoC53giWlBuA-1
Received: by mail-ed1-f69.google.com with SMTP id
 t28-20020a508d5c000000b003dad7fc5caeso17870642edt.11
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 22:56:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xQ9vxVh7MVZso7gNoF5R7MyZebDFF9kzGxpPlaJZ6EA=;
 b=qz36E7RPLHKGSuwrQJwHp+tuMdUUpCO4xzvNoAstb8QWNBkLX1UurrkE0TqSyYCrtz
 NnUpAlCDNl90ZWXRZdqTz0/6GlmfjKGF0Pcqtwxr4qrNsc1dIiIbySxYxaLvulRgtHlj
 DqXzAGmcil/wHffel6Qh2m/YG2toywqZjgUhVQ4v0oqns8efQmyEhot5An6lyuZdVGd7
 JTsdbFWo/fr9jrOWURRDNDLCpDf4pbT8ghVgj0t/toPC+4XPanXuWFKjCmhQ/LtHQWv6
 dEHYkr2M5TT4QwN/eGafEDCuzYN2lxhcFELj7spdyKt2PQsoBmVPoO9G0So66afyy5at
 Nd/g==
X-Gm-Message-State: AOAM5323DXBmU/bp3JH/5Ruv0wEt4DFvcQzCrI0gofd151XDN+evtM6M
 w8L57zIXAJdlAAQBhe7zCsBVcwhflOCE6lU4xgwIGbnMHiUpDr7iq5E0B83iy2CWNCwciS5BeyY
 bEO4GUkisoQREYwk=
X-Received: by 2002:a50:e043:: with SMTP id g3mr48645464edl.196.1634018194964; 
 Mon, 11 Oct 2021 22:56:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw10U0IXVAzCqbxdywJZC+O3G0PawjRs2y/V9Jv8mFOs3NUboHlNclafdExmyg3C8Gc5Ek7AA==
X-Received: by 2002:a50:e043:: with SMTP id g3mr48645448edl.196.1634018194789; 
 Mon, 11 Oct 2021 22:56:34 -0700 (PDT)
Received: from redhat.com ([2.55.159.57])
 by smtp.gmail.com with ESMTPSA id y22sm5677567edc.76.2021.10.11.22.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 22:56:34 -0700 (PDT)
Date: Tue, 12 Oct 2021 01:56:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 5/6] pcie: fast unplug when slot power is off
Message-ID: <20211012014700-mutt-send-email-mst@kernel.org>
References: <20211011120504.254053-1-kraxel@redhat.com>
 <20211011120504.254053-6-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211011120504.254053-6-kraxel@redhat.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 11, 2021 at 02:05:03PM +0200, Gerd Hoffmann wrote:
> In case the slot is powered off (and the power indicator turned off too)
> we can unplug right away, without round-trip to the guest.
> 
> Also clear pending attention button press, there is nothing to care
> about any more.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/pci/pcie.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index 70fc11ba4c7d..f3ac04399969 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -561,6 +561,16 @@ void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
>          return;
>      }
>  
> +    if (((sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_OFF) &&
> +        ((sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_OFF)) {
> +        /* slot is powered off -> unplug without round-trip to the guest */
> +        pcie_cap_slot_do_unplug(hotplug_pdev);
> +        hotplug_event_notify(hotplug_pdev);
> +        pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
> +                                     PCI_EXP_SLTSTA_ABP);

Does this handle all the things including link status etc btw?
I don't remember off-hand.

> +        return;
> +    }
> +
>      pcie_cap_slot_push_attention_button(hotplug_pdev);
>  }
>  
> -- 
> 2.31.1


