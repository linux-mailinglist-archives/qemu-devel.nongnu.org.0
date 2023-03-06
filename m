Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDCC6ACC1A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 19:11:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZFIm-0004KI-IJ; Mon, 06 Mar 2023 13:11:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZFIl-0004K5-BR
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:11:11 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZFIj-0002oz-8O
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:11:11 -0500
Received: by mail-pj1-x1043.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso14003164pjb.2
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 10:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678126268;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KpoPRq4xeIXJc2QJ8SHpXZqZ9VxjcubXP4aPrtZf44c=;
 b=dhAQY8yUqtGoCSCq6gb84LIVWcn1jvKcyXAzeTwI2WwX9A25jbJTZMaxoJnM0dpkvB
 281p4NT+8KtajAvSCdgSzg/8dGfFkxPkV3xgd3J+iUMQeAoKo8A5EkDtLslCJM1fxJdX
 Gi3TogMXfewWc3DLVwSaLI01QcjXmB55mM8tJKu9Tk9/kvk19IWAs8Kbp+s/w6/3bDQJ
 cYs3D1x6ctKLx+AkTtS3A+D1nw+laaWZBROUYWjcnRovMccuzEaROZxaKo7oYmlPSTzw
 Twr46MzO6tXa/fgtVMrfezoX15oryQWQI2llrI6uTEL/r70o9TpwzGXPycle7hw0yJMa
 C8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678126268;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KpoPRq4xeIXJc2QJ8SHpXZqZ9VxjcubXP4aPrtZf44c=;
 b=l7JhylK7RHqx4BXV1xrl2qaZsPcPx+NFtoC/71VbOgsmOkoERWXNJPAX4XFZU5aJ5B
 d/cAeRHC3NFpnCiJT7a/BU+ziQ/20VOIjPBAgPN+H52qbI/W4Mi+U+sb3JX4Pdggbw5t
 /OPZipUEayj/1o9QM4KodtWkupRX0VCyOBRIFDWWO2mTz/EWh9l9WulCue+wHfzWFD9e
 VOmq/G/W/OM7dOw5nyXELr2hxtA9PaY4frRnCZ9gqmn/LtUTzCWwsj/d/fJj8XsW3xRN
 W/w7AfON3IxpYLwqxPrGXTNrI+t9HWCsCS6KNWocy87GuexfAjeMhtUI/8H2VJeiwo/8
 MKUA==
X-Gm-Message-State: AO0yUKUlLddsJvbZtLKLqdX/cr7sfr9m/eU/pW3CyLY7d1XvoZ1L/N1D
 FoXU6szMBn6Ymi7guL5gi8NkWQ==
X-Google-Smtp-Source: AK7set8EoDQCD6x/2p+b7lKrwF7LT8bIjG6V3Z1v4tSrdeQGAWbhftygVxtUnMFzzGAa7gK3zOVvog==
X-Received: by 2002:a17:902:ec8f:b0:19a:972a:7cb3 with SMTP id
 x15-20020a170902ec8f00b0019a972a7cb3mr15537158plg.60.1678126267635; 
 Mon, 06 Mar 2023 10:11:07 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:7632:29c7:3cce:bec3?
 ([2602:ae:154a:9f01:7632:29c7:3cce:bec3])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a170903244b00b0019bd934433dsm6915655pls.286.2023.03.06.10.11.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 10:11:07 -0800 (PST)
Message-ID: <eea42ad1-3113-d2fe-81b2-46434734e5f7@linaro.org>
Date: Mon, 6 Mar 2023 10:11:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] target/arm: Support reading ZA[] from gdbstub
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230228003713.861168-1-richard.henderson@linaro.org>
 <20230228003713.861168-4-richard.henderson@linaro.org>
 <CAFEAcA9RJ0YTPG52tazPBvo7=DnmotgpoXKPyS=SD3d63ifwjg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9RJ0YTPG52tazPBvo7=DnmotgpoXKPyS=SD3d63ifwjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/6/23 03:06, Peter Maydell wrote:
> On Tue, 28 Feb 2023 at 00:37, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Mirror the existing support for SVE.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> 
> 
>> +    g_string_printf(s, "<?xml version=\"1.0\"?>");
>> +    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
>> +    g_string_append_printf(s, "<feature name=\"org.gnu.qemu.aarch64.za\">");
> 
> Isn't there an upstream-gdb-defined way to access the SME matrix ?

Not yet.


r~


