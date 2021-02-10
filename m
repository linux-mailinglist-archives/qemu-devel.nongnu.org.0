Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1683173B7
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:53:38 +0100 (CET)
Received: from localhost ([::1]:45504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9yMb-0000Yv-To
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:53:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9yKd-000885-7K
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:51:35 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:34206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9yKb-0001qG-L4
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:51:35 -0500
Received: by mail-ed1-x531.google.com with SMTP id df22so4985422edb.1
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=R8iv2jfaEYKd7FJEJrRj/qCV9ecguFtfufjR7tkooVE=;
 b=NjPO/i5l+jCcWvOoRzO6mkkymafDKX7RvS1gCKxoKomzGqX2zYCQv8v4Su1/WaCdmO
 ptXCpvH4LyuqbakqJYdq7aHWVb24dkUhf3G0oBFGiqdAKlrnFzzCHjZB4ElieM4S/VJ8
 THUqfrr+Mhzpn3c4G7cFW6NxtUKkGtXdjmIxAUlB0TCqNpK3C/09a7IVy77h5/vsmHf+
 E0vrVxXNHrfSsSFeviqV6G3rmJ6hSgchbddWNUSLkN+ZP66rmWNDuGt3s6HPyHdRgRgD
 q7Uu/EugL3RL05WDns6MbCKRxO+FLl8TLCrHf9uiHVgTCUG8KH/dI/CPkkT6V3FNtGgm
 wJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R8iv2jfaEYKd7FJEJrRj/qCV9ecguFtfufjR7tkooVE=;
 b=ZSiY1B5wH0sPDyHe1TqVM6qdIi0M/oxurZtwLA5ThEtdFkDUAsx90ANeO5s8FziWf8
 1caQ7LjkP//aNHCw3Z0Iiv5re3Lo1m4EuKd1sn/4G+/7utqhByesJ0CFdbFjrLZ4XP74
 wiO3jVWm7z4Z4gag6iStfzzjDYff/k++ahLvSCGDfVTCk3Nwa6ys8xu5+bbkGDHmB7Gk
 ixE4zGgyJkGC8T42HT/Jr1pfUg2G3Y7bTSmVHqiewDQahKFWuNTigPkexJmq3HMBtm1j
 3Tm1nl5opvseQQ35lB0ujDu23PGTD8NByxY6GvEfuM4VV81fac4H6FEjCObly0FPMrhq
 D+cw==
X-Gm-Message-State: AOAM533EW9z2Y+RBv4+LGj+NY6A9116IzedzrFkMDvKXWXqDz6tpQSI8
 u75W77+OaFhPsM0UmqGDOEE=
X-Google-Smtp-Source: ABdhPJzIB9dqiKQfD4iHuqtNAYIk4imQQpwTiINRicvK8foEMb3uH4RmEcOJYDyUlbTA2JK06OMeqA==
X-Received: by 2002:aa7:cd0a:: with SMTP id b10mr5311144edw.153.1612997491473; 
 Wed, 10 Feb 2021 14:51:31 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u17sm2274765edr.0.2021.02.10.14.51.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 14:51:30 -0800 (PST)
Subject: Re: [PATCH v2 15/42] esp: introduce esp_pdma_read() and
 esp_pdma_write() functions
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-16-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fcaa4613-9b90-d41e-e00b-8b7e7e6081ff@amsat.org>
Date: Wed, 10 Feb 2021 23:51:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-16-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.211,
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

Hi Mark,

On 2/9/21 8:29 PM, Mark Cave-Ayland wrote:
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index e7cf36f4b8..b0cba889a9 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -151,6 +151,20 @@ static uint8_t *get_pdma_buf(ESPState *s)
>      return NULL;
>  }
>  

Can you add get_pdma_len() (similar to get_pdma_buf) and ...

> +static uint8_t esp_pdma_read(ESPState *s)
> +{
> +    uint8_t *buf = get_pdma_buf(s);
> +

       assert(s->pdma_cur < get_pdma_len(s));

> +    return buf[s->pdma_cur++];
> +}
> +
> +static void esp_pdma_write(ESPState *s, uint8_t val)
> +{
> +    uint8_t *buf = get_pdma_buf(s);
> +

Ditto.

> +    buf[s->pdma_cur++] = val;
> +}

Otherwise:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

