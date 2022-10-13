Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E90B5FDF27
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 19:40:56 +0200 (CEST)
Received: from localhost ([::1]:55064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj2CV-0005AM-8n
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 13:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oj25n-0001Qj-9X
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 13:34:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oj25Y-0008GH-Ct
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 13:33:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665682419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mQCBEtPrLUnUdMQk4VuE5iGpnh0hhrHyo6hbmOyKyMg=;
 b=ScY3zsmuXICFYxT7XY2EKo+abSQzn2rONCrVY5VLt1URNRIhhcH6fFLFSQr9KPRas4EBrA
 WMbHcPkLJ5hhu0KcRyVeNHv7mWXBdyDNEQ9XyuxXrj4NRrY5HYCqpT8oAUcxG9ipz5KZ5J
 +yxfYVc/3yHjO8Iw0+exI2PaGBwVSYw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-259-koaOlrloMnu4fGv9fgmIFg-1; Thu, 13 Oct 2022 13:33:30 -0400
X-MC-Unique: koaOlrloMnu4fGv9fgmIFg-1
Received: by mail-wm1-f72.google.com with SMTP id
 n19-20020a7bcbd3000000b003c4a72334e7so1131175wmi.8
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 10:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mQCBEtPrLUnUdMQk4VuE5iGpnh0hhrHyo6hbmOyKyMg=;
 b=vDZ92NHfciVwpsTe0+INrdJUIiPmco5Bh69Q4pmaE+VEzkS2QsxDAmgxJXrgM6ceiq
 gojrXAMUaAp8dGxyJ8S8lsVX+VH0KI+s9DmDWNaL6g+v/0h/ShzVOYeIoNbNVdCfUlTQ
 VOkOCp9d7x4iEyTFDC3WIcba2zZttbdcaig2mjbA8B8R2Yg5q7rM377plspH+9vKxZXb
 /Fb6QOb03MrV/UlT0pvD+HfeywYoBIbX+A2DdbQa8BJyIa+2S4DjKifeyNxns6a/RXsX
 DFkbB50HhQDCzzlHNVL7RqXv6oA92QtqFCmASVrMpvYlwIeMJeoWCC0V3Dp+oXzX9BlB
 lncQ==
X-Gm-Message-State: ACrzQf1qFxcZM4S4PG22v1ZC4gHgV3k4ADYjLcw9DygI2M6Ul03QNUCB
 gQV5YvXiBLkOhQJz41lTLX4YT9ZBWBSE9Dh84cAUxBShW0a38GSzS40H8Jb9i6xBJeqC5ZsjWyj
 Hglqr3OqCoOsFBU8=
X-Received: by 2002:a1c:ed0b:0:b0:3c1:d16e:a827 with SMTP id
 l11-20020a1ced0b000000b003c1d16ea827mr641740wmh.127.1665682409251; 
 Thu, 13 Oct 2022 10:33:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5dsxdrf5bN+HVc+7ul3HQsy85ZwWkBAGgXny3x5rsbozZ4H4358Hab2aR8RgZmLHUGrGTdxA==
X-Received: by 2002:a1c:ed0b:0:b0:3c1:d16e:a827 with SMTP id
 l11-20020a1ced0b000000b003c1d16ea827mr641724wmh.127.1665682409011; 
 Thu, 13 Oct 2022 10:33:29 -0700 (PDT)
Received: from redhat.com ([2.54.162.123]) by smtp.gmail.com with ESMTPSA id
 bd21-20020a05600c1f1500b003b95ed78275sm106997wmb.20.2022.10.13.10.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 10:33:28 -0700 (PDT)
Date: Thu, 13 Oct 2022 13:33:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH] hw/i386: Use device_cold_reset() to reset the APIC
Message-ID: <20221013133311-mutt-send-email-mst@kernel.org>
References: <20221013171926.1447899-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013171926.1447899-1-peter.maydell@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Oct 13, 2022 at 06:19:26PM +0100, Peter Maydell wrote:
> The semantic difference between the deprecated device_legacy_reset()
> function and the newer device_cold_reset() function is that the new
> function resets both the device itself and any qbuses it owns,
> whereas the legacy function resets just the device itself and nothing
> else.
> 
> The pc_machine_reset() and microvm_machine_reset() functions use
> device_legacy_reset() to reset the APIC; this is an APICCommonState
> and does not have any qbuses, so for this purpose the two functions
> behave identically and we can stop using the deprecated one.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
> NB: tested only with 'make check' and 'make check-avocado'
> 
>  hw/i386/microvm.c | 2 +-
>  hw/i386/pc.c      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index 7fe8cce03e9..0b08010bf0a 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -486,7 +486,7 @@ static void microvm_machine_reset(MachineState *machine)
>          cpu = X86_CPU(cs);
>  
>          if (cpu->apic_state) {
> -            device_legacy_reset(cpu->apic_state);
> +            device_cold_reset(cpu->apic_state);
>          }
>      }
>  }
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 566accf7e60..2b2d0bc2b33 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1860,7 +1860,7 @@ static void pc_machine_reset(MachineState *machine)
>          cpu = X86_CPU(cs);
>  
>          if (cpu->apic_state) {
> -            device_legacy_reset(cpu->apic_state);
> +            device_cold_reset(cpu->apic_state);
>          }
>      }
>  }
> -- 
> 2.25.1


