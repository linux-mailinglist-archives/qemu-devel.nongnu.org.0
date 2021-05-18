Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EB63876A5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:36:31 +0200 (CEST)
Received: from localhost ([::1]:54704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lix5S-0001IA-Uk
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwsS-0003j7-Gp
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:23:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwsQ-0007a2-SW
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:23:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621333382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CbuKORZJgXdODuLYenYlRDs4NAEWsuVqokm6xzn7M/o=;
 b=YCqKfO9AatsDZJ2o4l88YFQZj3c9MfcRMm5/0PjG3cX+L0S1rQbgADNjRt3zReQSZTsEe/
 Hx9/AiCazO4MTR1b+fPcx/L8sMOVX0Nt2dh/wWgcpaPU1cd4Zmsc5EUg5igggbsyJ6KuCY
 bGDZA6O6TP653TekyntIYw/SnkBE1h0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-FI29Tv-1NC-JInXp3VN96Q-1; Tue, 18 May 2021 06:22:58 -0400
X-MC-Unique: FI29Tv-1NC-JInXp3VN96Q-1
Received: by mail-ej1-f70.google.com with SMTP id
 v10-20020a170906292ab02903d18e1be8f8so2184680ejd.13
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 03:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CbuKORZJgXdODuLYenYlRDs4NAEWsuVqokm6xzn7M/o=;
 b=bqQfghT+5/cmdNRUIPHgMujyWLDOKpys+NhR3etzVHMKkjbnXyGhjIWxyOpAc0DgkN
 sfCkqcDnQR4Zj5rVxsACazbaFPCZzgq9WMN09nVHt/Ndu+jJ/PpXve3NCxi/9z5uWEQq
 fqfbC9cwiHzaKLSgyowGG+pftQ3j6b5GXNk9+ImgIVkz1aGgTEP6O8ItxcLJrRmwliZb
 3jR93b5V88NWUD0/4wpOmo5xBnj/cZqRSiSpnGioUJn4miP/TZM87sw23ox8IaBc7hWQ
 dlJB9Vqs3IjN6c1wylLeLeeQ2Fz5GTxtwTqcpjqMClHCwgkaoqmA8CHaB9yO5hVXCwsJ
 AOgQ==
X-Gm-Message-State: AOAM533mDXiFJdijS9CnwAF1rHlk/tU8WlULSsXFCtq6ehzOVWzYM+v3
 5bUNzL9MnPkq3Llpo307fUQQTgKo99k0wR8o8re+M0tRQWkPrpAAd16lyQZDEGFIwqmbQQylvKX
 NvN7SiDFDMvUJkq0=
X-Received: by 2002:a17:906:3a57:: with SMTP id
 a23mr5169549ejf.81.1621333377643; 
 Tue, 18 May 2021 03:22:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqetLJNFMnacj6IYiE0ZQwbmcYPIocClXK6FAXYAmGOJHAApxHKNqFkIGE8YL07DIFhyHS2Q==
X-Received: by 2002:a17:906:3a57:: with SMTP id
 a23mr5169527ejf.81.1621333377429; 
 Tue, 18 May 2021 03:22:57 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w11sm13828360ede.54.2021.05.18.03.22.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 03:22:56 -0700 (PDT)
Subject: Re: [PATCH v2 49/50] target/i386: Move helper_check_io to sysemu
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-50-richard.henderson@linaro.org>
 <a843bff3-291c-34c3-76f7-5ffccd004fe9@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b15e4278-1ac2-bf64-1fca-cfde4629a6f4@redhat.com>
Date: Tue, 18 May 2021 12:22:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a843bff3-291c-34c3-76f7-5ffccd004fe9@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: cfontana@suse.de, f4bug@amsat.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 19:45, Richard Henderson wrote:
> On 5/14/21 10:13 AM, Richard Henderson wrote:
>> --- a/target/i386/tcg/translate.c
>> +++ b/target/i386/tcg/translate.c
>> @@ -193,6 +193,7 @@ typedef struct DisasContext {
>>       { qemu_build_not_reached(); }
>>   #ifdef CONFIG_USER_ONLY
>> +STUB_HELPER(check_io, TCGv_env env, TCGv_i32 port, TCGv_i32 size)
>>   STUB_HELPER(clgi, TCGv_env env)
>>   STUB_HELPER(flush_page, TCGv_env env, TCGv addr)
>>   STUB_HELPER(hlt, TCGv_env env, TCGv_i32 pc_ofs)
> ...
>> @@ -681,6 +683,14 @@ static void gen_helper_out_func(MemOp ot, 
>> TCGv_i32 v, TCGv_i32 n)
>>   static bool gen_check_io(DisasContext *s, MemOp ot, TCGv_i32 port,
>>                            uint32_t svm_flags)
>>   {
>> +#ifdef CONFIG_USER_ONLY
>> +    /*
>> +     * We do not implement the iopriv(2) syscall, so the TSS check
>> +     * will always fail.
>> +     */
>> +    gen_exception_gpf(s);
>> +    return false;
>> +#else
>>       if (PE(s) && (CPL(s) > IOPL(s) || VM86(s))) {
>>           gen_helper_check_io(cpu_env, port, tcg_constant_i32(1 << ot));
>>       }
>> @@ -699,6 +709,7 @@ static bool gen_check_io(DisasContext *s, MemOp 
>> ot, TCGv_i32 port,
>>                                   tcg_constant_i32(next_eip - cur_eip));
>>       }
>>       return true;
>> +#endif
> 
> This ifdef means the STUB_HELPER above isn't even used.
> This is caught by clang as an unused inline function.
> Will fix for v3.

While you're at it it's ioperm, not iopriv.

Paolo


