Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C548564F5FD
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 01:21:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Kw7-0004RE-9k; Fri, 16 Dec 2022 19:20:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Kw5-0004Qq-1S
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:20:17 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Kw2-0001RY-4H
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:20:16 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 e7-20020a17090a77c700b00216928a3917so7654932pjs.4
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 16:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w4v6UAzNL7fLzZHUFzW0vIVYiaqNZJRG4q5yNQ0pM+I=;
 b=Q/c2aXvh6xVtHFXVzoyTAz/MOEKf+w0kq2tDJyb+7qgjyhYdMHZ4MfPOynJ0BXYVh8
 lHOK31U9EA/zxeKBIZQNZhkGjt35abIZ+yCRGXSGQ6Dp7Lg5qPMJV5lowBQ4Dt9T2/I5
 jkXKgTd+9E/NG/XnpbI5n14dXHX73Ms67HLT5jSki0nCYFQUVs0IQrbbSkWyno9Jbvfs
 qQz1IlK6phWyT57pUxmLaZDPShHaUZITEs1EuZupcINggKNaFksVGXVuPxOAEFzwnJCB
 X45slcRbx2+X/xPQsEWAhOlvk5eG3PABPZeNfadx48NPjPG0TvV+5sO45geYkBqOAcph
 lQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w4v6UAzNL7fLzZHUFzW0vIVYiaqNZJRG4q5yNQ0pM+I=;
 b=HO9ZlbOfs7mRrtWygHFY9D+okaaHoula34dLj+65mdyUQX0dNmHDv4EClmBk+g6HoS
 wHPjtGC6oI52p/9egSNZ5YdIdM4TaA8TynA/sBwSLBWXRtV32OII0QeL+sp97ptiS9ee
 ZVjws+NxibEjaxovyYjqpW5lFWP3cI7VufH7HIt6Dz3iyZJ7Ed+vrnMqB92PSHD0fBnA
 HkO5MDiP7H+8aghx9hGXiSD8ns0TLcmgqA8QPj250n3RBSS7fyKwDJ/3S7+VmFtKzV2o
 ho2yA2FOZCleBx3w/P/mMGdE3mpUzn0mgh5LbIzc7ZknaPV1BLwbfcWGNxRuJrZ1VoJf
 CzLw==
X-Gm-Message-State: ANoB5pnCLP9DTiihxhDCFrT0ytBf6Prr+sdXjcQcGK2p/hYCLLAaTwbU
 EpRj2lpheHXUPEgwFa3BNGKycg==
X-Google-Smtp-Source: AA0mqf5ShgSuD9po5MbdLX0IkXQc+2BFv3/C1Y/ewrtY0Zr41J3QZe+CqgrbNUUoBPGFuWp6Udw3Zg==
X-Received: by 2002:a17:90a:9b0b:b0:219:28b7:c580 with SMTP id
 f11-20020a17090a9b0b00b0021928b7c580mr34584859pjp.22.1671236411531; 
 Fri, 16 Dec 2022 16:20:11 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 f61-20020a17090a704300b00218fb211778sm5339354pjk.41.2022.12.16.16.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 16:20:10 -0800 (PST)
Message-ID: <42c455aa-c93f-9167-59ef-ddf2b46ca2e4@linaro.org>
Date: Fri, 16 Dec 2022 16:20:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 5/5] target/arm: only perform TCG cpu and machine inits if
 TCG enabled
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20221216212944.28229-1-farosas@suse.de>
 <20221216212944.28229-6-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216212944.28229-6-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

On 12/16/22 13:29, Fabiano Rosas wrote:
> -    /*
> -     * Misaligned thumb pc is architecturally impossible.
> -     * We have an assert in thumb_tr_translate_insn to verify this.
> -     * Fail an incoming migrate to avoid this assert.
> -     */
> -    if (!is_a64(env) && env->thumb && (env->regs[15] & 1)) {
> -        return -1;
> -    }
> +        /*
> +         * Misaligned thumb pc is architecturally impossible.
> +         * We have an assert in thumb_tr_translate_insn to verify this.
> +         * Fail an incoming migrate to avoid this assert.
> +         */
> +        if (!is_a64(env) && env->thumb && (env->regs[15] & 1)) {
> +            return -1;
> +        }

This is a sanity check rejecting malformed vmsave.  While hw virt won't have the same 
assert as mentioned in the comment, it won't be happy and will raise some sort of cpu 
exception later.  I think it's better to reject the bad vmload early.  I suppose we could 
expand the comment to that effect, so that it doesn't appear to be wholly tcg inspired.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


