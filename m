Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF78A5B1C2D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 14:06:39 +0200 (CEST)
Received: from localhost ([::1]:60148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWGIo-0008HS-I4
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 08:06:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWGBx-0004oC-Ng
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 07:59:34 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWGBv-000225-1S
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 07:59:33 -0400
Received: by mail-wr1-x42a.google.com with SMTP id o25so1063792wrf.9
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 04:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Q4sLTEu/0ca8zDCXn0C919xAK1y9Jdxcu6L7R3XfDo8=;
 b=kJUKqUDavxUD6VDqkXbvPwR23DslIsjgr1rCdr8Vq2CEqUkR4gwRI3dhnLcN/bNz+o
 p4oSlkhRps2VHwGBDoFUi0TcU5mWRR2wENKyJTYYK+JbrZMhKTt6bb0PVyCXB/nwm9QB
 mQeTyzx4AekZBFDlecEH1OfX+JOpvlx9K1HmNUxHwy0tB4wcsSNf1YHNhnVZT+rnK02B
 rRD5LXxdvBBvEIBXB0H3ctbvMVe+h+Sl+xIy69CTWvAelOR8pvd95QqYg73UW/zGJOlX
 dtmDioN48WlWDO+23NxlYoT0wSGSSXCAKpkh75OnKNw/abPSRCW+pPBtiopGBz+dZvRB
 JvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Q4sLTEu/0ca8zDCXn0C919xAK1y9Jdxcu6L7R3XfDo8=;
 b=Q3duD4k/UppyJJLPtwOWcX0uVYrSGQwU0GDnk6Wmv8jaO5cGJewS2vlSwDTWQjIbHZ
 hwk3SMBo9zuDXvu60Ne1ajZfBK9zEGKxJXB1dKt5LmsJbeEAmUSDszV1uiVTp65tNEM8
 j5qhSPSqIloGOK2xLBQRPAO9nM9dbkm3C7FS/76RSQirUVLoNdmDeZZjyP8HtURxRCdV
 97Q3Qu8HhtOQwOBLhb+YMgzDu+F7a2FrkwRVps+RLZYCDhKcmAKM6/QjCmR0c34UJuWk
 /xkZuDkD3T74n63amz85TnDZekvzJ8Fnk6vmxVEkkf9buMxRkgtB32bWTYP+b4lqK5qj
 2bjg==
X-Gm-Message-State: ACgBeo3UMSgcW/v1WTzMOgxg5F6DNKw+0oSZ4pMRpTPv9JLydWrM1Ga4
 lTR5GVJmXx/Udeaf/sJx8gdd1w==
X-Google-Smtp-Source: AA6agR4No1wfJL33ve49PiBmLC7kUKKeno0XeT+ybcmZr/ks00RDqLvWTVu66ShM09FRxvu89NHcYA==
X-Received: by 2002:a5d:64ed:0:b0:225:11d4:76d1 with SMTP id
 g13-20020a5d64ed000000b0022511d476d1mr4820987wri.579.1662638369339; 
 Thu, 08 Sep 2022 04:59:29 -0700 (PDT)
Received: from [192.168.1.87] ([109.78.97.14])
 by smtp.gmail.com with ESMTPSA id
 m123-20020a1ca381000000b003a83fda1dc5sm2555864wme.44.2022.09.08.04.59.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 04:59:28 -0700 (PDT)
Message-ID: <f96fc511-de91-5fd6-644f-6a4f9575850b@linaro.org>
Date: Thu, 8 Sep 2022 12:59:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 2/9] target/arm: Change gen_goto_tb to work on
 displacements
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20220906100528.343244-1-richard.henderson@linaro.org>
 <20220906100528.343244-3-richard.henderson@linaro.org>
 <f8c471d1-7f4c-e491-d7fa-1df73aedc20b@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <f8c471d1-7f4c-e491-d7fa-1df73aedc20b@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.142,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 9/6/22 13:52, Philippe Mathieu-Daudé wrote:
>> @@ -1399,9 +1401,9 @@ static void disas_comp_b_imm(DisasContext *s, uint32_t insn)
>>       tcg_gen_brcondi_i64(op ? TCG_COND_NE : TCG_COND_EQ,
>>                           tcg_cmp, 0, label_match);
>> -    gen_goto_tb(s, 0, s->base.pc_next);
>> +    gen_goto_tb(s, 0, 4);
> 
> Why not use curr_insn_len() here?

I guess I could, but it's always 4 for aarch64.


r~

