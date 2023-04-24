Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C4B6ECCB6
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 15:11:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqvxq-0002a5-Fs; Mon, 24 Apr 2023 09:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqvxg-0002Re-VM
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:10:34 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqvxf-0006OO-06
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:10:32 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2f55ffdbaedso2752237f8f.2
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 06:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682341829; x=1684933829;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zRUrxT9CNcJOcitUPZBNmQ2oU1ueb/YSVDtnrOZrm/4=;
 b=zIMg0BlcK6T9iH2erIyXqBjWBZf2708irBe7pw0lIgH5rZO/r55r20ToYLY1URkkDW
 Vi3783qvKcP0Dywp5BW4g65XLp4vSdBjphkofLRG8hT2dngAqgBkfo9Rp7YQRiMFurU+
 3zu2TuOaLHj9CZ36fxNKB/MAS0g+e98LNRGgKqSjxPSEvCrq4TJYSnLC01JX+GKWEbaA
 eO2YClPnMtzQ0SI/LNM7wz9bOxY0Q8RP/cVs6pJuYkrJINLXTxqKsSspO5p24szKIAWe
 +Sh/zTfvXrWSECFK8hnpVFP4a8PMHSTftBRoeqNJk/qDAcz2si0TZsv2dsumqpBC9gna
 RPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682341829; x=1684933829;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zRUrxT9CNcJOcitUPZBNmQ2oU1ueb/YSVDtnrOZrm/4=;
 b=TtofrdUTxVMzWJBDOJtm2zqrUthWWPsx3YWmF0cpZmVpv7QP2EK9oAN/E7a+FBgk05
 2qOPXxCz3++GKnarAJJJpDAuM8ZjqacLW1GSRmTD1CXgHWSyewlkBTXZIOa1za8P/2H5
 uObh9Yt7hCWgvM+sVuu2R/w/+zcdWAbU12TPGFGuBttl3snzHpWMgPxEJ3OZ1Fnz1AVV
 QlsRlSJyfSWdTe2fTQ1bgP4z9yPMOLlDaEPmT/aIaxjAs00kYTC9LDHwQ46kObu5Tqhb
 zV1vXtLz8UfV8D/uMH7AGZ/vbyWguH7IBuphnGgpgUiaY+WCJkjOBDg23rl1tce/WunR
 bcIA==
X-Gm-Message-State: AAQBX9eS0KUj8cQqmZKwFUV0P2NoxLoZhzZHmqM0LKxDNkZTLQGUsmmX
 v47FRqKgOTudnIl42WBpOi5ZQw==
X-Google-Smtp-Source: AKy350ZXb2viAiUuYsIrUkfxmWqYImTmbxAwxMR9aor4vcp9PFDzXl0/3D61sFAIyC1yMHG4ebo+pg==
X-Received: by 2002:a5d:4bc6:0:b0:304:4460:11e7 with SMTP id
 l6-20020a5d4bc6000000b00304446011e7mr6250996wrt.51.1682341829244; 
 Mon, 24 Apr 2023 06:10:29 -0700 (PDT)
Received: from [10.43.0.114] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002fe522117fdsm10774646wrf.36.2023.04.24.06.10.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 06:10:28 -0700 (PDT)
Message-ID: <6dbb67dd-017f-59dc-1685-1555c60fd31e@linaro.org>
Date: Mon, 24 Apr 2023 14:10:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 6/8] accel/tcg: Replace target_ulong with vaddr in page_*()
Content-Language: en-US
To: anjo@rev.ng, qemu-devel@nongnu.org
Cc: ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net, philmd@linaro.org,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com
References: <20230420212850.20400-1-anjo@rev.ng>
 <20230420212850.20400-7-anjo@rev.ng>
 <7ab30709-5f65-2d2f-f78b-ad3983a25f3e@linaro.org>
 <f51ee4ad-e78f-7429-1a79-c93136543f92@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <f51ee4ad-e78f-7429-1a79-c93136543f92@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.194,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/24/23 13:51, Anton Johansson wrote:
> 
> On 4/23/23 11:13, Richard Henderson wrote:
>> On 4/20/23 22:28, Anton Johansson wrote:
>>> -static PageFlagsNode *pageflags_find(target_ulong start, target_long last)
>>> +static PageFlagsNode *pageflags_find(vaddr start, target_long last)
>>
>> Both arguments are target addresses.
> 
> See comment in cover letter. In short, I'm unsure why the signedness matters
> here as even changing last from target_long to target_ulong breaks tests.

Really?  Odd.  It's clearly a typo for last to be signed.
I'll have a look.


r~


