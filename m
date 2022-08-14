Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9976C591F97
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Aug 2022 12:52:52 +0200 (CEST)
Received: from localhost ([::1]:42060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNBEh-0002yP-8C
	for lists+qemu-devel@lfdr.de; Sun, 14 Aug 2022 06:52:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oNBAF-0001T3-Do
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 06:48:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oNBAA-00043Q-Cq
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 06:48:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660474088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NheGGj2hlHIpeQ8SOdrp7mlRm3r4i7dVdptVnr17rlk=;
 b=ZscWZ9grV1vQqP8qTIEMRdCocruJQ9iuBsEYBUKlCm5d7Ho62Q/pwIZ0SOQMZeYsB6fT4Y
 ZhYPrGRXEXW6az03QVvzTrHat/yS+dkVWRYlVmqtfxpoJsgn9ABPo2MlQt9Ueq62cS8Bhq
 SU1S+s6X+n4O1J9+DKtAyt5eutQcTO8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-602-JSMp1cRhMcybKZI3nrq9fg-1; Sun, 14 Aug 2022 06:48:06 -0400
X-MC-Unique: JSMp1cRhMcybKZI3nrq9fg-1
Received: by mail-wm1-f69.google.com with SMTP id
 h127-20020a1c2185000000b003a534ec2570so1356279wmh.7
 for <qemu-devel@nongnu.org>; Sun, 14 Aug 2022 03:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=NheGGj2hlHIpeQ8SOdrp7mlRm3r4i7dVdptVnr17rlk=;
 b=cilLZWpQjrszm0QnNGlvb7kYe79driI3o0/cfFmxKw8JjuAkzPyHziZiqNiqCtc6aB
 xuwtK5a8RW0/pfFO5btuWpdyK6CfIzdAmo3qOVuewAxvMhbdLI48T32gXgjrEf2GLWxj
 nJBRt68OTrrh0InkKJV5P8uQpo+ANfJDqBS/s/sp5vUmqicBr8wGuNmZBu3VUrUV6vDY
 AeNzAXZVhSwHvdFyy/af+mkQZlZMDGxr8WNjR2SdjRGL64tBQiP4piLZg7k1eFpITPXA
 x4g+iGWS2c/2GMIUEffHcUHJT/oYaTOTHtqtc0Yn9mFKm1c585kn/u+Pk0pM4OT8LlNE
 u3Fg==
X-Gm-Message-State: ACgBeo0iu7leoUEImI1ckG8BVblH1X360PGC0LWOOCMAFOkzscM36VO6
 /5KjGNPbS3ToKEd0FkIelITAQQf0Nao/3g//kNIECGtdxhq39rLvyzR/1XmcsMipmMZHYL/69XX
 I8JcpUW4/eQwOmaw=
X-Received: by 2002:a5d:5311:0:b0:224:f76e:ad6f with SMTP id
 e17-20020a5d5311000000b00224f76ead6fmr2368923wrv.54.1660474085485; 
 Sun, 14 Aug 2022 03:48:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5z5tlB1B5cAhumf1ukqydlTYmveaCXLLEKLLTdG7BNQV3jpeYznOjPkIVx2cQn1zjYVlNmyg==
X-Received: by 2002:a5d:5311:0:b0:224:f76e:ad6f with SMTP id
 e17-20020a5d5311000000b00224f76ead6fmr2368898wrv.54.1660474085200; 
 Sun, 14 Aug 2022 03:48:05 -0700 (PDT)
Received: from redhat.com ([2.52.152.113]) by smtp.gmail.com with ESMTPSA id
 c7-20020a05600c0a4700b003a5de95b105sm5826722wmq.41.2022.08.14.03.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 03:48:04 -0700 (PDT)
Date: Sun, 14 Aug 2022 06:47:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paul Schlacter <wlfightup@gmail.com>
Cc: marcel.apfelbaum@gmail.com, fam@euphon.net, kwolf@redhat.com,
 stefanha@redhat.com, k.jensen@samsung.com, f4bug@amsat.org,
 its@irrelevant.dk, xypron.glpk@gmx.de, imammedo@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, kbusch@kernel.org,
 hreitz@redhat.com, ani@anisinha.ca
Subject: Re: [PATCH] xio3130_upstream: Add ACS (Access Control Services)
 capability
Message-ID: <20220814064705-mutt-send-email-mst@kernel.org>
References: <CADak6y5OdAgSwCmsdghy9JarwFqeR7GtaK2pz+TSLvSiAy8PQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADak6y5OdAgSwCmsdghy9JarwFqeR7GtaK2pz+TSLvSiAy8PQA@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Aug 14, 2022 at 03:47:49PM +0800, Paul Schlacter wrote:
> If it is a pcie device, check that all devices on the path from
> 
> the device to the root complex have ACS enabled, and then the
> 
> device will become an iommu_group.
> 
> it will have the effect of isolation
> 
> 
> Signed-off-by: wlfightup <wlfightup@gmail.com>

I don't think we can do this unconditionally. Has to have
a property and disabled for old versions.

> ---
> 
>  hw/pci-bridge/xio3130_upstream.c | 3 +++
> 
>  1 file changed, 3 insertions(+)
> 
> 
> diff --git a/hw/pci-bridge/xio3130_upstream.c b/hw/pci-bridge/
> xio3130_upstream.c
> 
> index 5ff46ef050..2df952222b 100644
> 
> --- a/hw/pci-bridge/xio3130_upstream.c
> 
> +++ b/hw/pci-bridge/xio3130_upstream.c
> 
> @@ -37,6 +37,8 @@
> 
>  #define XIO3130_SSVID_SSID              0
> 
>  #define XIO3130_EXP_OFFSET              0x90
> 
>  #define XIO3130_AER_OFFSET              0x100
> 
> +#define XIO3130_ACS_OFFSET \
> 
> +        (XIO3130_AER_OFFSET + PCI_ERR_SIZEOF)
> 
> 
>  static void xio3130_upstream_write_config(PCIDevice *d, uint32_t address,
> 
>                                            uint32_t val, int len)
> 
> @@ -92,6 +94,7 @@ static void xio3130_upstream_realize(PCIDevice *d, Error
> **errp)
> 
>          goto err;
> 
>      }
> 
> 
> +    pcie_acs_init(d, XIO3130_ACS_OFFSET);
> 
>      return;
> 
> 
>  err:
> 
> --
> 
> 2.24.3 (Apple Git-128)
> 


