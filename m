Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D37B46D2E69
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 07:41:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piTz3-0001Nl-Vq; Sat, 01 Apr 2023 01:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piTyu-0001Nb-VT
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 01:40:53 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piTys-0004C7-QC
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 01:40:52 -0400
Received: by mail-pl1-x62f.google.com with SMTP id z19so23413581plo.2
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 22:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680327649;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oxzCibOUkxL8nFWtvGXXFgkh4dXgKrv8cSkQ+IRIe+k=;
 b=c63eZYcJjcBUOsJEqvDzCR77lOkNGEgSr1HbJPsKOM+PSC5GTyfgQKDF8NZvAtFdyB
 EyroxgvxNHk/+k5NboL2Mz3cLfR4yYHA7Kpcg1hVb3SvNv90QZTQOScTV1DSFYm58loP
 aXeQwC30aEkIxKgs4GwvjNcM4WyoiATrObtNu10rN7VMNMC7iTaH5/d+dxh7KJZAkIrb
 pH5KwaW3nreqY2XfRVSKs99cF2TGPvBi/sdLJuQELrwmtZFb5JqURKr7q8MjfcsgWiqv
 9mOCTTglS7Skr+Urtxp8BqhTFRGePqIbwclMScUncCS9csKeNbP76AdyYt/vpjc0DQ03
 E7cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680327649;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oxzCibOUkxL8nFWtvGXXFgkh4dXgKrv8cSkQ+IRIe+k=;
 b=xxZppKQPrdQjwmsSe3s1cFnntcSEc1dQQJh3Iwr3zOB+5bFy77GXW1KAYMAcUub7HZ
 8gt0SeN6QSV6RD1eQ8uc/dAiJRUSh8V+5DiwWHDIEeGnnRVC4VuBR8WfT+2qKeAJdTLX
 Zl7qjSJxpqWMxZgh+S9U+NOP8UFngdaP75mDI4+RJ9uExmJg/+5MF4QaGm2/tzrr9wT5
 5OxFBXA9L5fcRUk5ZsSGaHVXN3hW9WHCE36ZyTqYf5Znu+KP3Yjbga8Qri9sxfripaGz
 MFRTNNeft13LHPQpK37HxBTbPOWMZ/ZgWTXg1ruBBxKwBVuuDJzpU+Q0VcUIBHRdGumE
 8/tQ==
X-Gm-Message-State: AAQBX9fSnDf/vCRv4h3davLpkgDuCapu4TDlBtdMw5uEyhS/nnjrP37p
 nsCQsxtw8VSqhn4+ORAXxvnZIDhfGJtcWT08VOs=
X-Google-Smtp-Source: AKy350b6fwiDaqMkiIqEjdXunzDGtsqr5jyuZOJCc/EaGxff1Bhqur+zSE+FTQHraU4mpZl10fGXYQ==
X-Received: by 2002:a17:903:886:b0:1a1:8b54:ab58 with SMTP id
 kt6-20020a170903088600b001a18b54ab58mr24492357plb.19.1680327649291; 
 Fri, 31 Mar 2023 22:40:49 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 67-20020a630646000000b005136181264fsm2498807pgg.34.2023.03.31.22.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 22:40:48 -0700 (PDT)
Message-ID: <caadf55c-4ed1-2249-ae45-b876affd5c38@linaro.org>
Date: Fri, 31 Mar 2023 22:40:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 24/44] target/loongarch: Implement vsllwil vextl
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-25-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-25-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
> - VSLLWIL.{H.B/W.H/D.W};
> - VSLLWIL.{HU.BU/WU.HU/DU.WU};
> - VEXTL.Q.D, VEXTL.QU.DU.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    |  9 +++++
>   target/loongarch/helper.h                   |  9 +++++
>   target/loongarch/insn_trans/trans_lsx.c.inc | 21 +++++++++++
>   target/loongarch/insns.decode               |  9 +++++
>   target/loongarch/lsx_helper.c               | 40 +++++++++++++++++++++
>   5 files changed, 88 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

