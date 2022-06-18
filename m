Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C48C3550234
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jun 2022 04:58:01 +0200 (CEST)
Received: from localhost ([::1]:56318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2Oeu-0006Yu-TI
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 22:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o2Odm-0005sT-Gy
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 22:56:50 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:40578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o2Odk-0003Lr-VC
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 22:56:50 -0400
Received: by mail-pg1-x535.google.com with SMTP id f65so5501811pgc.7
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 19:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6YRn3WN7Q113EcFPVYxX2bkqKahTYddqtk82WT1jPjc=;
 b=dDkSbuCh/G16Eq3qTlTiS1W0+HBG0sGwgHEQBKvBT0G3ExIcM9jAL8sf/4+E6JL2oe
 /LEEOejPhNqRCV7JWK0MH2VDQ6IELLTzg+DgX6Zm44HhIhOwtjKs6EIwCA94ooWpVXsb
 VH+zDf1hxUGuvlolNZwTDOteTDLZd6dQ68f3ecQomZk2FjbRlT9cSm7ADo0a7FT1rMNj
 afj70U52pVOuBbASNbzQBWjFBbt8I+Prs6tya0XNNCPpN65NiDPGm1MyEl3acLVDkj17
 e+P270gx/0V14LLcGVcsQj2Gj0fXPlPOD+12vu5IU7mZQH1h4fdm/8rl4r4IRqqWulZL
 8I0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6YRn3WN7Q113EcFPVYxX2bkqKahTYddqtk82WT1jPjc=;
 b=qb9+hziGPJClstTSglc1fMKWhdNTBsmfxE9EW4epCt7bN87Gb3QjVhErmNgpbpP1cu
 tWKtqiYMYCTN4dHnDS+BAotP7MJHihrClvZLZV3KrLXUMdEpOvnRKe3FwnW4Jb0H6hxM
 uIv3wChL1ZR9uV3QfnketEvXMR+ePYc+87I/fwF2jSVWKbg+enP+LeDaRZsU3S9wsRWq
 nXH9Bbf4viHuWf30HoLYqxemaaO+9SuYSVeUSAwIFMaLmsadiNsVI7VDp/C6Og4HdL5R
 WLpyjSJP7FshUt03J8wY2d8Eiw22FeWfo1E84rudzlLnsdRhlIY1JHh7gV46UCHVZehd
 +Tcg==
X-Gm-Message-State: AJIora+iiLVFR/t7Sqym/vEqNtC/sbfQwgG/yx18pYrl1bbr13Pkvg6O
 rSOsVT/HBOPWVWYFYcYI1V1uww==
X-Google-Smtp-Source: AGRyM1t7gjNoJktLnhw20qrmi4D0LWKBUsY1lqsPDgfvEHDCkLJGMQkIgMqC9fv8tvD92XB8Z8wigA==
X-Received: by 2002:a63:7258:0:b0:40c:7483:969b with SMTP id
 c24-20020a637258000000b0040c7483969bmr1651326pgn.612.1655521007262; 
 Fri, 17 Jun 2022 19:56:47 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:da58:e2:88d1:d15b?
 ([2602:47:d49e:3c01:da58:e2:88d1:d15b])
 by smtp.gmail.com with ESMTPSA id
 ij29-20020a170902ab5d00b0016a0bf0ce2esm1131734plb.92.2022.06.17.19.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 19:56:46 -0700 (PDT)
Message-ID: <563431b9-06b8-9055-fa00-99b041bb19f6@linaro.org>
Date: Fri, 17 Jun 2022 19:56:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v17 11/13] target/loongarch: Adjust functions and
 structure to support user-mode
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220616121611.3316074-1-gaosong@loongson.cn>
 <20220616121611.3316074-12-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220616121611.3316074-12-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/22 05:16, Song Gao wrote:
> Some functions and member of the structure are different with softmmu-mode
> So we need adjust them to support user-mode.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> ---
>   target/loongarch/cpu.c                        | 21 ++++++++++-
>   target/loongarch/cpu.h                        |  6 ++++
>   target/loongarch/helper.h                     |  2 ++
>   .../insn_trans/trans_privileged.c.inc         | 36 +++++++++++++++++++
>   target/loongarch/internals.h                  |  2 ++
>   target/loongarch/op_helper.c                  |  6 ++++
>   6 files changed, 72 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

