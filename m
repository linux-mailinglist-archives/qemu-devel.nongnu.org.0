Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DDF380F2E
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:44:20 +0200 (CEST)
Received: from localhost ([::1]:46674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbrH-0004CK-3V
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhb96-0006BL-DC
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:58:40 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:39804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhb93-00035f-Gg
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:58:40 -0400
Received: by mail-qt1-x82f.google.com with SMTP id f8so60093qth.6
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 09:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PmDYKICtH4Ujp3wMWVxCuXwCS+IWoxy1wuBQpOUjRxs=;
 b=XWcFnpvpgvQIGl2z2gh6AX2F+Xr8O3mn289OEKMKO7/+n/l7seeE3EmJnhPJbRwMdN
 r8pp/RA+SLyLP/Eh5JHUsWxU0SBjPgsPE/fOWUdn6DoJeOiY6gQj7Z8VGaI5kcDBorch
 Heoi9lN9mZ/vGAI3p/qZD99/3haM1S1soncekS6xoYYVHahrUB/VBAJWvERvTbrHgeMq
 rTkZQZgm+Ro5DATuLTuK5/ag5w4xPEBCUI5SSRRJXBlly+XTxgDguKKFTQP3wwZBdg5/
 nuz+XN+QbV65Kgx4Fam+ac17gCyml7itvBTQsmZGHuuhaPwIPf56Z0qNg/cx5eNebjHj
 QDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PmDYKICtH4Ujp3wMWVxCuXwCS+IWoxy1wuBQpOUjRxs=;
 b=Ujpa1sh1naeypevGcEktRVUHm27ytddxf/4Da5Nbw1/A1jgPZ9dnXWWxl2+ADb7FbJ
 hMrrx2TMCzDHl+u0wmKeOzl22IoCU+eiLwdLRPRelKB3grGOaFZmNaBsx5qVAG7jnQLC
 gkCbcXX1CryCwDZaVqrdmpXXgquTI/6OORxLOHCMUk71n9t/PVTd6q19+foOvzBW2QhM
 mKfm86lkJpzXOJNhtyz0Fmhg+EP//oBScmkV90AUNaantC92FwBe84nvVMEtUgIvRJnQ
 SZNOp4KimD+MDhoOSNhM3OsKlL4e4yFAETE0fdlBt0ePzGCcX4LRn0G5FJbJpxkv2DXo
 vqnQ==
X-Gm-Message-State: AOAM533sTGC1Uy7Qwf9avJIIclQ6dcuGXG/VsTDTXptVXb6wL/2Linna
 7MyFZuxDWcvK334XolrtYlBMsQ==
X-Google-Smtp-Source: ABdhPJw94QNg5nXxZyu628uC5f96nibWEs6Sct8yaifzuMutOwrHBIu+K2Kjddc8h/Dr6XX7kB4yEg==
X-Received: by 2002:ac8:7544:: with SMTP id b4mr10447700qtr.368.1621011516429; 
 Fri, 14 May 2021 09:58:36 -0700 (PDT)
Received: from [192.168.183.76] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id x142sm5103490qkb.136.2021.05.14.09.58.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 09:58:36 -0700 (PDT)
Subject: Re: [PATCH v6 80/82] target/arm: Implement integer matrix multiply
 accumulate
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-81-richard.henderson@linaro.org>
 <CAFEAcA-V+dnrcrnhOLm4ggNajvfKA4CwYLvbML2tXW2mjQJ1mw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aef903d1-ad86-5894-c1f8-71fc90fd92bd@linaro.org>
Date: Fri, 14 May 2021 11:58:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-V+dnrcrnhOLm4ggNajvfKA4CwYLvbML2tXW2mjQJ1mw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/21 2:49 PM, Peter Maydell wrote:
> On Fri, 30 Apr 2021 at 22:36, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This is {S,U,US}MMLA for both AArch64 AdvSIMD and SVE,
>> and V{S,U,US}MMLA.S8 for AArch32 NEON.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/helper.h           |  7 ++++
>>   target/arm/neon-shared.decode |  7 ++++
>>   target/arm/sve.decode         |  6 +++
>>   target/arm/translate-a64.c    | 18 ++++++++
>>   target/arm/translate-neon.c   | 27 ++++++++++++
>>   target/arm/translate-sve.c    | 27 ++++++++++++
>>   target/arm/vec_helper.c       | 77 +++++++++++++++++++++++++++++++++++
>>   7 files changed, 169 insertions(+)
> 
> I have to say the decode parts for SVE and A32 (using decodetree
> were much easier to review than the A64 part...

Indeed, this was painful enough to write that I'm on the verge of converting 
a64 to decodetree as well.


r~

