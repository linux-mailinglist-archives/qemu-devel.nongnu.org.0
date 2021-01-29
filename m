Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAA5308E65
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 21:31:31 +0100 (CET)
Received: from localhost ([::1]:38150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5aQU-0005O5-B9
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 15:31:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5aET-0007L8-Dd
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:19:05 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:34155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5aER-0003Lv-KM
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:19:05 -0500
Received: by mail-pl1-x62e.google.com with SMTP id u15so5918698plf.1
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 12:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=U2Vvxi3FuBgMTxdvYk0aTAMkcZcrnTV/Y69WhMz95+A=;
 b=qf5DuO6ojcn6B+cpZxErVpPsL+adO/tpGxasA3th12z6ZCkuOoSuM3HWlQ8KeAdpWx
 Qy98OTOymKq5fZ5/gK17DNeii1gZBL22eJaVoMp1+E+gP7q0oicQPrMUXwrKfggia4ZX
 Oks3b66vEkgj1IkoPpSwpGaDOc/T9ql/6AtC4SaPWl9Un9RzCr/YqoTsu177/j3/ObR8
 4vvC5XznvkMFqRAi1LmlasTsQFqvgDU8ERn4cxRE4+/atai0X07GdQLGOn0pAFqVilQ8
 DHDoGxDmSZiuAOLnyljNX8d5X1jU+D4nScRTiYn3s+bSPEXzbeMIoijEq22RQsIdHxma
 fOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U2Vvxi3FuBgMTxdvYk0aTAMkcZcrnTV/Y69WhMz95+A=;
 b=AANPPwGgvQfLWZcviTOEPAarBPbs8QDtE9B6v/IeCGuVnVA1MHznrTgqSBFEiB7xZ5
 HLftSPLIwnNDr5rYw3i37sob8fGvBshEe110n9u63DR+HAUnurIJy5/pphnrI2ZRZJNc
 WZ1iZvA00MkDPN62JSPddSDFkJKq2gHXmanDQQ2WBZvOZmkF+5E/tyU7dO/nI285tmyO
 tAomynfWrNqsA+fVwD3GnI2y+p5j1Ihdyq0+kiDy80Nkkeh6ytETPx4lDzSAXjpKjGgl
 4+s7hCQo540fI23S0rKX4w2EVuUF0Qw64B65tmaflMoLoWZL2rFcUvs8t2a25xcNH4d9
 bT4g==
X-Gm-Message-State: AOAM531yEe6niKzRmdzzVed1avjFhF9iB1bAJrbxYul8P+XgpFk86zhQ
 3YlYSBRyF+cdQJULEBnp7pG3uQ==
X-Google-Smtp-Source: ABdhPJwcMFDFMUaMyoBzFmsBCpgAT9Fv5a/mxRrMX23uV1E5rc63gXhm3xz6oClbw4bST8f3D4V02A==
X-Received: by 2002:a17:902:ff06:b029:e1:1466:f168 with SMTP id
 f6-20020a170902ff06b02900e11466f168mr5629401plj.59.1611951542059; 
 Fri, 29 Jan 2021 12:19:02 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id w124sm3754766pfb.75.2021.01.29.12.19.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 12:19:01 -0800 (PST)
Subject: Re: [PATCH v3] tcg: Fix execution on Apple Silicon
From: Richard Henderson <richard.henderson@linaro.org>
To: Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
References: <20210113032806.18220-1-r.bolshakov@yadro.com>
 <e0b70beb-2905-9520-e825-219278fe4ed7@linaro.org>
Message-ID: <330c4b1a-6a8a-3625-8c39-7f9c88b20847@linaro.org>
Date: Fri, 29 Jan 2021 10:18:58 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e0b70beb-2905-9520-e825-219278fe4ed7@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Joelle van Dyne <j@getutm.app>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 8:34 AM, Richard Henderson wrote:
> On 1/12/21 5:28 PM, Roman Bolshakov wrote:
>> @@ -1083,6 +1083,12 @@ static bool alloc_code_gen_buffer_anon(size_t size, int prot,
>>  {
>>      void *buf;
>>  
>> +#if defined(MAC_OS_VERSION_11_0) && \
>> +    MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_VERSION_11_0
>> +    if (__builtin_available(macOS 11.0, *)) {
>> +        flags |= MAP_JIT;
>> +    }
>> +#endif
> 
> This hunk should be in alloc_code_gen_buffer, where we do the other flags
> manipulation.
> 
> I'll drop this hunk and apply the rest, which is exclusively related to
> toggling the jit bit.

Ping on this?

I would imagine that the patch would look something like

--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1296,6 +1296,11 @@ static bool alloc_code_gen_buffer
 #ifdef CONFIG_TCG_INTERPRETER
     /* The tcg interpreter does not need execute permission. */
     prot = PROT_READ | PROT_WRITE;
+#elif defined(MAC_OS_VERSION_11_0) && \
+    MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_VERSION_11_0
+    if (__builtin_available(macOS 11.0, *)) {
+        flags |= MAP_JIT;
+    }
 #elif defined(CONFIG_DARWIN)
     /* Applicable to both iOS and macOS (Apple Silicon). */
     if (!splitwx) {

But I don't know how CONFIG_DARWIN, iOS, and MAC_OS_VERSION interact, and I'm
not able to even compile-test the patch.
Certainly the final comment there looks suspicious, given the preceding MAC_OS
stanza...


r~

