Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B533B0F11
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 22:57:48 +0200 (CEST)
Received: from localhost ([::1]:34446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvnSt-00018M-5w
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 16:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lvnR5-0000LJ-5z
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 16:55:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lvnR1-0001VA-Pz
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 16:55:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624395346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1o6d8NQBorMfPvO0g6PWANfl616WFajt38EEyIjj0X8=;
 b=YkCcT+3AcdIfw4VRfza/B1f9kxP9AQNXwXTao1mzce7iGWgB0cmBrRC9tlFDCafSp5f+B9
 Csm0WbOkJR2d3zh44gRswd9lZUZQZOhIgkXFNiufy8buZUVU08CFxfCAT+u/tXHpYenF5V
 DmA0GOgxKkskR/S0GC0OzamivK1JXhI=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-AuUP1DQnMlW5MagkKWe08Q-1; Tue, 22 Jun 2021 16:55:45 -0400
X-MC-Unique: AuUP1DQnMlW5MagkKWe08Q-1
Received: by mail-ot1-f71.google.com with SMTP id
 v9-20020a0568301bc9b02904494d2869f2so10978676ota.20
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 13:55:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1o6d8NQBorMfPvO0g6PWANfl616WFajt38EEyIjj0X8=;
 b=kCkwMpqHvsFgkOo/Mw2c3gQolDkd7u84htMAgg1VM1p77ziWHiSmvADPBlt52Oo9mD
 RMb1oMKSd3t14jIkd1oMUda1kZcEtEDC1kcHGIV23+6r2Rg8lJt2IDtd8mxP0TTgCKXh
 mDNpwp5JpNz3kfsK3v8u7fUHUvsiEOBac4IOaBAd/IG/yCSVghgcM3Z8lqWGycnA58Vq
 tzGb6rBXWxUFMIuHisv54IRXGgloEgidzPtwYs3e/GBokFY1nUxMuFpiAvgeJs2HD5SB
 hZUWNX+QebGPtGdXLDqRWSDRB8u0f2lcRPr6N1abfjaL0kLgXpQHkVy2ZI1PB+55XyVE
 a3sQ==
X-Gm-Message-State: AOAM530DpiABqedqnOS2CxG50pGoQ5hcrC2AJ00XB0vzPJIFzJaKAUAp
 xxEuGTgPFM5u7Nk3NhS6qNj6BWBaDngDWDfW9I8V4H6ujk6kfUyqc2yvQQG7+JWEm39y0m1+Vv/
 y8LvohxatX05nBy0=
X-Received: by 2002:aca:b485:: with SMTP id d127mr568300oif.46.1624395344329; 
 Tue, 22 Jun 2021 13:55:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysnZO0dTNnr6JtEn0KMrLfRUBv5a4/9LxcCezijk+2RlQ+dkeVZjTuV7FqbGJUYMyauJua+Q==
X-Received: by 2002:aca:b485:: with SMTP id d127mr568283oif.46.1624395344141; 
 Tue, 22 Jun 2021 13:55:44 -0700 (PDT)
Received: from [192.168.0.173] (ip68-102-25-99.ks.ok.cox.net. [68.102.25.99])
 by smtp.gmail.com with ESMTPSA id
 u17sm728691oof.42.2021.06.22.13.55.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 13:55:43 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] x86/sev: generate SEV kernel loader hashes in
 x86_load_linux
To: Dov Murik <dovmurik@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210621190553.1763020-1-dovmurik@linux.ibm.com>
 <20210621190553.1763020-3-dovmurik@linux.ibm.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <85acff2f-367f-8ef1-a830-ba367daf17d7@redhat.com>
Date: Tue, 22 Jun 2021 15:55:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210621190553.1763020-3-dovmurik@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/21 2:05 PM, Dov Murik wrote:
> If SEV is enabled and a kernel is passed via -kernel, pass the hashes of
> kernel/initrd/cmdline in an encrypted guest page to OVMF for SEV
> measured boot.
> 
> Co-developed-by: James Bottomley <jejb@linux.ibm.com>
> Signed-off-by: James Bottomley <jejb@linux.ibm.com>
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> ---
>  hw/i386/x86.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index ed796fe6ba..5c46463d9f 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -45,6 +45,7 @@
>  #include "hw/i386/fw_cfg.h"
>  #include "hw/intc/i8259.h"
>  #include "hw/rtc/mc146818rtc.h"
> +#include "target/i386/sev_i386.h"
>  
>  #include "hw/acpi/cpu_hotplug.h"
>  #include "hw/irq.h"
> @@ -778,6 +779,7 @@ void x86_load_linux(X86MachineState *x86ms,
>      const char *initrd_filename = machine->initrd_filename;
>      const char *dtb_filename = machine->dtb;
>      const char *kernel_cmdline = machine->kernel_cmdline;
> +    KernelLoaderContext kernel_loader_context = {};
>  
>      /* Align to 16 bytes as a paranoia measure */
>      cmdline_size = (strlen(kernel_cmdline) + 16) & ~15;
> @@ -924,6 +926,8 @@ void x86_load_linux(X86MachineState *x86ms,
>      fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_ADDR, cmdline_addr);
>      fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, strlen(kernel_cmdline) + 1);
>      fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline);
> +    kernel_loader_context.cmdline_data = (char *)kernel_cmdline;
> +    kernel_loader_context.cmdline_size = strlen(kernel_cmdline) + 1;

I just wanted to check my understanding: I'm guessing you didn't set
`kernel_loader_context.cmdline_size` to `cmdline_size` (defined above)
so guest owners don't have to be aware of whatever alignment precaution
QEMU takes when producing their own measurement, right?

Otherwise:

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>


