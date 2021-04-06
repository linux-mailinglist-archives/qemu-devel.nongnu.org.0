Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E81CD355F1A
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 00:52:08 +0200 (CEST)
Received: from localhost ([::1]:60930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTuYK-0002WP-0n
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 18:52:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTuX8-0001lw-JY
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 18:50:56 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:34444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTuX6-0000L9-6E
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 18:50:54 -0400
Received: by mail-pl1-x62e.google.com with SMTP id a6so5017468pls.1
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 15:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E5gwc9nvKzWz+H9f/HYxZ21jPYFGymmFeI7nmnwRU+Q=;
 b=BjRrc7HXTz5Gr7/H6YUy/7A0NfFEXSHVUtgPUS8gUaxaStQdXZFyY+NcAqBTm6ezdT
 FzC777baHuWO+nlSN+y0Cv9teRflFPUfra4ub/zLS2H5+zKOjRkiQ7tpfJSkwON90WNe
 Kan4f1rJok2O4qXgUdFz56r1iLygQJQCPrw69L1bUwJk4qEQY7HBZ4UB73zhOrhMfqAK
 e7v3yngf2ut4ccIbz7LSN1dYAnG+E5ZSyQruYAJeFC9553yGLfLtYbfPbuLe72yI6O+l
 Oi8S49ZJooFFmILUj771P7mM74+hmW+/+v7E6/2SosQfVj8k4JnxHKw53y/iNaZGg0Es
 9dFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E5gwc9nvKzWz+H9f/HYxZ21jPYFGymmFeI7nmnwRU+Q=;
 b=qRVmcK8clJJeUyCGrDmPMMQfA8Y2S1cUjjBqtxu7/NbWOgiR6JnjJweauDQ/I3NyQK
 UrLaydCmlZO7QZ1Tw8Qro28YwtZ8lxMa9ArU4SqPUUZGQriKk1pVENkHgoNl9X0+PPf8
 WB9I2XD9UjJ21wv4RclaIEoO84R3OXSviDLzkJhKmVO2iuAoF3SYFx0j3XxieNm2rBo2
 bAYc8SCIWR6RTElu643Qgdw5vL0uI3BiFEelk3xxXYvdS/mtJkEaOYytWS1UkbtJbuCc
 0Yltn/gnE/mKUb8lRnjFeD5IWVKkzAWvG/+9VRNy0pNOPCxSjI6vgPBZRjr9lKFlLNFp
 8Buw==
X-Gm-Message-State: AOAM532Li7hAIDBXUWjrQWr/MCGJCXljkud8/9M3Fqrj4Lx/uaGqAwTN
 e8LBP7Y/YDOWk50HsVPKloI0Sg==
X-Google-Smtp-Source: ABdhPJyooQ+WkAT84dK87+GpAl+dunPI/Nor0RP+OwIATxLx4YQmNFylf7TB9lBrAYvpYPijhkq/2w==
X-Received: by 2002:a17:902:b117:b029:e6:81ed:8044 with SMTP id
 q23-20020a170902b117b02900e681ed8044mr313297plr.13.1617749450747; 
 Tue, 06 Apr 2021 15:50:50 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id n16sm19491671pff.119.2021.04.06.15.50.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 15:50:50 -0700 (PDT)
Subject: Re: [PATCH v2 20/21] Hexagon (target/hexagon) load into shifted
 register instructions
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
 <1617249213-22667-21-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cb40918a-7b3e-282c-866e-5e6bd90d1847@linaro.org>
Date: Tue, 6 Apr 2021 15:50:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617249213-22667-21-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/21 8:53 PM, Taylor Simpson wrote:
> Test cases in tests/tcg/hexagon/load_align.c
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg.h              |  66 ++++++
>   target/hexagon/imported/encode_pp.def |   3 +
>   target/hexagon/imported/ldst.idef     |  19 ++
>   tests/tcg/hexagon/Makefile.target     |   1 +
>   tests/tcg/hexagon/load_align.c        | 415 ++++++++++++++++++++++++++++++++++
>   5 files changed, 504 insertions(+)
>   create mode 100644 tests/tcg/hexagon/load_align.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

