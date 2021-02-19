Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F1432015F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 23:29:39 +0100 (CET)
Received: from localhost ([::1]:52118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDEHK-00075O-91
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 17:29:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDEGW-0006c7-Mr; Fri, 19 Feb 2021 17:28:48 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:45356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDEGU-0000ey-WD; Fri, 19 Feb 2021 17:28:48 -0500
Received: by mail-ed1-x532.google.com with SMTP id p2so12331647edm.12;
 Fri, 19 Feb 2021 14:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1nNAOi90siPQxpVwm9vP9MMnWgA4kt0cwgf4IseqfUI=;
 b=mICzd4/rmg1D37Zf0IzXpDC+DSA8vaL2b7ji1gRZewWNnbQFM9tWvCx1iOGI6OWRsX
 cBqqT2ewvreIgjkZt8QDU/ZvzABffVSaV3OhvcMTMwqdb+B/g9559/MG1THSPf+eIWnA
 LID9KJA/LudGFfAoblzM6g2Epl0rHsqWLd4VVeZ6FahnV9hr7R9kLQn4D13GJwkCDiV8
 HN6rzFWX9L+9qu1dV2asMIWGnXjYRMX8yWD+Rxl+wSXtuEERrxcFl5jz5NoaFePKqEhU
 5dY2I0Fr8RVlfmLRvbtx7qFJ7Ard2BiFtSl9pknbEBm4qM2rrgt10r30BGpGjvs5uAZD
 dvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1nNAOi90siPQxpVwm9vP9MMnWgA4kt0cwgf4IseqfUI=;
 b=bTbCbFW+qkDyEEl9OGuf8cnr8vcJrXD/Z8v5LQUYtmJN5t9hw8vscFIy8WEoHTBJ5j
 bS3I1mr9PIXkoCfRdNMQI0qNiEcYo2JLZY3A/us+zSTeot6HJsBh+3HdHvvOV/xra8kk
 6reVLxXIy8wZ0Wn7YK6VktGgTRlZgML3baiFAXSwol3CoJIF4hRrTcGiN6o7zNUuMbqC
 mEqhVrVmXwvsvQxp+cKs6XQEy0zwNfA9+eZ+jBTsGNbNB2zqWfqeeLUyRapRUecyiOiS
 hmFRvZ+cpTPRons159GiLGMIM0dzRjoz9CKTcT/Dn2iHxKzzOnpU3d7+v2FlCaI1PdZR
 Tf7Q==
X-Gm-Message-State: AOAM530r1S9t1gklzCSJpdZQJbX8QivQFP/AvLY4RTjQIYJWkXbITPH0
 vVtSKRIDhwzVFAUP2bek67E=
X-Google-Smtp-Source: ABdhPJxzoCnqK2etpDm7qDGysHz21aav9qhiId0YOt19rirp+UJ4uP5NTicE6I3lgufeMjFbX7RKGQ==
X-Received: by 2002:a05:6402:1113:: with SMTP id
 u19mr11177255edv.205.1613773725334; 
 Fri, 19 Feb 2021 14:28:45 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i18sm6090440eds.19.2021.02.19.14.28.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 14:28:44 -0800 (PST)
Subject: Re: [PATCH v2 6/8] hw/sd: sd: Actually perform the erase operation
To: Bin Meng <bmeng.cn@gmail.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20210216150225.27996-1-bmeng.cn@gmail.com>
 <20210216150225.27996-7-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1afba402-8a95-db72-6529-0ac40d20b073@amsat.org>
Date: Fri, 19 Feb 2021 23:28:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216150225.27996-7-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x532.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 4:02 PM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> At present the sd_erase() does not erase the requested range of card
> data to 0xFFs. Let's make the erase operation actually happen.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v2:
> - honor the write protection bits for SDSC cards
> 
>  hw/sd/sd.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index f1f98bdec3..b386f16fcb 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -766,6 +766,9 @@ static void sd_erase(SDState *sd)
>      uint64_t erase_start = sd->erase_start;
>      uint64_t erase_end = sd->erase_end;
>      bool sdsc = true;
> +    uint64_t wpnum;
> +    uint64_t erase_addr;
> +    int erase_len = 1 << HWBLOCK_SHIFT;
>  
>      trace_sdcard_erase(sd->erase_start, sd->erase_end);
>      if (sd->erase_start == INVALID_ADDRESS
> @@ -794,17 +797,20 @@ static void sd_erase(SDState *sd)
>      sd->erase_end = INVALID_ADDRESS;
>      sd->csd[14] |= 0x40;
>  
> -    /* Only SDSC cards support write protect groups */
> -    if (sdsc) {
> -        erase_start = sd_addr_to_wpnum(erase_start);
> -        erase_end = sd_addr_to_wpnum(erase_end);
> -
> -        for (i = erase_start; i <= erase_end; i++) {
> -            assert(i < sd->wpgrps_size);
> -            if (test_bit(i, sd->wp_groups)) {
> +    memset(sd->data, 0xff, erase_len);
> +    erase_addr = erase_start;
> +    for (i = 0; i <= (erase_end - erase_start) / erase_len; i++) {
> +        if (sdsc) {
> +            /* Only SDSC cards support write protect groups */
> +            wpnum = sd_addr_to_wpnum(erase_addr);
> +            assert(wpnum < sd->wpgrps_size);
> +            if (test_bit(wpnum, sd->wp_groups)) {
>                  sd->card_status |= WP_ERASE_SKIP;
> +                continue;

So if a group is protected, you skip it but don't increase erase_addr.
If G#4 is protected and G#5 isn't, when you check G#5 you end erasing
G#4.

>              }
>          }
> +        BLK_WRITE_BLOCK(erase_addr, erase_len);
> +        erase_addr += erase_len;
>      }
>  }
>  
> 

