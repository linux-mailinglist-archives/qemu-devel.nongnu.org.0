Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3361067F31C
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 01:24:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLYzY-0007gZ-Vy; Fri, 27 Jan 2023 19:22:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLYzX-0007gH-40
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 19:22:47 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLYzU-00068c-DQ
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 19:22:46 -0500
Received: by mail-pl1-x62f.google.com with SMTP id d3so6548569plr.10
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 16:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GadLoYihLq2je6MYFrcuqG6j575+3dCNXyYioo3yDv4=;
 b=LzXYQzQcjpXjqcvSEOU37Agha8Nf96xVUrqeb0JZuBURmEwXJAtxvemoVS8EryFLnO
 rJZQZZBlvvzCRTe3oUij/oAav3mxA2I0BqVhMxlL2nQ0YPfeJJVPuK6Bg4b6Kc3jOAjY
 VeXcRPQ1K5Rh0IHvX2rquaCk/1PzVLThF7aQt7QeW1zNe6P45x28KdtbUcNcC9KM0+Yz
 YuFk9oZTpZGmM+WMmvga10sG+1CoCBVa/W/cQEvabhnLclsK+evg8KJHuECWQqZEeCXo
 Wk8dRr9crxKRCtqpQBCSy6sLF87fa4T4sCyZPAv7PCchKLvp+yORJ93ocLzv5VoxeHhf
 PY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GadLoYihLq2je6MYFrcuqG6j575+3dCNXyYioo3yDv4=;
 b=QpxscDExyeH7ox5TAUcSSEEq9GRlkI5YDzzeP1ovdcA3MjIvoTv8Zcv/URnlO3rppF
 xQ6+QS46Bdp937NNGmaNCGUvtirwqqh2/ASFbd2xc0TXTcA9WfMTsBfmzH2QFtJfsdKG
 kmNyNJqtEvrS4T5u/VBjR4Cg5h8jf2PSOLF3BLMRuvhP4V1iN6QkLEWKpIgjOQHOhTgD
 xHSPjDg2iTTIkQtI7k144xTsUUlmxnCJYW41lTASqje/ZJqDkCrAWmrqikO4SIFupIQ1
 lbqVmx6iago8x0R5s1l2Cym7tD+gjHISnQvdczdVJwTmhNdJGt8xSdg5ZB9N6tdvy/l0
 KEZA==
X-Gm-Message-State: AO0yUKUg3B1ch51MMrkRVqsVq9FSgD8zB2t6ayApK0R5d9Tr7TEn8P+F
 ZmVTCzGGZfcoUuMelxiTZXD1ag==
X-Google-Smtp-Source: AK7set/Lk845WbGAFjZ5rF89GfB5FvB7W1sRpidMh9LOczcFsy825tblbmE6E7m86VRHuoGiqkF90w==
X-Received: by 2002:a17:902:d2c2:b0:196:3596:4a29 with SMTP id
 n2-20020a170902d2c200b0019635964a29mr12288145plc.21.1674865362703; 
 Fri, 27 Jan 2023 16:22:42 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 g8-20020a1709026b4800b00188c9c11559sm3445126plt.1.2023.01.27.16.22.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 16:22:42 -0800 (PST)
Message-ID: <d9c2116b-79bf-9a25-a407-bba568e23773@linaro.org>
Date: Fri, 27 Jan 2023 14:22:38 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 12/16] target/arm/kvm-rme: Add Realm SVE vector length
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-13-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127150727.612594-13-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
> +static void rme_get_uint32(Object *obj, Visitor *v, const char *name,
> +                           void *opaque, Error **errp)
> +{
> +    RmeGuest *guest = RME_GUEST(obj);
> +    uint32_t value;
> +
> +    if (strcmp(name, "sve-vector-length") == 0) {
> +        value = guest->sve_vl;
> +    } else {
> +        g_assert_not_reached();
> +    }
> +
> +    visit_type_uint32(v, name, &value, errp);
> +}
> +
> +static void rme_set_uint32(Object *obj, Visitor *v, const char *name,
> +                           void *opaque, Error **errp)
> +{
> +    RmeGuest *guest = RME_GUEST(obj);
> +    uint32_t max_value;
> +    uint32_t value;
> +    uint32_t *var;
> +
> +    if (!visit_type_uint32(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (strcmp(name, "sve-vector-length") == 0) {
> +        max_value = ARM_MAX_VQ * 128;
> +        var = &guest->sve_vl;
> +        if (value & 0x7f) {
> +            error_setg(errp, "invalid SVE vector length %"PRIu32, value);
> +            return;
> +        }
> +    } else {
> +        g_assert_not_reached();
> +    }
> +
> +    if (value >= max_value) {
> +        error_setg(errp, "invalid %s length %"PRIu32, name, value);
> +        return;
> +    }
> +
> +    *var = value;
> +}

I don't think you should try to genericize these functions, comparing the name string. 
Just rename them and let them be specific to SVE.


r~

