Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B85696D4F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 19:50:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS0NF-0000M2-QI; Tue, 14 Feb 2023 13:49:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pS0NA-0000Ik-Go
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:49:49 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pS0N8-0000ek-S2
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:49:48 -0500
Received: by mail-pl1-x632.google.com with SMTP id i18so9532811pli.3
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 10:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vfobwdTC01rmAh3WJS3xjsj2MCOkriF6RXlNNYyWYnk=;
 b=XdXA3m+ZXd0ijTvmcdP5xYZNyxHT1TXLb/2U2Nvc/1KJKZOvMC8K5pb6ZnEpl2ZUAF
 KaEzDDeiACzjlrKAsURGlB8w3dG8qyKUgNE/1hU2pPEkt/DywAAoODj/LptykaFQexE9
 9cwRLKBPCKcF/LhEEKHWol15MUk8ajTFGD/Xcq+cvx15V7RuUNMiBhhlDK1Q79mLfjDR
 Mv6l0zPEkjpDtWrH4fKuBcMFLV9U5yMC40EWPeqXSb+w9Xl72khPWioKhfpzkpQdqV8x
 tf084/N5msZK9JgJIIO/xA+mjsSJuYnpsB9BCy9Fj1vdj0b+2JV19OFnLToH69knBNuc
 MTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vfobwdTC01rmAh3WJS3xjsj2MCOkriF6RXlNNYyWYnk=;
 b=6VMrHy2RWQIu+/QHB6lDN4hQS+XiT6WGb1F98mJXRCKKefNCTvso7Q6m27gNzVTY6x
 WSSe8Kk15jB/BMCi/Wk5QIX1BsfJ0a6Lm8s8ejtlmdLpUXVE4+jMhMFWUd22OLmV+NJY
 An71r6Z77Hu0yj7vRLB7JmKkmtOpHLn48kjpvdIjseB6uaBWgVZsleWJTVOXLmZm58Bt
 +Dwd9v2t0WB3ByuuiND2dWe778f//ee9fc2xfsMKP9RuEvXTur0uB1DXkA493GDR3BQY
 c9AR4GDBKn/2NPSmrCg6WYJYI9dFwV1Qxp5xCCQgf4b7KUFdgdi3W0+kck5qowX6lY2m
 AHew==
X-Gm-Message-State: AO0yUKXXS5EsW1aQSkfyTkdq5WN7xeo1MDa2VIMylY1oRt4rblFxd2Gp
 mMAJNMW38zO0DmIYt5Yp8UePPA==
X-Google-Smtp-Source: AK7set9TemmtWNLUg+NS8DLZ2ApfPq0BrGljYNldGwIjPTL4EMVTcfHxN5kFeeUTYwJqq4bCZYd+Lg==
X-Received: by 2002:a17:90b:4a88:b0:233:fe64:a13f with SMTP id
 lp8-20020a17090b4a8800b00233fe64a13fmr3625891pjb.7.1676400585182; 
 Tue, 14 Feb 2023 10:49:45 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 s93-20020a17090a69e600b002339491ead6sm8096682pjj.5.2023.02.14.10.49.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 10:49:44 -0800 (PST)
Message-ID: <be88dc7c-750f-f4a3-c350-d780e36337ae@linaro.org>
Date: Tue, 14 Feb 2023 08:49:40 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 6/7] hw/isa: Assert isa_register_portio_list() gets
 non-NULL ISA device
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-block@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20230208000743.79415-1-philmd@linaro.org>
 <20230208000743.79415-7-philmd@linaro.org>
 <8bcc1035-c9fc-762a-7a32-6b0344539345@linaro.org>
 <f088930b-ad9d-354d-5053-f319272140a1@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <f088930b-ad9d-354d-5053-f319272140a1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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

On 2/14/23 00:18, Philippe Mathieu-Daudé wrote:
>   __attribute__((nonnull)) void a1(void *ptr)
>   {
>     // can no use assert(ptr) because compiler warning
>   }

I briefly glossed over that...

>> I realize we'd probably want to add -fno-delete-null-pointer-checks if we make too much 

... here.  The compiler warning should go away with the right flag.


r~

