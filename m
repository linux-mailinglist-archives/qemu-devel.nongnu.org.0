Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B84F43BAE6
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 21:34:31 +0200 (CEST)
Received: from localhost ([::1]:35288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfSDO-0008Ap-9l
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 15:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfSCS-0007Ug-Sv
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 15:33:32 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:38532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfSCP-00059t-Ne
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 15:33:32 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 y1-20020a17090a134100b001a27a7e9c8dso2790046pjf.3
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 12:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+Km1ePm5G5RoEc8vvMqd+J7RjDCWB+Rn8LnBofBDHuU=;
 b=bv45mK5UNzHz2+8RAtC+nKl5/37gYsgZmmkhTpImUng2ZbutalYl9Gcv8cKvJ9y4qE
 KoCsAqwVVVhhOOKE5qWxUzNBL6ovnlMc/+K/3cJOL0VhE56eu96Bki1/sIoJLUH8o5J8
 n6DnE7NQdUwjrvsdW7WORldwEyVREpX+tUR931vfSIKVrgzYGisrYdpmSwFXXt5/NK/J
 yp9QOmGplAmEA9KgWhV154txuZIOPmS3eJMYPpXYHh5O9wjYyHbf+xXPuDrHitTmg9B6
 RPqKyZoCgjg1KD+xbBpXi9JmvlzuLDQ5EU+j7PLKx4yjpWDPFs7fxyEvLJ2E3XFWdSTS
 Ca9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+Km1ePm5G5RoEc8vvMqd+J7RjDCWB+Rn8LnBofBDHuU=;
 b=v4dPSishflSHPFsODSJiLkL7gWDtk4CRoHM5pwWBO4koMc57FRysv2XJ6FnUQ3/tUs
 qadHG4n2tGbW/0Pouou4SHF3UwFdcS5LRjfuswq/FfVoWaUspdtBhfc0TuJURR3KY+0g
 rFz+epkQX0yesUsdngwXPOokhIGUZ3rLhtMhyhowuIpG+WbFgcbZJ5BXKemi7pAR6t3M
 jLce1ozzKIUD7o8JCrwFp5Ip74mNSpGvUpghOiJBLZ+zcUwcqHO+KvL0AKVAqGbBJxmX
 d0jKscXwxa1KhCilAZSWY3abBA18/gsXHBFyUsvEkVyB1gO2+YWtY+o0PHfTRbmzkoJC
 c5TQ==
X-Gm-Message-State: AOAM532jx8o3TOQdY7J0i30p5E9IV2PS1y1lqN90t/UFG5xjmnIyqzdi
 i3/QT+atex34JcTPtkSp9IXW+A==
X-Google-Smtp-Source: ABdhPJwyYPeH0r4RPCK3DANzDgTewp2MPLQ5oXwhAi/cPOTLpiSDa9Fej9nCB44IUdUJhk2Fe3RckQ==
X-Received: by 2002:a17:902:e806:b0:141:5df8:c535 with SMTP id
 u6-20020a170902e80600b001415df8c535mr3367737plg.9.1635276807860; 
 Tue, 26 Oct 2021 12:33:27 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id gq15sm1635329pjb.42.2021.10.26.12.33.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 12:33:27 -0700 (PDT)
Subject: Re: [PATCH v3 41/48] tcg/optimize: Sink commutative operand swapping
 into fold functions
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-42-richard.henderson@linaro.org>
 <87o87bzqz7.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e24676e5-b0a9-b795-ef79-6b8e46ed2797@linaro.org>
Date: Tue, 26 Oct 2021 12:33:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87o87bzqz7.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.215,
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
Cc: luis.pires@eldorado.org.br, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 9:27 AM, Alex Bennée wrote:
> I find this a bit magical. I couldn't find anything about TCGArg except
> it's type:
> 
>    typedef tcg_target_ulong TCGArg;

For an argument that contains a temp,

static inline TCGArg temp_arg(TCGTemp *ts)
{
     return (uintptr_t)ts;
}

static inline TCGTemp *arg_temp(TCGArg a)
{
     return (TCGTemp *)(uintptr_t)a;
}

i.e. the TCGArg is in fact a pointer.

> so I'm not sure what to make of -1 in this case. I guess it just means
> we never have a (sum == 0 && dest == a2) leg but it's not obvious
> reading the fold code.

Indeed.  The use of -1 goes back quite a ways.  How about

#define NO_DEST  temp_arg(NULL)

which will also fail to match in that expression?


r~

