Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72F25B58DF
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 12:57:43 +0200 (CEST)
Received: from localhost ([::1]:52062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXh8I-0000j9-PP
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 06:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXh5Q-0005WS-Oo
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 06:54:45 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:42824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXh5P-0003gd-0Z
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 06:54:44 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-127d10b4f19so22226160fac.9
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 03:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=3iHGB0diEqzc4c0cIAHxf52ydX62L4DAWrTzQv1mbe8=;
 b=C7MBf4Z/cHRWGJwTIwdLbTCusVuNqvn3h55T3nP57K5bzEcSSVU+I25tA8kl35b227
 xMotpFA1Ksz52AuSXx4NDVaJG3MGI8opWiRz7rfGdk4jOoSSNwnjkrgk7j/fFaiY95AX
 /NH/kGU/tRKxD+crrioWKONeuk7QWFQ1/GBjaBT9QpICZdz6DWbQ12+Q892u30d/XEFK
 mnVH1L1skN/hyxJYmBNbw0q6D+ax8nDkEE+MokonSJh1sPSQH0rr3LFzb5AMmzkbeSrA
 D6K1P0UzZuRKJyXW5mTEqjf0BqUHP/NdeF48+xgizXKMDmKt8fTkrh98m+nj+oy6xxUJ
 4+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=3iHGB0diEqzc4c0cIAHxf52ydX62L4DAWrTzQv1mbe8=;
 b=nx+4hX6laUwA+xd9wjQt2I82470ZYScsL4JwvVbU0nTZ0BEtrePQ43oyezXxl4xijS
 lQ6lTpLzl0Od9uih901nsFuhCdVDdLWTz6HNsEZ102u2qcO/PoNevgvCt3PsSKQ0ZVSy
 56J41GB+LDVeHL6wQ5ChgTiZFPrR7JVsv8jpXvT3j+s4ps1PEbfF2TQwFzJeW1dm+NWM
 EoVSPYrwesSfZ5oABob3PLavyrBxNlWARw0fG8DRQ2MAgF57rBXAVUPFXswm0fsX5cF2
 ooq4AnJLYz+bdesAV3oQgQG4PhF3Ei2qFrfrtXPaMnwS65wtIOLArrI/ERCTBZs3Zx0M
 Jq2w==
X-Gm-Message-State: ACgBeo0kZUr04gOxPAequ9bkcQnpglwmieMfsJKAhW657AvuUIbUyI8W
 DdJqcIOsnodL8q6Z9IdaE2GFrQ==
X-Google-Smtp-Source: AA6agR5j9NPMf+rwaA0dDbPlTjn6bfZDh9QzQ+CPywCuwSEnn5HrjGR+V6oJoX9kDgyTo4tcJRQ/+Q==
X-Received: by 2002:a05:6870:7a7:b0:fb:d45:62f with SMTP id
 en39-20020a05687007a700b000fb0d45062fmr10763406oab.170.1662980080200; 
 Mon, 12 Sep 2022 03:54:40 -0700 (PDT)
Received: from [192.168.44.231] ([172.102.14.47])
 by smtp.gmail.com with ESMTPSA id
 3-20020aca0703000000b00342df642fd3sm3698012oih.48.2022.09.12.03.54.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 03:54:39 -0700 (PDT)
Message-ID: <aed50ac6-82ff-4052-4ab1-56ab98e261da@linaro.org>
Date: Mon, 12 Sep 2022 11:54:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 05/37] target/i386: add core of new i386 decoder
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-6-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-6-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.101,
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

On 9/12/22 00:03, Paolo Bonzini wrote:
> +/* five rows for no prefix, 66, F3, F2, 66+F2  */
> +static X86OpEntry opcodes_0F38_F0toFF[16][5] = {

const.


r~

