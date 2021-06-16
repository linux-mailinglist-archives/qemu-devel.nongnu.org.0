Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E12C43AA368
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 20:43:42 +0200 (CEST)
Received: from localhost ([::1]:59488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltaVp-00060e-LS
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 14:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaRt-0007uT-0C
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 14:39:37 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:47005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaRq-0002FQ-8P
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 14:39:36 -0400
Received: by mail-pg1-x52e.google.com with SMTP id n12so2688116pgs.13
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 11:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zMaiiccTbtjzTbbliF2o9jvv+qDmqqI6h7RffTLzOSI=;
 b=ejkbfEwdeFFqqwZM020nNEnG4v56T94n5oGDZtCdZZcgJytUyIAp3de/wLwdlQDzS5
 9Upc1GxyNcfoNpQF5boJK7ICothbYPK2t7GnQGRpAKPht9e6fFPRIABf+bjVr2vXwFPB
 v4TsY6sSHgrxfLseqvoiyMPI7LPdyIcd+9+Fp/ZDW47OAkN0nP0gXvhHkX3Yt5AMEIf+
 cFMq+z9GILyegH3WnyrHn9BwhyefDzloLdRPCSUZnq36JXJrYF3Lcff22O5Qddf/omWT
 U6qq8MdLJwRGaaPSc1mFV1xQ2u5S9tha1CS/3g07Lff6niTd4keote+sQwpmv/qrit9k
 hU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zMaiiccTbtjzTbbliF2o9jvv+qDmqqI6h7RffTLzOSI=;
 b=dBPjbxEXs4xXr8x6gB9IdT3Kvth5o4Y2CilWXj0p/rYv/nrtJgenPQ1QCujRCgD6iY
 9wEOx9yLRBTvYC8Xut8BHGixcOhbWWg1yZNJgS+MeEIJoiwL6yofYggF7CgT1HoxCqZ7
 iCMkjsovckcHY258VPdh6k9BZKNnZCNxGk08El5QavtICXEamTSrKClNf9BoBoytLMMV
 h1XBPj74p6Od2CMO7KDDkiCigfV6yXZYP6r8DPGP45+YxnHb7cQt5yzn23ANG3KFY2P6
 YTpq/YwPehjO1AIBEyGt4cUt1J1A9MgjFMfAb2DvBgi1LBkI2RrG/gJ90IoWbP52hwx7
 VQnQ==
X-Gm-Message-State: AOAM530eKgA8Qe1pZ2IqJQMNfRehZmcggPfNTwRkYUixVG06eyTIJT+R
 uNtgwgNU0ae8QBN60xXqhiIMzQmOCEIY5w==
X-Google-Smtp-Source: ABdhPJygTC92i7ELs2KXNOf7wy34yiTjVZCZBMdhwpLB38OGqo1UEqjT0Z3/WrWA9Zr75lOlwuHLeA==
X-Received: by 2002:a65:48c5:: with SMTP id o5mr955708pgs.397.1623868773054;
 Wed, 16 Jun 2021 11:39:33 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 h1sm6047720pji.14.2021.06.16.11.39.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 11:39:32 -0700 (PDT)
Subject: Re: [PATCH v3 03/13] hw/display/sm501: Simplify sm501_i2c_write()
 logic
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f236137f-c067-09b3-8a0f-e05b6cf005d5@linaro.org>
Date: Wed, 16 Jun 2021 11:39:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616161418.2514095-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
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
Cc: Corey Minyard <cminyard@mvista.com>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 9:14 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/display/sm501.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

