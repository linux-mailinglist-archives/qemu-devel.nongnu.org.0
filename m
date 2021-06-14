Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8A13A6B19
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:58:09 +0200 (CEST)
Received: from localhost ([::1]:56034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsoyW-0001hw-1l
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsoqF-0004iH-2q
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:49:35 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:39671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsoqD-0005sG-EO
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:49:34 -0400
Received: by mail-pg1-x532.google.com with SMTP id w31so6468367pga.6
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=SU0OX9maf1efTcRiwn4aNy9zvj5YtA/al0eXjHuAZGM=;
 b=lwp0LJ/TCIvVl3SpC7Q+ZYT6dlE6dlqQnc6Q7jP933QoUkZkDy3YMYf4P1AEBJ1T9Z
 rIrw/u9Do7dt0KugxtFtv86RzNojAKyh4oVMnC9L2eKkCngel5LrdijnDd1Wv8/pPDyM
 UdREFSZWKqoIh/YcJJsrwMIL94iBIPtunIkVOq1WIdntGsgB5Wa7Mq3pHMbOEtH9IMu9
 wVgoruxkzgrzgVnJF6QP8nM7wYC5SKhZPOnf4aRCr4D9PlCf3X1/3//o6ULvpS1tluBH
 1MQ9Dr/3G1mXnW+wghIGV4Wugj29+dnT9BxaqqJQAxnvYZv1ZCz6rwfBCyckQuGMq7H7
 9gAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SU0OX9maf1efTcRiwn4aNy9zvj5YtA/al0eXjHuAZGM=;
 b=C+OS6O8Z/pqLBd0k31hfs9bg5GNvGsAD7H3Un15/KrgvtRYSd7WRzTfa8VoXsyy4Ku
 /YbO1FL/7KxteO5mEgWhqrZuCA15UK1qsSGLo8gtffe1H3auuDzU5tJ2A4VMkkgGz6Ca
 OVtVILAcFHrYr0hyZRC5J6YN90ZriOOyJe9FnxiI5VrS29rxrrllMXqFZflD4JuTPRG5
 g5Mj3fzF304DY89qyg8yRvVYnz/tHKO5XyE2cUXTT2GdP4kSlEczrunC9lGknR1XeudA
 XfydGrmowCVGbN/6eD5zmTNi++TmaO/hU0V6Ax/cmtfnVODrqUZF12N3NmyNEgW66dyD
 urNA==
X-Gm-Message-State: AOAM530ycBsi8hpVWp8b9fUQGaLoy7K/zKxwDMbal5kWF2ZdJtm9NNMI
 bz9DZmaDPbm2ipIk9kTINKGy7PwlrV/ehg==
X-Google-Smtp-Source: ABdhPJxIM4jZYOjTcmKvapqGv252IB16744Adb0GKfAS27FQyYxdLjcUvpdNilfA+MZ/uPTbCRbR/A==
X-Received: by 2002:a63:1224:: with SMTP id h36mr17769063pgl.296.1623685771725; 
 Mon, 14 Jun 2021 08:49:31 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 t14sm13963937pgm.9.2021.06.14.08.49.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 08:49:31 -0700 (PDT)
Subject: Re: [PATCH 14/28] tcg/mips: Support bswap flags in tcg_out_bswap32
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-15-richard.henderson@linaro.org>
 <398ea97d-9149-84a5-0fb1-8ad2bafc1bd1@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <46ee15a5-58b9-d809-d4d4-2fdd6bd85600@linaro.org>
Date: Mon, 14 Jun 2021 08:49:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <398ea97d-9149-84a5-0fb1-8ad2bafc1bd1@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 2:31 AM, Philippe Mathieu-Daudé wrote:
> On 6/14/21 10:37 AM, Richard Henderson wrote:
>> Merge tcg_out_bswap32 and tcg_out_bswap32s.  Use the flags
>> in the internal uses for loads and stores.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/mips/tcg-target.c.inc | 39 ++++++++++++++++-----------------------
>>   1 file changed, 16 insertions(+), 23 deletions(-)
> 
>> -static void tcg_out_bswap32(TCGContext *s, TCGReg ret, TCGReg arg)
>> +static void tcg_out_bswap32(TCGContext *s, TCGReg ret, TCGReg arg, int flags)
>>   {
>>       if (use_mips32r2_instructions) {
>>           tcg_out_opc_reg(s, OPC_WSBH, ret, 0, arg);
>>           tcg_out_opc_sa(s, OPC_ROTR, ret, ret, 16);
>> +        if (flags & TCG_BSWAP_OZ) {
>> +            tcg_out_opc_bf(s, OPC_DEXT, ret, ret, 31, 0);
> 
> Maybe mention the rotr -> ext32u mips32r2 simplification?

Oh, from dsbh + dshd + dsrl in the old bswap32u function?
Sure, I can do that.


r~

