Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C980A672734
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 19:39:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIDJQ-0006yg-OH; Wed, 18 Jan 2023 13:37:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIDJF-0006uz-Uj
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 13:37:19 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIDJD-00055G-Fw
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 13:37:17 -0500
Received: by mail-pf1-x431.google.com with SMTP id 127so9649658pfe.4
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 10:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dDaCUfUgdAQIteC/9iGEwgmtWI88IUGOoB20m9fBcnc=;
 b=ynAyhyVVH9qkV/R546Q00OK8lFIOlu1NA5bl0gK3ZPncBZm5onB3T5XExBspqOj0je
 0bFrJsUe89uVsu9gkHyr9nBgmxmVAdguIPVV89aYt3bPXFeepDpoZYXbX6PerUSzXRPb
 5kgg2yqxKtSCKgML/SH1gRbfgcY51kYYuyRM3jSr4uRX1ll0ES/GHgnJp0RuDhL1RmSM
 DGxdOljdYzyD+JUkRUdDs5cNWl0Cg4MBv0SFwwowWcxWYeyWHMzEi0O9lh9GTnWVdZhm
 bo+ItA2oFVgDX9A2bMatSUfjUuXLaUaCqhGfWHR39mfXM6+U+KKQRAonWRliUuOJe/Kp
 JNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dDaCUfUgdAQIteC/9iGEwgmtWI88IUGOoB20m9fBcnc=;
 b=NI/xZL4NX5ZvH+RpxO4MSAcKnRZqXGLuTGaOdpm1YAckmX5Uyx8oEU4RxLYCWwzCMV
 qLsn84mF8DuA1y1bGN2DozYdZQYJqnesJrfJr4q+HWD+jh3rfRf79DN2ssgBq63SmXoK
 FF2y7DkJ03ai2plbUmEP6LigBZjNIRhA2FiJXr35h0EX8Tn3vl28Gn9FJ3xleLMOgOi/
 OsXbFGOozIe07cuPaAPKqetbIJYWodX3bvrfVISRbxWcFInmdKhG92bg1mDe88J/dZWg
 3cGEwny2qvjMNR9Lcal8EHJdGyAxlo1eyYzr4gspX+TmpVK3i4rZ29WOOEuzyaasMQei
 dFXA==
X-Gm-Message-State: AFqh2kowtG7INfY1E7/Oqw63WjghBHWGvQEBJINaPdlZf6i2efH3G+gH
 ULBMKM4lSZ/CKEUllD4i/bw90g==
X-Google-Smtp-Source: AMrXdXtP9tg2YJ+yG//i8ipE7GZFP8WoTTWHwqeBJCRape+Ojq1yM4fxKQfJwaZ5vo/ARviLMWs9Xg==
X-Received: by 2002:a05:6a00:4289:b0:583:319a:4425 with SMTP id
 bx9-20020a056a00428900b00583319a4425mr8371713pfb.29.1674067026171; 
 Wed, 18 Jan 2023 10:37:06 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 i6-20020aa796e6000000b005884d68d54fsm18797610pfq.1.2023.01.18.10.37.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 10:37:05 -0800 (PST)
Message-ID: <226e6b9f-b95f-0198-fb45-eb3407d015d6@linaro.org>
Date: Wed, 18 Jan 2023 08:37:01 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] target/tricore: Remove unused fields from CPUTriCoreState
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20230117184217.83305-1-philmd@linaro.org>
 <6da18e97-c80e-1ac2-edca-34fb243edd81@linaro.org>
 <20230118090319.32n4uto7ogy3gfr6@schnipp.zuhause>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230118090319.32n4uto7ogy3gfr6@schnipp.zuhause>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/17/23 23:03, Bastian Koppelmann wrote:
> I'm not sure of the purpose of the hflags. I assume they are hidden flags that
> hold some hidden state of the emulated CPU. However are privilege levels really
> hidden state? At least in the TriCore any guest software can read PSW at any
> privilege level and see its own privilige level. Is there a typical usecase when
> I would use hflags?

I'm sure env->hflags was copied from i386 or mips.  It would be used to cache cpu state 
that is not easy to recompute.  There doesn't seem to be any of that in TriCore.


> I do wonder why there is the extra step via the flags of a TranslationBlock. Why
> can't we sync directly using CPUState?

We need the data in the TranslationBlock in order for the data to be hashed and compared, 
so that we do not attempt to run the same code with the wrong privilege.


> I first thought to differentiated the
> TranslationBlocks for the different privilege level. However isn't that done
> using the softmmu_idx?

No, it's not.  The only thing that's used to select TranslationBlocks is the data 
retrieved by cpu_get_tb_cpu_state.


> Yes, everything runs in the highest privilege mode. I'll look into properly
> implementing privilege levels, but for now we can remove this dead code.

Ok.


r~


