Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F7334454D
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 14:16:38 +0100 (CET)
Received: from localhost ([::1]:47238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOKQ9-0004ej-TE
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 09:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lOKPE-0004BJ-5t
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:15:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lOKP8-0002IR-Vd
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:15:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616418933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q1T4Hbedi8xQBlDN6tCmYJOv4gLPEBBhWj52oN2mg8I=;
 b=Xt4zeQHyrHfeEAwRhJWToGMAokebBTR9pdmgdc53AGnrjaWKubQI7HHX0fgj0xwxjsOENq
 wBxXBmT2xPOefCNw2WnlH8Bo08bhcLZ98+hNw1r8+HUjnuIB2S5E5gQGfsLUHXaxmvjaGQ
 bq63kBmEafh9LLKv/5tuAtxTqFlzgwQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-LcjNNiPuMUGq7beN1FHLjA-1; Mon, 22 Mar 2021 09:15:29 -0400
X-MC-Unique: LcjNNiPuMUGq7beN1FHLjA-1
Received: by mail-wr1-f71.google.com with SMTP id 75so25798256wrl.3
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 06:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q1T4Hbedi8xQBlDN6tCmYJOv4gLPEBBhWj52oN2mg8I=;
 b=EATT5TGiDMaIliR17UL3V6BOnlNCG2sWslEl+5r/7Hwyfd0cX443Hr/4WTUcvO/5U+
 pEqCQZDt2qCCbHMJpVkj7W87IL9kuyGTgJ+FbjnNAf+q5jy49C8Cy+k8dvrih0hsTBge
 cLsQzcB9hJPmHS6tS/wLsXFVVGaOBnGOwj35oJbhySYMnFzH8ci4/UcmBd2xNghy8wnU
 Updf/PIPGTVikq0zoDc9MmqbR7idlKHOk/yGYY7JgHcnVMt1H069hy8pziSuHwnngmmR
 u0MfP7GOdfLTXCe1cgl6cQJlYgiatYPEVGQ6ppka0JSw3tdUbv9Q2VPuGqcLDv2Mvyeb
 9k3Q==
X-Gm-Message-State: AOAM530zAWpfc6vLz4Zfb6HC0cdnBWC7dEkrE23L9F+HHmuShjKNesPx
 z1v1F/m9LMw/ZTUcUaQXXJNDa6vEbPG1yi0XPm80ZMGiC+qK4eDqkCR7ekXMwxvtr4UJbekza+3
 wgS0szOYG9lvTqP7tyWhtXam12jidAoHe7oySMDwE0Ww9XiTWF+JUifRfM0ROalYq
X-Received: by 2002:a1c:df46:: with SMTP id w67mr15793868wmg.176.1616418927997; 
 Mon, 22 Mar 2021 06:15:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEbc+Oh23Cb+QJ5kELilQdLwy67S0SZGqIKunjopfVz1fLpedwUbMYoHw72yuvIzCnghGxrw==
X-Received: by 2002:a1c:df46:: with SMTP id w67mr15793839wmg.176.1616418927652; 
 Mon, 22 Mar 2021 06:15:27 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id h13sm15895299wmq.29.2021.03.22.06.15.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 06:15:27 -0700 (PDT)
Subject: Re: [PATCH] optionrom/pvh: use memcmp() to find the RSDP signature
To: Stefano Garzarella <sgarzare@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210322114834.166798-1-sgarzare@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <38e9c458-f931-1fa7-3070-8c2d90b543de@redhat.com>
Date: Mon, 22 Mar 2021 14:15:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210322114834.166798-1-sgarzare@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/21 12:48 PM, Stefano Garzarella wrote:
> New versions of gcc report a potential error and there may be alignment
> issues using uint64_t pointer to check the RSDP signature:
> 
>     gcc 10.2.1 "cc (Alpine 10.2.1_pre2) 10.2.1 20210313" reports:
> 
>     pc-bios/optionrom/pvh_main.c: In function 'search_rsdp':
>     pc-bios/optionrom/pvh_main.c:61:21: warning: comparison is always false
>     due to limited range of data type [-Wtype-limits]
>        61 |         if (*rsdp_p == RSDP_SIGNATURE) {
>           |                     ^~
> 
> Let's use memcmp() to get more readable code and avoid these issues.
> Since pvh optionrom is baremetal, we use the compiler's __builtin_memcmp.
> 
> Reported-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  pc-bios/optionrom/pvh_main.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/pc-bios/optionrom/pvh_main.c b/pc-bios/optionrom/pvh_main.c
> index 28e79d7fc4..12202e38c2 100644
> --- a/pc-bios/optionrom/pvh_main.c
> +++ b/pc-bios/optionrom/pvh_main.c
> @@ -27,7 +27,8 @@ asm (".code32"); /* this code will be executed in protected mode */
>  #include "optrom_fw_cfg.h"
>  #include "../../include/hw/xen/start_info.h"
>  
> -#define RSDP_SIGNATURE          0x2052545020445352LL /* "RSD PTR " */
> +#define RSDP_SIGNATURE          "RSD PTR "
> +#define RSDP_SIGNATURE_SIZE     8
>  #define RSDP_AREA_ADDR          0x000E0000
>  #define RSDP_AREA_SIZE          0x00020000
>  #define EBDA_BASE_ADDR          0x0000040E
> @@ -53,12 +54,14 @@ static uint8_t cmdline_buffer[CMDLINE_BUFSIZE];
>  /* Search RSDP signature. */
>  static uintptr_t search_rsdp(uint32_t start_addr, uint32_t end_addr)
>  {
> -    uint64_t *rsdp_p;
> +    char rsdp_signature[RSDP_SIGNATURE_SIZE] = RSDP_SIGNATURE;

static const?

> +    char *rsdp_p;
>  
>      /* RSDP signature is always on a 16 byte boundary */
> -    for (rsdp_p = (uint64_t *)start_addr; rsdp_p < (uint64_t *)end_addr;
> -         rsdp_p += 2) {
> -        if (*rsdp_p == RSDP_SIGNATURE) {
> +    for (rsdp_p = (char *)start_addr; rsdp_p < (char *)end_addr;
> +         rsdp_p += 16) {
> +        if (__builtin_memcmp(rsdp_p, rsdp_signature,
> +                             RSDP_SIGNATURE_SIZE) == 0) {
>              return (uintptr_t)rsdp_p;
>          }
>      }
> 


