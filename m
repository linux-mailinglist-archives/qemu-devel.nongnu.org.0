Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E766D5208
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 22:15:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjQYn-0004cv-L2; Mon, 03 Apr 2023 16:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjQYm-0004cT-A9
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 16:13:48 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjQYj-0006hG-JE
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 16:13:46 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 h12-20020a17090aea8c00b0023d1311fab3so31755475pjz.1
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 13:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680552824;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yumJUo4J+0QlLXxMg8/iltXig5wg5/zYVyQvDjXEfGs=;
 b=ooHq35Rc/FA8FvQUHFoZpo1CWejK8ENX6J05FbzG4iK3mXiN9/Xt/26yQWp1joz8kG
 6iJFSSvXkOrQV9Wtz6O7t/j74D3doEdokjVwz7pvwuGOcxnPxie3PIKYm5xPSYCY8VpL
 4DuuHM5P5KBrovLkD0OeA3zwQDXGsUvY22+otHudOfw6S5GlzzlOxMasxKUUmlb8wiTw
 ygHGovdJmm1o3X06VHITrShhKT/DwX8kbj6XQz+z92lIynD97E10B+20a8oVXCR9OSnO
 TaLt4yGgCUFEfU4xUM2IXbLH7E7kEPdX2/4fB6lfUxFfkoyuoB6Q+QDMmsp52ZfdI2Ws
 U/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680552824;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yumJUo4J+0QlLXxMg8/iltXig5wg5/zYVyQvDjXEfGs=;
 b=Jk15PEXLhxK4cWlnXI8nU/kcaDsFASPRbMtUS5q8K1W/CoR1krFx+hntTalVkBKD9n
 9RFFfOVMYVrCiT4kQnbsd2htSrTaVHAW+QdseKpt5l1/1maYFAAyCQSfZJtklKDf/leJ
 d1bGZhBknPkiP5zBozboC94mStTNhXoST4enTeBkyeDfzjzcuRLjMlK44ajaiymxsFjn
 /QCmL7xmCzg0WFM9tpBq0fzJ3u/mQGTkUuZtxaCNZVvuCWL/moyaX4yb2q+sOVgwg2zm
 kgUL0GI5AzkfNhme7NWpW1zzyRZBI54dyFRwEb0mN8t6oFWlTEMvRddNfmopu47dLCSn
 +P7A==
X-Gm-Message-State: AAQBX9eL0ubxTucGzOq/mYombkNPEDNGOGDYmDoW52vqw+ZXL0NlrzNf
 JcVKAMipsVAjqbwW7IxUwkeu6rYcx0YptaiYxGg=
X-Google-Smtp-Source: AKy350bkAlTodgKEYn8c0EfuLaKH0BTCmNzNgStxKodwDCtVQfSZBcyFfNiCBxTZODksV/vGLL4hpg==
X-Received: by 2002:a17:903:22c1:b0:1a0:42c0:b2a5 with SMTP id
 y1-20020a17090322c100b001a042c0b2a5mr330585plg.24.1680552823948; 
 Mon, 03 Apr 2023 13:13:43 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:c7ce:2c40:3ee4:21c4?
 ([2602:ae:1541:f901:c7ce:2c40:3ee4:21c4])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a170902e98300b0019cc3d0e1basm6966436plb.112.2023.04.03.13.13.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 13:13:43 -0700 (PDT)
Message-ID: <ed0c6b91-a9ea-1578-e244-c87cf8c918c4@linaro.org>
Date: Mon, 3 Apr 2023 13:13:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 18/44] target/loongarch: Implement vsat
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-19-gaosong@loongson.cn>
 <c30ab882-1b50-7325-87bb-fd273e479e51@linaro.org>
 <8d077ca4-9f49-6a38-744e-0a7878df26c9@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <8d077ca4-9f49-6a38-744e-0a7878df26c9@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.349,
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

On 4/3/23 05:55, gaosong wrote:
> Hi, Richard
> 
> 在 2023/4/1 下午1:03, Richard Henderson 写道:
>> On 3/27/23 20:06, Song Gao wrote:
>>> +static void gen_vsat_s(unsigned vece, TCGv_vec t, TCGv_vec a, int64_t imm)
>>> +{
>>> +    TCGv_vec t1;
>>> +    int64_t max  = (1l << imm) - 1;
>>
>> This needed 1ull, but better to just use
>>
>>     max = MAKE_64BIT_MASK(0, imm - 1); 
> For the signed  version use ll?
> I think use MAKE_64BIT_MASK(0, imm -1 )  for the signed version is not suitable.

int64_t max = MAKE_64BIT_MASK(0, imm);
int64_t min = ~max // or -1 - max



