Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 085DC4A4BA0
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 17:16:29 +0100 (CET)
Received: from localhost ([::1]:39804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEZLt-0005pR-Bf
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 11:16:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nEYzO-0006m3-CV
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 10:53:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nEYzM-0003Gg-VQ
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 10:53:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643644387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NZU1iHaiSTkaMqH8QBAwfDGqj3RCD8y2Zin05CM4oys=;
 b=bpQbDPcXnob4nsu1+uR7YKpmrTfgIdF/hHgeDbqIxoEfOYA9KgGXOvnz4RqLrYJaURkwj2
 Lx6OtjsHx0ZgdhrnheYgpZgfu4NcUS5McLf6cmywNZHQM2zQaGngQwp7zTghP87N6p6z1O
 B+Udp4DDKxoIOXIDUSPP5/iZNhjhIP8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-L2toFyTzMv274LS1lie4rQ-1; Mon, 31 Jan 2022 10:53:06 -0500
X-MC-Unique: L2toFyTzMv274LS1lie4rQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 en7-20020a056402528700b00404aba0a6ffso7160461edb.5
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 07:53:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NZU1iHaiSTkaMqH8QBAwfDGqj3RCD8y2Zin05CM4oys=;
 b=a5RpiMD3RysnFgy8TpolmTfmkEX+Cew7A1LfFID359rSfYdk5dwuikwkZKyAelTXDN
 BwqYc14fjsg8cXxMpjV/hhUOw1/tNBCDikuqhNPvuzZ06hDnK4WuNCPqJ1y5y1L95iJa
 9MTDfK+QqXjhx8AQklcU+4fO1eGSFR+foAyuqM7jEc4Y0Ng5FE+FSpPsfM6ylMEgjJwo
 xQkvZPUa7Rpa+dwxoRvK2l8/+SLLuWBz+4EXpeCLRaUmoAgC7lIzkRL618K2WEC7ReVL
 7vquZ4ixnPZmJOy0jstvWRBObfxCI94smQGxeVeCC9xHZCdy/abGn8Xr70B+g/HJPdJG
 eKzg==
X-Gm-Message-State: AOAM533dAzA2Z/m5iCaK5HJWIrZ5clBNsT2qnxllE+EHDD3q8eJKrKkJ
 B0qZE+GzwgYIibHX99fT680MwddJuHX5ckqX7ehuJl+Aj7rh31rAdF6nvj+u7alKi0vnSxnf2TV
 i08kKB2h8z0oHqNg=
X-Received: by 2002:a05:6402:440c:: with SMTP id
 y12mr21166602eda.75.1643644385293; 
 Mon, 31 Jan 2022 07:53:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQeT5Mfo65sG5coZe3KWNkOZYbArNcMLYHvp7yN0vjVsJrpJr/IEGio50rRwPBluOJl9u5IA==
X-Received: by 2002:a05:6402:440c:: with SMTP id
 y12mr21166572eda.75.1643644385013; 
 Mon, 31 Jan 2022 07:53:05 -0800 (PST)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id d3sm7694772edq.13.2022.01.31.07.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 07:53:04 -0800 (PST)
Date: Mon, 31 Jan 2022 16:53:02 +0100
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 1/2] hw/arm/virt: Fix gic-version=max when
 CONFIG_ARM_GIC_TCG is unset
Message-ID: <20220131155302.ud4kzxxi27zky4jn@gator>
References: <20220131154531.429533-1-eric.auger@redhat.com>
 <20220131154531.429533-2-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220131154531.429533-2-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: lvivier@redhat.com, peter.maydell@linaro.org, thuth@redhat.com,
 f4bug@amsat.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 pbonzini@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 04:45:30PM +0100, Eric Auger wrote:
> In TCG mode, if gic-version=max we always select GICv3 even if
> CONFIG_ARM_GIC_TCG is unset. We shall rather select GICv2.
> This also brings the benefit of fixing qos tests errors for tests
> using gic-version=max with CONFIG_ARM_GIC_TCG unset.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Fixes: a8a5546798c3 ("hw/intc/arm_gicv3: Introduce CONFIG_ARM_GIC_TCG Kconfig selector")
> ---
>  hw/arm/virt.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 141350bf21..2f1d4d0230 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1852,7 +1852,11 @@ static void finalize_gic_version(VirtMachineState *vms)
>          vms->gic_version = VIRT_GIC_VERSION_2;
>          break;
>      case VIRT_GIC_VERSION_MAX:
> +#ifdef CONFIG_ARM_GIC_TCG
>          vms->gic_version = VIRT_GIC_VERSION_3;
> +#else
> +        vms->gic_version = VIRT_GIC_VERSION_2;
> +#endif
>          break;
>      case VIRT_GIC_VERSION_HOST:
>          error_report("gic-version=host requires KVM");
> -- 
> 2.26.3
>

Why is the config generically named "ARM_GIC_TCG" when it only controls
Arm GICV3 TCG?

Otherwise,

Reviewed-by: Andrew Jones <drjones@redhat.com>

Thanks,
drew


