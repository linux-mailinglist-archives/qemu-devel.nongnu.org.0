Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF73367F32C
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 01:33:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLZ80-00015p-NU; Fri, 27 Jan 2023 19:31:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLZ7v-00014d-Ov
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 19:31:27 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLZ7t-0007j8-Lj
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 19:31:27 -0500
Received: by mail-pj1-x102c.google.com with SMTP id m11so6195150pji.0
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 16:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c9TvRgP/WaR8VIU1peabWvB2vUf9So4db7kZY32WBfc=;
 b=IEl1AYt19438v8bXivEthPYpOZVUPLt1TrDVUjgeZveFIDdI2tZ8lPHkEJn+H5e73R
 i0NhJaZktaN+kZg/8DvrsUAmXq4oqymNqseMNfdFNnTlgFLIygZh/5OTL/c3859W2erd
 pcqdy0WSKVgxovtrUAuPOfpnyGdOPrWklX2QPSNrU9YDT6b0nPpsTpTJoJfydYqBI0ko
 Vk8ozHdVW535sA2m3rsRJh/NLQmSQREVFY/3nbRi4zPa3U20D/1hXnTsP/oNCQT7UnAJ
 Hoxp0HFBq5TaSU9leX81bCklm9Z5hYSW84h7lTe0DosdfxeUM4099HZEKF49xFMIc00f
 1ptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c9TvRgP/WaR8VIU1peabWvB2vUf9So4db7kZY32WBfc=;
 b=0W7ctACR22UEj6/unF7q/fTKqqkNtG5ZZvep0tY0jr9AzhlAcVsl6bKnWT4hrNTeCn
 9J5kKn4QzDtptvKkC24tFhhe+n7pE9Wy8N/gQeXLmOu8vf9x5VgzmLVP00tdQ/2lzvSb
 tYk4XxJ8msBmjKfwt1eWGCw5dcD/gMpDx6z6ojmR63qky6RDo4XLEdDckilbHLps2/JS
 bIKrlrLNMvWp/l09W2X3Zr52hXd7LgspOO+N1KXomtaswiLzq5xpkZFFcR7o1MNH7NMb
 aSvwdsj46EcVkpeGEPpwGy1GnHW3EODahXWJ11UUnjwVnPZ6hDsp3tuHhb2DtiYG4bTu
 Oaxw==
X-Gm-Message-State: AFqh2kokOuh4xDb+pm+xolWPJ23y4KqY/aan+oxS1mIw20zRbhV13fdh
 V+nozKVKkhEHD2qR+ERhbzU42w==
X-Google-Smtp-Source: AMrXdXsiNM15dpRGIk4QId/SPm9kumoxRKvgkSBZbhSmLmWgSylmcrGDkvxoIX/SzZChfNGsshb6ig==
X-Received: by 2002:a17:90b:3148:b0:22b:ae0b:ac88 with SMTP id
 ip8-20020a17090b314800b0022bae0bac88mr30939009pjb.47.1674865884062; 
 Fri, 27 Jan 2023 16:31:24 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 em6-20020a17090b014600b00217090ece49sm3260523pjb.31.2023.01.27.16.31.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 16:31:23 -0800 (PST)
Message-ID: <55b9afd2-f158-3c27-fbb2-a367d10ce536@linaro.org>
Date: Fri, 27 Jan 2023 14:31:19 -1000
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

Something I've used elsewhere just recently (and should probably make generic:

static void rme_get_uint32(...)
{
     intptr_t offset = (intptr_t)opaque;
     uint32_t *ptr = (void *)obj + offset;

     visit_type_uint32(v, name, ptr, errp);
}

     object_class_property_add(oc, "sve-vector-length", "uint32",
                               rme_get_uint32, rme_set_sve, NULL,
                               (void *)(intptr_t)offsetof(RmeGuest, sve_vl));


r~

