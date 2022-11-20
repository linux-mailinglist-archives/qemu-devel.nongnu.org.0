Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B65631759
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 00:32:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owtmA-00087t-TG; Sun, 20 Nov 2022 18:31:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1owtm8-000872-5v
 for qemu-devel@nongnu.org; Sun, 20 Nov 2022 18:31:00 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1owtm6-0002wL-JS
 for qemu-devel@nongnu.org; Sun, 20 Nov 2022 18:30:59 -0500
Received: by mail-pg1-x52b.google.com with SMTP id 6so9662924pgm.6
 for <qemu-devel@nongnu.org>; Sun, 20 Nov 2022 15:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WPrCWlJRpAJmaETVxpVAb6jxUrIkOnuqcJNzEb1dMeQ=;
 b=OxS75qiozExAXIv12ryP0yILCuXrPqk1ia+T8Uef8kJP6UA3v2TTORJGYoN8jmStpg
 0tU58GJzLP37/eS/tByKQTkkEJUSqAf/NBXnGALhQhR6bervMMpBqIxHaPTySgvuTYko
 WfYv3Kwuh7/BQjkYAGHA7YJhCdXywdIoTEDRVtxSK2DViFnn9PDIbgb8RcspeLpdPeIl
 zuehRYG+55VqKr2ExOF7o4ptcovRpjA2A0yD7cO3ZbQl+OSmjmyaPIsMZNjiukt2YkEI
 sxJa6uwIoURdSJMa4BWybgOUnb7PXf2kprp992kDxWB74KaMUaTkDVDhfantWc4amS0I
 1usw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WPrCWlJRpAJmaETVxpVAb6jxUrIkOnuqcJNzEb1dMeQ=;
 b=Mg7E3oxuJUEFiGksT8LRlsPDfKCLyqW7sRj2PH2sAufC2e5uC9cLN4vMRvYcvyTQsr
 t8y17yHUWI2+wPB2D4oyD5zn4LMKgSAEoJYyUUqse7N/5AJ3/0bbJBYIt2s4qtdotxch
 vBSi7y8JHBY3WkD2IcZh2aQwoiXSo8IByIjgPe2mPhdfHfO20IMtxr2jEkRx6BWfKflc
 BccF567Yl78vWfwUivo/cv7XWEgZDRlz/sASGIfEmhhNbh2S9oD/0MleO1xlLqNSR2v6
 RCHQvDZRFrULlLeVj6DadP4S9tf+vzivvsGqwo2EmadKR4gsj2AH56cjEUgEQo9WvS/7
 /ATw==
X-Gm-Message-State: ANoB5pmimoeqw4u83NOUOhnjDeW0dIbhexGSDwNviSgR+cDn+6RCkH52
 8kXHAAwH3eHpLBz3iyKQDzFdBA==
X-Google-Smtp-Source: AA0mqf7+I+Jy9pyX+zChu22AceUlfhtWK69drAdPL6qop34Zdg7CuvlI/91vfuezkxJZNG81GOO+Ew==
X-Received: by 2002:a63:5a02:0:b0:477:15c9:423b with SMTP id
 o2-20020a635a02000000b0047715c9423bmr14196015pgb.374.1668987055508; 
 Sun, 20 Nov 2022 15:30:55 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:ff2a:795d:f1df:2976?
 ([2602:47:d48a:1201:ff2a:795d:f1df:2976])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a17090311c300b00186a6b63525sm8177871plh.120.2022.11.20.15.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Nov 2022 15:30:54 -0800 (PST)
Message-ID: <702c1474-2dd1-1e09-935a-427b97a24652@linaro.org>
Date: Sun, 20 Nov 2022 15:30:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH for-8.0 1/7] qemu/main-loop: Introduce
 QEMU_IOTHREAD_LOCK_GUARD
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221118091858.242569-1-richard.henderson@linaro.org>
 <20221118091858.242569-2-richard.henderson@linaro.org>
 <87k03s75c5.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87k03s75c5.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

On 11/18/22 05:30, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Create a wrapper for locking/unlocking the iothread lock.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> Cc: Paolo Bonzini <pbonzini@redhat.com> (maintainer:Main loop)
> 
> You might want to review Paolo's comments from:
> 
>    Subject: [RFC PATCH] main-loop: introduce WITH_QEMU_IOTHREAD_LOCK
>    Date: Mon, 24 Oct 2022 18:19:09 +0100
>    Message-Id: <20221024171909.434818-1-alex.bennee@linaro.org>
> 
> So it would be worth having the WITH_QEMU_IOTHREAD_LOCK() and
> MAYBE_WITH_QEMU_IOTHREAD_LOCK() helpers for completeness.

I don't see that (MAYBE_)WITH_QEMU_IOTHREAD_LOCK is particularly useful in any of the 
cases that I converted.

> And of course the name cleanup.

What name cleanup?


r~

