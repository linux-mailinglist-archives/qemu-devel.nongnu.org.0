Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BE16E0AAB
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 11:54:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmteT-0004Xf-FX; Thu, 13 Apr 2023 05:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmteQ-0004Ut-TK
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 05:53:58 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmteP-0005LF-Bl
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 05:53:58 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50489b16e6aso3279148a12.1
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 02:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681379635; x=1683971635;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cxsayw16syAi5vu1czzU3NWmvxL/vYeb2b5FUcMh3hk=;
 b=NOueP4bKsqt1HpPILkwhCP1GT6R+W5nifmkiP91N8BthL4BuK5F+Tqn8CU7IMAgWcq
 4SR/giCEAi2w7hR6wfsvlLnsgQKxRW5WecDauMNdFtxjDhYcl0qj8UtVx+yIuuJPyvCb
 gV55Z8auMPBqyqA84twMSeLKPN/vWQIAk4qPFDL7XutuJW3zaPaNGsWBvqAlkxaj+yUD
 og8OQDdu7Y4XpK0fQlEbD5o/xrL9py65JgBWcIu0NxenkpIW1115MowH1ztztPsEpMcc
 fncy67rm5K7yO249E/qjIaPuUenlTkb1hBwwExbE0jiWD1c97hanKWR5IWKi9mQv5Ciu
 2bbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681379635; x=1683971635;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cxsayw16syAi5vu1czzU3NWmvxL/vYeb2b5FUcMh3hk=;
 b=ZccUXzcLMqq0Hb13RkVlyKmddYSS+eFqRvy8haFa0XiMJm4mD4kdBWVe8kkX0XTigO
 +ExABFXPV1Vy5puYYWjIDluiybjNjUaLHzTza3E0VVlaacSaiktlC2HU16yydr32v1vN
 lSfQiW49EvMEW/XOhLLwm8BJXlxgKbeL87cKbNgEY4Qzs98+gCef2Zpsg1FAX3tJ3S7n
 +0CktF5JtOGi5AnDNM41J0i+7Q6cfa6jcQ8RqUlAs8+KxCPKBCro2Jp2yaN2T+jnafOS
 xRniL0cc2Oi//1wAaZtGrW22TBypIhL+3F2UWjZC/S6s1hzDEK0lfLoVx3Q2C2Nms8Cg
 0c5g==
X-Gm-Message-State: AAQBX9cK8lU0bJfBuouLvxqCFM8vJcusKciUULIxLZ9OBzBfNI5rIaPt
 QnVeV8pHo8PJv7V2+iSruP9r1w==
X-Google-Smtp-Source: AKy350YeIcc2gFLqbLSzDuRIyYamM5IeNjPSKgfXm8hiMtVkK/8Mdk1Sj8c0TKz3DQO0c6GZIcCpnA==
X-Received: by 2002:a05:6402:158:b0:504:b5e2:1106 with SMTP id
 s24-20020a056402015800b00504b5e21106mr1666458edu.31.1681379635582; 
 Thu, 13 Apr 2023 02:53:55 -0700 (PDT)
Received: from [192.168.30.227] ([46.183.103.8])
 by smtp.gmail.com with ESMTPSA id
 o23-20020aa7dd57000000b005047847d3e5sm612624edw.36.2023.04.13.02.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 02:53:55 -0700 (PDT)
Message-ID: <c84bbc8a-155e-d850-7e8e-6777d7103680@linaro.org>
Date: Thu, 13 Apr 2023 11:53:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 18/20] bsd-user: Automatically generate syscall_nr.h
To: Warner Losh <imp@bsdimp.com>
Cc: qemu-devel@nongnu.org, ryoon@netbsd.org, kevans@freebsd.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, riastradh@netbsd.org, brad@comstyle.com,
 reinoud@netbsd.org, jrtc27@jrtc27.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230411170955.17358-1-imp@bsdimp.com>
 <20230411170955.17358-19-imp@bsdimp.com>
 <7f006fb2-d88c-61e2-d536-ba6369107972@linaro.org>
 <CANCZdfrWPxfQXBUsTqG9qezuN+qvdfamOJo2rLeO9Ass1PCPyQ@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CANCZdfrWPxfQXBUsTqG9qezuN+qvdfamOJo2rLeO9Ass1PCPyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.083,
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

On 4/12/23 16:21, Warner Losh wrote:
> 
> 
> On Wed, Apr 12, 2023 at 4:10 AM Richard Henderson <richard.henderson@linaro.org 
> <mailto:richard.henderson@linaro.org>> wrote:
> 
>     On 4/11/23 19:09, Warner Losh wrote:
>      > +++ b/bsd-user/syscallhdr.sh
>      > @@ -0,0 +1,7 @@
>      > +#!/bin/sh
>      > +
>      > +in="$1"
>      > +out="$2"
>      > +bsd="$3"
>      > +
>      > +awk -v bsd="$3" '{sub("SYS_", "TARGET_" bsd "_NR_", $0); print;}' < $in > $out
> 
>     If the host/guest syscall numbers always match, there's no point in using
>     TARGET_freebsd_NR_foo at all -- just use the original SYS_foo symbol from <sys/syscall.h>.
> 
> 
> long term, this is likely correct. Short term, though, changing to SYS_foo would cause 
> quite a bit
> of churn that I'm looking to avoid. 

Fair.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

