Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FE56F6669
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 09:59:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puTrv-00047u-Pk; Thu, 04 May 2023 03:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puTrt-00047S-5C
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:59:13 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puTrr-0004Fy-I7
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:59:12 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50bdd7b229cso247434a12.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 00:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683187149; x=1685779149;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3iGpcmTUcRH0CXmOKBFqhnVYsGlEJt6WvBFbEbcCiKo=;
 b=gouCIC8ZR8h+O1DeXORJhonq8zX+DxptSQK3U49FG8XsBWhZwnPEnoW4xmgF5ocvz0
 9TB5KRFLzhTX760npSqVqldX7DBNKD0tjGleb3TUf77pxiyzgKtUPdYISlezGLihNpw9
 3byTnw1+U/GPY1JGLmka+tXqyzhFW7vRdez3fQ6noj7SpIHRoYAMFgnz3JISVf22mM9R
 8bB6mpNNfPx744XbErGcwZI4TBfEYpaYMyVNHS6zsanYQ/VpB1UFGiGMD72kHSYvDV8q
 GKZigK558kVkOu78ts6BeoFLpb4zCyDLyzbsuSS6u8y09u0+AIB7eW6RUlt70XbwOs4J
 mkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683187149; x=1685779149;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3iGpcmTUcRH0CXmOKBFqhnVYsGlEJt6WvBFbEbcCiKo=;
 b=KPqOkQ20c52xG8lk13lKZIPerBlLjKdh9DR8XArVBxz9RaLDcmwRjTT56ojIhICUIp
 f6vIzjD+ov60rSLc9LZgM3yg5FHnPgF3j/dQEFNieC+NoLxW5TYjz1hImzjyFqPvkixt
 WI/8Y8LT9AZxJumt8ceO4uYFvUdbY405IdHOpICXcd6tmYfdyYywVoYdiEtzceVdEsA+
 4gezSpSLTa+WVZfNUepTeuIJ9cvlLTvbCGSCvZXRaeBNpTG9CzkNNrHuA7jd+Ssp5mav
 Jg8Pz7Txxclofgwni8/IGXoei/v7cwp3F7byLTOSMNDz8qU4WWcCKjfjXQ4I9LAhdmw2
 ZGkA==
X-Gm-Message-State: AC+VfDwKPBLXuGRfOWdeCdbI82MB4IX1TSihk3JoMjZwj+656KWNuqlc
 HkgyGTCuCAx3qB9k9VD0v8ykCw==
X-Google-Smtp-Source: ACHHUZ5QJis59j7fCEW0gZdsZ8G5OxDUDSxqdBpM/zPeWUx2UdZzISj/Q4MIvxSV7kGc1BOCInYlSQ==
X-Received: by 2002:aa7:dc12:0:b0:50b:d863:30ea with SMTP id
 b18-20020aa7dc12000000b0050bd86330eamr728078edu.0.1683187149707; 
 Thu, 04 May 2023 00:59:09 -0700 (PDT)
Received: from [192.168.0.57] ([82.152.154.96])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a056402061800b0050bd245d39esm1581406edv.6.2023.05.04.00.59.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 00:59:09 -0700 (PDT)
Message-ID: <4ee07539-4b69-4e61-9a24-f31f5f19a6fc@linaro.org>
Date: Thu, 4 May 2023 08:59:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 7/9] target/sparc: Finish conversion to tcg_gen_qemu_{ld, 
 st}_*
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Cc: mrolnik@gmail.com, edgar.iglesias@gmail.com, tsimpson@quicinc.com,
 ale@rev.ng, anjo@rev.ng, laurent@vivier.eu, philmd@linaro.org,
 jiaxun.yang@flygoat.com, david@redhat.com, iii@linux.ibm.com,
 thuth@redhat.com, atar4qemu@gmail.com, jcmvbkbc@gmail.com
References: <20230502135741.1158035-1-richard.henderson@linaro.org>
 <20230502135741.1158035-8-richard.henderson@linaro.org>
 <f06b8aed-cfa0-adc3-f86e-833928c4b179@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <f06b8aed-cfa0-adc3-f86e-833928c4b179@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
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

On 5/3/23 21:11, Mark Cave-Ayland wrote:
>> @@ -5390,7 +5399,8 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>>                           lo = gen_load_gpr(dc, rd + 1);
>>                           t64 = tcg_temp_new_i64();
>>                           tcg_gen_concat_tl_i64(t64, lo, cpu_val);
>> -                        tcg_gen_qemu_st64(t64, cpu_addr, dc->mem_idx);
>> +                        tcg_gen_qemu_st_i64(t64, cpu_addr,
>> +                                            dc->mem_idx, MO_TEUQ);
> 
> Should this be tcg_gen_qemu_st_tl() compared to the ones below? Or is there some extra 
> tidying up whereby _st64() is converted to _st_tl() in a #defined TARGET_SPARC64 section?

It's because we're using an explicit _i64 argument (t64),
so that we can store the pair for sparc32, where "tl" is _i32.


r~

