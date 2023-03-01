Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4B86A75F1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 22:10:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXThz-0005ng-4C; Wed, 01 Mar 2023 16:09:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXThx-0005nU-Pd
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:09:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXThw-0007kL-8C
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:09:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677704991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jwK/rx/wFKZhto/Mn89DESZwi1NGd4SOX4Gr/+MddwY=;
 b=NcMTjufvEf0bpusjOyhr4O8NVu+DTLQfQ+c09X3hsRmmuQYp+57c2G5q+KeDO0EcDZoKDc
 /R0kM7Ke8WMAYOjV1LpGIsOsKJSdAH+CFL4bc6Xlz8XN4W+jxJkZu8B9Xsz35oB7hITasc
 +t0D6KkR2QBW1DNPOqPmcKb07oju70E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-YyoVAsJ4NjK6JNNU_eMItA-1; Wed, 01 Mar 2023 16:09:50 -0500
X-MC-Unique: YyoVAsJ4NjK6JNNU_eMItA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l31-20020a05600c1d1f00b003e8626cdd42so5005174wms.3
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 13:09:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677704989;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jwK/rx/wFKZhto/Mn89DESZwi1NGd4SOX4Gr/+MddwY=;
 b=bP7lXV8NKeobzJX6EifIzv1mB0bb9FlPmbw6ZHz9eiSU8JIUxmX+uFqdNh+KHZsj1N
 ys0sqZStyWjKDBLUGGCj95kSFG+QirTqAKq39DW5VPIxyAswPB6FtPNdwILEEi7CxJPH
 Z4nHDlUSaIeRfLry7JYmVwOL6Kl+qBRgusJZHBjq5raXV3XyQ1exWIlGhOwrzvCYkBxJ
 7PLo6BM4lyPLIZ0F8nPD2p6Z8phr9oVQF9Xw6KdnIFBFilzu62KakQH0y/eSI5BGGX4A
 YRTKJxLP1rkcP0c7/y/rLjOs+wluGx4WWPXUybTCQJUj1Ss02Dn/G1cPOs7ibVPd79xs
 14ig==
X-Gm-Message-State: AO0yUKWpolkuCAHroQJIK0B8zos3DK4hhRfYk9DZ41XsuuBAmtgIkSgv
 5Jy8O5CgCg4HHUAr/YR7xjtsW1IdyXduuFmNKOEAHAypBYyNwDmAB4Jn9oniIk2N5IJmVtTamhJ
 p/gj/AUIcoxDr5AE=
X-Received: by 2002:adf:d4d2:0:b0:2c8:6db5:1561 with SMTP id
 w18-20020adfd4d2000000b002c86db51561mr5410041wrk.41.1677704989033; 
 Wed, 01 Mar 2023 13:09:49 -0800 (PST)
X-Google-Smtp-Source: AK7set9jLScNXyT23omcyr/eppZMmfYjV+y4ML8eQmadGOXzSCL4GNZqJ5+quAdDptwXYskFui5XVA==
X-Received: by 2002:adf:d4d2:0:b0:2c8:6db5:1561 with SMTP id
 w18-20020adfd4d2000000b002c86db51561mr5410024wrk.41.1677704988712; 
 Wed, 01 Mar 2023 13:09:48 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 t3-20020a5d49c3000000b002c5804b6afasm13874847wrs.67.2023.03.01.13.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 13:09:48 -0800 (PST)
Date: Wed, 1 Mar 2023 16:09:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 eduardo@habkost.net, berrange@redhat.com, pbonzini@redhat.com,
 marcel.apfelbaum@gmail.com, philmd@linaro.org,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: Re: [PATCH v5 13/18] pci: introduce pci_find_the_only_child()
Message-ID: <20230301160855-mutt-send-email-mst@kernel.org>
References: <20230216180356.156832-1-vsementsov@yandex-team.ru>
 <20230216180356.156832-14-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216180356.156832-14-vsementsov@yandex-team.ru>
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

On Thu, Feb 16, 2023 at 09:03:51PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> To be used in further patch to identify the device hot-plugged into
> pcie-root-port.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Reviewed-by: Anton Kuchin <antonkuchin@yandex-team.ru>

Wait a second does this work for multifunction devices correctly?

> ---
>  include/hw/pci/pci.h |  1 +
>  hw/pci/pci.c         | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+)
> 
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index d5a40cd058..b6c9c44527 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -341,6 +341,7 @@ void pci_for_each_device_under_bus_reverse(PCIBus *bus,
>  void pci_for_each_bus_depth_first(PCIBus *bus, pci_bus_ret_fn begin,
>                                    pci_bus_fn end, void *parent_state);
>  PCIDevice *pci_get_function_0(PCIDevice *pci_dev);
> +PCIDevice *pci_find_the_only_child(PCIBus *bus, int bus_num, Error **errp);
>  
>  /* Use this wrapper when specific scan order is not required. */
>  static inline
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 208c16f450..34fd1fb5b8 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1771,6 +1771,39 @@ void pci_for_each_device(PCIBus *bus, int bus_num,
>      }
>  }
>  
> +typedef struct TheOnlyChild {
> +    PCIDevice *dev;
> +    int count;
> +} TheOnlyChild;
> +
> +static void the_only_child_fn(PCIBus *bus, PCIDevice *dev, void *opaque)
> +{
> +    TheOnlyChild *s = opaque;
> +
> +    s->dev = dev;
> +    s->count++;
> +}
> +
> +PCIDevice *pci_find_the_only_child(PCIBus *bus, int bus_num, Error **errp)
> +{
> +    TheOnlyChild res = {0};
> +
> +    pci_for_each_device(bus, bus_num, the_only_child_fn, &res);
> +
> +    if (!res.dev) {
> +        assert(res.count == 0);
> +        error_setg(errp, "No child devices found");
> +        return NULL;
> +    }
> +
> +    if (res.count > 1) {
> +        error_setg(errp, "Several child devices found");
> +        return NULL;
> +    }
> +
> +    return res.dev;
> +}
> +
>  const pci_class_desc *get_class_desc(int class)
>  {
>      const pci_class_desc *desc;
> -- 
> 2.34.1


