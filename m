Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EF367F2C4
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 01:08:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLYlL-0004St-FI; Fri, 27 Jan 2023 19:08:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLYlD-0004SF-RR
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 19:08:00 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLYlB-00023n-Ci
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 19:07:58 -0500
Received: by mail-pg1-x52f.google.com with SMTP id r18so4217282pgr.12
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 16:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YU7YW85QPyg9XiExQDx6HHoBI9WegkkBjdetxlQe2BA=;
 b=InT5xDytkKCvS19kVb/E04KjdCJjarIrs3tK5VtFzItNWMSeNyV3hvHQ7L5Kb6XIzH
 P1qja1qFIRxXg2pdsHIt62YONgs3mqj7XJfwqMgsXB35Nmh+3K//ICcu6DFFHbACPPEv
 GjIB0MSTFwCfDJL6FErtU3TiN6H41qvq4jdEfGWw4FcNAXLAhRYVXjtGsGtyJM8y2J/6
 1yfyH9IoU8+dGInHt0D7dJYnA07i2kPRA2YWgB4iAvtg6us5nE72n13Co1lZoRvtGble
 9equAjl1bMxcht6iO/FAvDUXzMRKS0rYXe/iqDJ0jgBfSd/hXJEQ0vZiIXFKIUDmtpBC
 KCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YU7YW85QPyg9XiExQDx6HHoBI9WegkkBjdetxlQe2BA=;
 b=X4xSAxqNzzB4Cgw6Tsv79/CE85QqeVYso9+OmHUAYpGKy1G21iWTZCNAbyn0QxWKVC
 J/jS2jm5QN96Bpm+K1bkF1t195X+qljd/Lr9433M1iPNkTM9i09xXKKgF29+zkqZUEOk
 T7hUY74mP5IKpI+jYZ3/ZWMH1rt95HKNT4ocasDNE5GUuDWhTxPdAGSEFfGY/baoSmx8
 BJHJ3ewOUQNTcyAIIhEWGMfofyaFCAPDBOlVRzThHwLWQucWD24Y7sp5zU8yS7ztOSDG
 5bX7DOWS0e3N3iSJS3E0kKS0i2HAhBxhQz3x8mgNnFAyEK+5fwfql43vxSpMn/2QbWlB
 gcYA==
X-Gm-Message-State: AFqh2krLXyaSQ53D7zlk4grAQLwHPR+TUth8dPojwLjVFGhEY+SrReus
 BrolhhbyILlABN21InVzalNzlA==
X-Google-Smtp-Source: AMrXdXtwWcvCovpkIIlO4QENFYvBh/hlFQr6arSIh2vaId8oz311bkjp0hv3DpHUeVAcJO5ciNXLkg==
X-Received: by 2002:a62:3007:0:b0:587:8d47:acdd with SMTP id
 w7-20020a623007000000b005878d47acddmr40545361pfw.34.1674864475973; 
 Fri, 27 Jan 2023 16:07:55 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 bm6-20020a056a00320600b0058d9623e7f1sm3187454pfb.73.2023.01.27.16.07.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 16:07:55 -0800 (PST)
Message-ID: <d0fc0e05-180b-f345-441f-f4c62c8e1521@linaro.org>
Date: Fri, 27 Jan 2023 14:07:51 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 11/16] target/arm/kvm-rme: Add Realm Personalization
 Value parameter
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-12-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127150727.612594-12-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 1/27/23 05:07, Jean-Philippe Brucker wrote:
> +static int rme_parse_rpv(uint8_t *out, const char *in, Error **errp)
> +{
> +    int ret;
> +    size_t in_len = strlen(in);
> +
> +    /* Two chars per byte */
> +    if (in_len > KVM_CAP_ARM_RME_RPV_SIZE * 2) {
> +        error_setg(errp, "Realm Personalization Value is too large");
> +        return -E2BIG;
> +    }
> +
> +    /*
> +     * Parse as big-endian hexadecimal number (most significant byte on the
> +     * left), store little-endian, zero-padded on the right.
> +     */
> +    while (in_len) {
> +        /*
> +         * Do the lower nibble first to catch invalid inputs such as '2z', and
> +         * to handle the last char.
> +         */
> +        in_len--;
> +        ret = sscanf(in + in_len, "%1hhx", out);
> +        if (ret != 1) {
> +            error_setg(errp, "Invalid Realm Personalization Value");
> +            return -EINVAL;
> +        }
> +        if (!in_len) {
> +            break;
> +        }
> +        in_len--;
> +        ret = sscanf(in + in_len, "%2hhx", out++);
> +        if (ret != 1) {
> +            error_setg(errp, "Invalid Realm Personalization Value");
> +            return -EINVAL;
> +        }
> +    }

I think this parsing is late, and should be done

> +static void rme_set_rpv(Object *obj, const char *value, Error **errp)
> +{
> +    RmeGuest *guest = RME_GUEST(obj);
> +
> +    g_free(guest->personalization_value);
> +    guest->personalization_value = g_strdup(value);
> +}

here, when the value is set, so that the error is produced at the proper time.


r~

