Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B15A2D11B1
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 14:18:54 +0100 (CET)
Received: from localhost ([::1]:54382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmGPl-0004Z6-CO
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 08:18:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmFxR-0007co-B4
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 07:49:39 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:37767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmFxL-0001um-W4
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 07:49:33 -0500
Received: by mail-wr1-x442.google.com with SMTP id i2so12652381wrs.4
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 04:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ff9dudwKzr9RKp54jL9aoNOKi5jGdTwCO9eItajzqEc=;
 b=IVnn0AIhYSHv9u87ESDdqrWomo8kk0nc3fiHqKd3Z2OYvGrnNORnRLycA+wMW3OxXU
 i6lHg/g70V4/Eh1GbmzzBu+eTDo7jWQzotzY7EauYa5GbqC3MzsIhhi7cuKQwVmksCmB
 SCFksi/MAgZsjMW3PNvykh23hQWI5O3JI2IunjSWwFZd7nZ25E/+KipY7naETB1ruucA
 ag4YHhUZaKjvx9yfLwOShMakGt6M4XRKTT/Wx8J3SvYzMPAmPBwoY76mfFykRdDirogi
 cItLxdSfduTJochct1rbUPWuXGXi587JGbyqkkyPJZ4skVxEo7Y4+7JVQ/YaQnL+8i0G
 SfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ff9dudwKzr9RKp54jL9aoNOKi5jGdTwCO9eItajzqEc=;
 b=HcydIUEEkppgumpT4PBq6sdUkl2dR4B6qKUcHGE1WjPh3DHRrRvo7IRkHWB0ZOtMMM
 EM78jmOuq1yBmtxS4WZwsAa6hUkpvGAXeuvZhsHQVDfp+SwZIB+PAzFfIfueaoyhsF4k
 w6r3tQ4VbOh8+K3tsFRSepgzUxenQ0Wdsgh0nqgCDc4PYpDldVZs80rs9syxCGFd3Ifv
 mjGglWro/HXcY38p+rg+RiaCSGC7V040+XLV2n+GdHm6VKnFmPdpsnmSoNocN1aUhMx/
 PCcNRdp+uSCf6zYfs7e73UOULKzFSR6/gxq3rTCihMWoNDhtfUkEaCPELI3Utx+qorSj
 /hig==
X-Gm-Message-State: AOAM531ksnw/KrdxhF725OfHgbNbvCx6N03piHUr4eiypXzynjmiFOMv
 iukwSEoIR4/5KV+mIo1CRD8=
X-Google-Smtp-Source: ABdhPJwlJ8CPD2Sept02Gb7oU5fhvYr05v1HXgF+3Qwi0gzpfCkIJhVHqwmIc3CsbfwKoxRa5ZdGEQ==
X-Received: by 2002:adf:8184:: with SMTP id 4mr16425617wra.63.1607345369527;
 Mon, 07 Dec 2020 04:49:29 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id s13sm15034323wrt.80.2020.12.07.04.49.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 04:49:28 -0800 (PST)
Subject: Re: [RFC PATCH 18/19] target/mips: Restrict some TCG specific
 CPUClass handlers
To: Claudio Fontana <cfontana@suse.de>
References: <20201206233949.3783184-1-f4bug@amsat.org>
 <20201206233949.3783184-19-f4bug@amsat.org>
 <88161f99-aae5-3b80-e8c6-a57d122a28c4@suse.de>
 <61618998-f854-a7df-301f-f860d9725f1d@suse.de>
 <3956df0d-a42e-f3af-d5e1-cf396ddcb795@suse.de>
 <5d11701b-31f8-cfcd-30f9-3eba62c3bab7@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <92611fa6-b3bc-51d2-f90a-995b9cc99bf4@amsat.org>
Date: Mon, 7 Dec 2020 13:49:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <5d11701b-31f8-cfcd-30f9-3eba62c3bab7@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 12:43 PM, Claudio Fontana wrote:
> I am adding to my cleanup series the following, so this is done for all targets:

Great! thank you Claudio :)

> 
> 
> Author: Claudio Fontana <cfontana@suse.de>
> Date:   Mon Dec 7 11:02:34 2020 +0100
> 
>     cpu: move do_unaligned_access to tcg_ops
>     
>     make it consistently SOFTMMU-only.
>     
>     Signed-off-by: Claudio Fontana <cfontana@suse.de>
> 
> commit 1ee8254b568a47453ab481aa206fb9fecc7c16f7
> Author: Claudio Fontana <cfontana@suse.de>
> Date:   Mon Dec 7 10:29:22 2020 +0100
> 
>     cpu: move cc->transaction_failed to tcg_ops
>     
>     Signed-off-by: Claudio Fontana <cfontana@suse.de>
> 
> commit 1a03124581841b5c473f879f5fd396dccde48667
> Author: Claudio Fontana <cfontana@suse.de>
> Date:   Mon Dec 7 10:02:07 2020 +0100
> 
>     cpu: move cc->do_interrupt to tcg_ops
>     
>     Signed-off-by: Claudio Fontana <cfontana@suse.de>
> 
> commit 6a35e8f4ee68923006bba404f1f2471038b1039c
> Author: Claudio Fontana <cfontana@suse.de>
> Date:   Mon Dec 7 09:31:14 2020 +0100
> 
>     target/arm: do not use cc->do_interrupt for KVM directly
>     
>     cc->do_interrupt is a TCG callback used in accel/tcg only,
>     call instead directly the arm_cpu_do_interrupt for the
>     injection of exeptions from KVM, so that
>     
>     do_interrupt can be exported to TCG-only operations in
>     the CPUClass.
>     
>     Signed-off-by: Claudio Fontana <cfontana@suse.de>

