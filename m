Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 482B670279D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 10:53:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyTwR-0008IH-AA; Mon, 15 May 2023 04:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pyTwP-0008G8-1F
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:52:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pyTwN-00065R-55
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:52:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684140740;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=NZVlOg28FdbfZwVK8jpACnAXAjM1hk1fGYx5M9A0rZU=;
 b=THqdor2OxTJYiBi99MBMBQQm0aO158nznArcSGqKUSt+Zo0DQDd+ByNTjFlz2R6xdJm1kG
 9uNOtSvAE5CJ+ZgRqLa0APdk9UYLtB2FufCwKC2kmtIoSenKTFZK2UCB0fx8+zEup4Kzif
 iM671VLS+KZK0J4FRRnn94KQLC64I2o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-lYKL0opTPO--kS8McbUP0Q-1; Mon, 15 May 2023 04:52:17 -0400
X-MC-Unique: lYKL0opTPO--kS8McbUP0Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2618D88B770;
 Mon, 15 May 2023 08:52:17 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73406C16026;
 Mon, 15 May 2023 08:52:14 +0000 (UTC)
Date: Mon, 15 May 2023 09:52:12 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Hao Zeng <zenghao@kylinos.cn>
Cc: pbonzini@redhat.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH V2] hw/arm: enable qxl for aarch64
Message-ID: <ZGHyvBb8BQdKhWEy@redhat.com>
References: <20230512093108.1180726-1-zenghao@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230512093108.1180726-1-zenghao@kylinos.cn>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, May 12, 2023 at 05:31:08PM +0800, Hao Zeng wrote:
> Qemu does not support qxl graphics cards in arm, it is recommended to enable

Who recommends this and why ?

The recommendations from Gerd are what I tend to point poeple to
for display devices:

  https://www.kraxel.org/blog/2019/09/display-devices-in-qemu/

and it had this to say about arm:

  "On arm systems display devices with a pci memory bar do
   not work, which reduces the choices alot. We are left with:

    virtio gpu, if your guest has drivers
    ramfb"

Not sure if anything has changed in this respect ?


The QXL graphics card is an incredibly complex device, offering
2d acceleration that is not very interesting for modern guest OS
desktops since they're largely focused on 3d acceleration. This
complexity is bad from a security POV.

It would also require a guest driver to take advantage of QXL
features and while I presume the Linux driver will build, it is
still mostly pointless because of lack of interest in 2d acceleration.
I'm not sure about status of the Windows QXL driver for aarch64 ?

Further QXL is only useful when combined with SPICE graphics and
the SPICE project is largely inactive.

Overall, IMHO, we should keep QXL restricted to as few build scenarios
as possible. Given the status of SPICE, possibly we'll even want to
deprecate it on x86 eventually, not add it to more arches. 

What are you seeing as the compelling use case that requires QXL to
exist on aarch64 ?



> 
> Signed-off-by: Hao Zeng <zenghao@kylinos.cn>
> ---
>  hw/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 0f42c556d7..d0bedf9347 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -32,6 +32,7 @@ config ARM_VIRT
>      select VIRTIO_MEM_SUPPORTED
>      select ACPI_CXL
>      select ACPI_HMAT
> +    select QXL
>  
>  config CHEETAH
>      bool
> -- 
> 2.37.2
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


