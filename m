Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 793AF547134
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 04:02:05 +0200 (CEST)
Received: from localhost ([::1]:50220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzqRw-00027G-26
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 22:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nzqQy-0001M2-1X
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 22:01:04 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:52016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nzqQs-0003py-JF
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 22:01:00 -0400
Received: by mail-pj1-x1036.google.com with SMTP id cx11so940985pjb.1
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 19:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=52wi6oe2ydDgN1n3qiMDHu50TTNZfZM+0EElCOSnq2Q=;
 b=TWbb+qDbPnRLwt0b8eH7bvVeC80daRmvPEThg6VTggzIjNQUveyBW1Tv8tScPSsRyJ
 oT/PMfaIgDl0lb2mO5nSxytbo68W8oJ0ptDWdlCF8mznkCcXZocorCrKgyjRjmacPR/7
 FGz2bTSxdM8vHlKwt5KO2W8kpyYGJyrYaj9BLarKQ/Wa1xpKrX6O+Z4FMv4vOZi28aqz
 Mhhi9LVipBXoltbnl7FC5SNGRp+M1sSIFrpCDyvd/fdhvYGh1wVMNN7hx7mr4oFB5xIw
 Hqfuj/FLRbYUzbZKG6Qy7ld78w2bMSJNV/Y8JAvUnlk+imFcASco34uelX2g/LvQC99E
 Q3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=52wi6oe2ydDgN1n3qiMDHu50TTNZfZM+0EElCOSnq2Q=;
 b=FM1orpszZ2xDNOiHn4zjzkyKph7LVZZXTbY9zd4zb6fjbjTJKmMkQNtvCU/m6qJEDu
 pC6+eL+356LoRH414WEfOPquFrNsNRuAAKfQWTBweU3H34rKcJgwLLLAA+8HoNUJiO6G
 5/WbRLB6OrYSEDaXHdKPNYf9+JsYqD1zhsB1xjwB7HoRXyd4K8Ta3JEEzSx/WpGX3WKr
 EOZXHUN+dTzbpfmwW6baQHYT0c1SKHXEK5kEmPLUGSddd1cjetg7i+egFfY2zLLoYOtC
 vTgE9kfP0OHTRtK1u+hjNg4/9CdBN47wuLKNHH+GXm4sv/xi0vyfx2HmCNr38WRrkmiq
 B0KA==
X-Gm-Message-State: AOAM533yuHgQZ0wNi6SI3j1NqYgCsiPFoc877uWnS+lpW1qpIwWHfq18
 F15E0a/WkMmEqfATVgRe7NCFOA==
X-Google-Smtp-Source: ABdhPJxfdvCBNh4zul8wsSRYyHfohV/Qc9Vcxd07OS9ik1IuRDdSXIMVyOVIxFl23gUfRuu3k9/57A==
X-Received: by 2002:a17:902:8a91:b0:167:621f:9749 with SMTP id
 p17-20020a1709028a9100b00167621f9749mr35716325plo.9.1654912855720; 
 Fri, 10 Jun 2022 19:00:55 -0700 (PDT)
Received: from [10.254.40.115] ([139.177.225.229])
 by smtp.gmail.com with ESMTPSA id
 8-20020a621908000000b0051bc3f9a1f6sm241721pfz.55.2022.06.10.19.00.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 19:00:54 -0700 (PDT)
Message-ID: <367999a7-b05c-8576-b91b-e5576ad941fb@bytedance.com>
Date: Sat, 11 Jun 2022 10:03:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: Re: [PULL 54/54] crypto: Introduce RSA algorithm
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gonglei <arei.gonglei@huawei.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20220610075631.367501-1-mst@redhat.com>
 <20220610075631.367501-55-mst@redhat.com>
 <93d111a8-222e-b46f-2f36-1d1784cf0373@amsat.org>
 <fff6fbb7-b1be-610d-c48d-0498df879ae2@linaro.org>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <fff6fbb7-b1be-610d-c48d-0498df879ae2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/11/22 02:05, Richard Henderson wrote:
> On 6/10/22 08:55, Philippe Mathieu-Daudé wrote:
>> On 10/6/22 09:59, Michael S. Tsirkin wrote:
>>> From: zhenwei pi <pizhenwei@bytedance.com>
>>> +static int cryptodev_builtin_set_rsa_options(
>>> +                    int virtio_padding_algo,
>>> +                    int virtio_hash_algo,
>>> +                    QCryptoAkCipherOptionsRSA *opt,
>>> +                    Error **errp)
>>> +{
>>> +    if (virtio_padding_algo == VIRTIO_CRYPTO_RSA_PKCS1_PADDING) {
>>> +        opt->padding_alg = QCRYPTO_RSA_PADDING_ALG_PKCS1;
>>> +        opt->hash_alg =
>>> +            cryptodev_builtin_get_rsa_hash_algo(virtio_hash_algo, 
>>> errp);
>>> +        if (opt->hash_alg < 0) {
>>> +            return -1;
>>> +        }
>>> +        return 0;
>>> +    }
>>> +
>>> +    if (virtio_padding_algo == VIRTIO_CRYPTO_RSA_RAW_PADDING) {
>>> +        opt->padding_alg = QCRYPTO_RSA_PADDING_ALG_RAW;
>>> +        return 0;
>>> +    }
>>> +
>>> +    error_setg(errp, "Unsupported rsa padding algo: %d", 
>>> virtio_padding_algo);
>>> +    return -1;
>>> +}
>>
>> Build failure:
>>
>> ../backends/cryptodev-builtin.c:187:27: error: result of comparison of 
>> unsigned enum expression < 0 is always false 
>> [-Werror,-Wtautological-unsigned-enum-zero-compare]
>>          if (opt->hash_alg < 0) {
>>              ~~~~~~~~~~~~~ ^ ~
> 
> Yep, e.g.
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/2574418442
> 
> 
> r~

I checked this building log, and noticed that clang-13 reports this 
error. I tested this by clang-11(from Debian10). Sadly, clang-11 did not 
report this.

I'll fix&test this patch by clang-13, then send this patch again.

Thanks!

-- 
zhenwei pi

