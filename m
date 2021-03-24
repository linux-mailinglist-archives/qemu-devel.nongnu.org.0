Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1965348456
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 23:06:23 +0100 (CET)
Received: from localhost ([::1]:57718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPBdu-0001EK-9l
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 18:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPBbI-000057-Fz
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 18:03:40 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:38892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPBbG-0003jr-Qh
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 18:03:40 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 w21-20020a9d63950000b02901ce7b8c45b4so42911otk.5
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 15:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lyRnaj53HqSl8Y18JVrVMdgzY5mFSxE8lSuJqUlRKSA=;
 b=xYJcRWgiUAmmW1UiUUMs1fyZai/2fHW2cn3Ces4QLKVTki1uiSnVVTbKhV1mNjTN+7
 65TfsadnyF+eH/X27l3XIzU9zxNSlAzz5dxREvW2UjY01JJeEuPAswbmgX8ZP/QsBC1o
 XEef3g22zGBUuEH6Tcyc8ijQvpnpE3r/TJuA3EKlf0ow34NbE4+qIopbBLjqg0bJHf7e
 1eKnuOO1g0NGc5yOg4CXjT4N5w0ktHoE0yp/1mCSdX3M4yOFUOZTt/eMwBNpguhr/KRe
 9tQ8p1BwcBp46PrS10P4+XjkAQLqtgYe2KZdW6MyazaLEwHWlEdETJS7Byqr0Ww99EAo
 B9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lyRnaj53HqSl8Y18JVrVMdgzY5mFSxE8lSuJqUlRKSA=;
 b=KTOa3yQO/mVZxtABjvK9pBIKy9E3N+UfB4HqWAX58DyBbSP4MzgYp14IIkK+5bTkAO
 /+Fn5SARywtqqa7RXEJHDFQryMr98mpo+FnOa/HZEf8JMsgG9NyeG+kWUHk8hj329O/0
 CZrUzCX/ViJdEdBqURdIdPgc54xo5drwtClnPwDlO54NFbcusxG9dFwGFq1cPqvvbBOd
 Qonb0XMoSdQUzEkq3ryAijSt/Lr28Y+U65EPtVAKxwE1dTmxANEVRAoGgXNh1LRBpEO9
 Vud2K/1hG3GaGuCHC8BFA+H40XJULNJ7jfGkNi8xgTIIP3L3dd8xQgqYxIi804RHduXL
 i5PA==
X-Gm-Message-State: AOAM531McFz8QHFYZNgU78N4Q7WWRlSsuRTKFJ0vMTpYq0UK+xWu/J+t
 vhmOwCILZx7ZNkhAtREL1QJaPA==
X-Google-Smtp-Source: ABdhPJxXxNA4mL6/YvpHNP+UNvyiQxFdaUjOGrUdFGvQfoboyH29GiHemrg3XEZN91bk13d7turhHQ==
X-Received: by 2002:a9d:4c8f:: with SMTP id m15mr4714967otf.16.1616623417520; 
 Wed, 24 Mar 2021 15:03:37 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id q67sm677851oic.55.2021.03.24.15.03.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 15:03:37 -0700 (PDT)
Subject: Re: [RFC v11 22/55] target/arm: move sve_zcr_len_for_el to common_cpu
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-15-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6eb61895-7d00-e8c6-fca4-2a70e7e2b066@linaro.org>
Date: Wed, 24 Mar 2021 16:03:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323154639.23477-15-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 9:46 AM, Claudio Fontana wrote:
> it is required by arch-dump.c and cpu.c, so apparently
> we need this for KVM too
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> +/*
> + * these are AARCH64-only, but due to the chain of dependencies,
> + * between HELPER prototypes, hflags, cpreg definitions and functions in
> + * tcg/ etc, it becomes incredibly messy to add what should be here:
> + *
> + * #ifdef TARGET_AARCH64
> + */
> +
> +static uint32_t sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
> +{
> +    uint32_t end_len;
> +
> +    end_len = start_len &= 0xf;
> +    if (!test_bit(start_len, cpu->sve_vq_map)) {
> +        end_len = find_last_bit(cpu->sve_vq_map, start_len);
> +        assert(end_len < start_len);
> +    }
> +    return end_len;
> +}

I guess you could

#ifdef TARGET_AARCH64
     ...
#else
     g_assert_not_reached();
#endif

Dunno if it's worth it or not, since they're small.


r~

