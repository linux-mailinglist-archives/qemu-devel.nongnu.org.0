Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D8B541F54
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 01:09:25 +0200 (CEST)
Received: from localhost ([::1]:55550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyiKC-0003NL-HD
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 19:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nygkv-0005ro-E0
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 17:28:53 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:34472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nygkt-0007iF-KS
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 17:28:53 -0400
Received: by mail-pf1-x42d.google.com with SMTP id c196so16633467pfb.1
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 14:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=z8m8kRoWu1rdmmRKEN7UNvLmS6Mrxw2ozpdcdWNyww4=;
 b=RkZvIo15hjD0Xg0791s2gP4dHMk4hmGwOIv0LQj78xQcBAGAuPuYPzeTKWTK2MdvZr
 79860DCocBqx9jahczOTZkilGEzLmRMIk87rdiRLu0oBTrAOmvRcIToyyo0ZIdGhA389
 XN/Ym1nJ97Vt20RAylt8vLKQIiL/3Y6ka6M2UJTuh6iWIgIsDHcnHMFg+fiuisT8zxhd
 YN7HOtWFC/O8jQAlMq3IpQznZ/KjFRK6eV8zwskMz5rfuy+AJnGFW7jk7rJCpt4dT6e3
 Q/vZXLnX1eQ0g5LsUbyOLyX2+KvNG1pk9dz/YUmVq43sxAZLpudN6Uwe178JGATGps3z
 gS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z8m8kRoWu1rdmmRKEN7UNvLmS6Mrxw2ozpdcdWNyww4=;
 b=QE594GjfqMJsIH8+gUtm5c9WP87L/emVOrO2NPdZSZOG7d3/UvGvQGtQ2LKa/tiWSK
 VxLhT2T7LedOgRJtjJ0VAcZlrzENW57taWpXXXhKQ2jMugkeExxWymZMKpeOpLPONuPn
 HZitDLLVOOWu57t6IzTUgLwENv6cKhMPmxOFo1v7HtRMHb9lkckt0h9BRq03FAZ/kr8w
 P9hmDtNWbXkIm31u5n5H/uTseBQ7t/E6iuCML/sgUyeFwMKagLiGbxgOijdUnyyzpZ10
 sjZoEbL41EfzFa1MgkNU0mEaGise8+bxP3od3Rq801MQatCTPbatMQgm8qXp9PLtbU0M
 5OSw==
X-Gm-Message-State: AOAM5317mnApWiwYmJ2GILunR9yUbqX0CoiUSaKU+FSnsTz5uR1rrRvi
 B54H2GjwkOcIuy3svQaUocyBBg==
X-Google-Smtp-Source: ABdhPJwxVoVz1T/ckikf1vv5Ek0jybM2+L/vNQ13TZuN2Gw1Q03byBTJiJOWoq7nJ9tsECe+CLLhjQ==
X-Received: by 2002:a63:2b16:0:b0:3fa:faf9:e6d7 with SMTP id
 r22-20020a632b16000000b003fafaf9e6d7mr26865046pgr.325.1654637330002; 
 Tue, 07 Jun 2022 14:28:50 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3cf2:c634:5b19:25f6?
 ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 l63-20020a638842000000b003f61c311e79sm12293547pgd.56.2022.06.07.14.28.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 14:28:49 -0700 (PDT)
Message-ID: <4279f170-76df-c329-24ec-26e1e68446eb@linaro.org>
Date: Tue, 7 Jun 2022 14:28:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/6] bsd-user/freebsd/os-syscall.c: unlock_iovec
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: arrowd@freebsd.org, def@freebsd.org, jrtc27@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>
References: <20220607201440.41464-1-imp@bsdimp.com>
 <20220607201440.41464-3-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220607201440.41464-3-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 6/7/22 13:14, Warner Losh wrote:
> +void unlock_iovec(struct iovec *vec, abi_ulong target_addr,
> +        int count, int copy)
> +{
> +    struct target_iovec *target_vec;
> +
> +    target_vec = lock_user(VERIFY_READ, target_addr,
> +                           count * sizeof(struct target_iovec), 1);
> +    if (target_vec) {

Locking the same region twice seems like a bad idea.

How about something like

typedef struct {
     struct target_iovec *target;
     abi_ulong target_addr;
     int count;
     struct iovec host[];
} IOVecMap;

IOVecMap *lock_iovec(abi_ulong target_addr, int count, bool copy_in)
{
     IOVecMap *map;

     if (count == 0) ...
     if (count < 0) ...

     map = g_try_malloc0(sizeof(IOVecNew) + sizeof(struct iovec) * count);
     if (!map) ...

     map->target = lock_user(...);
     if (!map->target) {
         g_free(map);
         errno = EFAULT;
         return NULL;
     }
     map->target_addr = target_addr;
     map->count = count;

     // lock loop

  fail:
     unlock_iovec(vec, false);
     errno = err;
     return NULL;
}

void unlock_iovec(IOVecMap *map, bool copy_out)
{
     for (int i = 0, count = map->count; i < count; ++i) {
         if (map->host[i].iov_base) {
             abi_ulong target_base = tswapal(map->target[i].iov_base);
             unlock_user(map->host[i].iov_base, target_base,
                         copy_out ? map->host[i].iov_len : 0);
         }
     }
     unlock_user(map->target, map->target_addr, 0);
     g_free(map);
}


r~

