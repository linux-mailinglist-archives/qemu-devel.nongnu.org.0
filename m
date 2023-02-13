Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 922E469437B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 11:54:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRWS2-0003hd-GP; Mon, 13 Feb 2023 05:52:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pRWS0-0003gv-7x
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:52:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pRWRy-0002XD-9x
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:52:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676285565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hQ5Xl1/SAWVzBsSbN4BvJ/joluRB7qcNNyNf47yUu08=;
 b=Qf2J5/HVH/0xVXsx41ZH72zdrF3k/Vb6Fspboi2uBb7k5wJxFoxcePTmtbluHgWuP750f+
 x/HfbVDbqywuGN+10sGv7XD37aI+CQYtAthqqp1kjt+axUbNy6mpLscfyAuUb912BhJLwK
 RyOsl4oZS16RLhgoXqU9IdhUoqBc750=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-438-fXDw4sCtNayQ3_3qTIY9Sw-1; Mon, 13 Feb 2023 05:52:43 -0500
X-MC-Unique: fXDw4sCtNayQ3_3qTIY9Sw-1
Received: by mail-ej1-f69.google.com with SMTP id
 hp2-20020a1709073e0200b0084d47e3fe82so7295018ejc.8
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 02:52:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hQ5Xl1/SAWVzBsSbN4BvJ/joluRB7qcNNyNf47yUu08=;
 b=ZD1Lj87/MxGoyQo3cfgUJ1I0eFN9IRFj6EP42y2k7u29aANIqudIDQadEoaP7WxKmS
 40oTHrXM4wb1KyCpsxaZHujsq0NRhDwTlZ7fhYJPNWviMpVvdlsJcR8V4/w5Ak3CFgTA
 J2k9b231pINJaxeV6xvJZ7G6xkre3s6hFjEiJMP0UyWK6Nt0uBwPSUNxqqrIcz2qVJPo
 4qfGwYwNCMpSsxXC2mjimSgdj1UV6pZCVTNFQV1LGpL60srBJOIWK/JyezFKL63WTlsZ
 QoINtTWA9A6zbAW+1+oPM4DZDGbc/vQqlQlINcrGP90bL+V5YRu4CAnLkeYZXqIAAO7V
 PRgg==
X-Gm-Message-State: AO0yUKWwZ2DxmfiV5PtzJutB1BQaQABuEPEFNB14gciPFSZP3xpsPpDS
 pJd4zpdstlnwkQfdJQZwayHdNuBJF2/hNi3C7LvNAp8ckGoQ+ZJOwdbfqXwc3lSrXt96kWes3oD
 Ino6iwePs/KmCdgY=
X-Received: by 2002:a17:907:3e12:b0:8af:2107:6ce5 with SMTP id
 hp18-20020a1709073e1200b008af21076ce5mr20510951ejc.35.1676285562872; 
 Mon, 13 Feb 2023 02:52:42 -0800 (PST)
X-Google-Smtp-Source: AK7set9DzsD0VaL7AdyngAoIz0XbD6wsGhefCBkC0746Tix3vJpHAgyv4O9kkGbh8a0kPpVOkkvRaQ==
X-Received: by 2002:a17:907:3e12:b0:8af:2107:6ce5 with SMTP id
 hp18-20020a1709073e1200b008af21076ce5mr20510943ejc.35.1676285562716; 
 Mon, 13 Feb 2023 02:52:42 -0800 (PST)
Received: from redhat.com ([2.52.132.212]) by smtp.gmail.com with ESMTPSA id
 c25-20020a17090603d900b0087bd50f6986sm6674973eja.42.2023.02.13.02.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 02:52:42 -0800 (PST)
Date: Mon, 13 Feb 2023 05:52:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Gonglei Arei <arei.gonglei@huawei.com>, Li Qiang <liq3ea@163.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Hu Tao <hutao@cn.fujitsu.com>,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 xiaoqiang zhao <zxq_yx_007@163.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v2 5/9] hw/pci: Replace dev->parent_bus by
 qdev_get_parent_bus(dev)
Message-ID: <20230213055231-mutt-send-email-mst@kernel.org>
References: <20230213070423.76428-1-philmd@linaro.org>
 <20230213070423.76428-6-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230213070423.76428-6-philmd@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Feb 13, 2023 at 08:04:19AM +0100, Philippe Mathieu-Daudé wrote:
> DeviceState::parent_bus is an internal field and should be
> accessed by the qdev_get_parent_bus() helper.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/pci-bridge/pci_expander_bridge.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
> index e752a21292..8c0649c071 100644
> --- a/hw/pci-bridge/pci_expander_bridge.c
> +++ b/hw/pci-bridge/pci_expander_bridge.c
> @@ -151,7 +151,7 @@ static char *pxb_host_ofw_unit_address(const SysBusDevice *dev)
>      assert(position >= 0);
>  
>      pxb_dev_base = DEVICE(pxb_dev);
> -    main_host = PCI_HOST_BRIDGE(pxb_dev_base->parent_bus->parent);
> +    main_host = PCI_HOST_BRIDGE(qdev_get_parent_bus(pxb_dev_base)->parent);
>      main_host_sbd = SYS_BUS_DEVICE(main_host);
>  
>      if (main_host_sbd->num_mmio > 0) {
> -- 
> 2.38.1


