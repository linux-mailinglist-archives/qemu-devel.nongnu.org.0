Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13CA381F31
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 16:03:40 +0200 (CEST)
Received: from localhost ([::1]:35324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liHMp-00034b-Ts
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 10:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liHL6-0002CQ-5k
 for qemu-devel@nongnu.org; Sun, 16 May 2021 10:01:52 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:40888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liHKy-00027k-56
 for qemu-devel@nongnu.org; Sun, 16 May 2021 10:01:51 -0400
Received: by mail-qk1-x731.google.com with SMTP id f18so3412174qko.7
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 07:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=o0yQFUVeNgvq7Epql+6PYQIEiNZULrlbZDWa5AJF0nU=;
 b=bQwT97ryOB4MhxWOPfAY9n2mGL5+4rNEhJN4lhTjqP2SRA04Shj8zaWWdBZHpdHAD1
 zMvM6qRDj8vLTnaEXElEexwvnK63wwRANsOE4WW3tgTPDPgivdvDBq4tnqO+pQUeqhJD
 tPVmu1QKaoq/Xg2Ha0xvtNq0jL1JqQfhB/neCuEK8rbBpeuQzXBOvnxJt677aMS/qtTY
 Rcflzz6eP7p/0I9vwOGHxL/qm9CCocQ0XiNDU3xQgxqqUB6tNONhFiSqqtqwXWj9U2PL
 Ojr3x9Cj0sD/sladlQn69nLcnGOSXcAp2ooqkYG2dvdGQU2hE5wTM4dDl2QxxkXQQw7/
 pnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o0yQFUVeNgvq7Epql+6PYQIEiNZULrlbZDWa5AJF0nU=;
 b=EufN/SJUJ6qSbDKBZ79vJEj7eikjyJSbLuCjFUbXj8tBiTCJ3ud3qFzciMJC1ofsqQ
 E5sPRXsGU/1mFPZNmSAH0D/xzbk8Yze92jwz3FfWBd/YzSVYBlokh8oX/tmCXrPDnex+
 lL9XtzwT9wJCRlKs8SFfjDEkqPnryA4AJl4ylYUfi3in9w4ODL/cUaw4gUinOoLgQ4Ik
 Usedu7w+uCr1KhnT36v1W/pki48mPOp2yIbWupnNNIrEpafboxBn5POssmJBhVhJFDhS
 tertkEtZY+3gVe8VIHlavSiJ8zejdqfFVOGoz52h3VWgpldEqnz7oqQrJEeJ84QgPW39
 v6Lw==
X-Gm-Message-State: AOAM532Xo8RMES0VoQzyR7KnqRM+GJS198T19zxtcoTO8J1jIYB+YUFF
 ltVhopmyc86JrMmdfk7B8u3ytw==
X-Google-Smtp-Source: ABdhPJxZMViCkcY+Awd8Gre7hKkA9al3M3FpcUjIoaSHgif/KkKpQSaxtIpaWtVn6ncIoxRdfsoMCA==
X-Received: by 2002:a37:bbc3:: with SMTP id
 l186mr48595214qkf.273.1621173702825; 
 Sun, 16 May 2021 07:01:42 -0700 (PDT)
Received: from [192.168.182.172] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id e12sm8816260qtj.81.2021.05.16.07.01.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 May 2021 07:01:42 -0700 (PDT)
Subject: Re: [PATCH] accel/tcg: Align data dumped at end of TB
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210515104202.241504-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <90edde1e-b429-0364-8507-d760be8ed1fe@linaro.org>
Date: Sun, 16 May 2021 09:01:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210515104202.241504-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/15/21 5:42 AM, Philippe Mathieu-Daudé wrote:
> +                qemu_log("0x%08" PRIxPTR ":  .quad  0x%0*" TCG_PRIlx "\n",
> +                         (uintptr_t)&rx_data_gen_ptr[i],
> +                         2 * sizeof(tcg_target_ulong), rx_data_gen_ptr[i]);

This doesn't quite work, because


> ../qemu/accel/tcg/translate-all.c:2045:26: error: field width specifier ‘*’ expects argument of type ‘int’, but argument 3 has type ‘long unsigned int’ [-Werror=format=]
>  2045 |                 qemu_log("0x%08" PRIxPTR ":  .quad  0x%0*" TCG_PRIlx "\n",
>       |                          ^~~~~~~
>  2046 |                          (uintptr_t)&rx_data_gen_ptr[i],
>  2047 |                          2 * sizeof(tcg_target_ulong), rx_data_gen_ptr[i]);
>       |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                          |
>       |                          long unsigned int


However, I also noticed that we shouldn't be printing ".quad" for 32-bit hosts 
either.  So I'll just split this into two separate qemu_log invocations, based 
on sizeof(tcg_target_ulong).


r~

