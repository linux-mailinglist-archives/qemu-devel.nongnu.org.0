Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEFC3210BD
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 07:13:41 +0100 (CET)
Received: from localhost ([::1]:44052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE4TU-0004Qc-Nh
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 01:13:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lE4Rw-0003kf-BM
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 01:12:04 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:38975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lE4Ru-0002rk-Rv
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 01:12:04 -0500
Received: by mail-pg1-x52a.google.com with SMTP id o63so9600827pgo.6
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 22:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=o9xqAn51OtDIEgDWI77glzS6uMMMJ4GFCxZ06c7zJW0=;
 b=RhX9QUsKgNRVPBBl7lNIgVt1bhxth1cimn+51X8AIoiNYWlXHMUuscLGztuufb6F6V
 /PLinp98Spa/JJ85P2X1UP4EYZ3cbULSy+RKQO0tpWlsMZFTkd4U8IVi9no8jwy2t5Ux
 uYEulkGkz0KzIEBYCVCHw8fbJ+D799iQ/1ZCa9a4QaABxYh5IJqcf6XgWIQfb0w7z8pz
 /Trl8GuzIySc8de6OfsiUikjQKiL39K6dDGgm6SKr+PnymYY/quevqyDu+QisAGJOhcD
 nHVcrgRMpzuTS7mCjneNaXRGdWg0RAB0e4m1xZ4APteVj0BBkRSRhCFhSPnzvoZGEQLS
 w95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o9xqAn51OtDIEgDWI77glzS6uMMMJ4GFCxZ06c7zJW0=;
 b=XZuE5p2Ht9CiSw4HTeolHVfDe0+6VQQpRR0u0ZVZYTBi3or+2g6eVzWCVM8Ji9JdBr
 zUfBgiB5zEspFaTYl9+Fiff18fc+5TsIzMMuC6mLqpDjYbldAwIFM+k26IHV6UmEtAs7
 PzrA84m0fiNt0CTCxQ2fJqK4tAmFdY6gIkvVASG29KivayxWq1bugEtTrrAs5bUF09Oj
 b+uyCZGDUfmp/7gUsAe7QDbcXVopcmcM2DGi7vCujyiA+zeGD8TW5bEY9jc8yNtesaTd
 y8kj7xgmaZM/kG2qY0rWDaD15+MxHAvV67fjWYhPkdMcTGZkmCZSGSAbt326Cajr10xm
 z6VA==
X-Gm-Message-State: AOAM532QB08R3GUTL9+6xYMb/IoiqYzjA3HENr/ftf+QXOiLHLC5rCwv
 Pa4rt+kvtB0UpfdKtYb4o3yiCSspWo96aw==
X-Google-Smtp-Source: ABdhPJwfE32q6ssa1zyIUSHTGmk9bnZVhLJYtsf8zeBRls16PzyD/n0nfM0Q5b+UBVfYI0CIR54seg==
X-Received: by 2002:a62:6304:0:b029:1c0:d62d:d213 with SMTP id
 x4-20020a6263040000b02901c0d62dd213mr20378210pfb.79.1613974319642; 
 Sun, 21 Feb 2021 22:11:59 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id o1sm16272153pgq.1.2021.02.21.22.11.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 22:11:59 -0800 (PST)
Subject: Re: [RFC v1 32/38] target/arm: cpu: do not initialize TCG PMU for KVM
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Claudio Fontana <cfontana@suse.de>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-33-cfontana@suse.de>
 <ea91e888-10db-8abe-7a62-bc4532ba99eb@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0afa25c0-5c09-0c6c-82a3-db18f055ea06@linaro.org>
Date: Sun, 21 Feb 2021 22:11:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ea91e888-10db-8abe-7a62-bc4532ba99eb@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/21 1:53 AM, Philippe Mathieu-Daudé wrote:
> On 2/21/21 10:24 AM, Claudio Fontana wrote:
>> From: Claudio Fontana <cfontana@centriq4.arch.suse.de>
>>
>> KVM uses its own PMU initialization.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>  target/arm/cpu.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index a8321fecf8..d334987cad 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -1648,6 +1648,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>>          unset_feature(env, ARM_FEATURE_PMU);
>>      }
>>      if (arm_feature(env, ARM_FEATURE_PMU)) {
>> +#ifdef CONFIG_TCG
> 
> Shouldn't this be #if !defined(CONFIG_KVM) ?

No, because that would break the normal build which enables both tcg and kvm.

But I think there shouldn't be an ifdef at all, just a stub.


r~

