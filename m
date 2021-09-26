Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26F8418CFC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 01:08:36 +0200 (CEST)
Received: from localhost ([::1]:54936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUdG8-0007JG-1Q
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 19:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mUdEp-0005zG-Oy
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 19:07:15 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:33549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mUdEo-0002wx-9c
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 19:07:15 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id a9so10120169qvf.0
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 16:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OANrXxqA4+IM6raJjftZZe4bBpIHrf6vlZ1U2yubfvs=;
 b=TyEP0JQ3C7+MMhneAbtU7Evdy9Qa/uOaC32dXvRbaOebqF9dLOnWGdikOwg/mTqk8D
 djm7QWccKgRHpzTf9HxmeNoWCnr0CyzQyqf3iOhcJ5dDo5QxpsCStyjrTjw6oAj+orQB
 LsfP84gnevFAV8vgwayMSb42ZwKSXOHUA/jtCneQ3yDyG00dkHXKdDOk/boRZOrL3jRR
 8HwHMkpSDsGogUZrr+qFHjChvJb1AkWf0KgbkRRcT7+hnWrII2mMwW3IgtN65i/yiz5g
 8ao01narYDkMprluWHozNqHfvJofBvCwiseY394ZMMHEYrRjH7VmNy+m+55DDG4aJXDO
 8ncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OANrXxqA4+IM6raJjftZZe4bBpIHrf6vlZ1U2yubfvs=;
 b=ypo9MyTL/uyzwZhHA70XsWlDFBdqctufuBmxPmdRRP3WXJSRtcc1Wd7F3eed/rzGeg
 y37k0WWpaDO1i3FFeBcFjdCpcCgG01ljQZ9dJabvnhbqm9nBORh2AlMhbl3Wb1yNmELx
 VcRriD5kB5aXd4PaL9TCrRUw+1uudl0hmhI1ccOdjhpImP7gllFV0a89cxwhDXk5C0eZ
 NgnWAFrdgCb04WnRnnt47oerkVTYzoDnJGq0tfbWQM4S/klLyYHRmVJYbxwEcPJafNVa
 4Li5cpGGACkus9szxXRZnC/VN4ZNOXkC8UdWapJBCFX8qFPyig0zUcJHayimLmesVL8p
 1y2Q==
X-Gm-Message-State: AOAM530+inOyBPJqEdkRxne98MqomKZNPO0wQ2i4/H63rdVBmESNDlI3
 Ns/5R1qJtw/iRKdRPVp7jY8WCg==
X-Google-Smtp-Source: ABdhPJxk68Pd4ALNLpECjugYv5r6w7l9Hv2A+5Fim/phRsP09SZzTVss4d9g6NMAzPUJZMOJ+wVZNg==
X-Received: by 2002:a0c:906c:: with SMTP id o99mr21466741qvo.43.1632697633445; 
 Sun, 26 Sep 2021 16:07:13 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id c139sm11531320qkg.2.2021.09.26.16.07.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 16:07:13 -0700 (PDT)
Subject: Re: [PATCH v6 26/30] tcg/loongarch64: Implement tcg_target_init
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210925173032.2434906-1-git@xen0n.name>
 <20210925173032.2434906-27-git@xen0n.name>
 <8fb1e344-a31d-02cf-edf8-fe775d3dc307@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f05efe32-0c0e-cece-54e5-5ea059f4717e@linaro.org>
Date: Sun, 26 Sep 2021 19:07:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8fb1e344-a31d-02cf-edf8-fe775d3dc307@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.478,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/26/21 3:15 AM, Philippe Mathieu-Daudé wrote:
> On 9/25/21 19:30, WANG Xuerui wrote:
>> Signed-off-by: WANG Xuerui <git@xen0n.name>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/loongarch64/tcg-target.c.inc | 27 +++++++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
> 
>> +static void tcg_target_init(TCGContext *s)
>> +{
>> +    tcg_target_available_regs[TCG_TYPE_I32] = ALL_GENERAL_REGS;
>> +    tcg_target_available_regs[TCG_TYPE_I64] = ALL_GENERAL_REGS;
>> +
>> +    tcg_target_call_clobber_regs = ALL_GENERAL_REGS;
> 
> If you plan to add support for vector registers later, I think it is
> safer to start today with:
> 
>         tcg_target_call_clobber_regs = -1ull;

It is not "safer", it is wrong -- there are bits set for which there are no registers.


r~

