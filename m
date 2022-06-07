Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1768854072A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 19:44:06 +0200 (CEST)
Received: from localhost ([::1]:51798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nydFM-0001UM-Lg
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 13:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nydCX-0000jM-Ea
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 13:41:10 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:37404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nydCT-0003ds-AG
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 13:41:08 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 3-20020a17090a174300b001e426a02ac5so18335737pjm.2
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 10:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=hLNaa181H8ZV34t+mYn6dZSDjvN0Yj6tUPG8NXR6U/8=;
 b=nb5gqojJsfk2hOLsDZRy2JKfC6GeKe96zDKtLlHpjfpoci2ItDVqsiQ508Orc0oKYx
 Q9tbMH7+MUTnfZX5LeSa9IA6Genvn3ODR7eJ/d2adIcRzXJIkQ3A6Abp24znvxDIv45J
 i0y+ELRIaXic9sUFwB+ulmdq/XO0okjtvaoeXPx1zwc57zuLSgXhGNovwJj4WYt+RxKu
 ZDhevGezFY7Xo+FdV1iJHT4mV6fACpZC3ds9pBYgMoiCERkGQcETvUShxt1zGQ/SGstX
 IiI0ZVP/xmZifHwHS7f322qfnYPM1Y/oTbRZvICxvE926Gp+58zVe0K7sgET4XQj/9p/
 kMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=hLNaa181H8ZV34t+mYn6dZSDjvN0Yj6tUPG8NXR6U/8=;
 b=fvNEG5iDpeXYio8hoN3k4S92g4goB+mB4EUgbru0MdsEkFgGEi2A1SjNROxZgMq3lc
 xvtu1h1OX0K6aZFPUt8emnCVg8C4bzuzR2fK09UJuT70bPYYAnrHKXn7WAYg/edzWywg
 sGS37OXSFgF6jk80aTdN7MbLKi3MRd8Jdp3zb8jlBALWNzxr37hpaNPM6bCdmBrDiYwn
 CYOv4ZBEu2cRfFJa+bBb1gia42yzS4ooYQh2wv/Xsuz9ciCl8QEmGtllbC82a3J13kT6
 188E/KqqFAnhdknAaICbP/+MGMr9W+Ejia0rs19E7E+PXMpDqMdqm9oYjpWiSU+swtYD
 b/5w==
X-Gm-Message-State: AOAM530C88tOrTDhV2dWbrJi4D0tbvjPJZ4TDIiIffp+EXqbOCnVIYAA
 XzJB0dl7LydbBwf3RPycI7Q19A==
X-Google-Smtp-Source: ABdhPJwjpW2D5KmbTLpOit87YXGtzM+tvYVfLqCi74rC92TLGKAI2wRfrvjHSM8QTG737S3Nrd/0cw==
X-Received: by 2002:a17:902:8ecc:b0:15e:f63f:233f with SMTP id
 x12-20020a1709028ecc00b0015ef63f233fmr30167171plo.86.1654623663566; 
 Tue, 07 Jun 2022 10:41:03 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3cf2:c634:5b19:25f6?
 ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a170902c70200b001617541c94fsm12828847plp.60.2022.06.07.10.41.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 10:41:02 -0700 (PDT)
Message-ID: <dcc045e3-93c6-35ce-e378-fa4e73fe9a12@linaro.org>
Date: Tue, 7 Jun 2022 10:41:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 09/49] semihosting: Adjust error checking in
 common_semi_cb
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-10-richard.henderson@linaro.org>
 <CAFEAcA9x+xCFkLQX8wMnTr4JfFLN0nOnLan6y-Qt-tmzRe5mpA@mail.gmail.com>
 <840c75f7-069b-9c53-37ca-399489989758@linaro.org>
In-Reply-To: <840c75f7-069b-9c53-37ca-399489989758@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/23/22 08:35, Richard Henderson wrote:
>> That implies that our current code is right, in that the
>> way to check for "did the call fail" is to look at the
>> retcode, not the errno (in the same way that if you make a
>> native syscall or library call you look first at its return
>> value, not at errno). There's nothing in the protocol text
>> that makes a guarantee that the errno value is non-0 if and
>> only if the call failed.
> 
> I admit that I didn't check the gdb code.  I looked at our side and saw that when the 
> second result is missing that we'd supply 0, and interpreted "can be omitted" as "will be 
> omitted" on success.

Checking, can->will is actually correct, and gdb will omit the errno parameter on success.

https://sourceware.org/git?p=binutils-gdb.git;a=blob;f=gdb/remote-fileio.c;h=fe191fb6069a53a3844656a81e77069afa781946;hb=HEAD#l328

So I think checking err != 0 is a good change.


r~

