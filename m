Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E0F6DF452
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 13:54:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmZ23-0001l1-05; Wed, 12 Apr 2023 07:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmZ0v-0008Ry-Pc
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:51:57 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmZ0s-0004Cf-M0
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:51:49 -0400
Received: by mail-wr1-x432.google.com with SMTP id i3so1280098wrc.4
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 04:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681300292; x=1683892292;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p+t5roRD0VBzwL69wpicdvZbXw5UhpMxUImy4QhiLOs=;
 b=ctz61KFxeVBZuS31M8KbhSUpbJoUbb8XkkBwhoOOFEssoZv8Z3g01W1Q36KLWBerIm
 ltII9yAhmcxBQSfedTbIkFag25vKodWAk/z8+4OO7peJg+Pz2Drhis6yG5+M3ElMFTYI
 r0oimXNWJp/C9Z6lTfrCJaQXmPokZWGFcM4MPjMtvbBodrSh+I4Oem5iXMxN+8QlfW01
 xl0vpD8/Aubi+uAPp4m4Zw8xAwRTBzw9zSpCCOvi6RJdSXEQLxVaIDPqZykW3a+AR1V5
 +TUMikZTWAZgvxtm8fE8k0nm0GoXDQkcib0vvZwAgSuAtJ0oyO9ZIU3IE+AwBnKBRdNo
 e7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681300292; x=1683892292;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p+t5roRD0VBzwL69wpicdvZbXw5UhpMxUImy4QhiLOs=;
 b=bx+dxNx4ud/EUU5dZg1yyf950Neg9WICJm8Gy1cpvJh7MsOwQWj/tuja2v5bVreJTD
 gOihcxa3bvyfX5d/KmsgvPTanPd0vK4XH8GJZxU8QOan2hpvNFGTZPYaKw/2og7NE0j8
 aev0R3UCMjYyu9Zid4AjdmXo30jueRiv324h7U2CFGmwBUDpNgEc+wXMBbeUAkNhDkdp
 sPHwpmBnrJFO+xR5uRgUik6Py5pbIrKW0iJh9OWOuNr3ugxbxNiOmwD+5BLNg7UnTjJC
 oULeO1bj85Xe23Ary0JCZvW71nBfWAWN/F9uAwr2ipDTLSbl5eLsc2gRIyRGU/uULPEM
 yRtA==
X-Gm-Message-State: AAQBX9eAMY3E9GBPs2ZzcI1tOGgVYzoJQUedwMEbdxo/P/F7fZbRRblF
 mcOK3JhdQTTrVC70HLYlK3BiGQ==
X-Google-Smtp-Source: AKy350ZJFYCQ14G6i9AABWXomscUK1ftNdtwiGcUvP3E8bOJrhu8Sk9XhyF7amrrkL6bIYEkju74wQ==
X-Received: by 2002:adf:f909:0:b0:2d2:f3e3:115d with SMTP id
 b9-20020adff909000000b002d2f3e3115dmr12415838wrr.59.1681300292155; 
 Wed, 12 Apr 2023 04:51:32 -0700 (PDT)
Received: from [10.0.2.69] (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 w11-20020a5d680b000000b002da75c5e143sm17024018wru.29.2023.04.12.04.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 04:51:31 -0700 (PDT)
Message-ID: <27494b72-1fe4-6fcb-3f2d-ebf94b53dc22@linaro.org>
Date: Wed, 12 Apr 2023 13:51:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 20/42] tcg/i386: Use TCGType not bool is_64 in
 tcg_out_qemu_{ld, st}
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
 <20230408024314.3357414-22-richard.henderson@linaro.org>
 <24065205-6919-378f-8e97-4754befd49f4@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <24065205-6919-378f-8e97-4754befd49f4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.083,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

On 4/11/23 14:12, Philippe Mathieu-Daudé wrote:
> On 8/4/23 04:42, Richard Henderson wrote:
>> There are several places where we already convert back from
>> bool to type.  Clean things up by using type throughout.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/i386/tcg-target.c.inc | 35 +++++++++++++++++------------------
>>   1 file changed, 17 insertions(+), 18 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 

Thanks, though there is now a v2 patch set which does not contain this patch, or some 
others you have reviewed in the last days.


r~

