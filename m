Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 194E130156F
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 14:34:00 +0100 (CET)
Received: from localhost ([::1]:37464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3J38-0001hM-Le
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 08:33:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3J1J-0001AA-Qw
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 08:32:06 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:40432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3J1H-0002hn-H6
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 08:32:05 -0500
Received: by mail-ej1-x62b.google.com with SMTP id gx5so11614844ejb.7
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 05:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vgs9L4WTWNQs0RfzaFcn4IbfF/1yvka8LptH99wCcOQ=;
 b=GvQPmFC2MfMH1GsOt+1dickoVhFHX2dUFi4lPFvKKqfEaalRb3LQdxZzKJEDsroO2y
 WnmjOPwlO6f1RKVpPMhZ8Whlvpf8vlSPq5ZNT2RthUDnj0+B+vB0whsavPrvm1V9QcdA
 mI8HBpSjlPnVBIerD6XHsRkrpJjeW+0X8exp03kCVvlr12J4oJisnfQ9zhcpyIZvN34f
 w9y4xXBHzYWUVP5CVOnaHS4FuGMrnCbaSzgX/yf1DU9I4bQx+tG5BWYTF8fWY3mZozAY
 6i/cR+IdBIwDVHIHxMu3vgZDIOxhDNAY2vhpXCCRItn/UoKqDfXG+vpahP9EjoudR8MP
 DWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vgs9L4WTWNQs0RfzaFcn4IbfF/1yvka8LptH99wCcOQ=;
 b=VeJv85oCWxP1E+QuMeYz79lNTBTxDJDEnT5psmfDnHP0NTIFWcw1O0jxSXZGpM5icN
 hdbJAXNzwRavxYIi0Ms1Ee4GOJXhVIO5IHX3l0UluOW6zaowkg6FFzp5VJdtDTvHwC1F
 n4T9sIGwCHES1nL9bOZoVgyOBieQMzx0VY/ULuHuXUjIan+O3DzFiQ8bVWi07disPmse
 SdsStOMVwOCF6S5j+pT0C/VKJNFNxQ2N1rATFsFkioMFB/A3Juj+Hp9C9n6nFzy0WV9R
 beAEHXJsjJsZSNTp2zRd6hedCrSBK7irfIJLvvU+UHgGBIAShevf7kIzz9ACZKQNKk3F
 1+8g==
X-Gm-Message-State: AOAM531A+0wQVIdk8AR3rebRy/oNka5FflU6hxym+QZmtZnS2nnqc7j9
 W6QddHcHsLkHes2F3bjH4m0=
X-Google-Smtp-Source: ABdhPJzyX9WQm4ne6WK2zrvDD+2Xcnr7E5L9vMS1mHu6WCicQaCFGlRe5RSuZADI3p6pk06ARCLkkQ==
X-Received: by 2002:a17:906:86cf:: with SMTP id
 j15mr884733ejy.216.1611408721310; 
 Sat, 23 Jan 2021 05:32:01 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id b26sm7109418edy.57.2021.01.23.05.31.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jan 2021 05:32:00 -0800 (PST)
Subject: Re: [RFC PATCH 2/2] gitlab-ci: Add a job building TCI with Clang
To: Stefan Weil <sw@weilnetz.de>, Wataru Ashihara <wataash@wataash.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210110162739.858087-1-f4bug@amsat.org>
 <20210110162739.858087-3-f4bug@amsat.org>
 <78a9718b-dec0-cc31-7ada-e815d9022e65@redhat.com>
 <20210121103250.GH3125227@redhat.com>
 <b1309c5e-69f2-0c4d-eefc-9023e906694d@amsat.org>
 <20210121112154.GJ3125227@redhat.com>
 <e46b9117-59ed-cfb8-303b-1a5a013c4cc8@amsat.org>
 <20210121120241.GK3125227@redhat.com>
 <97b12e1b-e570-bd4d-5484-376f3fe6f7dc@amsat.org>
 <ada021e4-b6e5-e720-bcfb-c078488c835c@wataash.com>
 <7e423408-b0e9-2c32-b88b-eb579dd273c5@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e25af73a-5de5-9181-2c3d-92bad10f7812@amsat.org>
Date: Sat, 23 Jan 2021 14:31:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <7e423408-b0e9-2c32-b88b-eb579dd273c5@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/23/21 11:26 AM, Stefan Weil wrote:
> Am 23.01.21 um 09:59 schrieb Wataru Ashihara:
> 
>> Actually I use TCI also on macOS. Like the use case quoted by Philippe,
>> there're even other reasons to use TCI:
>>
>> 1. Learning TCG ops.
>> 2. Debugging QEMU with gdb. e.g. diagnose codegen or stepping into
>>     helper functions from tci.c:tcg_qemu_tb_exec().
>> 3. Guest instruction tracing. TCI is faster than TCG or KVM when tracing
>>     the guest ops [1]. I guess qira is using TCI for this reason [2].
>>
>> [1]: https://twitter.com/wata_ash/status/1352899988032942080
>> [2]: https://github.com/geohot/qira/blob/v1.3/tracers/qemu_build.sh#L55
> 
> 
> Yes, TCI can help a lot for debugging, especially also when porting TCG
> to a new host architecture.

Indeed, Alistair used it to boostrap RISCV:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg552643.html

Worth citing a comment Peter mentioned at the end of this thread:
"the interpreter [...] only works with a subset of host OS calling
convention ABIs".
https://www.mail-archive.com/qemu-devel@nongnu.org/msg553077.html

> If we had binaries which can switch from native to interpreted TCG, it
> could also be a reference implementation used for unit tests, comparing
> the results for each TCG opcode.
> 
> Using TCI with profiling like gprof is useful to count the frequency of
> the different TCG opcodes in practical scenarios and can be used to
> detect bottlenecks (and less frequent or unused opcodes) for native TCG,
> too.
> 
> Stefan
> 
> 
> 

