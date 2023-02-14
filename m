Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1308697100
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 23:58:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS4E6-0001OE-VJ; Tue, 14 Feb 2023 17:56:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pS4Dr-0001NS-RH
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 17:56:29 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pS4Dq-0000yi-4n
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 17:56:27 -0500
Received: by mail-pl1-x62b.google.com with SMTP id d8so17334003plr.10
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 14:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vwLeE02LVEPpg2m8nKgzFw4Fk31sfmNOFStJijCQ4Jc=;
 b=H42tsn0IyBuLgG9pkXYYhfIerX25HiH1gGqJ5TRW02CNer6fdrNPpZA1MvVe4jt5GO
 JrHP5K3vizxGVhv6Kz45eIOGTY6zBby5M0mSAc8s5Uhfc+7dSKSFdKy/uP5Tj1xlaYds
 zhSMO9u60NTBkxpEKc+j1H1Q378c3WM9if18oV+5JRzQuPvmEvQvRvX6nr8k1j83c89d
 QsCOsJrDM7+BrnupIoN8ViIuwWixBf6nnekGy15ShI8Urqidjn8SiDENbobT+7B5z6A3
 lnvSsvbzG1b3p3pAYWQDoWLXWKQMwaTo4LIyLpVkgvCCGoJnw/z2gOg6GRDqw7aiZwiZ
 s2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vwLeE02LVEPpg2m8nKgzFw4Fk31sfmNOFStJijCQ4Jc=;
 b=Iw2Iz4dggo0lvJFXk44n1DUmAvVbIVfLALheMTbpDTQnrXCbqzxHR9vmerxItRxKou
 oAlkbmWeoc8kTl8l0u5Un9TIxPK7RlnIyY1T83gmNkF3PKT05uPZZu4OY2Hbv5SWMDMp
 lwiMAggQW4zASbqivOjLy8EIJbpf7UGfpcRNvlho0hFapy7TBEFft5TADoHceK4+Z8C3
 R7HN/WaV7W2VAIFVmujtjYAxw7hQfD6he6SKC9YMJhgyA+ctxWwbYRJWtA7k9gE3JCoL
 WgRGzpQcKGVF2rN/Yc4zhNJYmYi8pHDLwca4JrOtAUWi7opVjP20TIDt0GqA9YoXZTzq
 Y6bA==
X-Gm-Message-State: AO0yUKV2kRdf/S1mnmnJoB3FOA3zqdqPSMyC8hvyZy/2r2fNPAyWVTbV
 wDjFgAl+P/ui9JATV4a9QC7w2g==
X-Google-Smtp-Source: AK7set8wr52Qj/bUXa2MjdIuql+OY9tJ9WHgXgr2e4Kjwj/KVyjaRTy6qLu+kFa/BPQwPsBZPztmWA==
X-Received: by 2002:a17:903:110e:b0:199:2051:3c82 with SMTP id
 n14-20020a170903110e00b0019920513c82mr434057plh.11.1676415383251; 
 Tue, 14 Feb 2023 14:56:23 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 l3-20020a170903120300b00186c3afb49esm10687226plh.209.2023.02.14.14.56.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 14:56:22 -0800 (PST)
Message-ID: <4b6eefe8-0450-8323-15a7-74958765052b@linaro.org>
Date: Tue, 14 Feb 2023 12:56:18 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 05/14] target/arm: Simplify register counting in
 arm_gen_dynamic_svereg_xml
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-6-richard.henderson@linaro.org>
 <875yc4kp92.fsf@suse.de>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <875yc4kp92.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/14/23 09:42, Fabiano Rosas wrote:
>> @@ -310,8 +313,8 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
>>       g_string_append_printf(s, "<reg name=\"fpcr\" bitsize=\"32\""
>>                              " regnum=\"%d\" group=\"float\""
>>                              " type=\"int\"/>", base_reg++);
>> -    info->num += 2;
>>   
>> +    /* Define the predicate registers. */
>>       for (i = 0; i < 16; i++) {
> 
> There's a info->num++; at the end of this loop.

Good catch, thanks.


r~

