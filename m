Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F73767ED35
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 19:14:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLTEV-0006nh-DH; Fri, 27 Jan 2023 13:13:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLTEQ-0006lh-De
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 13:13:48 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLTEM-0002ob-Oz
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 13:13:44 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 m7-20020a17090a71c700b0022c0c070f2eso8711701pjs.4
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 10:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5Cgrhjutu/CVyrQcb+HPxgJ+nmDhKxQCbBoLlEfGVHw=;
 b=cHvfrGJrSf/zOq/KZiWsHSZFEITSwHBfPuBe0U3ua6HF+NNDv6Fv1pC+YKvO8NLegm
 dxMl5OU/lfvLh3twemcra2pRrn/Ryf5hrmFnv99vz2Dd7gr+hj4UVqt+g8hGVGyDBw4a
 ofEB1uYN2peCj9dTMVF4/skw0tX9H+skFqH/hIidCWTRftxY1JHTud9cOQjJzU/KZVkQ
 VmUP1DryiFUGaj/W8saA+rEQ2NcYzHAaj7kbzrQJlqfCpXwuH1gscewZUys+3Px37znL
 74uCtYvlTX3wEF0nrYXMX6+4BhWDKRl/D4L4pJsFmVEXXXPrTcHu8myNuJL2FdfU+YMs
 970g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5Cgrhjutu/CVyrQcb+HPxgJ+nmDhKxQCbBoLlEfGVHw=;
 b=kgPBCk28mf9nUFnlOzOm7WcAEitzJXRvaEubp5yRzo4Vb0DsEDKHI6d+P9LzKOL+NF
 PPZkSi+07pCHVe2sMrlkUL7RCa+vEe0tM2XYXk8jmidUcQOq+2n/id37cZmVES6nZb1t
 dFvdbvHOkt8LvT8B6/DLfs15x9K40PMXF2Pr3i74kWTRhNFVeAyYKclfQSHFrRUiG37f
 zfirDCeNeq4LIQzhquBkg7UsJPOTgm3Ff+0lPAdgZ6zOH04d1wxymL90WuBit46UWYC2
 nkg+tVFy5l/BvNsPe4XESFiL4rYSX6YnMZ86NP4YYb8LaCNiGhSPFI1lIpKjQ08Hoz+U
 Pclg==
X-Gm-Message-State: AFqh2kqSPFwOA+TBX98GdmnC2M5p/BWNhtqmlI21XaSPZ3rsRq5UDMZH
 Oo8lPBU5xOw0WIMe3Ah5YcBLnA==
X-Google-Smtp-Source: AMrXdXuzX44sgoKxfKdXc5abwbLdfOtpVAyuEe8Gnz2ArrofNm5chW0Xukf4mzqmPUYwFYZPREbW3g==
X-Received: by 2002:a17:902:7089:b0:194:6414:12db with SMTP id
 z9-20020a170902708900b00194641412dbmr38685140plk.56.1674843221286; 
 Fri, 27 Jan 2023 10:13:41 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 iy15-20020a170903130f00b00186748fe6ccsm3170849plb.214.2023.01.27.10.13.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 10:13:40 -0800 (PST)
Message-ID: <8b675670-838d-0ee2-d57f-2531963b6999@linaro.org>
Date: Fri, 27 Jan 2023 08:13:38 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/5] target/tricore: Fix OPC2_32_RCRW_INSERT translation
Content-Language: en-US
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org
Cc: anton.kochkov@proton.me
References: <20230127120328.2520624-1-kbastian@mail.uni-paderborn.de>
 <20230127120328.2520624-3-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127120328.2520624-3-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 1/27/23 02:03, Bastian Koppelmann wrote:
> we were mixing up the "c" and "d" registers. We used "d" as a
> destination register und "c" as the source. According to the TriCore ISA
> manual 1.6 vol 2 it is the other way round.
> 
> Signed-off-by: Bastian Koppelmann<kbastian@mail.uni-paderborn.de>
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/653
> ---
>   target/tricore/translate.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

