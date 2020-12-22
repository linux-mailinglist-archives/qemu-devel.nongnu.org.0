Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E00FF2E0BE9
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 15:38:36 +0100 (CET)
Received: from localhost ([::1]:48738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krio7-0007Bw-NT
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 09:38:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kribx-00021R-Kc; Tue, 22 Dec 2020 09:26:01 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:36281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kribw-00072w-0G; Tue, 22 Dec 2020 09:26:01 -0500
Received: by mail-ej1-x630.google.com with SMTP id lt17so18499550ejb.3;
 Tue, 22 Dec 2020 06:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=riTTfBizsrSLCiciT4MbJWXTOyfBWrVSrrfndUPTjVU=;
 b=eqDRIX6icAEBtzNBvrHm5kdl6au5g5Y9TH6bc5Kwg/hG9V4k2DBCxalZDGAk0H4c1x
 FvWrHa4E1w63DelzEmhACN8BvOsQaUlcgW3t4oFRVwcmJhQKPnC0HZAs7S/fqiFKVbbL
 d1dQYrkV2KIL9tAQRi5FoRWNAgR0IHxW+ybJUGllwprRirlhK1oqKbiRFKICXh49jIZJ
 F6cCNQChSk8jrhXzFFjgmz2ym4wxWIUx5pzq8lJSZp3Ux4EI06e7y754SRENsUenGfB1
 Y89zYPnj+kscs4HpXBG/292fpt6ygWGIi5L8nkcoHdNvS2TCk/35D7ocFt+YD4N9OHbi
 KI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=riTTfBizsrSLCiciT4MbJWXTOyfBWrVSrrfndUPTjVU=;
 b=LEWKa4u0e5YNEn0vDPr5VYCZUw+j2HrTRdfsFFqjDpiCpeXzZRGRv8REKXfzTiLFS1
 MUyNXHdAna2eeoCw42hFl/BORURTc63aCA+pnnBcVOkEPuhfstUqc2qCsN9dpDqIeQkT
 oEbVWGXWuT9QqEp1cYWJ6Tp64kiilSsTVJ/idyGX/y9moEIzR1zxF1zuEydFBvrUynYq
 PRYMqZGqEgxpmS0dcv0QSzwiy3qk5HfFBzbFdG8FgMQWLc90x14lF3toQSvWoCFTvQeg
 7M+FnUdM8i0dQsMOPTEMzty5UJN6ZiwY56EQSgXoDW5qnKtHrDHqspVUHKkgmugmo0Km
 6j+g==
X-Gm-Message-State: AOAM532gkL5EcPR7TmVFZdtAwR5vBIsEOG2hak4OdGbYtaXLBzExOZ1C
 od6oF9ELSCRnzdBO4o9/eH4=
X-Google-Smtp-Source: ABdhPJwfPDoC7umDbGtStxicioH5Jvhwv6eQggSvJAWnOj10Ib5zXzpC4uML+E5tLWmq0mbpS4AjUg==
X-Received: by 2002:a17:906:4050:: with SMTP id
 y16mr19453760ejj.537.1608647158153; 
 Tue, 22 Dec 2020 06:25:58 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id z9sm10476913eju.123.2020.12.22.06.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Dec 2020 06:25:56 -0800 (PST)
Subject: Re: [PATCH v4 1/2] hw/block: m25p80: Don't write to flash if write is
 disabled
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Francisco Iglesias <frasse.iglesias@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <1608619520-62782-1-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b13fb344-f2f2-f114-67bc-8e6f4f403539@amsat.org>
Date: Tue, 22 Dec 2020 15:25:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1608619520-62782-1-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.521,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/22/20 7:45 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> When write is disabled, the write to flash should be avoided
> in flash_write8().
> 
> Fixes: 82a2499011a7 ("m25p80: Initial implementation of SPI flash device")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - new patch: honor write enable flag in flash write
> 
>  hw/block/m25p80.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 483925f..236e1b4 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -594,6 +594,7 @@ void flash_write8(Flash *s, uint32_t addr, uint8_t data)
>  
>      if (!s->write_enable) {
>          qemu_log_mask(LOG_GUEST_ERROR, "M25P80: write with write protect!\n");
> +        return;
>      }
>  
>      if ((prev ^ data) & data) {
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

