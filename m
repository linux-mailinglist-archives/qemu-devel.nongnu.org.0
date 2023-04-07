Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 771AC6DB706
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 01:13:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkvGk-0001ux-BU; Fri, 07 Apr 2023 19:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkvGi-0001um-Ry
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 19:13:20 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkvGh-00031o-80
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 19:13:20 -0400
Received: by mail-pl1-x633.google.com with SMTP id p8so187710plk.9
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 16:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680909197;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+ItnoDxjRyq5NxF6TJi+AQI7ZLK0+7Nql3EFIwnRinE=;
 b=tBpx2Whb4QzegaMnt95h9v7OIs3R0veH7QI0AUG8m9HbqbV69oRmE1Lp3HyvnMwLin
 McrVCRHDPd0x2sKbwU88FmIlMhQnR+/8x5bkAEnXgzjwWrTRhDDlXblkJAD/Gz648Xwc
 5Raj8RHXLDPLqPir8wxUa9xK9fb7aGTo1JHNiEa3mGeWRYIsyKtHdFiZJYaxFCiRB9Sw
 e3YuDa9UieI9e3U+MI+GMOtmitZ6G286gVAMwWk6LF3ANI4RVLMGHfTrXI4s+jKap2JY
 LvI5E5XUdmS2/NCFq1bHDfM8/DxpdIw7Sp0m9wmFWfggE3O13TldNX65vBYEOTNlWaI7
 hICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680909197;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+ItnoDxjRyq5NxF6TJi+AQI7ZLK0+7Nql3EFIwnRinE=;
 b=p57MfyBNFMjvDUgT9zrqAVSy+Z4peMWpa4hK29pnESwZBYlRc8cn1SQuPe9Oe2NZBp
 zFh7AX7swbEfsyJGYIeAVNHicWVcNIjWgGSKK5ubytuaY0DmIdXwhceIagsiyZSdke2w
 rxZMHOF8KvmU6k4GN49Fk8rB7asec2C5T++TX5fwAqR4WIwu0liIVBwRypdKIpd4dHkk
 i/Fvn/6gMAX2RZhf3Hweos0XcdaJF7mxq6N8zehzk8zN8+luouGaSp6Rf7G2IJeAtgIi
 BpbOcbFMTeTdGsYj1nt79Z3e5N7ZpVOE/G3wEUohIXySM6Uk3co+9ep+f+woX1orHN8N
 hO1Q==
X-Gm-Message-State: AAQBX9dax6dwIjqGDyfjkUXDKT2UYsDzEEyEok3i2z2xShXOsskxGTIs
 uyXKZhSsmEthXIllW+jjdUOEMw==
X-Google-Smtp-Source: AKy350Y3lzjtZw4RK/yOE1pq/rsEAaEwouoQEVbujzz2mrQjMkOvcprqVjsdpaOumVHAhvkYih/Nlw==
X-Received: by 2002:a17:902:f544:b0:1a1:b8cc:59da with SMTP id
 h4-20020a170902f54400b001a1b8cc59damr5210653plf.33.1680909197678; 
 Fri, 07 Apr 2023 16:13:17 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a170902821600b001a199972508sm3382209pln.124.2023.04.07.16.13.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 16:13:17 -0700 (PDT)
Message-ID: <9a1a1a4a-ef80-61a8-8d2c-55817fd12496@linaro.org>
Date: Fri, 7 Apr 2023 16:13:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 13/14] accel: Inline WHPX get_whpx_vcpu()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20230405101811.76663-1-philmd@linaro.org>
 <20230405101811.76663-14-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405101811.76663-14-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
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

On 4/5/23 03:18, Philippe Mathieu-Daudé wrote:
> No need for this helper to access the CPUState::accel field.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/i386/whpx/whpx-all.c | 29 ++++++++++-------------------
>   1 file changed, 10 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

