Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D636AD4B6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 03:34:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZN8q-0007oF-Ps; Mon, 06 Mar 2023 21:33:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZN8p-0007nw-BA
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:33:27 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZN8n-0001M5-Rl
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:33:27 -0500
Received: by mail-pf1-x42c.google.com with SMTP id ay18so7187489pfb.2
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 18:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678156404;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Amxd7gErfJzZdzaWbBC3XeuwJHMgmNz2nH8AxeGgGgo=;
 b=WtqDtUms/vzjaa6U0frAbqffIqXKL1fB5CivE6TUT5hYi6rLesoecBzLFpMKXkVMOC
 ZjqgO53oV/IExlUFpHPVEoylXin4NfI4rX+sLeBbEWHW+sWT/C/xSf6pk+NzWpUGVVRo
 wOVXA+BCJX8jrmyUAyPnwMNAjawY3rzeBYri+QdJ1+aBgZVrIJ4Dg6oJVEOUilSUTcdP
 AFugSa7/cIQdtulRgrmbIVq6KEqPqEbPxwNps5763JR9hiYHyu2orzSCouNvHAcsWqOW
 gPOOM8rOem6rn/X9pRwngr+VtvzoXDQpprOm+uCUcWLgci93+2P4QtSYSD42iOY6MMT5
 IK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678156404;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Amxd7gErfJzZdzaWbBC3XeuwJHMgmNz2nH8AxeGgGgo=;
 b=kMNdQ2xKgOYM6aqXF9LPfvRMpiR7lzKNk92SHMo0kyLDUgHNd1t5QG9ZkLH9BMWBRB
 ywKv+zGEUscD7bDWdQgthTA15gZ0UHglenVnFRdO05+8tirbF6McT/I9u3wwSnlHM80l
 w0nBWQ+JlRuJERpj4gLUGmelujaxBMKnNAEtzwnDXlsk3bBhAjhlUL/1YQ0C7/1/Yt4C
 E3UN7vP422mPX1cNMuvD0CZDNcZ6FxoIRp1eWRLWTNvUZcvGQazdT9IP3y6FxJXpE35D
 M9cIcClEvDI9InzyQxXtU+4wmDits6TVv21TCW/jyxa52hFxIEvH1OmsJFiUKI4WyEyI
 8d8g==
X-Gm-Message-State: AO0yUKXnEHeMweC/yah9M0o991Gnt2Z1DelC1Nq5DCrXTiewJ1Yxx7A8
 xx/BVLmPPqogdd5Ixj+ltV9IeiOZTGaYJDF9iac=
X-Google-Smtp-Source: AK7set+M0w8YhV3g3xJ4z4w8/SzfYUUhlpOjjbqiVEXO6xbv62xlr2CqDO1YzAsRQ5bBPtxeuU0Uvw==
X-Received: by 2002:a62:64cc:0:b0:5db:bade:cf18 with SMTP id
 y195-20020a6264cc000000b005dbbadecf18mr11805140pfb.13.1678156404281; 
 Mon, 06 Mar 2023 18:33:24 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb?
 ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 19-20020aa79153000000b005d9984a947bsm6905157pfi.139.2023.03.06.18.33.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 18:33:23 -0800 (PST)
Message-ID: <86b4c656-330a-fefe-5f8a-93ad01804ed9@linaro.org>
Date: Mon, 6 Mar 2023 18:33:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3] target/arm: Add Neoverse-N1 registers
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Chen Baozi <chenbaozi@phytium.com.cn>, qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20230307021442.3915728-1-chenbaozi@phytium.com.cn>
 <d867ae79-0347-3f72-2dcc-e176ab809842@linaro.org>
In-Reply-To: <d867ae79-0347-3f72-2dcc-e176ab809842@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/6/23 18:29, Richard Henderson wrote:
> On 3/6/23 18:14, Chen Baozi wrote:
>> Add implementation defined registers for neoverse-n1 which
>> would be accessed by TF-A. Since there is no DSU in Qemu,
>> CPUCFR_EL1.SCU bit is set to 1 to avoid DSU registers definition.
>>
>> Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
>> Tested-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>> ---
>>   target/arm/cpu64.c     |  2 ++
>>   target/arm/cpu_tcg.c   | 66 ++++++++++++++++++++++++++++++++++++++++++
>>   target/arm/internals.h |  2 ++
>>   3 files changed, 70 insertions(+)
> 
> You really need to base on upstream master, as these files have moved.

I beg your pardon, my mistake.  Only half of the patch set which moves these files was 
applied.  I had to do my own rebase around file movement today, but these three are not 
yet affected.

But do be aware that there is a potential conflict out there.

My comments re the placement of the array still apply.


r~

