Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F02C031C6E2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 08:35:42 +0100 (CET)
Received: from localhost ([::1]:51552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lButa-0003fr-0I
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 02:35:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBura-0002qW-Rf
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 02:33:40 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBurZ-0003k2-HW
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 02:33:38 -0500
Received: by mail-wr1-x430.google.com with SMTP id n6so11776363wrv.8
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 23:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c6zTZrnzpLLuEToAr5hQjRBJqzrI+7ZFu+LcmPzx1r0=;
 b=C8M+NDhvNg1iST5CCtB5hBTxnsJ9NUfIBUFmoDD3SDwtal0egsVMW1nvrLC7wQzqDz
 6hti7sivqTwiM93UUmutuILifFQx16pH2Y6bQgaii+RuLUNVNJh//7elMzAi/Al+1M8b
 QAwKnDAm76Fm5bFK6cR21Q4+vhJ74i0vyEI56BwEOExOFwWRAJIR1whAgnISawmewvag
 5bhiqrrh/SIP2sSQbszhxa1k/EhTqsq2GvCcjU1dkmdI8DXRzqktjmTHpZTLIW/1dgm3
 4oWNGGYOZiH3LZwpFJCNvucHD9taYxzpTjDuGwygWzLKosqIkAEoQ5+J58inY/Nwq/OF
 tEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c6zTZrnzpLLuEToAr5hQjRBJqzrI+7ZFu+LcmPzx1r0=;
 b=J/F3P76YUW4HFKZyyTLT/XQcRYToA3JvWa8J9bQSeNtnB92RC8qHtgjSuLZSEnfhjv
 lGLYpCaew6JTHuLu+XjpOTAdvEQsrNl0dvTrEM57k8mDEUyRQfulaiQYpaP5liPBuRyB
 /nWVTiPH+qXPfbfEIEOqByH24W8INI0KKPU70DeSkwyc4YKcUUSKMJ8oIs159TZ9dBmd
 2NcSLt0Mco06kWPs1bXZLEqNnF9d4tVpZMV838bb2m8eSGpDr22F1o56zhE+k4CTdsUc
 dIzjxBpWIvXf6v7dEL28KTNFVTau2KigF0G8dWFXVEuU0mo6a791v7PXrDcZdcWv0/mT
 U5ow==
X-Gm-Message-State: AOAM533OkKH2NXPdW7/yj30eixFNg24ZFtZa3rdr8U/4xgVHcKMIpJap
 306zKRIOy+DeVSb+tMV+tbw=
X-Google-Smtp-Source: ABdhPJyMxJVsRhRmvk6oW4V0wIPOoFbB8DGHN9wY73Hi7oF1Zt0QyyK/ObBrHIqEMpA1sdMZydWKSA==
X-Received: by 2002:a5d:68c8:: with SMTP id p8mr22410978wrw.370.1613460815999; 
 Mon, 15 Feb 2021 23:33:35 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m2sm2109335wml.34.2021.02.15.23.33.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 23:33:35 -0800 (PST)
Subject: Re: [PATCH v2 11/42] esp: apply transfer length adjustment when STC
 is zero at TC load time
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-12-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <215d5901-e5d9-fe70-1b46-5baadb7048df@amsat.org>
Date: Tue, 16 Feb 2021 08:33:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-12-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 8:29 PM, Mark Cave-Ayland wrote:
> Perform the length adjustment whereby a value of 0 in the STC represents
> a transfer length of 0x10000 at the point where the TC is loaded at the

0x10000 -> 64 KiB?

> start of a DMA command rather than just when a TI (Transfer Information)
> command is executed. This better matches the description as given in the
> datasheet.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index a1acc2c9bd..02b7876394 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -562,9 +562,6 @@ static void handle_ti(ESPState *s)
>      }
>  
>      dmalen = esp_get_tc(s);
> -    if (dmalen == 0) {
> -        dmalen = 0x10000;
> -    }
>      s->dma_counter = dmalen;
>  
>      if (s->do_cmd) {
> @@ -699,7 +696,11 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
>          if (val & CMD_DMA) {
>              s->dma = 1;
>              /* Reload DMA counter.  */
> -            esp_set_tc(s, esp_get_stc(s));
> +            if (esp_get_stc(s) == 0) {
> +                esp_set_tc(s, 0x10000);

0x10000 -> 64 * KiB

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

