Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D775A2B84
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 17:46:25 +0200 (CEST)
Received: from localhost ([::1]:52730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRbXL-0006by-W7
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 11:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRbOY-0003x1-Va
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 11:37:19 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:41647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRbOX-0001B7-Bw
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 11:37:18 -0400
Received: by mail-pf1-x436.google.com with SMTP id x26so1878717pfo.8
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 08:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=AGGjToEM/6sgP4/zB9eJ8e8ZTYol2qh9Nmue8/V8p4A=;
 b=mfjgBciPiAoz46nDkGmClREpeFImH/f1dwZRCRuQSUN8jgmADLlahcyeGLIjr8RTWn
 JfioEoREHr3fGwOjh8B9OH1sVMPVgaBFZ+fNlFvX9AKsQlsWHrdo5lB+4V5lXg6fy5MM
 M9E0eorpm7M9k0O8gYleJkpk3GuyJOUejB/8qkHzwnupuwgHTGQ6UZlQoKrxxl6l9x7F
 fNUcfXVVu3hhhPvvVqXcUaKjnyvxXm2NrET6qeryeymolz9feD+4POtbwoUk/sduzwAp
 6dTDZ4pHF33rSZRW4q6WPgh+JIArFnAVDMR8vFFw+zRlsOkpPcnfGcM86MFZ8WLADRt1
 Y4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=AGGjToEM/6sgP4/zB9eJ8e8ZTYol2qh9Nmue8/V8p4A=;
 b=hM3UbPJbro7p30yxrP6/4Ha4Ki+2Spy7x95duog2AlJuTzBXCiFMFVVainX2ThbHcr
 M6JCXnZgvOVDmowigj1ovON6z8TDGoqrkcHG31PSNZD1NzfI/PnQImbK7ifPHD4yC48T
 JypaXHisURmlUqUww9pRoxYvHZn6DNcY4MWmlNoOdA2ykWCqEcNlt78B+Ab27fbxZ+hU
 4gVxSwGYPfvMZFhaOpnvzazNK5nZm9kCi++CP91knB4vRU0ZbNCURWeezOSKiKMd19FQ
 70Ahp9hbBtWUD4pX3UwhGsL+gAlHCQjUjtuEqmXNMoyF8YLWBqAmjDCJ4RS5wj85tuIh
 Y0Vw==
X-Gm-Message-State: ACgBeo1A9ox7XobXhPQFxHFCy3m2or/39MYcTO6vF3IrpZqfXLDFlMxg
 IqsM58Yh4quGRUeqicDGoP8l9Q==
X-Google-Smtp-Source: AA6agR50HNcFK4qsXs7cHgxYl4CgnTYrLp2rlNSve5hyWOODdEiTtDeIQGPlRFa7C+FjiMcUCaM4Rg==
X-Received: by 2002:a05:6a00:2449:b0:528:3a29:e79d with SMTP id
 d9-20020a056a00244900b005283a29e79dmr4424277pfj.39.1661528235708; 
 Fri, 26 Aug 2022 08:37:15 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f?
 ([2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a17090a66c500b001f334aa9170sm1802916pjl.48.2022.08.26.08.37.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 08:37:15 -0700 (PDT)
Message-ID: <b699c3fc-734d-83b1-b95a-5fb437d66120@linaro.org>
Date: Fri, 26 Aug 2022 08:37:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 03/18] i386: Add CHECK_NO_VEX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220825221411.35122-1-pbonzini@redhat.com>
 <20220825221411.35122-4-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220825221411.35122-4-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

On 8/25/22 15:13, Paolo Bonzini wrote:
>               } else {
> +                CHECK_NO_VEX(s);
>                   if ((op6.flags & SSE_OPF_MMX) == 0) {
>                       goto unknown_op;
>                   }

Swap these, perhaps?  Or drop the unknown/illegal distinction?

Either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

