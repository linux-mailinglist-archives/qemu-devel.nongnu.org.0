Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FCC348457
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 23:08:25 +0100 (CET)
Received: from localhost ([::1]:60996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPBfs-0002b6-Ps
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 18:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPBen-0001lI-7w
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 18:07:17 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:34501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPBel-0005J7-M0
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 18:07:16 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so72761otn.1
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 15:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TB0oJJLlnibZIzXk6H+9hbbiT1QtP6PluC0Z/sabW7k=;
 b=NAs5DX4zypkq+nKnrKnxhsl4V+w1FZmI9hcpU64nTxZRWS5XJYOxb0pCCwCapX6cpT
 8/3A7UamA2axsdRgR2TSUNWZ0T3XOfyya97RfSQyeU9t40AhYNNKxyDK3S4Tms3lkRs6
 lpE4zjN/BAOCgEBPxQObptC4Gnct55WoW4aIKeZNpyATj8A5IEVRMPKhO40FNJBp0lbP
 Zes+tXIRThQY7Zh4MZQoSjhxwjv3M9V5RiQ4xOoD31C3AjlpBLBUZUXXFXRamYDiNaZl
 z7RmfjZhtHDkzXMUpjE9oemMGCgW5IA0oQnVNoaXE0vb+C1IyNXyKhnpRHxN1b4ANtjD
 12qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TB0oJJLlnibZIzXk6H+9hbbiT1QtP6PluC0Z/sabW7k=;
 b=mz8MSWV/89kDBgPHSu2+LmBrO1AIY1fW54pSgS6ZZrdGDxfk9rLlXWx9TgcJ5fmuyF
 G7AN/uiQy1McZyCIrAxZrDbWNJ7kuoZPvRks6CHtfDkbCUVuDwWaKGEEop5xTBbV+79Y
 pBeKliskq6KsrkU9ZaBsMg4eLQ0QIvIa6Z7szWR0cpucjPF7tyRD2vx9RyKpvEc0VeYj
 PEUlpG5ru/3Bzan77S0CdzR1iaeuLn4ix4TxH3VtKk840Vc6z2+H8X19V1YzI5qbHj+z
 QyxBnkWzUlE8lajQOEUNCmTEC3DnTNQ55iXYrjTBO9vO7HyeW9TWYFdcrzQo+ise7mwa
 OlJA==
X-Gm-Message-State: AOAM530EqT2AXztvR8nITtbAo8/15h5CmQ3PEZzlgLF0bokBzvt5Up0T
 FGYgrmlaNiJKj1XIWUBci9Kjaw==
X-Google-Smtp-Source: ABdhPJwa6iP87bZYs4X21K5+3wDMXcHzOj2n/x2lHb7f3gJBZUZIzo0xoGMZegxf6iCAqtNtXROqTA==
X-Received: by 2002:a9d:458e:: with SMTP id x14mr5050525ote.231.1616623633878; 
 Wed, 24 Mar 2021 15:07:13 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id v6sm799563ook.40.2021.03.24.15.07.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 15:07:13 -0700 (PDT)
Subject: Re: [RFC v11 23/55] target/arm: move arm_sctlr away from tcg helpers
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-16-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2251f4fa-a0da-2706-8a21-329dc3f7c56d@linaro.org>
Date: Wed, 24 Mar 2021 16:07:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323154639.23477-16-cfontana@suse.de>
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
> this function is used for kvm too, add it to the
> cpu-common module.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

>   /* #endif TARGET_AARCH64 , see matching comment above */
> +
> +uint64_t arm_sctlr(CPUARMState *env, int el)
> +{
> +    /* Only EL0 needs to be adjusted for EL1&0 or EL2&0. */
> +    if (el == 0) {
> +        ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, 0);
> +        el = (mmu_idx == ARMMMUIdx_E20_0 || mmu_idx == ARMMMUIdx_SE20_0)
> +            ? 2 : 1;

I only thought of it because of the comment, but *E20_0 is aarch64 only; 
aarch32 always uses el = 1 here.  ;-)


r~

