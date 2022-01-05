Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E6E485854
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 19:31:23 +0100 (CET)
Received: from localhost ([::1]:34568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5B4E-0002iS-Gd
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 13:31:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5B12-0000xZ-AQ
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 13:28:08 -0500
Received: from [2607:f8b0:4864:20::433] (port=39581
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5B10-0000C0-45
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 13:28:03 -0500
Received: by mail-pf1-x433.google.com with SMTP id s15so116949pfk.6
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 10:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eMG99Wv41T8f5x8wQXkLcQeR3E6TesGZDcQ9waoHVGk=;
 b=WjdkjzIPB+PLVBRlxALw8uilhRjpvHraUuRcAL1Xlm2OVBIRozUAyl5Vv3G2zOScWE
 bB4F+3neHJvroeQQyatyrDy6KNAFVO2YKL3zWcs/0bASLmx/Y/Ze1MLnhyL5sMyfouJb
 TChZeJRcsEUH39LkoWIDfWjQ9RO2WW5ZhYEsUrym0PQaJ1e9fsWQkoNOUP/IVfrWj9cn
 uIv5cFGoery8v87HKDt0vLs4WktdkU3CgfNXDXhV/UqwIJFSkGPwiUGL1KifhkfOznhA
 4Mx/xQv+JvQYNBAr/Lq+szuZKGXZV8bimIOwtiLa22bOppQ0W1aXM3vS+rbGmtCEO38H
 YMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eMG99Wv41T8f5x8wQXkLcQeR3E6TesGZDcQ9waoHVGk=;
 b=46U78zq49k1dIGM4MLgydpwJsiYMRi1w7/0SiR6hsnJL54OKoZIiTjhJTpwUv7KpoT
 sue4S9P6MUQzSRzxaX6jFHjRprKwEgBHCiZxWVo8vvUhZvsKaSE184EBe5rq4Z7xsChZ
 1DKStQ+9Jeu/V+PN44pHjnW1e76Zlo/J0/XMgFpNrZXgqrYiFs308FDq3aljAobIC9kY
 yKQoc5iXcOQJt7G43WU5d7HXkzVHZnUddAGaLt/PmB4neXGUN8J6/1zUuTa8glRd+t7v
 FNeUZPaQlqDhLol99Gp11eD206C5NkuBtJWo2tJpr/SMKAMkOkE46XVsAR/FmWtWvVGr
 Kurw==
X-Gm-Message-State: AOAM530//Yj0J+DU6QME7VbSPVFIphcV4v/arx/HH1Ywm/aqNaHZufYS
 uluFXZqorbR+iF3NoDWFkEyBiw==
X-Google-Smtp-Source: ABdhPJygU2fGhU6XumwFEN+szL7KcNxSYnPHw6tz4FFoQxklLuRh7Nv3rHUK2eM7Ex6tRQSBINvZ9w==
X-Received: by 2002:a62:cfc5:0:b0:4ba:7a1e:9ae5 with SMTP id
 b188-20020a62cfc5000000b004ba7a1e9ae5mr56435498pfg.39.1641407280616; 
 Wed, 05 Jan 2022 10:28:00 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id e11sm2356960pjj.49.2022.01.05.10.28.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 10:28:00 -0800 (PST)
Subject: Re: [PATCH v2 1/2] linux-user/ppc: deliver SIGTRAP on
 POWERPC_EXCP_TRAP
From: Richard Henderson <richard.henderson@linaro.org>
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220104210015.457468-1-matheus.ferst@eldorado.org.br>
 <20220104210015.457468-2-matheus.ferst@eldorado.org.br>
 <eebcc0ab-8585-7521-7ddc-b8e85c97aa02@linaro.org>
Message-ID: <68b994f4-e8e3-aaae-ea22-c3141021754f@linaro.org>
Date: Wed, 5 Jan 2022 10:27:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <eebcc0ab-8585-7521-7ddc-b8e85c97aa02@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.057,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: laurent@vivier.eu, groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/22 2:12 PM, Richard Henderson wrote:
> On 1/4/22 1:00 PM, matheus.ferst@eldorado.org.br wrote:
>> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
>>
>> Handle POWERPC_EXCP_TRAP in cpu_loop to deliver SIGTRAP on tw[i]/td[i].
>> The si_code comes from do_program_check in the kernel source file
>> arch/powerpc/kernel/traps.c
>>
>> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
>> ---
>>   linux-user/ppc/cpu_loop.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/588


r~

