Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D50B6618D6
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 20:53:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEbhv-000124-8U; Sun, 08 Jan 2023 14:51:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEbht-00011p-Uo
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 14:51:49 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEbhs-0000sW-EI
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 14:51:49 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 c8-20020a17090a4d0800b00225c3614161so10574793pjg.5
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 11:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6Ky3Wv2A4zS27wp8/QgIq90Xtz61Yk4PlVCTLobF9iA=;
 b=b204wQb+ivlSyvXVgGbDcQ1kdPaURK3rrqoSz+69fp961KGXO2X0OIxfPsF/2iTXYI
 AZ76u9fsVl3jsvAVhFxf70GwSEfPSI9If0JYZ2tRxnaQyq806RLz/jiTvYs3EwuT/sCb
 +HiZCbjPMpjUkx9eUHAIxvHaHcZ35/BBKGGCFMtY5PMcntGyQSSTgN0ulYxbxBYx+Wdu
 5B4GehXB02qceHmGdvL1v8n7P10gV74VhRfNt+iaZoNZz6AgCKH5FjgGtWGeW5aEd2He
 vdmU4rb39A1+UJvExgfFXWwgPKLLM2+gtVCsz8jwTHjOE/ppZaqxstYw9flO6CPryJP6
 sRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6Ky3Wv2A4zS27wp8/QgIq90Xtz61Yk4PlVCTLobF9iA=;
 b=tOGs4BelZQdwyzZSyLUIT7xGCTd7B1Zfivv8tfKLlEzGUM14KiKwhHrpd1JxWS9Qv1
 IFCcAd6Fc76nTiW10bDbxppHcSd6GO6AdcBKn2GS4V+1gLGhVpvYH6lOT1CsQ9gbjfHT
 h3hW4ymZIrVOJFl/2wdvsMUB2lLDRpIt3IzQzL2eVrgEISGrUG9yMNRHJ8Qzm4Ci+CZ6
 7d9NWpqGF2f/nPX7CUUc9fqDB0i5RbynWqfLikQJtVtHMshRgfYJdsoGTgeYjL450cpi
 QkW2JGMI9YIZIwiZPi9exyA0P0ICYbmFJWViTZC9YxtXv8Qx4g3lVa7MGWN2FbawsBQG
 6U1Q==
X-Gm-Message-State: AFqh2krOvFfl21yMjZi5Xwv7ZSW+JYQCgwqKo7SpM4mN/U/h4OEKvt2F
 rlh0vEWyu9DE4ePg3UMX1WDOcg==
X-Google-Smtp-Source: AMrXdXs3XLsNDV5dJWjTid6J3F0mesjkGWyEW9zzK7/c2LBCH0j5/lSTXQd0SG7ZmD//ylhJFAIySw==
X-Received: by 2002:a17:902:b116:b0:191:1131:da2 with SMTP id
 q22-20020a170902b11600b0019111310da2mr62144108plr.27.1673207506865; 
 Sun, 08 Jan 2023 11:51:46 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a170903120f00b00188fce6e8absm1377027plh.280.2023.01.08.11.51.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 11:51:46 -0800 (PST)
Message-ID: <4f9cf406-1a46-8f7c-6a52-fb13d8c27317@linaro.org>
Date: Sun, 8 Jan 2023 11:51:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/4] util/qht: use striped locks under TSAN
Content-Language: en-US
To: Emilio Cota <cota@braap.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230108163905.59601-1-cota@braap.org>
 <20230108163905.59601-4-cota@braap.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230108163905.59601-4-cota@braap.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 1/8/23 08:39, Emilio Cota wrote:
> +static inline void qht_bucket_lock_init(const struct qht_map *map,
> +                                        struct qht_bucket *b)
> +{
> +    qht_do_if_first_in_stripe(map, b, qemu_spin_init);
> +}
> +
> +static inline void qht_bucket_lock_destroy(const struct qht_map *map,
> +                                           struct qht_bucket *b)
> +{
> +    qht_do_if_first_in_stripe(map, b, (void (*)(QemuSpin *))qemu_spin_destroy);
> +}

I think it's clear the declaration of qemu_spin_destroy is wrong vs const.

Why do you create two wrappers for qht_do_if_first_in_stripe, but...

> +static inline void qht_head_init(struct qht_map *map, struct qht_bucket *b)
>   {
>       memset(b, 0, sizeof(*b));
> -    qemu_spin_init(&b->lock);
> +    qht_bucket_lock_init(map, b);
>       seqlock_init(&b->sequence);
>   }
>   
> @@ -250,7 +328,7 @@ static void qht_map_lock_buckets(struct qht_map *map)
>       for (i = 0; i < map->n_buckets; i++) {
>           struct qht_bucket *b = &map->buckets[i];
>   
> -        qemu_spin_lock(&b->lock);
> +        qht_do_if_first_in_stripe(map, b, qemu_spin_lock);
>       }

... not others?

The actual logic of the stripe seems ok.


r~

