Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D853695085
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 20:20:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pReLz-0003Mo-K6; Mon, 13 Feb 2023 14:19:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pReLw-0003MV-EF
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 14:19:04 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pReLu-0005xN-UD
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 14:19:04 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 v6-20020a17090ad58600b00229eec90a7fso14510387pju.0
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 11:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VHqbPugPLFtp52xzsuULDOUwWtU/kX4UW3Vuzg5hhBw=;
 b=e24oE+HFnc+Q2V/EITsTmGHNXTsgaGCwQrlNFBzY2+KSfFDEVHIDa+LKaqCK1f4Bcn
 ZsuCR9TpD/rQWIJ1J20PcmNeNosYdB9iKshWJGkDK/0FMOJIlpeCKuN7zu82idGtJIRs
 dAveIYDzj42rdoPAymv1G1Lz8+dfGlzhG3NOAf3RE8L+ssCeZ7Z6SJGfSoaHfDTDuluj
 pDnLYdbjwE0KNLyy/r+lhv5kXbD/aj78EzmFRRxKTFfDkOY7auIpdY8G/7XnmDoLYfYF
 /ybABo/dMyi2mCtlie3tdP4XtOYZbMZ4tWJty+hiaEIxZoA2mnWPrWo1wSl66FSMj5hS
 /iBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VHqbPugPLFtp52xzsuULDOUwWtU/kX4UW3Vuzg5hhBw=;
 b=wMCY0Voa5vIzu9/iXTHCKiTNe3H6BqKk9xk9QffYAljekbOOIuvRCq42hPdtqSVTAG
 VsAlziELOncrU+zI8MFvd0TOQSIOngpx85TyHE+GLAX2tW4vZTuZ6FOh1R3lb9IReVMe
 r0ATOWwfD9L1YbRylsWIzwfBxjSlvczi5fh4IuZ5PEiRUJTZZhrom7r/cbz5RcG5dhID
 8Pxj09PD/eQ2Pig0HgmCaFvR0JBkZkRsXechwwCqUN4TNAM92+8pyU/5YtkaZhQweTqC
 acuSzoGBgHW2uNDJTjp9sOW1DbG8/3hBjFkUb9+cso+CXovcgLymZtjrhUVbZxas3UnL
 xpeA==
X-Gm-Message-State: AO0yUKVREaeCr8BzLtPhlVSJpobajU4ZgEdOBsX/x4c6d9opSwNQrkFP
 lhRwwakOzdlrUyk8CREl5uP6eoEn/GTuNmtb4Hw=
X-Google-Smtp-Source: AK7set9/rxeCcHt9Y+nQDrzZxi9Rdtj9qAJIF8hzCYUGe5Or4SYmkUNkddksIlHgAHDvUYRXM9w/4g==
X-Received: by 2002:a17:90b:4acd:b0:234:f77:d6d2 with SMTP id
 mh13-20020a17090b4acd00b002340f77d6d2mr2734852pjb.45.1676315940958; 
 Mon, 13 Feb 2023 11:19:00 -0800 (PST)
Received: from [192.168.145.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 s23-20020a17090a075700b0023377b98c7csm6383857pje.38.2023.02.13.11.18.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 11:19:00 -0800 (PST)
Message-ID: <cb062199-897d-469c-959d-a06f9876bb19@linaro.org>
Date: Mon, 13 Feb 2023 09:18:55 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 01/43] target/loongarch: Add vector data type vec_t
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-2-gaosong@loongson.cn>
 <fd5e8513-8890-ca06-194c-4ea4538bc7f3@linaro.org>
 <0b2940dc-d058-4b87-9f54-b80bf700f2fe@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <0b2940dc-d058-4b87-9f54-b80bf700f2fe@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
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

On 2/12/23 22:24, gaosong wrote:
> Hi,  Richard
> 
> 在 2022/12/25 上午1:32, Richard Henderson 写道:
>> On 12/24/22 00:15, Song Gao wrote:
>>> +union vec_t {
>>> +    int8_t   B[LSX_LEN / 8];
>>> +    int16_t  H[LSX_LEN / 16];
>>> +    int32_t  W[LSX_LEN / 32];
>>> +    int64_t  D[LSX_LEN / 64];
>>> +    __int128 Q[LSX_LEN / 128];
>>
>> Oh, you can't use __int128 directly.
>> It won't compile on 32-bit hosts.
>>
>>
> Can we  use Int128  after include "qem/int128.h" ?
> So,   some  vxx_q  instructions  can  use   int128_ xx(a, b).

Yes, certainly.

r~


