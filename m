Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4654F5A1D36
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 01:34:27 +0200 (CEST)
Received: from localhost ([::1]:37996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRMMe-0007yH-TH
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 19:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRMLK-0006c3-0m
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 19:32:59 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:33634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRMLH-0006FZ-Ul
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 19:32:57 -0400
Received: by mail-pf1-x434.google.com with SMTP id g19so22796pfb.0
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 16:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=VawTsHi5N0XS2XJVpcglTlOhvcK7IbcoVkVh71FXhbQ=;
 b=oe+BwvTnFxbwCls7tQQoSXV9gzDw29qYSenNf246vb50oe9Uf/dy7QFu4uIvbrVKMA
 A2REg7ETLat9AQvsvuUZUGRFjSwxsVb/vBgxDLMN9cs5P/vqg/uyyGO7z5dkgoRT8PmQ
 I4BRH3IqFrVKyTslTpi+AKRWpOEKq27xCXKk5LLhpEyh02m6723V2JGKbD6JYat9ZIfY
 /wA/XhVFPkV0pf+4yZUDS2zeI/xpmu/ZBqvrFeyUcPOQa9jk1+ErgtogayGX8ig4iDdj
 6rgXe9+JZXB9x0XJrvnxkdyJlws0r4qWLdQ37LjwkzmXYJajjO2rfgGWWRxvNWSVapWp
 /fFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=VawTsHi5N0XS2XJVpcglTlOhvcK7IbcoVkVh71FXhbQ=;
 b=uoaMkg23nKBbS5vlbCWyy/o1TKnLBnkP/T3fhbxoCWyQWzWiijaALW2qJPxTlSOljs
 wpQyaRMQyjf9DhPqRtIKJeSlyIdbmLjVNHySt8stpwPp2sdSraXYQHccUAmufLhgU6PK
 cXfhfvpni2E+MQG8G1lBSxDE24lQfjrPMWMSM5dpyGssJ6a96JK7wVs65Vt7CZKWH9En
 dVczoxzFceLgUg+4QYri0Jvun6upEGURdOrL7yBetsS3SfU9muLd9muup24AfusE+Gm8
 g2ePFfwuY6oH9koQGoXZFRA+2H2ZkVLZnpBF/CtKK5l0K5YGFUQRiZM5oLAaxmEaH/ox
 noMA==
X-Gm-Message-State: ACgBeo0RuCnkDfzLnFeWGf2W6Fjil5aGab1o88istPgZVzRtxn+p0a53
 h7kA2lDHr1Lha70qIksRigC/7A==
X-Google-Smtp-Source: AA6agR6vS/Wf8fVAphQm+32Mq3zjQ8pgUf0EnjGLm08hjuyhHGdao2nUwPqvPu2lM/GWrYCzfbFuhQ==
X-Received: by 2002:a63:5418:0:b0:42a:d773:cbd6 with SMTP id
 i24-20020a635418000000b0042ad773cbd6mr1143257pgb.106.1661470374030; 
 Thu, 25 Aug 2022 16:32:54 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:345c:4a6c:31b:1fca?
 ([2602:47:d49d:ec01:345c:4a6c:31b:1fca])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a170902d64b00b0017302933b5esm93095plh.301.2022.08.25.16.32.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 16:32:53 -0700 (PDT)
Message-ID: <53da3967-8541-9ea5-995c-5f2fcd6fcde7@linaro.org>
Date: Thu, 25 Aug 2022 16:32:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 00/18] target/i386: make most SSE helpers generic in the
 vector size
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220825221411.35122-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220825221411.35122-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
> This is the first half of Paul's series from last April, reorganized
> to have no occurrence of YMM_ONLY or SHIFT == 2---meaning it can be
> committed without much fuss, even without a plan for the implementation
> of AVX decoding.
> 
> In most cases this is done by using loops that apply the same code for
> all of MMX/SSE/AVX, in some cases AVX needs special-casing for the two
> 128-bit lanes and then this code is simply missing.  The missing helper
> code is just 100 lines though, so this _is_ the lion share of the work
> to adapt the existing t helpers.

Ok.  I'll note that this is a decent intermediate step for
further conversion to tcg/tcg-op-gvec.h, which has a parameter
for the vector length instead of having N functions with the
length implicit in each name.


r~

