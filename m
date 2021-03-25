Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5843496A8
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 17:21:00 +0100 (CET)
Received: from localhost ([::1]:45798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPSiZ-0004ah-Me
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 12:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPSgD-0003Pk-N4
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:17:56 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:47031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPSgB-0003v7-Qf
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:17:53 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 68-20020a9d0f4a0000b02901b663e6258dso2425123ott.13
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 09:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+sa6sR5rcjKPa8DAnDtt2xQVJ3hL2CSTSFo9FNBpg/U=;
 b=vmSPB0LfJ2+v5y7vIwunZr2XonodREDvIZ0w7FEIBZzX6zQAjYMbFSyRTM9U6HVxqL
 aRKIa9tnDj0Bgwyro832zKzlul7wdeTaregGoSMzL4JcNtP0iDqbUxG3Cyb1IZIcX8gl
 XxNyBFqIuiZkP/9TW/tEWTEX1CIU2VsBrPwACw/FBqIP/M6JbmTQ5r5YqNt25bRNZh2E
 7M/T3BYfuvpZfr/BGSP02GQ3mU6BXlFpg4eTcwSAviru9qP+lOpAX31ntHXbSUzEbGA1
 hJS9lc75KBbQ8kAvEqnrLOXhNvDOy0OwscQUTAm8SAkwaq/WraArANe1WuQMr0+SLf48
 4vhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+sa6sR5rcjKPa8DAnDtt2xQVJ3hL2CSTSFo9FNBpg/U=;
 b=uEwxuVI2ZnN2zaOjDBrfZPfJHWsrEcP/tkUZJQic0pGjjh6hlsBum8pax+KdcFSQ0C
 y94sym7DjL8YiwpbGhXfzgsu6rDoXs3/uxk3ooWmAVojFWbsHXgS/jdHWowojtobwxXZ
 8+BObimTuR+cB61dhHiEb4N5fII7yWOdwmSK8VK7GUwwNqz6zNusxCGVVGaRUjg2Wg5h
 p2E7VF7978iGjXE1YrPTfT8lnr03JPVIqMIRKspsYcZHWvu1v7f1Mxji1exV8OfCbOSQ
 QImtfDpMi33d+vKK3Qg0pdya1pPv4j32dQPw98tANaifEfUQmrFbSjReuX+URhX5NIFH
 H64Q==
X-Gm-Message-State: AOAM530Q0qsApCQYcviv+Di7wKFwAsqjDaNAy+eakZzTp80XZXaJ0CUv
 nJWYrKz5HOQRenc2zHqPu/Npkw==
X-Google-Smtp-Source: ABdhPJzfxMepQTzM0/sO8ITqIC4OMFC+/nX58qu1Pp3sUq6hS4TE2LgLFzYF2U9Ho29aWbtCm5P5OA==
X-Received: by 2002:a9d:3423:: with SMTP id v32mr8330559otb.168.1616689069455; 
 Thu, 25 Mar 2021 09:17:49 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id i4sm1161146oik.21.2021.03.25.09.17.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 09:17:49 -0700 (PDT)
Subject: Re: [PATCH 09/15] Hexagon (target/hexagon) use softfloat for
 float-to-int conversions
From: Richard Henderson <richard.henderson@linaro.org>
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
 <1616640610-17319-10-git-send-email-tsimpson@quicinc.com>
 <4dca7e06-0782-90dc-c058-b4249193a616@linaro.org>
Message-ID: <3c38b7c8-0658-aec3-9bcf-38bbb3983f50@linaro.org>
Date: Thu, 25 Mar 2021 10:17:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <4dca7e06-0782-90dc-c058-b4249193a616@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/21 10:09 AM, Richard Henderson wrote:
> On 3/24/21 8:50 PM, Taylor Simpson wrote:
>> @@ -451,16 +456,28 @@ int32_t HELPER(conv_sf2w)(CPUHexagonState *env, float32 
>> RsV)
>>   {
>>       int32_t RdV;
>>       arch_fpop_start(env);
>> -    RdV = conv_sf_to_4s(RsV, &env->fp_status);
>> +    /* Hexagon returns -1 for NaN */
>> +    if (float32_is_any_nan(RsV)) {
>> +        float_raise(float_flag_invalid, &env->fp_status);
>> +        RdV = -1;
>> +    } else {
>> +        RdV = float32_to_int32(RsV, &env->fp_status);
>> +    }
> 
> So this is interesting.
> 
> The 8.3.x Document Bundle, which has the V67 programmer's manual, say the 
> output value is IMPLEMENTATION DEFINED (without saying anything more about 
> defining values for any particular implementation), while the older 2010 manual 
> specifies 0x7fffffff as the result (which is what float32_to_int32 provides).

OMG, I had the wrong manual open.  Ignore me.

r~


