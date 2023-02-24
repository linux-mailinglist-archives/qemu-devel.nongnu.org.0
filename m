Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F24266A24D8
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 00:03:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVh4p-00047G-Mw; Fri, 24 Feb 2023 18:02:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVh4l-000459-Jj
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 18:02:04 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVh4j-0002xC-Uo
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 18:02:03 -0500
Received: by mail-pf1-x42a.google.com with SMTP id u20so382275pfm.7
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 15:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b4OskIzazsQxZsMll8D1QLnXUXI9o3vkQVSKknsOPm0=;
 b=Ay1dlcWebIYP1gR14xpEZffjLB3ba7SAH+LRIqA03ofu6t+6SePx/QMz+8xTXSz7Pm
 1TdVEGOGqqDmkQDvy6T8Bx+z7EDPiFssiSBKLXlEoBRkzMkKLSH61Si8oOxlHuTS73Oz
 VQlslKEPeXWrj+NMQRnkYM6XHnklrwxkbFzytBJS+IkKEyEIDDwDh00AVz8sMEM7JJpq
 zIT87UE1jeBn4GoGoAFZUjen7B28qj63+g1ShCYw91N+3pKVXTN5UePOmWZQhGne/b3j
 ArQTAlurEzaQkd28cfxBTEq9ipLj3OhhsuiLUkMjd5K6CBeUt3ciIL7jteSAh9bGjFzl
 0YGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b4OskIzazsQxZsMll8D1QLnXUXI9o3vkQVSKknsOPm0=;
 b=dS2DaKEO1BSsfBxBZApZeUFx6BI2GHVYBGZJ+tf8d8d0zg1lUH0eYJYDsPmwv97j5t
 4xXXKijXwr7K5y5xnaGZ0o+Ecvq2gmB9ypssqeHZ3QP1pInbohsx4tdUgADImoRnnrvP
 w+lvY8qySPAkUf00kcc22s5in4K58EspXDla7pZZ1yQUKUPHjr9Gyv6LFtaW6vzc/PWq
 1pMA0LFiLdMYXp82oNAY2gBFcJBTUOfoh1EdoKmV8JEf8USsiHyauypJ6uiS7eR70i9j
 58GC2DxmND2l7mvE/tbs+rlnYFRvlxgEP7v08tHXigKiXbMyOPcRaOGUw9WgvMJ6VO60
 sB3g==
X-Gm-Message-State: AO0yUKV7cHhjplJCG4G3pkweu/7GGuTHU22r8V2mwyIXsZe+ngnsoL+G
 yu+iqEBrt3YmLYKh3wJOa6qUb1UMUSajxAaabuo=
X-Google-Smtp-Source: AK7set8/1docDhim1NBTR3hbXUU9519+0fAslwgE3Sub7XprN992HG5NAYtK/3uRDQvS/VSacy+9Vw==
X-Received: by 2002:aa7:9537:0:b0:590:7616:41eb with SMTP id
 c23-20020aa79537000000b00590761641ebmr15748202pfp.30.1677279717436; 
 Fri, 24 Feb 2023 15:01:57 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 a23-20020a62e217000000b005d92c9afbd4sm86281pfi.33.2023.02.24.15.01.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 15:01:56 -0800 (PST)
Message-ID: <9efbc9ba-9a5b-9c6e-9255-a407126c7c8a@linaro.org>
Date: Fri, 24 Feb 2023 13:01:53 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 10/43] target/loongarch: Implement vaddw/vsubw
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-11-gaosong@loongson.cn>
 <268ef762-fce5-ca47-d5f7-bd60955a3a0f@linaro.org>
 <f5c0796d-62c9-691a-c2ba-e4dd9e654831@loongson.cn>
 <e75fd2b7-9955-ad2b-62d2-30d7b85d7e7b@linaro.org>
 <f484b933-8f9f-6f0b-0d81-7202bed31d83@loongson.cn>
 <1ad204fc-8f7e-0f1c-e8f6-163d11f3880b@linaro.org>
 <c795a157-21a8-a8d7-bbc1-ed33e7f32747@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <c795a157-21a8-a8d7-bbc1-ed33e7f32747@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 2/23/23 21:24, gaosong wrote:
>          {
>              .fniv = gen_vaddwev_s,
>              .fno = gen_helper_vaddwev_w_h,
>              .opt_opc = vecop_list,
>              .vece = MO_32
>          },
>          {
>              .fniv = gen_vaddwev_s,
>              .fno = gen_helper_vaddwev_d_w,
>              .opt_opc = vecop_list,
>              .vece = MO_64
>          },

Oh, these two can also include .fni4 and .fni8 integer versions, respectively, for hosts 
without the proper vector support.


r~

