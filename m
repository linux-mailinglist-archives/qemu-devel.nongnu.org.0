Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B144128DE
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:29:01 +0200 (CEST)
Received: from localhost ([::1]:55630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRmW-0007gh-M4
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSRBA-0003oh-31
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:50:24 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:37655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSRB5-0005tm-HK
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:50:23 -0400
Received: by mail-pg1-x535.google.com with SMTP id 17so18743790pgp.4
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=YSSmLY7q9yW0R0pSTS3V43vaVN9issM1Fhw60iXn+n0=;
 b=fVSK83oG1VzVu943QH9PNjhBk8k6IMCVI5ehnHWHhRnLA4rIDYHf6x8LaE283qEE+M
 3bTaui915ob3I/nryhgD9ygApUx5xeIsHDVMcJqxStGA+eBiR3VRyBA/bIRX2Vzqwxcq
 yIScagvm+Fw/N9taSJTXdczYfor5kGThWDZlGwHD76Emtsr8QHh44JOIyVhQqkTUmsGH
 w13WtWrwhcokBN54WpLXNG5Zq0cVnrt49kvtnRMU8f6qlQyBuusbmMgeB+YKqsH4pja3
 3CI7Dlgq9wdWMPR7igqXZzrJqdYDkmNtZPOh/kZrbVqnsWBzPm6bCl95zgAurWPPJyR3
 KZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YSSmLY7q9yW0R0pSTS3V43vaVN9issM1Fhw60iXn+n0=;
 b=1UNXTBh+4bpYV37YcLUAFvOAB4GkXcmxIrDhBp7NqeyguxmgMONrUctu6EaDWQFgdj
 JmQMFzptRzTw5i7/M0WoVzB0WAFhs2LWJ/r63bB/Z0njn1DwQG/jwfFyr7sACtAJMf4i
 1PLI007wdcbpqVZ6SQI/d5I0gkZ+Bz0B4Uop5L5zKTJ7V09ZUGuJIVbBdkTS/RX6X6as
 m9nDWND6b58qqZLK2ja7EOzjytM6BZ7JeXynjcDVavkZjFe7ReIneS04avCJfKDpkyRY
 mJz7toFTPq98u96kUh/Pg2EGZcIZkE3oM8Cqc46uQ9zQzoLn6nGYuOWqaSQ4Wqb1H9ZR
 62Og==
X-Gm-Message-State: AOAM531kXKp5x/4Ah+uaXEb7A46yZdx/Un8newdgDJtrdsPc6arwWKsa
 HGSnafYXgqPsyFrmQl8TrzMF029hY29pfg==
X-Google-Smtp-Source: ABdhPJy+AL1A+bGfbRh25iGx+g9BEVMxW4pnWVis34dknY3kjEvpgsB35dNaRE3bujs4sy6sFg/kTA==
X-Received: by 2002:aa7:8434:0:b0:43c:222b:1d3d with SMTP id
 q20-20020aa78434000000b0043c222b1d3dmr27106477pfn.84.1632174617523; 
 Mon, 20 Sep 2021 14:50:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id l22sm17422330pgo.45.2021.09.20.14.50.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 14:50:17 -0700 (PDT)
Subject: Re: [PATCH v5 12/31] target/cris: Restrict has_work() handler to
 sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210920214447.2998623-1-f4bug@amsat.org>
 <20210920214447.2998623-13-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a8e2bc46-cc65-5e5b-e77e-7571bdce595a@linaro.org>
Date: Mon, 20 Sep 2021 14:50:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920214447.2998623-13-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

On 9/20/21 2:44 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/cris/cpu.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

