Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4009F526104
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 13:32:03 +0200 (CEST)
Received: from localhost ([::1]:51104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npTWb-0003yO-UL
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 07:32:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1npTRE-0001Yu-VZ
 for qemu-devel@nongnu.org; Fri, 13 May 2022 07:26:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1npTR7-0005ZO-Mh
 for qemu-devel@nongnu.org; Fri, 13 May 2022 07:26:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652441179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R7Kq4qPA9A8h6co1gG0mSxQds5Jk2MGiVTfdm2EgH50=;
 b=AwUNN5AecmId+SpxkeDS7AJjB+Qqkpikqoec3LwcXEFX202SsLGpSYAsHsrLQIDBvhQy3e
 8WcrGtJMj+Z4GGaq69co6Acua55271kIEdKLfkrlVgW47KQ3OkvCgvEdU+gA8Ime5crmbz
 yj90w2rkizleucbk+OWkmc1LKVlPy2E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-dxvkaZXyOW6CbQY2WHkXyg-1; Fri, 13 May 2022 07:26:17 -0400
X-MC-Unique: dxvkaZXyOW6CbQY2WHkXyg-1
Received: by mail-wm1-f70.google.com with SMTP id
 m186-20020a1c26c3000000b003943e12185dso2812537wmm.7
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 04:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=R7Kq4qPA9A8h6co1gG0mSxQds5Jk2MGiVTfdm2EgH50=;
 b=pnIWIzr9EOUsqHimVYAR5Tkx0satlzpj70iW0CnBQbXeCXvv8t+/FFHEY8vZaxFfgn
 c3pKhsxi7+VvtFlCKIdPO2F6wTc/N5/V4lNgTI373cBEI8H+0m2iCbXIXUnEEPQyxJnt
 LV0TilW6lS+ZuaiDyiORyV9tXbdcSjVh9E0+ORQw492xknKrTbpsltV3pGS9CajQmptP
 VQ4qSexrBtO7VkNBDL1C8sHwHT3M4JFSVc5pnPgjqN59ovZeQt8EG/bJrss2HZkWbQsn
 5Ej1xHQHDxSesX46LYrXce2JypzIT8wt+Zil1qkeNsoyiDVT2wx2dc2lYCe0NrXsizH+
 NoDQ==
X-Gm-Message-State: AOAM532SXIfnQH65+yqTem6ZHaeMIQg8UNPrFzrnJfGdT/b3WYKw1e2B
 nsf5FBm1W4a5oobnfe0COdmQlLTDHnV0NEU7Hm1Uf1dEudhGzMrhtbf6CQnAzBXwJiLSZddWu5f
 PVD+fxB3ZRolmcx8=
X-Received: by 2002:a05:600c:4f4f:b0:394:97e1:ca99 with SMTP id
 m15-20020a05600c4f4f00b0039497e1ca99mr4140831wmq.143.1652441176693; 
 Fri, 13 May 2022 04:26:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwahfoAz4yJLkqe0JYOlr6oxq5TOPs81+syBA98Y7s+7nEu82UM5BtNI+j6VagXjjNAwHcS/w==
X-Received: by 2002:a05:600c:4f4f:b0:394:97e1:ca99 with SMTP id
 m15-20020a05600c4f4f00b0039497e1ca99mr4140802wmq.143.1652441176401; 
 Fri, 13 May 2022 04:26:16 -0700 (PDT)
Received: from redhat.com ([2.53.15.195]) by smtp.gmail.com with ESMTPSA id
 h9-20020adfa4c9000000b0020cd2e8d3b1sm2033419wrb.5.2022.05.13.04.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 04:26:15 -0700 (PDT)
Date: Fri, 13 May 2022 07:26:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, "open list:IDE" <qemu-block@nongnu.org>
Subject: Re: [PATCH 1/3] hw/ide/piix: Remove redundant "piix3-ide-xen" device
 class
Message-ID: <20220513072532-mutt-send-email-mst@kernel.org>
References: <20220508103432.14874-1-shentey@gmail.com>
 <20220508103432.14874-2-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220508103432.14874-2-shentey@gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Sun, May 08, 2022 at 12:34:30PM +0200, Bernhard Beschow wrote:
> Commit 0f8445820f11a69154309863960328dda3dc1ad4 'xen: piix reuse pci
> generic class init function' already resolved redundant code which in
> turn rendered piix3-ide-xen redundant.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Cc xen maintainers for review please.

> ---
>  hw/i386/pc_piix.c | 3 +--
>  hw/ide/piix.c     | 7 -------
>  2 files changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 4c185c72d0..27dfde4917 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -244,8 +244,7 @@ static void pc_init1(MachineState *machine,
>      if (pcmc->pci_enabled) {
>          PCIDevice *dev;
>  
> -        dev = pci_create_simple(pci_bus, piix3_devfn + 1,
> -                                xen_enabled() ? "piix3-ide-xen" : "piix3-ide");
> +        dev = pci_create_simple(pci_bus, piix3_devfn + 1, "piix3-ide");
>          pci_ide_create_devs(dev);
>          idebus[0] = qdev_get_child_bus(&dev->qdev, "ide.0");
>          idebus[1] = qdev_get_child_bus(&dev->qdev, "ide.1");
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index ce89fd0aa3..2345fe9e1d 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -241,12 +241,6 @@ static const TypeInfo piix3_ide_info = {
>      .class_init    = piix3_ide_class_init,
>  };
>  
> -static const TypeInfo piix3_ide_xen_info = {
> -    .name          = "piix3-ide-xen",
> -    .parent        = TYPE_PCI_IDE,
> -    .class_init    = piix3_ide_class_init,
> -};
> -
>  /* NOTE: for the PIIX4, the IRQs and IOports are hardcoded */
>  static void piix4_ide_class_init(ObjectClass *klass, void *data)
>  {
> @@ -272,7 +266,6 @@ static const TypeInfo piix4_ide_info = {
>  static void piix_ide_register_types(void)
>  {
>      type_register_static(&piix3_ide_info);
> -    type_register_static(&piix3_ide_xen_info);
>      type_register_static(&piix4_ide_info);
>  }
>  
> -- 
> 2.36.1


