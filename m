Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C1E4119EF
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 18:39:11 +0200 (CEST)
Received: from localhost ([::1]:55226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSMJy-0005vu-SO
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 12:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSM5b-00076Y-6R
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:24:20 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:44824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSM5Y-0004zX-QQ
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:24:18 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 nn5-20020a17090b38c500b0019af1c4b31fso350182pjb.3
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 09:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=OSXVE+16/LCzF20cu4GeV88BfUZ8DskqLZEgZQN89UY=;
 b=tAK0wuZme9MLdNCcHsC0NLb3gVbwgAbjVJ/YSwdDxVxLYEOSJHqc7taBh1rYr1wnsI
 csAxTwgxnSiOtkYMOCXEnS6K0HWG+wzBbMPSaQHHmMYwP+Xv2zrg+H/7uaP0kmPS4Ltz
 oN405b0RN5zJbABlFX1YPcuvuQ6GaBILVBYHduxkF/0nJ2+sLNY9zcbLLmCccmUkri5V
 aUm3YS4nWJvmaoRn2kAayjV8LBN0BWJgJtqQp2UCq5AJAe/L39ZxX/kaSpfPk4hgOi0u
 cfb+FG4ZPO7zcvMIx06LTairT1Tw4gSyTfNaJjjTFTCDDexPrXgEUvwXykFH2sa0yNBz
 EP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OSXVE+16/LCzF20cu4GeV88BfUZ8DskqLZEgZQN89UY=;
 b=PKK+zdmqlRFRX5AKCHOIRb2Vgy3MmVYtVn7mtDF+DtOH7l3z5Y7QGj4LGwumirMo3v
 ir/etrZxykJSEDXSoMqjBUQdlZ9jchJZWfrBoss4R77JM6QmtOOCGtZXqwL9UUuB1+6o
 YOX8CeOCiM6OpTl+5HiCwW03IlT75Idg4tG0cWm0xsIy8wiodLha/HUk9lZORka7Bi8N
 5KblBONkNyVPWfM3yCtIlpxNbP5m6S1wtf1IZxNtw5rogPkr11mXeowpZysrE/luyZmL
 rMjHIq8dqm2va/RAkuYiUKJ6DL3fyNL6nX8cgKMQZRPJm61xkKaAXmFUXyhMW3DCLO+/
 j/dw==
X-Gm-Message-State: AOAM530muL+uPhgzCQiI3BChSEeDvAeSXQ2Nkl5bmN4l9ZdpWick2zN0
 hVCjf4y6uaknOmVDyOOzOoehImuzqktBqA==
X-Google-Smtp-Source: ABdhPJwBxGRA5BzxUprjvVZ8kygr0E5EG3P3en07a5JNLMmf0jzjEvOZCkqiG7fABXaozfGWQ981Zg==
X-Received: by 2002:a17:90a:d3d6:: with SMTP id
 d22mr9466546pjw.242.1632155055140; 
 Mon, 20 Sep 2021 09:24:15 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id v13sm14977546pfm.16.2021.09.20.09.24.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 09:24:14 -0700 (PDT)
Subject: Re: [PATCH 20/30] tcg/loongarch: Implement setcond ops
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-21-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <523333d4-5e5b-aa83-db04-fe9562a13d13@linaro.org>
Date: Mon, 20 Sep 2021 09:24:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920080451.408655-21-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 9/20/21 1:04 AM, WANG Xuerui wrote:
> +    switch (cond) {
> +    case TCG_COND_EQ:
> +        tcg_out_opc_sub_d(s, ret, arg1, arg2);
> +        tcg_out_opc_sltui(s, ret, ret, 1);
> +        break;
> +    case TCG_COND_NE:
> +        tcg_out_opc_sub_d(s, ret, arg1, arg2);
> +        tcg_out_opc_sltu(s, ret, TCG_REG_ZERO, ret);
> +        break;

You accept zero as input; you'll want to skip the subtract in that case.

r~

