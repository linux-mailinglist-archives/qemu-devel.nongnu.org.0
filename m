Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EF0454471
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 10:57:53 +0100 (CET)
Received: from localhost ([::1]:37426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnHhQ-0003DU-KU
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 04:57:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnHfL-0001el-Nd
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 04:55:44 -0500
Received: from [2a00:1450:4864:20::32b] (port=51148
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnHfK-0005iZ-1N
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 04:55:43 -0500
Received: by mail-wm1-x32b.google.com with SMTP id 133so1651551wme.0
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 01:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eSbbstaznvudQeKDDESXSvkpYrkq/kqiBQtMHYKRB3I=;
 b=cLw8usFGH9hiAPJq3W24xREzfySJu0dOUx27hadoR5eUeItNFNL4DXNrH4V+5BzWKO
 49q1wMUnIEDJ3pxWl1qQ3FOzegGZ2liIB5cY9PaUATYpfQtiWxWcJkFf2Gfzcrdj3eNE
 EqeiaZdPpaoi7sH3VXMrj7H9/voHYfRhC59vntTXd430VPGgA9RqPVnByenGBLCChS/+
 FWrRCUXYG9yKYGxJHPqVmxfmvE5Xtr9p4cWPGytAh435KCYbd5DoFfwB2/4Vvaio07HA
 BLV7DVx+7i8I3bxIsytEwOvRdoL2ZnR24j3xOUqqP9S7k6e5nub1/kRglUuId87+bEV1
 gnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eSbbstaznvudQeKDDESXSvkpYrkq/kqiBQtMHYKRB3I=;
 b=dy54qOD2XisaZDVYlATw3P6G7yMPWKue2gOD0mki/cpBQqfLT5WraynXrqSwO55zI2
 ZELGMzUC1okeQkwnGBmG0taucLu23BbWGz0ku/+LBq5IPm9AXq9tlxgEPUlpPcxgAUNR
 loubtx8KMdABMO069Z5d++C12EXXY4qt1sPieA2jjkQbvRFkZ82AhNrtwoPIvyFDu3Hu
 g0NKqQFbShhceUr39ptHdieeJf2xVv4cs2Vv+Q2AVR33AoAaQPXHqFbpxIMS8Ka7vlZ2
 tCI3ITDv49PINz/z69YwTClcxR1gRdYeqilijd32OSfFCPN0zKJdZaaifAP/LuBOj/ec
 XAow==
X-Gm-Message-State: AOAM5325pT+wdfoj6qwcroYEm1meckdrwmcJOK55JJGiMOVmgfC3EN7C
 YUP3XHtr18IpSvw3d9YvP2GbZw==
X-Google-Smtp-Source: ABdhPJyWeiHEIMaG5KBis72EYSSMPeUfIC7e6H34/5WPh0EZcFhyLKSz+7KluSy9KCXTG5MKRbUxEg==
X-Received: by 2002:a1c:a9c6:: with SMTP id s189mr16371949wme.38.1637142940274; 
 Wed, 17 Nov 2021 01:55:40 -0800 (PST)
Received: from [192.168.8.105] (101.red-176-80-44.dynamicip.rima-tde.net.
 [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id b10sm20597729wrt.36.2021.11.17.01.55.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 01:55:39 -0800 (PST)
Subject: Re: [PATCH v10 04/26] target/loongarch: Add fixed point arithmetic
 instruction translation
To: gaosong <gaosong@loongson.cn>
References: <1636700049-24381-1-git-send-email-gaosong@loongson.cn>
 <1636700049-24381-5-git-send-email-gaosong@loongson.cn>
 <7e6e5c26-2c1a-e4b5-a724-c2db33a36180@linaro.org>
 <5c3c3107-da7f-7e13-189e-866c7ff1acde@loongson.cn>
 <f1e1b0fd-b34e-1403-1851-35c783a12237@linaro.org>
 <6e225d21-c2e4-69d0-c4f9-d2018096ec70@loongson.cn>
 <e26b8243-2797-cde9-3833-a7c4cd3b6a65@linaro.org>
 <a46e8df8-ccb9-52d0-2e73-33a49e92bfd8@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <75e1049b-b09c-7b6d-990f-d2c341ca12c8@linaro.org>
Date: Wed, 17 Nov 2021 10:55:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <a46e8df8-ccb9-52d0-2e73-33a49e92bfd8@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.009,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/21 10:29 AM, gaosong wrote:
>> gen_rr_i ?
> 
> The code is not written completely,  like this:
> 
> gen_rr_i12:
> 
> @fmt_rr_i12               .... ...... imm:s12 rj:5 rd:5 &rr_i
> slti         0000 001000 ............ ..... .....     @fmt_rr_i12
> sltui        0000 001001 ............ ..... .....     @fmt_rr_i12
> ...
> 
> gen_rr_ui12:
> 
> @fmt_rr_ui12               .... ...... imm:12 rj:5 rd:5 &rr_i
> andi         0000 001101 ............ ..... .....     @fmt_rr_ui12
> ori          0000 001110 ............ ..... .....     @fmt_rr_ui12
> xori         0000 001111 ............ ..... .....     @fmt_rr_ui12
> ...
> 
> @fmt_rr_i12 and @fmt_rr_ui12 are two 'Formats',  but they use the same 'Argument sets'(rr_i).

What I meant is that there would be a single gen_rr_i function handing the argument set 
rr_i; no need for two gen_rr_i* functions.

> gen_rrr_sa2p1:
> 
> @fmt_rrr_sa2p1        .... ........ ... .. rk:5 rj:5 rd:5   &fmt_rr_sa  sa=%sa2p1
> lsl_w           0000 00000000 010 .. ..... ..... .....    @fmt_rrr_sa2p1
> alsl_wu          0000 00000000 011 .. ..... ..... .....   @fmt_rrr_sa2p1
> alsl_d           0000 00000010 110 .. ..... ..... .....   @fmt_rrr_sa2p1
> ...
> 
> gen_rrr_sa2:
> @fmt_rrr_sa2        .... ........ ... sa:2 rk:5 rj:5 rd:5   &fmt_rr_sa
> bytepick_w       0000 00000000 100 .. ..... ..... .....   @fmt_rrr_sa3
> ...
> 
> gen_rrr_sa3:
> @fmt_rrr_sa3         .... ........ .. sa:3 rk:5 rj:5 rd:5   &fmt_rr_sa
> bytepick_d       0000 00000000 11 ... ..... ..... .....   @fmt_rrr_sa3
> ...

Likewise a single gen_rrr_sa function.


r~

