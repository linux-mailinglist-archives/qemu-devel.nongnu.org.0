Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 626585A9B44
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 17:09:56 +0200 (CEST)
Received: from localhost ([::1]:38164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTlpL-0004q1-6f
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 11:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oTljq-00004y-RD
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 11:04:24 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oTljl-0004H3-Cz
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 11:04:13 -0400
Received: by mail-wr1-x430.google.com with SMTP id b16so15129330wru.7
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 08:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=YF+Mg3isX0cmFE8kubGGohFjw0/ZIrD04XqOFqTxa8s=;
 b=Kxap+hbkbIlFtRWGhlMx8DKVsrvcBF21AXSumILvJKtFpcsaf/uf2KoPEvsrEqwBTj
 FPtXZ/w3NCFNaE5RNMtnQ9bPzigF64DijwIlYjZEXCl2qX464wObFQLXrk78ecV8YiIR
 mnt7YKK0Tsasu8W3+NBiEEJSQXPu65Q+y+LoHNjLYENucGAmv/27X7Kexlns2gTg3w2I
 9+F3C3DwJUO6PUqIIfbSxyBRronX1ngddSHUxQ+jSmJSCknH8M3UP2b8mlcl7MVFdi/w
 eZzRYPxxpfGJmnoBrKDnPfp9H3saPLEZoiIRvGAiWc938StgT4WdoWQWqpy+qxdnGyOl
 69xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=YF+Mg3isX0cmFE8kubGGohFjw0/ZIrD04XqOFqTxa8s=;
 b=LbWBJUBGbpyQFA1g0dHqBwwsPdu14+N5/99jAKDni+a254pX77nO2T36zBc5acHUUt
 IV6A3aOE4i7lg6NC2FHmf5r+It5tZD+UXTsAi1OG1nW8zfK/hAXwS6na/5bb8WoR8jwx
 QNhvsWBrNKSYK7g71ErU9CqDvU1f79mMSMazLEN+KhalYLyVTp6/g7eKdoMtRYphFjkh
 bNiZ30NAb1kYx/NfFRkuCdZKUOJrL+/yq8UaznES0sk+khkM+vte8UBsD91CpysiiKVq
 /XnDhdEtnIldl7d81RZlleJzzEF7TvsTaoSZnJaZ6aKpSsORbh9FlEsv45IZ9vkcbn19
 8DPw==
X-Gm-Message-State: ACgBeo0pz39EO+v+t9b/fLvbbb2f/VRVJwfkUVhlNy9J78KwTDklcDiF
 Wta5t67qC3e2s7mX8jTwSKTaLjvQqk0IT3Pr
X-Google-Smtp-Source: AA6agR46vGv2dMFzqTSknVpvD+XVDrlclz393ExoseUKKAPOtIsBIbOgGao5iTRhFGBhuHalZmSiTQ==
X-Received: by 2002:a05:6000:78b:b0:226:d10f:1c3 with SMTP id
 bu11-20020a056000078b00b00226d10f01c3mr14081897wrb.149.1662044647830; 
 Thu, 01 Sep 2022 08:04:07 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168]) by smtp.gmail.com with ESMTPSA id
 az19-20020a05600c601300b003a342933727sm6075783wmb.3.2022.09.01.08.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 08:04:07 -0700 (PDT)
Date: Thu, 1 Sep 2022 16:04:04 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com
Subject: Re: [PATCH 10/10] hw/arm/virt: Fix devicetree warnings about the
 virtio-iommu node
Message-ID: <YxDJ5FE4zXSQW10p@myrica>
References: <20220824155113.286730-1-jean-philippe@linaro.org>
 <20220824155113.286730-11-jean-philippe@linaro.org>
 <CAFEAcA-Kv16weckhxM-mQrwiPZa5JMY4YkXcD5UfCzDKr4xGtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-Kv16weckhxM-mQrwiPZa5JMY4YkXcD5UfCzDKr4xGtQ@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, Aug 24, 2022 at 08:51:18PM +0100, Peter Maydell wrote:
> On Wed, 24 Aug 2022 at 16:51, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
> > dt-validate and dtc throw a few warnings when parsing the virtio-iommu
> > node:
> >
> >   pcie@10000000: virtio_iommu@16:compatible: ['virtio,pci-iommu'] does not contain items matching the given schema
> >   pcie@10000000: Unevaluated properties are not allowed (... 'virtio_iommu@16' were unexpected)
> >   From schema: linux/Documentation/devicetree/bindings/pci/host-generic-pci.yaml
> >   pcie@10000000: virtio_iommu@16:compatible: ['virtio,pci-iommu'] does not contain items matching the given schema
> >   From schema: dtschema/schemas/pci/pci-bus.yaml
> >
> >   Warning (pci_device_reg): /pcie@10000000/virtio_iommu@16: PCI unit address format error, expected "2,0"
> >
> > The compatible property for a PCI child node should follow the rules
> > from "PCI Bus Binding to: IEEE Std 1275-1994". It should contain the
> > Vendor ID and Device ID (or class code).
> >
> > The unit-name should be "device,function".
> >
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> > Note that this doesn't follow
> > linux/Documentation/devicetree/bindings/virtio/iommu.txt, I'll update
> > that document when converting it to yaml, hopefully this Linux cycle.
> > The "virtio,pci-iommu" compatible string is not actually used by any
> > driver and only QEMU implements it, so we can get rid of it.
> 
> I'm not sure you can just change the compat string like that,
> unless you can guarantee that nobody anywhere has ever
> looked for it in a dtb. Also, "virtio,pci-iommu" is much
> clearer than "pci1af4,1057"...

I'm pretty sure nobody ever looked for it, but can't guarantee it. And yes
the PCI notation is hideous but that's what the standard requires. So I
think changing this to 'compatible = "virtio,pci-iommu", "pci1af4,1057"'
would be better.

Thanks,
Jean

