Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 781A2438B16
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 19:47:20 +0200 (CEST)
Received: from localhost ([::1]:48058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mehaZ-0005uW-In
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 13:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mehVf-0003vQ-1A
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 13:42:15 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:46667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mehVc-00045f-2f
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 13:42:14 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 pi19-20020a17090b1e5300b0019fdd3557d3so6643926pjb.5
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 10:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dYRcQUnDyUr8cdS0Gfey6nCt1UZFa/oNdM6Oxx9TWVg=;
 b=eXF8BKeC/EjVjK6n17AR1h25QXsLvhQ02kU60a8Hz4opHwYzKcS1NVGAc/ut6fsIGl
 zcJgL32ZMcbXEIB163V8jkw5eRA5tynSuZm0w0/fdTrqgS44SIDs/MwP+P6q6pkcwD0p
 gz3LxaNGRDcQoY+ZFqqVy0WZaUKYwQQk8ePSpebQl4h/h8OTZFWzdBih3qqP21Cqq2it
 loKuRGG3kXCTiUjnNYbiN9v0J+nHtbyxfAE7uV1JvksISfXluOJWdj4ZNrZqt0+2Y3WV
 dq0EkjVAVzUXd/tAqkYXJMyvOLzjMq/yQkHrtZrOPlSchDj4rx5D9rX/RBLtq+VzGbKL
 uDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dYRcQUnDyUr8cdS0Gfey6nCt1UZFa/oNdM6Oxx9TWVg=;
 b=ZykztSlDCsY2D35T31k7s32b0PeEJP8+HKrZNE72ty8RB2RP7ICz1zDlF6+nOUvSyw
 Ubt10xlDgE4s7Zn6SfLuUDi6hPpXF4DQq6GgGR+skv4ehdLZ/5SL2iZcICRApQI0Uadi
 Xf+cxwRTgszHaLEfKm3GQGBz5ruwdi+Ra9LDgf8MQ6k9Bmu8pFjUYCVV9L3VmxIld7qY
 sEVlJUb6m1BKabo3MJGR1xwJf9G1vsRrCAzt0qraxoPMpPCYLNINH9gYI1A2QRgNWrZY
 QmDSMr3WFH7nM/92o4yPiQ0t5Lfkg1zZB61oCVB+bvSP1lpdwy8dl1EiY/YEMK48ngp2
 w+lQ==
X-Gm-Message-State: AOAM53056PMp6Ix6eIXcfn6sqTJijfFDaeul8UQiNDeNZ/4Hdep1wYzK
 C0ctsbfwzn2iGSpTg1dXOZqXog==
X-Google-Smtp-Source: ABdhPJxBivgUsIUkDsO5TQGiprsGwYqsyvzn6CGZaekcPICoWnSw2vUwICWT46aW7dSpE/2YBb2uFg==
X-Received: by 2002:a17:902:aa82:b0:140:4655:b211 with SMTP id
 d2-20020a170902aa8200b001404655b211mr4337740plr.38.1635097330612; 
 Sun, 24 Oct 2021 10:42:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id e15sm9473042pja.52.2021.10.24.10.42.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 10:42:10 -0700 (PDT)
Subject: Re: [PATCH 20/33] target/mips: Convert MSA 3RF instruction format to
 decodetree (DF_HALF)
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-21-f4bug@amsat.org>
 <38e966f8-68d1-e444-e4be-2d19edffb603@linaro.org>
Message-ID: <14f3e7f5-15ae-d0f5-4e78-88965c868526@linaro.org>
Date: Sun, 24 Oct 2021 10:42:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <38e966f8-68d1-e444-e4be-2d19edffb603@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.33,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/24/21 10:37 AM, Richard Henderson wrote:
> On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
>> +static bool trans_msa_3rf(DisasContext *ctx, arg_msa_r *a,
>> +                          enum CPUMIPSMSADataFormat df_base,
>> +                          void (*gen_msa_3rf)(TCGv_ptr, TCGv_i32, TCGv_i32,
>> +                                              TCGv_i32, TCGv_i32))
>> +{
>> +    TCGv_i32 twd = tcg_const_i32(a->wd);
>> +    TCGv_i32 tws = tcg_const_i32(a->ws);
>> +    TCGv_i32 twt = tcg_const_i32(a->wt);
>> +    /* adjust df value for floating-point instruction */
>> +    TCGv_i32 tdf = tcg_constant_i32(a->df + df_base);
> 
> I think it would be better to decode df completely in decodetree.
> E.g.
> 
> %df_hw        21:1 !function=plus_1
> @3rf_hw       ...... .... . wt:5 ws:5 wd:5 ......  &msa_r df=%df_hw
> 
> %df_wd        21:1 !function=plus_2
> @3rf_wd       ...... .... . wt:5 ws:5 wd:5 ......  &msa_r df=%df_wd

Meant to say, with that changed,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

