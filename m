Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 794C9425869
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:50:00 +0200 (CEST)
Received: from localhost ([::1]:53936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWal-0004TR-BF
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mYWJl-0005aD-Eq
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:32:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mYWJj-0001c5-TQ
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:32:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633624343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wcPwfok7hlWw1u9zFYAktsrSD7Ftvy7NI8EcJaCkDRQ=;
 b=ZbWrX8BhnuZfcW2MKvWY+TPM3fuHC2B0tKRMdKosGa6YUsbg7sArw8dmbgP5XR3ObPQVWD
 ceh/VihLt3ArYZy/XU+dKjPV4z0KmVYe6D+7zDtr6kssyzKIo/qMwfDR6bxePZxifd9Ce5
 ps41O9IkVFN5VOBQq3rzBEKcXkeXXgk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-NYDYTW3xOsOQFpAoMSVwlQ-1; Thu, 07 Oct 2021 12:32:22 -0400
X-MC-Unique: NYDYTW3xOsOQFpAoMSVwlQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 41-20020adf812c000000b00160dfbfe1a2so1482148wrm.3
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 09:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=wcPwfok7hlWw1u9zFYAktsrSD7Ftvy7NI8EcJaCkDRQ=;
 b=fOtRR62fSfBXQ2E8CA9zb6uKqH9aBTix6Rh3SchcMHXxcb6d4aprSzlcAcfEVX5nT9
 6m+GKonCYVT5ERynNzZ6IbpI+lrmYDGh6SJGmeKpUGzqkLH/CiSckz7XPWO8Hm2vsXBJ
 cGnOZ8GsC9RpXzNruKpmoRhfTwU6ASzbh9jN1AlPZ8q1IRSLDN1I/FPB2Ns+IZSVh6zg
 TZ3j+MY+9WwbNqBIiX3umPJvDssZevVtwzNZC7xt1K4+5gomGklyAYf2doD7rPYxS5ZX
 ue63P3r+t5HhKjpDGabIbep89kQk+gzjNNQneDMlNhMtgp4eqf3vd9spv2zIwxLDHCvK
 6woA==
X-Gm-Message-State: AOAM532mOEAiVzf9MVuyI8ZSYRUCGKOXxoY1a2ZFSYg+opDcVLZzZc+g
 geiIGbuvq5iw90TCCC7Qezgf6Z5C/uiiGUedCp3LLqVnzvXh4wcJu5nELiFC+ianeR3qG/GMy/c
 DBhPr+jj2SebrxIE=
X-Received: by 2002:adf:a294:: with SMTP id s20mr6769435wra.34.1633624341111; 
 Thu, 07 Oct 2021 09:32:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbefLzTot1ul3sotoGqiNbncTZrWTQb+yZf5dmOIwZNZOKtNSfLr3kHeEsTzv/598ehu+SmA==
X-Received: by 2002:adf:a294:: with SMTP id s20mr6769386wra.34.1633624340838; 
 Thu, 07 Oct 2021 09:32:20 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id j1sm101316wrb.56.2021.10.07.09.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 09:32:20 -0700 (PDT)
Date: Thu, 7 Oct 2021 17:32:18 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 14/23] target/i386/sev: Rename sev_i386.h -> sev.h
Message-ID: <YV8hEmSI3Yyociat@work-vm>
References: <20211007161716.453984-1-philmd@redhat.com>
 <20211007161716.453984-15-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211007161716.453984-15-philmd@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, qemu-devel@nongnu.org,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Philippe Mathieu-Daud� (philmd@redhat.com) wrote:
> SEV is a x86 specific feature, and the "sev_i386.h" header
> is already in target/i386/. Rename it as "sev.h" to simplify.
> 
> Patch created mechanically using:
> 
>   $ git mv target/i386/sev_i386.h target/i386/sev.h
>   $ sed -i s/sev_i386.h/sev.h/ $(git grep -l sev_i386.h)
> 
> Signed-off-by: Philippe Mathieu-Daud� <philmd@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  target/i386/{sev_i386.h => sev.h} | 0
>  hw/i386/x86.c                     | 2 +-
>  target/i386/cpu.c                 | 2 +-
>  target/i386/kvm/kvm.c             | 2 +-
>  target/i386/monitor.c             | 2 +-
>  target/i386/sev-stub.c            | 2 +-
>  target/i386/sev-sysemu-stub.c     | 2 +-
>  target/i386/sev.c                 | 2 +-
>  8 files changed, 7 insertions(+), 7 deletions(-)
>  rename target/i386/{sev_i386.h => sev.h} (100%)
> 
> diff --git a/target/i386/sev_i386.h b/target/i386/sev.h
> similarity index 100%
> rename from target/i386/sev_i386.h
> rename to target/i386/sev.h
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 0c7c054e3a0..76de7e2265e 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -47,7 +47,7 @@
>  #include "hw/i386/fw_cfg.h"
>  #include "hw/intc/i8259.h"
>  #include "hw/rtc/mc146818rtc.h"
> -#include "target/i386/sev_i386.h"
> +#include "target/i386/sev.h"
>  
>  #include "hw/acpi/cpu_hotplug.h"
>  #include "hw/irq.h"
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index b54b98551e9..8289dc87bd5 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -26,7 +26,7 @@
>  #include "sysemu/reset.h"
>  #include "sysemu/hvf.h"
>  #include "kvm/kvm_i386.h"
> -#include "sev_i386.h"
> +#include "sev.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-visit-machine.h"
>  #include "qapi/qmp/qerror.h"
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index f25837f63f4..a5f6ff63c81 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -28,7 +28,7 @@
>  #include "sysemu/kvm_int.h"
>  #include "sysemu/runstate.h"
>  #include "kvm_i386.h"
> -#include "sev_i386.h"
> +#include "sev.h"
>  #include "hyperv.h"
>  #include "hyperv-proto.h"
>  
> diff --git a/target/i386/monitor.c b/target/i386/monitor.c
> index ea836678f51..109e4e61c0a 100644
> --- a/target/i386/monitor.c
> +++ b/target/i386/monitor.c
> @@ -32,7 +32,7 @@
>  #include "sysemu/kvm.h"
>  #include "sysemu/sev.h"
>  #include "qapi/error.h"
> -#include "sev_i386.h"
> +#include "sev.h"
>  #include "qapi/qapi-commands-misc-target.h"
>  #include "qapi/qapi-commands-misc.h"
>  #include "hw/i386/pc.h"
> diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
> index 170e9f50fee..7e8b6f9a259 100644
> --- a/target/i386/sev-stub.c
> +++ b/target/i386/sev-stub.c
> @@ -13,7 +13,7 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "sev_i386.h"
> +#include "sev.h"
>  
>  bool sev_enabled(void)
>  {
> diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
> index d556b4f091f..8082781febf 100644
> --- a/target/i386/sev-sysemu-stub.c
> +++ b/target/i386/sev-sysemu-stub.c
> @@ -14,7 +14,7 @@
>  #include "qemu/osdep.h"
>  #include "qapi/qapi-commands-misc-target.h"
>  #include "qapi/error.h"
> -#include "sev_i386.h"
> +#include "sev.h"
>  
>  SevInfo *sev_get_info(void)
>  {
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 5cbbcf0bb93..e43bbf3a17d 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -25,7 +25,7 @@
>  #include "qemu/uuid.h"
>  #include "crypto/hash.h"
>  #include "sysemu/kvm.h"
> -#include "sev_i386.h"
> +#include "sev.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/runstate.h"
>  #include "trace.h"
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


