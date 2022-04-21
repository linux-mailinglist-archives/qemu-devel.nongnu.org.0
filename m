Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3590E50A7D9
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 20:08:53 +0200 (CEST)
Received: from localhost ([::1]:52416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhbEa-00041S-8P
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 14:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhaFL-0002oW-Cm
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:05:36 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:50998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhaFJ-0007EL-Oi
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:05:35 -0400
Received: by mail-pj1-x1035.google.com with SMTP id iq10so1756383pjb.0
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 10:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=s6jTI07p7llQlwOi8V9iwVByOJjJ8UDe4vTIa8xiLQg=;
 b=jF4vtI5J5YkiXQWXcqe5PUPPwr//H8ELn2CDoD1MQsFjdK7bUtmRatbNRPNkf0JDhq
 KYOM7AhBy6H37KsFsq4+ru3uCTvDC/1Xnkn/c4zhHFsiVI0L5mR1zcITLsoRG0HKfXgw
 ggKT/GEeZudzt9Z62xI46YBvjEcuvp1EESOF4gZLe4D+5U6qMefrw74YIqRPXNUU5oSi
 GAhU3x38Sz73FebsaipTfdcSyNfQ+I4ER7wE3wmqQ4Dl3M2iew763g+OvUTaIZRm3c5e
 cTmaKGkKnkjvc66DPwBCOY9cRGatW/UN3Dvkb2wFUNKYXXUvP2zlIyogd2TmA0VkhhdY
 O/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s6jTI07p7llQlwOi8V9iwVByOJjJ8UDe4vTIa8xiLQg=;
 b=G+ySojjEOqPDuegNtbsBWOOwF8mGs9uq45PrCxApWKQDDEMSeHIuO9/C1NzwfkuZhn
 G3aJAGnWkKV8bl4YxGfoauBq5yH1il9F6nFgUo4z89Y/gcXd58tJlTL+5hGwCNvtZG5n
 YEeBpI5/riDwN9Z2IQLOt2VCoUM90C++lIZVmH08PkJPykZPk8jVUNAQzE5ejIKi/I/Z
 9TZrxLpw7FPf/NjYY2dHNvNpmyv05J2SQiaMSPZnb/urLR3gB9UFWmOZyfXdUQmbf+bW
 4UMSfnT2ZuE37oWg5JNXz4EqkNGZEy2HC+2Wlw/z4gPcj5YNF3wz3rkNt17E7f0oJqaG
 toKA==
X-Gm-Message-State: AOAM532Mh1aVviYOatDPCcbFspsGBEHtewymT0R0J4OhzkltObCtEYha
 CUFLP70sxjyG/499Fep2GBx70yPxwTqA+Q==
X-Google-Smtp-Source: ABdhPJwY/GWWYmVIJRQzZHS5Pen8wfkBbJLUO/gjO77TcdDGWCOuqI/e5ao0M8EM39Z5g3G60SoZvA==
X-Received: by 2002:a17:90a:5aa3:b0:1d2:e15a:dfa with SMTP id
 n32-20020a17090a5aa300b001d2e15a0dfamr11540562pji.100.1650560731892; 
 Thu, 21 Apr 2022 10:05:31 -0700 (PDT)
Received: from ?IPV6:2607:fb90:80c1:f8a5:3d1f:84a9:7713:bf09?
 ([2607:fb90:80c1:f8a5:3d1f:84a9:7713:bf09])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a65554e000000b0039db5d2c260sm23922079pgr.69.2022.04.21.10.05.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 10:05:31 -0700 (PDT)
Message-ID: <a4cf2a9c-58be-3964-1425-4ab920c27927@linaro.org>
Date: Thu, 21 Apr 2022 10:05:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/4] target/rx: Track PSW.U in tb->flags
Content-Language: en-US
To: Yoshinori Sato <ysato@users.sourceforge.jp>
References: <20220417165130.695085-1-richard.henderson@linaro.org>
 <87k0blmsfo.wl-ysato@users.sourceforge.jp>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87k0blmsfo.wl-ysato@users.sourceforge.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: i@yvt.jp, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/22 00:40, Yoshinori Sato wrote:
> On Mon, 18 Apr 2022 01:51:26 +0900,
> Richard Henderson wrote:
>>
>> This is a follow up to Kawada-san's patch for the problem
>> of a missed update to the stack pointer in CLRPSW/SETPSW.
>> This fixes the problem without movcond by tracking the
>> current state of PSW.U within the TB.
>>
>>
>> r~
>>
>>
>> Richard Henderson (4):
>>    target/rx: Put tb_flags into DisasContext
>>    target/rx: Store PSW.U in tb->flags
>>    target/rx: Move DISAS_UPDATE check for write to PSW
>>    target/rx: Swap stack pointers on clrpsw/setpsw instruction
>>
>>   target/rx/cpu.h       |  1 +
>>   target/rx/translate.c | 67 +++++++++++++++++++++++--------------------
>>   2 files changed, 37 insertions(+), 31 deletions(-)
>>
>> -- 
>> 2.25.1
>>
> 
> Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> 

Queued to target-rx-next.

r~

