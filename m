Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B26E3768EA
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 18:38:20 +0200 (CEST)
Received: from localhost ([::1]:48020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf3UY-000250-Eh
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 12:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lf3R6-00019d-ML
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:34:44 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:33539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lf3R5-0001iI-4T
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:34:44 -0400
Received: by mail-pf1-x433.google.com with SMTP id h11so8194764pfn.0
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 09:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PhWuEeuWy3qF/DGwLPLgwdqrMippxdal9/MJwdbG97A=;
 b=PhtylubSW/ufOBanLyXLPgVvfePF3tU1qI9Uix+sXguCNza0LdhD6rf/3F2m7/bhnQ
 ZbmDj1n5ZA86crPAIndD3cOMAw6S2+EsDX1pHL2745sixVaFfynjCe9Y2tmY8lpPLdMo
 dN/+6Jrn0oZRPdmL3QIBmyuf0P2Zydt/O9KBIgdwQlkX72wEuWgydao/4Q+h9wb6+ajI
 p0aQgU8VJ8GLHu3DiYeTBJCSIP76h+8yeIBP6eMhwl/BhhTNhLZ1nJt0/Qx/Nwolib06
 zGHrYu3osJhVZ/o/rsVb9DEgQOTjyA3YOqPTUM7djpC2RDVEX+28G1SR+ZBqTpyKlY/x
 X3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PhWuEeuWy3qF/DGwLPLgwdqrMippxdal9/MJwdbG97A=;
 b=oaqWCW02mpOmZJfOpIpZb1WZGTyXwbURGNJH+ioMGkHTpTK7ggUx+Rpt4qd9qBobFK
 oAKafDDgbtSVwqewypJL98gITnwNsk83RumyJqVzuav5LlXdN6RYUUMM2v2r/6lrYxVV
 8RMZIdLYGLGg44feglR7SW7cONWVOn85kHHjTMVlKaMu+1iiVCWy00kiaKB6r6Tyyo8r
 MAoDbPwuNjhO4PAND6Ux4X1B/adgthjHBd7MDNmPFRLFokdulBE+ZdTx527kw3Pm6BSd
 6OlJ/AGXr1NN4eeHXBfg6s9XXxEXTQZSjiPKQbkGR2dhEPuk1Hyc6jbS9SjhQVopeq7Q
 Eyxw==
X-Gm-Message-State: AOAM530QlYmjVC3D9Br2VlY09+zZErNwM5/BustL/H2fqsEDNxXO4SvI
 27bOhHSx9Veaou7T7+hJc4I7Fw==
X-Google-Smtp-Source: ABdhPJx7soKB1UE3Y80kGXbqEHlbbvEm8V3GnzJZvKeXj46n9zB9wQi34c2sJAZPgK31T26vUlwi5w==
X-Received: by 2002:a63:2c81:: with SMTP id
 s123mr10768453pgs.168.1620405281722; 
 Fri, 07 May 2021 09:34:41 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id s13sm5140395pfd.79.2021.05.07.09.34.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 09:34:41 -0700 (PDT)
Subject: Re: [PATCH 13/23] hw/usb/hcd-xhci: Avoid dynamic stack allocation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-14-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f98724dd-8494-8c32-48f7-b180a3155421@linaro.org>
Date: Fri, 7 May 2021 09:34:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210505211047.1496765-14-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 2:10 PM, Philippe Mathieu-Daudé wrote:
> Use autofree heap allocation instead of variable-length
> array on the stack.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   hw/usb/hcd-xhci.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
> index 7acfb8137bc..59a267e3c8b 100644
> --- a/hw/usb/hcd-xhci.c
> +++ b/hw/usb/hcd-xhci.c
> @@ -2387,7 +2387,7 @@ static void xhci_detach_slot(XHCIState *xhci, USBPort *uport)
>   static TRBCCode xhci_get_port_bandwidth(XHCIState *xhci, uint64_t pctx)
>   {
>       dma_addr_t ctx;
> -    uint8_t bw_ctx[xhci->numports+1];
> +    g_autofree uint8_t *bw_ctx = g_malloc(xhci->numports + 1);


There is a later use of sizeof(bw_ctx), which is now broken.

Also, I think you might as well remove this buffer entirely and use the address 
space memset routine you recently added.


r~

