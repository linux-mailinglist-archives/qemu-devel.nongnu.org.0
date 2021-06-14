Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 683A23A63F2
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 13:18:28 +0200 (CEST)
Received: from localhost ([::1]:55002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lskbr-0003pW-F0
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 07:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lskaS-0001zv-RW; Mon, 14 Jun 2021 07:17:01 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lskYV-00027M-K2; Mon, 14 Jun 2021 07:16:59 -0400
Received: by mail-wr1-x436.google.com with SMTP id y7so14107182wrh.7;
 Mon, 14 Jun 2021 04:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n3d9tHd+IqiUYu72+oaH7N2TYt5gJ/TAwPVndbHly6M=;
 b=gbggkXnojyh2LqXuw5xq7l/rP19VLgX++vpAmNy+Edm8RS5n7k3nYDV6sBbmRRSeLv
 kTPrWRAjWPj43ysnMB27Bs1K1FWzQdkBGIsASDo9k7z8+tvTiPQezusle6HK95laOdpt
 3loqQIaPuVvrNmSTQVxN02fTlscfG4YNRLzjKzNbH1wEYQC0RkE1en8Pku998vYWlfh9
 oI6SP64/hr2fFvwy8zPKEr15WWKUs4w9G7wS38Ha7UTHeuzBi1TvTnquwjZCRa/SV1Le
 zmKAEdqLpltWCTucbvIc3hSlUBQJEakpQEfVM42fwcEcOS8hgF3Op9bQ8hfd3xszGq1c
 o76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n3d9tHd+IqiUYu72+oaH7N2TYt5gJ/TAwPVndbHly6M=;
 b=eGLpJ6k2kX43DbyuALPecj/EIALudVTmVI1lGCRVC7C+EfGQw4P8KdyPhkYX+S8D+5
 JICdPR2N8tX8MfcWxgsHR92Qlp2LE3iaQd2maQJSx731nCvrxnicq2yvsyVteC+Lq3pP
 vtHCltrhsX1h4aqmiq104KbViNEJbnyFWwMYcDBt4jPYd9VqID+6vOspLCjT+KVmrj8n
 ux6F9mht6v4qbg1pGH3f5qEevCSmOjC+CrmdOkwrlyYMymG12VB35kd2FbN4yPLPAo+8
 V/I4SWLlsABvR4Os2SP3p+xnmLrN41a9tWK3n2SRaN7fgRHgqNgy+piIqGB9mZadZJsY
 DRWQ==
X-Gm-Message-State: AOAM533mAddD1dphZXKTleawDHIi+uW/Pl0RjaPawvSuimWSTMdUjbA7
 Ni0IZAumCMe3XL26a7o7OvQ=
X-Google-Smtp-Source: ABdhPJyjAae3/jvCByCuYxqX6Ri1zerCA6epq0KAlu2uShr9WXiQc0RCwfgxZBOUaQdaBhVpmuhF7w==
X-Received: by 2002:adf:e389:: with SMTP id e9mr17942343wrm.424.1623669293108; 
 Mon, 14 Jun 2021 04:14:53 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id i16sm12756453wmm.9.2021.06.14.04.14.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 04:14:52 -0700 (PDT)
Subject: Re: [PATCH v2] hw/pci-host/q35: Ignore write of reserved PCIEXBAR
 LENGTH field
To: qemu-devel@nongnu.org
References: <20210526142438.281477-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <602ced9a-757d-f7f5-0ec8-1f8e8cab9a72@amsat.org>
Date: Mon, 14 Jun 2021 13:14:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210526142438.281477-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-stable@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 5/26/21 4:24 PM, Philippe Mathieu-Daudé wrote:
> libFuzzer triggered the following assertion:
> 
>   cat << EOF | qemu-system-i386 -M pc-q35-5.0 \
>     -nographic -monitor none -serial none \
>     -qtest stdio -d guest_errors -trace pci\*
>   outl 0xcf8 0xf2000060
>   outl 0xcfc 0x8400056e
>   EOF
>   pci_cfg_write mch 00:0 @0x60 <- 0x8400056e
>   Aborted (core dumped)
> 
> This is because guest wrote MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_RVD
> (reserved value) to the PCIE XBAR register.
> 
> There is no indication on the datasheet about what occurs when
> this value is written. Simply ignore it on QEMU (and report an
> guest error):
> 
>   pci_cfg_write mch 00:0 @0x60 <- 0x8400056e
>   Q35: Reserved PCIEXBAR LENGTH
>   pci_cfg_read mch 00:0 @0x0 -> 0x8086
>   pci_cfg_read mch 00:0 @0x0 -> 0x29c08086
>   ...
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> BugLink: https://bugs.launchpad.net/qemu/+bug/1878641
> Fixes: df2d8b3ed4 ("q35: Introduce q35 pc based chipset emulator")
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v2: Do not remove default case (rth)
> ---
>  hw/pci-host/q35.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
> index 2eb729dff58..0f37cf056a9 100644
> --- a/hw/pci-host/q35.c
> +++ b/hw/pci-host/q35.c
> @@ -29,6 +29,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/log.h"
>  #include "hw/i386/pc.h"
>  #include "hw/pci-host/q35.h"
>  #include "hw/qdev-properties.h"
> @@ -318,6 +319,8 @@ static void mch_update_pciexbar(MCHPCIState *mch)
>          addr_mask |= MCH_HOST_BRIDGE_PCIEXBAR_64ADMSK;
>          break;
>      case MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_RVD:
> +        qemu_log_mask(LOG_GUEST_ERROR, "Q35: Reserved PCIEXBAR LENGTH\n");
> +        return;
>      default:
>          abort();
>      }
> 

