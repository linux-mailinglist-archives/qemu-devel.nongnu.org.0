Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 108476CCBA5
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 22:53:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phGJG-0006Bd-Ee; Tue, 28 Mar 2023 16:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phGJB-0006BI-1K
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 16:52:45 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phGJ9-0001Q3-HA
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 16:52:44 -0400
Received: by mail-pj1-x1029.google.com with SMTP id q102so12051902pjq.3
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 13:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680036762;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m8RJpFzwCBIp5Ov6nPomDqqE4ROF/CGpvxGV8ipSV1k=;
 b=w1rTWcsKHC2gzM57n5KvAJoP4htiE/6z1x9VW2/3LE0hyh0d7JrJO/CskjIFE5Ty0l
 g5B1WpHHfOLvzLwnSXrHJ0+V4qlG70kqlSvWTnb4JWsSbhnU21nYpNrDVp1pmYuSoKSW
 EivH/KqcqS5Z2Nbz5Zcqqg8GOoOL8YzUrGZ59VkY+y64PULbCegYFIR6Qwq1KFjDhsCV
 u5ervhDfxckQjX8RqkvvK6sunfsWrc/IQ2tLgqm1gqJ1C2ATCBPIHPnoHwHXWrDcNCTX
 pWXYt/nRKagMqAU43K/68j+SAan/ap2G5GPDjI3pSop4jAN5VbMRLBWlnPbDMKYVDMqe
 c/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680036762;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m8RJpFzwCBIp5Ov6nPomDqqE4ROF/CGpvxGV8ipSV1k=;
 b=AmDsj9slrTNyUGrB8o53keVRIW6DboqUq3av1w8I0Ow3lLOyNaMzRZnR8J385k7Ouz
 qrvsHVIE6Ye+Zn6ZZrMc8t/bqgvvkEhlTIeNwQfI7bbixw+kMhAiYnZz52C+T33JT2g+
 UWkg8+YqoN2zmadZ90lX+sSdN6R4yukJUx0GBjrf+QZG3hcRtdwAyBedRCptb+gb6WwG
 aPobwrCHnrxw52lqxRRUk1QyKB7r2jPDuILizXJIXxFdsLCBDIiN84M/oCEkNIcLwUaH
 c+drNPKUWWcIvrM3k82WCBQTqqC0GJeZGKplegi7A1RhrUBkLCEbRgTslcBOePa1FajK
 GRBw==
X-Gm-Message-State: AAQBX9dWxlXHPHzvWt43dKbEFfq6FcJY/umciWFq8US2K20tumzuj8Nv
 6lF3zE78I0iHs6xBEZYslsGlCQ==
X-Google-Smtp-Source: AKy350Y5tr9o92vPXaSOi0eDZsZ/yYAlNNFH52YcjKZTIpPUUgeqRBu0n6VChzLY7y//WlKicj2S6w==
X-Received: by 2002:a17:90b:38d2:b0:23f:3b89:7f16 with SMTP id
 nn18-20020a17090b38d200b0023f3b897f16mr18236287pjb.0.1680036761958; 
 Tue, 28 Mar 2023 13:52:41 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e?
 ([2602:ae:1541:f901:396:9f0d:afc2:978e])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170902ee5100b0019339f3368asm21689908plo.3.2023.03.28.13.52.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 13:52:41 -0700 (PDT)
Message-ID: <9d6028e0-a25c-e955-3c22-152ec176ec3f@linaro.org>
Date: Tue, 28 Mar 2023 13:52:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v2 17/44] target/loongarch: Implement vdiv/vmod
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-18-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-18-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/27/23 20:06, Song Gao wrote:
> This patch includes:
> - VDIV.{B/H/W/D}[U];
> - VMOD.{B/H/W/D}[U].
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    | 17 +++++++++
>   target/loongarch/helper.h                   | 17 +++++++++
>   target/loongarch/insn_trans/trans_lsx.c.inc | 17 +++++++++
>   target/loongarch/insns.decode               | 17 +++++++++
>   target/loongarch/lsx_helper.c               | 38 +++++++++++++++++++++
>   5 files changed, 106 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

