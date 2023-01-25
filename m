Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2C367B69D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 17:09:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKiKC-0005un-O8; Wed, 25 Jan 2023 11:08:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pKiK3-0005tb-VO
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 11:08:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pKiK1-0000gW-8R
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 11:08:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674662904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zpwAIyrPSy2F0HzrnW9q7eFrDeA8WA5yRsenGqbWAXU=;
 b=dtXsoef9hnn5EmvVMlEtGyIOSdzci47kS43ApbzGRfp1EZqBenxNUHPMJ7uKomdLlZWQV9
 9TlBrg0W5fZMPCcdL7PnlI2mS1A7SUE4vAQUflEUWWlIBDEX9uhsqs4C88fqZLNSLdDk3t
 a+wPUZo7T4lHnwxS1s7dnow6AkdJs10=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-574-_MR528jeM4az6Hqpwj3TEQ-1; Wed, 25 Jan 2023 11:08:21 -0500
X-MC-Unique: _MR528jeM4az6Hqpwj3TEQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 l17-20020a056402255100b00472d2ff0e59so13236810edb.19
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 08:08:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zpwAIyrPSy2F0HzrnW9q7eFrDeA8WA5yRsenGqbWAXU=;
 b=0XFV4kcuqyPY3/7gqef3R2BlO9lBE4g6tnR6DKGeuiWe5+GMo7u2oiU8jLS8BFnFMg
 crwkKgcHbx+8MFm3jYEGhcg4MlYK5kMyNcwr7Ru2Qyc3FSECB+gWWrYW1iysy3r9wAdz
 nnxHo01kZg9vbxVOPFMZwYAKswsrVbKWdYI69Wk1g9maE7Nm7CbhRILuMz/cUx9pj92L
 KtNyLlTer8JVnV7qilpvqD6UV06Nm3M245YNhaKs412tGHRT5sbh0M8RjTXj6VPe4T2K
 FbUagKIjUeWSq4Kdhds+thnyTWyfFTMA/7g8FC+4oZQUPyJ8bEkDyCRFAj00lwCYS082
 Rtpg==
X-Gm-Message-State: AFqh2kpxCCg7dKtyQ8XoBEAJ18nXUlcG6sPWYS9nEuHEcVy6ulabjaEZ
 B17CDVdfO3h04kZOQh/tvHpzgPOn+IPaaNVRwgCQgq0qX+N/FWlgtOyR8RZVthlJZo8fQ9r0wjt
 jiyYF9J3o8x1GOaI=
X-Received: by 2002:a17:906:4d0a:b0:84d:3e38:2f0c with SMTP id
 r10-20020a1709064d0a00b0084d3e382f0cmr47598253eju.67.1674662899871; 
 Wed, 25 Jan 2023 08:08:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv81MJy4i/t7D7PYWTBxudwh9gbU6L+qeZ/JZZPOgoko7ZQflVdyvM5CuqcdAtZ3DRpIiMbfw==
X-Received: by 2002:a17:906:4d0a:b0:84d:3e38:2f0c with SMTP id
 r10-20020a1709064d0a00b0084d3e382f0cmr47598237eju.67.1674662899603; 
 Wed, 25 Jan 2023 08:08:19 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 p9-20020a170906614900b0084d43def70esm2539515ejl.25.2023.01.25.08.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 08:08:19 -0800 (PST)
Date: Wed, 25 Jan 2023 17:08:18 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Ani Sinha
 <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>, Aurelien Jarno
 <aurelien@aurel32.net>
Subject: Re: [PATCH 6/7] hw/acpi: Trace GPE access in all device models, not
 just PIIX4
Message-ID: <20230125170818.3013d56c@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230122170724.21868-7-shentey@gmail.com>
References: <20230122170724.21868-1-shentey@gmail.com>
 <20230122170724.21868-7-shentey@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Sun, 22 Jan 2023 18:07:23 +0100
Bernhard Beschow <shentey@gmail.com> wrote:

> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/core.c       | 5 +++++
>  hw/acpi/piix4.c      | 3 ---
>  hw/acpi/trace-events | 8 ++++----
>  3 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> index 6da275c599..a33e410e69 100644
> --- a/hw/acpi/core.c
> +++ b/hw/acpi/core.c
> @@ -32,6 +32,7 @@
>  #include "qemu/module.h"
>  #include "qemu/option.h"
>  #include "sysemu/runstate.h"
> +#include "trace.h"
>  
>  struct acpi_table_header {
>      uint16_t _length;         /* our length, not actual part of the hdr */
> @@ -686,6 +687,8 @@ void acpi_gpe_ioport_writeb(ACPIREGS *ar, uint32_t addr, uint32_t val)
>  {
>      uint8_t *cur;
>  
> +    trace_acpi_gpe_ioport_writeb(addr, val);
> +
>      cur = acpi_gpe_ioport_get_ptr(ar, addr);
>      if (addr < ar->gpe.len / 2) {
>          /* GPE_STS */
> @@ -709,6 +712,8 @@ uint32_t acpi_gpe_ioport_readb(ACPIREGS *ar, uint32_t addr)
>          val = *cur;
>      }
>  
> +    trace_acpi_gpe_ioport_readb(addr, val);
> +
>      return val;
>  }
>  
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 836f9026b1..b65ddb8e44 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -45,7 +45,6 @@
>  #include "hw/acpi/acpi_dev_interface.h"
>  #include "migration/vmstate.h"
>  #include "hw/core/cpu.h"
> -#include "trace.h"
>  #include "qom/object.h"
>  
>  #define GPE_BASE 0xafe0
> @@ -510,7 +509,6 @@ static uint64_t gpe_readb(void *opaque, hwaddr addr, unsigned width)
>      PIIX4PMState *s = opaque;
>      uint32_t val = acpi_gpe_ioport_readb(&s->ar, addr);
>  
> -    trace_piix4_gpe_readb(addr, width, val);
>      return val;
>  }
>  
> @@ -519,7 +517,6 @@ static void gpe_writeb(void *opaque, hwaddr addr, uint64_t val,
>  {
>      PIIX4PMState *s = opaque;
>  
> -    trace_piix4_gpe_writeb(addr, width, val);
>      acpi_gpe_ioport_writeb(&s->ar, addr, val);
>      acpi_update_sci(&s->ar, s->irq);
>  }
> diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
> index 78e0a8670e..159937ddb9 100644
> --- a/hw/acpi/trace-events
> +++ b/hw/acpi/trace-events
> @@ -17,6 +17,10 @@ mhp_acpi_clear_remove_evt(uint32_t slot) "slot[0x%"PRIx32"] clear remove event"
>  mhp_acpi_pc_dimm_deleted(uint32_t slot) "slot[0x%"PRIx32"] pc-dimm deleted"
>  mhp_acpi_pc_dimm_delete_failed(uint32_t slot) "slot[0x%"PRIx32"] pc-dimm delete failed"
>  
> +# core.c
> +acpi_gpe_ioport_readb(uint32_t addr, uint8_t val) "addr: 0x%" PRIx32 " ==> 0x%" PRIx8
> +acpi_gpe_ioport_writeb(uint32_t addr, uint8_t val) "addr: 0x%" PRIx32 " <== 0x%" PRIx8
> +
>  # cpu.c
>  cpuhp_acpi_invalid_idx_selected(uint32_t idx) "0x%"PRIx32
>  cpuhp_acpi_read_flags(uint32_t idx, uint8_t flags) "idx[0x%"PRIx32"] flags: 0x%"PRIx8
> @@ -48,10 +52,6 @@ acpi_pci_sel_read(uint32_t val) "%" PRIu32
>  acpi_pci_ej_write(uint64_t addr, uint64_t data) "0x%" PRIx64 " <== %" PRIu64
>  acpi_pci_sel_write(uint64_t addr, uint64_t data) "0x%" PRIx64 " <== %" PRIu64
>  
> -# piix4.c
> -piix4_gpe_readb(uint64_t addr, unsigned width, uint64_t val) "addr: 0x%" PRIx64 " width: %d ==> 0x%" PRIx64
> -piix4_gpe_writeb(uint64_t addr, unsigned width, uint64_t val) "addr: 0x%" PRIx64 " width: %d <== 0x%" PRIx64
> -
>  # tco.c
>  tco_timer_reload(int ticks, int msec) "ticks=%d (%d ms)"
>  tco_timer_expired(int timeouts_no, bool strap, bool no_reboot) "timeouts_no=%d no_reboot=%d/%d"


