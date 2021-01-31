Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE55B309DB4
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 16:40:30 +0100 (CET)
Received: from localhost ([::1]:46420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Epx-00066p-KN
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 10:40:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Elf-0002ye-L6; Sun, 31 Jan 2021 10:36:03 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Ele-0000HG-2g; Sun, 31 Jan 2021 10:36:03 -0500
Received: by mail-wr1-x429.google.com with SMTP id d16so13855104wro.11;
 Sun, 31 Jan 2021 07:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Tj9ynb2vRPFjqtE44EpTjMkFQtoIUjhfjhxMTiCpavE=;
 b=bKISEXILOqbBKSyWxvRZTuqbFnMi0zbFX7AD4hLA5WBrs5OH0WAyfczzJO+CNwqZsH
 Px6aqJnUVVzUonDQ10/D4g69YH1ddYR09nffJI/ZWFikuSfuVxu3j6deINIQFetTavz5
 7CB+cq5ySm37Y8rJ8MwxUmhoZdKCfu36fgGzfloOWPaLi22Cp9ygPjj8aGlQIaaQHq8p
 2IHzfac/aVBfZIQQtBiotSnheZvuijwqcKpFhuI1E5CjikLGMbyONtbX/FkkDI2N54ec
 G0A6Ytwl9tirRcjmpbOsSElN5Jz/07qnnKLQNXGICM/tyABc8/kd8gkD8S3sorOVk8M9
 9RCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Tj9ynb2vRPFjqtE44EpTjMkFQtoIUjhfjhxMTiCpavE=;
 b=GW5R69zvX2Q2ttfrrb92E6G4zhACEEPDqUQkKrxHdyl0VKionuFkVERviFeae5ovii
 Q3p+xKA93v26wkYhY/AwdN8JEG4dbihNN56GU8OkDQ9wtkpllyjOgXIjLfZsABNfKMx3
 c48fBqgIgR0547fJNumI/jXt126vYNhHUEqS06Xj3bCQL4j7y5Wps/aiMPVSOSxN+KgC
 EpgC8kIFTRRgGHej2lZNwDHWfitM9uolr8sW3CoAAHVFI/y+Oms3Rx2/NRP1uy2nHDRH
 P0N/GPBa+7OLGaRWoIMjNJ9li4i+HjC+vgUJ/zUgpBALwPNRy0ISLYoOi8YkNWAoLEdu
 6OoA==
X-Gm-Message-State: AOAM531YeWTlYXccXS77fP/lA/YrTobl+lWAtFJVPFVXXzR6Da34roov
 FhlvlVf2eOqE5DW2L0UEQ2Uq2sWHqtE=
X-Google-Smtp-Source: ABdhPJwxwfwJ1O3wZnQXDc1ZmYatUowqBlUM5eDlN14YoQfKfNZKRQ03jZH9GWmo0RCtIQi/fXcy0A==
X-Received: by 2002:adf:ecc5:: with SMTP id s5mr13603929wro.423.1612107359885; 
 Sun, 31 Jan 2021 07:35:59 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id f4sm23839332wrs.34.2021.01.31.07.35.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 07:35:59 -0800 (PST)
Subject: Re: [PATCH v5 03/11] target/arm: Restrict ARMv4 cpus to TCG accel
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210130015227.4071332-1-f4bug@amsat.org>
 <20210130015227.4071332-4-f4bug@amsat.org>
 <CAFEAcA8UCFghGDb4oMujek_W_wsyYz+duiQ-d8JyN09NYoff-g@mail.gmail.com>
 <2871f7db-fe0a-51d6-312d-6d05ffa281a3@amsat.org>
 <CAFEAcA-W1tcRREaPTfMw98cNsHs7JHk4gjaJWaJNLpxZoVnKaw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <40ca4720-7adf-8469-2593-6e6689d03fd6@amsat.org>
Date: Sun, 31 Jan 2021 16:35:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-W1tcRREaPTfMw98cNsHs7JHk4gjaJWaJNLpxZoVnKaw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.079,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 kvm-devel <kvm@vger.kernel.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/30/21 7:54 PM, Peter Maydell wrote:
> On Sat, 30 Jan 2021 at 18:36, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Hi Peter,
>>
>> On 1/30/21 4:37 PM, Peter Maydell wrote:
>>> On Sat, 30 Jan 2021 at 01:52, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>>
>>>> KVM requires a cpu based on (at least) the ARMv7 architecture.
>>>
>>> These days it requires ARMv8, because we dropped 32-bit host
>>> support, and all 64-bit host CPUs are v8.
>>
>> Oh, this comment is about the target, to justify it is pointless to
>> include pre-v7 target cpus/machines in a KVM-only binary.
>>
>> I'll update as:
>>
>> "KVM requires the target cpu based on (at least) the ARMv7
>> architecture."
> 
> KVM requires the target CPU to be at least ARMv8, because
> we only support the "host" cpu type, and all KVM host CPUs
> are v8, which means you can't pass a v7 CPU as the target CPU.
> (This used to not be true when we still supported running
> KVM on a v7 CPU like the Cortex-A15, in which case you could
> pass it to the guest.)

Indeed:

$ qemu-system-aarch64 -M xilinx-zynq-a9
qemu-system-aarch64: KVM is not supported for this guest CPU type
qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0):
Invalid argument

