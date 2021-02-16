Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B296A31CCFB
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:34:33 +0100 (CET)
Received: from localhost ([::1]:53730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC2My-0004Xe-QT
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:34:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lC2K8-0003Hs-WC
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:31:37 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:40348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lC2K4-0001IU-Hh
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:31:36 -0500
Received: by mail-pl1-x62a.google.com with SMTP id z7so5659647plk.7
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 07:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=emZiZ2lYD6uHSWfmXr8OdxjxcEU3ihIrtDPoVwvKkVk=;
 b=l3LTRjdHLzIbvw0tcZg+Kfk2TeIXpZ6UBK0hMWQWh6Go8SdCTBYt1lp9o0UnGqbjby
 X1j2pfAwODyLOz4bNioBr9fxESAsze4rDwbQxlIuIVdwNQYfYfpqZn6PjJvHL8Zjmlcl
 1UNwy6WBAHy3V+U8gYW+LzXPAKo1xKVogGdWgwS1MEJBzsrEonqgYfnejOKZvO/UR6zW
 m8npTKhYBP9sWlJiftYdZO3BpkNQFq7ZeJJMhTJ3QN1EmO7E4CinEwFfeBMbbimf/9Ra
 fAQW+PuIfRdumbQkZkzlP545UxPDcbac6hXjMMJGJKfibqN8KS3xMF5g8PLF6iys4vHd
 TVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=emZiZ2lYD6uHSWfmXr8OdxjxcEU3ihIrtDPoVwvKkVk=;
 b=JVKkC0wKBVwrmFhhS+87qvHYPTMSuwWSyWpMLrvSM6vO3on3z24/WLEs94vNa8LN+g
 XJID1Et/C0Uhwy6Vq7YMIWMtBX3JVZdGJ83FcybI5ZLbNR7k76TK3hgM6IFKAtkfSypr
 tBhwSnCbYXpdlkU4Q6sdUsbdQiImLKUzocahXk8ifj4WtVeIr9c9+Ti9nd+kPp62lnlg
 50TonqY7/tYpmbKzwWu6SDdTynwSyeRq+jYWTW2VGouMRwF88T63N2rGN6dAVtjTzcC+
 m3jqNZME14hY6TsRmqM+qqr7VZBwRbJEn0JXy4oBA2xfP3I8AEu5dyFLLChl9Ej1A3ni
 LuJg==
X-Gm-Message-State: AOAM532ECMDz6wCCQl2XhhNYgkj15ZTvGvlzGSZioJA8adTQ77h4wEK7
 GmrZDn94OnQMZ5ri4Tv3Tze99w==
X-Google-Smtp-Source: ABdhPJy16yxNInib06mABEUYxJwVT2MyYPi/2BggYkCS7ZHE+bpjlHXWyRwpgRjXOW+ijClRc39BIA==
X-Received: by 2002:a17:902:b212:b029:df:ec2e:6a1f with SMTP id
 t18-20020a170902b212b02900dfec2e6a1fmr20182880plr.24.1613489490412; 
 Tue, 16 Feb 2021 07:31:30 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id h70sm22483777pfe.70.2021.02.16.07.31.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 07:31:29 -0800 (PST)
Subject: Re: [RFC PATCH 4/5] Add migration support for KVM guest with MTE
To: Haibo Xu <haibo.xu@linaro.org>, drjones@redhat.com
References: <cover.1612747873.git.haibo.xu@linaro.org>
 <25a922038d256e47f3eb99683c5e3bd9c34753ac.1612747873.git.haibo.xu@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ae0326e2-8766-803a-ef89-1155d45fdd2a@linaro.org>
Date: Tue, 16 Feb 2021 07:31:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <25a922038d256e47f3eb99683c5e3bd9c34753ac.1612747873.git.haibo.xu@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/21 7:20 PM, Haibo Xu wrote:
> +    if (kvm_physical_memory_addr_from_host(kvm_state, addr, &ipa)) {
> +        /* Buffer for the page tags(one byte per tag) */
> +        tag_buf = g_try_malloc0(size);
> +        if (!tag_buf) {
> +            error_report("%s: Error allocating MTE tag_buf", __func__);
> +            return 0;
> +        }
> +
> +        if (kvm_arm_mte_get_tags(ipa, TARGET_PAGE_SIZE, tag_buf) < 0) {
> +            error_report("%s: Can't get MTE tags from guest", __func__);
> +            g_free(tag_buf);
> +            return 0;
> +        }
> +
> +        qemu_put_buffer(f, tag_buf, size);
> +
> +        g_free(tag_buf);
> +
> +        return size;
> +    }

So, in patch 2 you disabled the allocation of tag-memory.  Now you're
allocating new memory (admittedly quite a small amount -- 1/16th of a page,
small enough to just be a local variable).

Why don't you allocate tag-memory, copy the data into it, and then let
migration proceed as normal.  Then you don't have to have a random data block
that happens to follow each ram page.

I'm concerned that what you're doing here makes it impossible to migrate
between kvm and tcg.


r~

