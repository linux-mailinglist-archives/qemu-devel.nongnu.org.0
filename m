Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3145A32BB
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 01:42:26 +0200 (CEST)
Received: from localhost ([::1]:52592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRixz-0005yi-CY
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 19:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRiZu-0003tz-4q
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:17:31 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:34373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRiZs-00008I-Ah
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:17:29 -0400
Received: by mail-pg1-x534.google.com with SMTP id 12so2673443pga.1
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 16:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=QKFFJwWSQ0t/TTTF66wgqxbyw9HdKHkuBk+e+N0A4R8=;
 b=LOCTB9JE9MZ2vn9IwCCblv3p9bvGQefQBra2KQkeZHYNbcY7D8gvfO0PKHhwHZvTEa
 MGI3hPI3gBG97jDw73p5kVQn89eGOBCuP+H5RB9P9tb7xNQ1r6nukhYh7//YB6YvyxhN
 WYu2VOH4azufWWRADOBADxfgN+Rd298z6G/y7vf9Yv2GTEI/z9a7JuT5WwELaVMrnaF9
 GgRwm3Q+CervtWGBzYp5l0gbgaYiymUdWS9fwCayMI0nSqRRl0AuDMaqAWnzwHc34ddU
 uu2O1gTDzHjVq1aindBlNkMhC/sgZgaGlCDg+bCg5tmi+v2sFJ/2KyLtDNLPhoTsffoh
 0hfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=QKFFJwWSQ0t/TTTF66wgqxbyw9HdKHkuBk+e+N0A4R8=;
 b=ESY0WtWT4t6HjVYKVHM+ihVqycfNDX29wu4QA7TWtuilalMIIJZoUehdccrrXwXHS2
 2wu4ufT4XiuJBlPz3u3lxWxH0B9hQQ09ixqXDme/NVNGEVFAA9KJpKZXYyf6mXEvE1Wu
 MHPq6NDwfmPpfnt5EseEWS7BSS6N8A5/ry0VjsvhgK2QpRux+NVUYuwpPCvQboPYMBxD
 ezD9aZQb45z+Y8CgCg5QG1NcyjcZv+OSDFRdsQHUXf5bj0F2Lm6vtVCAeqpNb9OVqbBr
 6436oJLmUPdzokaBafmLUrUcbozli4ZfhV9RNk/ofBL0X/5Mp2PLGztG+2uA/R515T80
 bfNA==
X-Gm-Message-State: ACgBeo3uyCZLMvlQGT0Z/Oc9hFd4kcLEMEntGIzRUGyUPito+SvwmAGu
 B3nWpg2HZLjRL69wW65d52xniQ==
X-Google-Smtp-Source: AA6agR6AYKeuC9fVR2ZwV6BoVKrpdj5H432KhlnWoQVfvnS5E3H15vZQRpjVptFvcWpB26h1rRTHQA==
X-Received: by 2002:a65:6cc4:0:b0:412:35fa:5bce with SMTP id
 g4-20020a656cc4000000b0041235fa5bcemr4942575pgw.466.1661555846663; 
 Fri, 26 Aug 2022 16:17:26 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f?
 ([2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a170903018200b00171311470eesm2174034plg.8.2022.08.26.16.17.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 16:17:25 -0700 (PDT)
Message-ID: <4b0d4348-2408-9d3e-27ef-9b88456dc401@linaro.org>
Date: Fri, 26 Aug 2022 16:17:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 01/23] i386: do not use MOVL to move data between SSE
 registers
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220826231204.201395-1-pbonzini@redhat.com>
 <20220826231204.201395-2-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220826231204.201395-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

On 8/26/22 16:11, Paolo Bonzini wrote:
> Write down explicitly the load/store sequence.
> 
> Extracted from a patch by Paul Brook<paul@nowt.org>.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/tcg/translate.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

