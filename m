Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC762654B71
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 04:00:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8YGQ-0000yI-O8; Thu, 22 Dec 2022 21:58:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p8YGO-0000xu-C6
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 21:58:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p8YGM-0000Ql-6z
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 21:58:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671764300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=37T1Ua6f16ASCKshtuVi6SLKoblBpsm65cEzKCjvKw4=;
 b=GnCRd7CvHHTYaNORWfDilUWm96DhEBgP8sdzgZDjjSciarhT5XB4eD6QdzBgiI2Ne6iNtc
 zfUIO0/rnAZJxC+s+p1y9niwQn1O1wvyPU1xqSyLb/BH5q3CNlIW7UvFVeQf2//EqnNZTc
 pnGtBe5qx51gZ7Y2X+oB3qCZCsJ4eI8=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-168-zVIXckWpNeG-JWreIFrVLg-1; Thu, 22 Dec 2022 21:58:19 -0500
X-MC-Unique: zVIXckWpNeG-JWreIFrVLg-1
Received: by mail-oi1-f198.google.com with SMTP id
 o1-20020a05680803c100b0035ea5685b6bso760819oie.23
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 18:58:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=37T1Ua6f16ASCKshtuVi6SLKoblBpsm65cEzKCjvKw4=;
 b=H4Xg+bdUrvgHH33res1DiGGArlrmDEc1PdYdxHAyiyvHPrpbqtxc27QZD4cupnYFhS
 1e1IxlISL6RuWewFYga5hZ+yrw+2afjzOB+6zB+89ZziQHBT1eL6FMyz9M5WhLnae6hS
 MclZ1jBmXdXW4YM7MBU/xiS+u/JUbjgqbzwm8VE3wxPWcp9/PCdCnIR0TbUIZxCZZRz2
 UxRmwI/mmoK1oYG+0btGhar+UgnNDGfFZ0YD3uO0ldj7/c1M6r+KoZt6ejSesLFTz1C5
 nXv5bS6de5DUlWngi3tnCYmtgYUSZN6Ue64SgttEsSdIJbwLoVmEup6ZtpYKhLwg1LyB
 X/yg==
X-Gm-Message-State: AFqh2krBbXbeneXHLpLwwcWL/OjtPqN1A5ryqwrBBiRm1oHUy0ndSKgB
 5GJmmxLwGByPgiL9efLQF1V3BNIstftyD0SP2yMZDGqhieDT49R5d5TZIzU6JMD6l+74waUfsqD
 8hK/X911nfPBEplclyzrHN4L4NTav+hM=
X-Received: by 2002:a4a:d287:0:b0:49f:449a:5f6c with SMTP id
 h7-20020a4ad287000000b0049f449a5f6cmr356510oos.93.1671764298431; 
 Thu, 22 Dec 2022 18:58:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvTjkB7mYQM07EvAF5MRKOIQWtwBGZ19FtayGPZmgDJk0/6CRSzSKyc37LHhEClds6F5GkmqsEyjPAnQyjZ8yI=
X-Received: by 2002:a4a:d287:0:b0:49f:449a:5f6c with SMTP id
 h7-20020a4ad287000000b0049f449a5f6cmr356504oos.93.1671764298212; Thu, 22 Dec
 2022 18:58:18 -0800 (PST)
MIME-Version: 1.0
References: <20221222120813.727830-1-armbru@redhat.com>
 <20221222120813.727830-2-armbru@redhat.com>
In-Reply-To: <20221222120813.727830-2-armbru@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 23 Dec 2022 10:58:06 +0800
Message-ID: <CACGkMEs6R45JkYm294ms33yWJheD0oB6Zs3gvC1d7sv+-oHufA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] include/hw/virtio: Break inclusion loop
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, imammedo@redhat.com, 
 ani@anisinha.ca, peter.maydell@linaro.org, laurent@vivier.eu, 
 edgar.iglesias@gmail.com, Alistair.Francis@wdc.com, bin.meng@windriver.com, 
 palmer@dabbelt.com, marcel.apfelbaum@gmail.com, yangxiaojuan@loongson.cn, 
 gaosong@loongson.cn, richard.henderson@linaro.org, deller@gmx.de, 
 vikram.garhwal@amd.com, francisco.iglesias@amd.com, clg@kaod.org, 
 kraxel@redhat.com, marcandre.lureau@redhat.com, riku.voipio@iki.fi, 
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, 
 crwulff@gmail.com, marex@denx.de, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Thu, Dec 22, 2022 at 8:08 PM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> hw/virtio/virtio.h and hw/virtio/vhost.h include each other.  The
> former doesn't actually need the latter, so drop that inclusion to
> break the loop.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
>  include/hw/virtio/virtio.h | 1 -
>  hw/virtio/virtio-qmp.c     | 1 +
>  hw/virtio/virtio.c         | 1 +
>  3 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index 24561e933a..48ab2117b5 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -22,7 +22,6 @@
>  #include "standard-headers/linux/virtio_config.h"
>  #include "standard-headers/linux/virtio_ring.h"
>  #include "qom/object.h"
> -#include "hw/virtio/vhost.h"
>
>  /*
>   * A guest should never accept this. It implies negotiation is broken
> diff --git a/hw/virtio/virtio-qmp.c b/hw/virtio/virtio-qmp.c
> index 8e7282658f..3d4497da99 100644
> --- a/hw/virtio/virtio-qmp.c
> +++ b/hw/virtio/virtio-qmp.c
> @@ -11,6 +11,7 @@
>
>  #include "qemu/osdep.h"
>  #include "hw/virtio/virtio.h"
> +#include "hw/virtio/vhost.h"
>  #include "virtio-qmp.h"
>
>  #include "standard-headers/linux/virtio_ids.h"
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 289eb71045..0ec6ff9ae4 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -25,6 +25,7 @@
>  #include "qom/object_interfaces.h"
>  #include "hw/core/cpu.h"
>  #include "hw/virtio/virtio.h"
> +#include "hw/virtio/vhost.h"
>  #include "migration/qemu-file-types.h"
>  #include "qemu/atomic.h"
>  #include "hw/virtio/virtio-bus.h"
> --
> 2.38.1
>


