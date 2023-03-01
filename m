Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BDB6A757F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 21:40:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXTDt-0002WF-Ei; Wed, 01 Mar 2023 15:38:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXTDq-0002OA-Vh
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 15:38:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXTDp-0000mW-Dq
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 15:38:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677703123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ReMTy9cRjcqySdggW2QuMj+PgCW0pMDAK2+Qd0fGPck=;
 b=IQ5AwqdOGiFNn9rUXsEOuwzG7BArb8ti2QmId8ya2COLyBS5wbYfW90z94YdETqjlIMylq
 iSBZsbAsS/zNs3lJ2F0iUBQVtT8VZYrFqFvHeRmDP1FEbizuE34VcA4u+W4aSrULNrhDz3
 pWVxPajIvywUPBpH8uxcrGDNd/FK1Rw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-611-gFJZNNWSMM-dtmZnCtzvqA-1; Wed, 01 Mar 2023 15:38:42 -0500
X-MC-Unique: gFJZNNWSMM-dtmZnCtzvqA-1
Received: by mail-wr1-f72.google.com with SMTP id
 o3-20020a5d6483000000b002cc4fe0f7fcso2094023wri.7
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 12:38:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677703121;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ReMTy9cRjcqySdggW2QuMj+PgCW0pMDAK2+Qd0fGPck=;
 b=4LdQroT4bqLAjKAxlDt5GS4KXypR32mdujKwv8ObgfYx0JqhyAPAw7eVpVMvNaPGlk
 CWdvGzbZiiBfljIlsHRRiK4tezO6CTFk4Cm/0oFPdM2howPo1R23hXEikFDNydOgf/+N
 J3fo+TZRuQi+Lgs742a8BW5jkFKhlDZa0FzqqvaPp24hgcbWB04zILmd1flgp/hxrf/d
 2chgDEQTpF9tHkJSPQnLoN1f6JwmOqPS8jO4pwoU5mgjFkNALyp6dUnncCvgRSPNwWPG
 G8HCc9YLs4sikmFbYf7S1+Ky7TMZlhkPu0loal7ZSQ5tP8mqgOMAczfkoOvVu3q0UPcp
 GW3A==
X-Gm-Message-State: AO0yUKXf318OMwRx/bVF4IiZoWLxf0yFtvTFqc94LBowv1uizi55TpjI
 PAW1n7pjlvu4K3hNacjHRfrb3Us901z2bsMwAX3GksLOLwtyDRCl9uCVH7nFIulsEfsQv8Jg9mA
 /BdA0GUibylIiBiM=
X-Received: by 2002:a05:6000:1b84:b0:2c7:16c3:175e with SMTP id
 r4-20020a0560001b8400b002c716c3175emr5375527wru.64.1677703120931; 
 Wed, 01 Mar 2023 12:38:40 -0800 (PST)
X-Google-Smtp-Source: AK7set/+CN3bsrwc75HTtyYLTmZFSlJ/bDEc24Aq/iMrDJMlXInxy75T1OA65mkwADDYABy6CLUI2Q==
X-Received: by 2002:a05:6000:1b84:b0:2c7:16c3:175e with SMTP id
 r4-20020a0560001b8400b002c716c3175emr5375518wru.64.1677703120557; 
 Wed, 01 Mar 2023 12:38:40 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 a13-20020a056000100d00b002c6e84cadcbsm13636476wrx.72.2023.03.01.12.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 12:38:39 -0800 (PST)
Date: Wed, 1 Mar 2023 15:38:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: wlfightup <wlfightup@gmail.com>
Cc: marcel.apfelbaum@gmail.com, qemu-devel@nongnu.org
Subject: Re: [PATCH] xio3130_downstream: Add ACS (Access Control Services)
 capability
Message-ID: <20230301153555-mutt-send-email-mst@kernel.org>
References: <20230131063013.65588-1-wlfightup@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230131063013.65588-1-wlfightup@gmail.com>
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

On Tue, Jan 31, 2023 at 02:30:13PM +0800, wlfightup wrote:
> When vfio-pci devices are attached to the downstream, pcie acs
> capability may be needed, Consistent with physical machine.
> 
> It has been tested in our environment, and pcie acs capability
> is required in some scenarios.
> 
> Claim ACS support in the downstream port to allow
> passthrough of individual functions of a device to different
> guests (in a nested virt.setting) with VFIO.
> Without this patch, all functions of a device, such as all VFs of
> an SR/IOV device, will end up in the same IOMMU group.
> A similar situation occurs on Windows with Hyper-V.
> 
> Signed-off-by: wlfightup <wlfightup@gmail.com>

Hmm ok but this is an unstable property and nothing sets it.
If your product starts using it, it will break when qemu
changes the property in some way.

Do we want to maybe set this by default?
If not I am guessing at least a stable property is needed.

> ---
>  hw/pci-bridge/xio3130_downstream.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/hw/pci-bridge/xio3130_downstream.c b/hw/pci-bridge/xio3130_downstream.c
> index 38a2361fa2..2017cf42a3 100644
> --- a/hw/pci-bridge/xio3130_downstream.c
> +++ b/hw/pci-bridge/xio3130_downstream.c
> @@ -40,6 +40,8 @@
>  #define XIO3130_SSVID_SSID              0
>  #define XIO3130_EXP_OFFSET              0x90
>  #define XIO3130_AER_OFFSET              0x100
> +#define XIO3130_ACS_OFFSET \
> +        (XIO3130_AER_OFFSET + PCI_ERR_SIZEOF)
>  
>  static void xio3130_downstream_write_config(PCIDevice *d, uint32_t address,
>                                           uint32_t val, int len)
> @@ -111,6 +113,10 @@ static void xio3130_downstream_realize(PCIDevice *d, Error **errp)
>          goto err;
>      }
>  
> +    if (!s->disable_acs) {
> +        pcie_acs_init(d, XIO3130_ACS_OFFSET);
> +    }
> +
>      return;
>  
>  err:
> @@ -137,6 +143,7 @@ static void xio3130_downstream_exitfn(PCIDevice *d)
>  static Property xio3130_downstream_props[] = {
>      DEFINE_PROP_BIT(COMPAT_PROP_PCP, PCIDevice, cap_present,
>                      QEMU_PCIE_SLTCAP_PCP_BITNR, true),
> +    DEFINE_PROP_BOOL("x-disable-acs", PCIESlot, disable_acs, true),
>      DEFINE_PROP_END_OF_LIST()
>  };
>  
> -- 
> 2.24.3 (Apple Git-128)


