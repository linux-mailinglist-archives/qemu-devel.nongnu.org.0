Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 244E9606A6E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 23:42:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oldIi-0004m7-OD
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 17:42:04 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oldGc-0002Fw-8B
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 17:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oldGV-00021E-2F
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 17:39:47 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oldGS-0000kJ-0i
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 17:39:45 -0400
Received: by mail-pl1-x632.google.com with SMTP id k9so501174pll.11
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 14:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EC/AZpmpnmqxlKTGg/qWbNAJi+PcpwOYIXVpptYSig0=;
 b=FX/ztBlOHSthweYu2n//JwEoVIG4g/hIufoj9sUvK/HRuWJstMP52gcUu4RFih0SLf
 hxVMFP90ebWdp0PRp5LgCVG3wD9M0ZKEjjgwp09RPIbwlsvHT5lq1dhjhMjdSoR7sJUX
 BjjC522XcNaH4u72jpiNVAl8/uJ7+Ix8i1FWjYThIlQK/VAiOnv1VRErfKvMfkg931JL
 fsysCAiE0JefVbNLhn4QS38Y1zjJLtWj0Z99ukMm96hXWh7CbqUMAd9BB0tOA12ccgJp
 dOvfBk5kwO6d9rVZsQbr59eJbRnoJ4MUlnNQSWmdUBee9WTe/88abVbmho4zR1WCCDE/
 +74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EC/AZpmpnmqxlKTGg/qWbNAJi+PcpwOYIXVpptYSig0=;
 b=7UzrplEW4DW3624TyTUtTQu5pyEH9kA6XEUvuu6e/03hNG7dYKQKb2kPYdReqSaIQ5
 VqvkWFOk6YAVrfc+afE6QZSMUHApwfvoIWG0AXp9Lce7k6tj3sSzuX7lB30QUv7WiAbv
 lyhLv25uqPDWwstR5D4Jn0vsrxkPWX/R5D5CGNeqCC7iY1yu28y57zVET7BvaIxxKc1N
 HlmID1Ojzs9ybgStiQTds+gf709o3jA5v/CYKT0461M4z0jrXVNOeM42f2r/DDiqHR3x
 isDo/gTq53lyyCWeojq8NZLhVXQfPjJ3DI1sjWcu698hngk6IYnwC+t9+5k3kiPCJDP4
 LM2Q==
X-Gm-Message-State: ACrzQf2PwIs+85EXVbbS0bBa85pSuN5eiFXGBUheAMnggHvcRw3kiTLr
 0myl1UlLxO7a8UnkffIB1uDMlQ==
X-Google-Smtp-Source: AMsMyM5isLOv0JRu04qHmfk8w9USGJMzmRLlnwkckqG9n6DSYBOjt5N3heN2k8xXUcHYS3gKPcau9w==
X-Received: by 2002:a17:90b:33cc:b0:20a:7f32:9632 with SMTP id
 lk12-20020a17090b33cc00b0020a7f329632mr18729952pjb.149.1666301982543; 
 Thu, 20 Oct 2022 14:39:42 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a170903120b00b0017f74cab9eesm13377354plh.128.2022.10.20.14.39.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 14:39:41 -0700 (PDT)
Message-ID: <ca687bbe-e5f4-4465-d8ac-676340649eae@linaro.org>
Date: Fri, 21 Oct 2022 07:39:36 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 15/31] tcg: Replace TCG_TARGET_CALL_ALIGN_ARGS with
 TCG_TARGET_CALL_ARG_I64
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
 <20221020115242.2301066-16-richard.henderson@linaro.org>
 <1c9f842b-5f19-b85c-5ec4-30c8baba52a3@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <1c9f842b-5f19-b85c-5ec4-30c8baba52a3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/22 01:12, Philippe Mathieu-Daudé wrote:
> On 20/10/22 13:52, Richard Henderson wrote:
>> +++ b/tcg/riscv/tcg-target.h
>> @@ -81,8 +81,8 @@ typedef enum {
>>   /* used for function call generation */
>>   #define TCG_REG_CALL_STACK              TCG_REG_SP
>>   #define TCG_TARGET_STACK_ALIGN          16
>> -#define TCG_TARGET_CALL_ALIGN_ARGS      1
>>   #define TCG_TARGET_CALL_STACK_OFFSET    0
>> +#define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
> 
> Don't we want to use the even arg on RV32 hosts?
> 
>    #if TCG_TARGET_REG_BITS == 32
>    # define TCG_TARGET_CALL_ARG_I64        TCG_CALL_ARG_EVEN
>    #else
>    # define TCG_TARGET_CALL_ARG_I64        TCG_CALL_ARG_NORMAL
>    #endif

Good catch.
I had remembered that we only supported rv64, incorrectly it would seem from the myriad 
other tests for T_T_R_B.


r~

