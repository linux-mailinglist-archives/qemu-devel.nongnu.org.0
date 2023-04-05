Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D806D8A81
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 00:19:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkBTF-0005UL-Vs; Wed, 05 Apr 2023 18:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkBTE-0005U5-An
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 18:19:12 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkBTC-0000wo-OS
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 18:19:12 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 r7-20020a17090b050700b002404be7920aso36951262pjz.5
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 15:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680733149;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QqqHmo8A6H88zj5+MBdcWfBDJ17VUCNTWlQ+YJzqwNk=;
 b=iciKnnYllRFM/Fj91iy8BqaBJz7IRaI1mgibfNdTSXcpdD+yYBThW9wAvease7DavQ
 P0aVObr8RpWL7fzA9a6w+n9CYMg9qtO8KPTY5TSPzJ6mq1sYlrbLzzgH7YPotXXdMjkx
 8JRPEQQAfbsIbR0i6tJxNQzFqMmEv0wrHxTvys3VHERGBD3niYt2Yqq3Clk6g5lRPbhn
 CDte4Yy6TQpzO35wzFJRL4QlsD+fAptiuSiYESanHdm5OwPtsVVlYL3WAQqmtAnly451
 Jw8ooKcuXjj7wPDddVx8Ey7t8G2t34UPEgXv2ljpqvZWaxQxyXyPVrkK5zx9dNOmcLHc
 6Qjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680733149;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QqqHmo8A6H88zj5+MBdcWfBDJ17VUCNTWlQ+YJzqwNk=;
 b=C65ighkoVE7w9wmvS+4l0Rhl5LZjundwcFzO3pmsQcfMx7IvJuw/BYBuy3+/uy+JaU
 8UdfF+dgWKaIyG18dLRhpt2EETpTBSIvdYTPmPVyUkHGjqLd/Vso10hpuCgm7gglCXiu
 DBXW2rZBN77/I+NL7n4t9i8gIR7SVJg9sENxhMIp6+bS13rH4sOS3+vW362II43+EALA
 76OAZUcfERS5dQgODQt9veb6bKeU89KcenumthaZmB3Y1IydgaO5nObKigBW/5LvGr7m
 4N35cSLh6zs7xM9EvTfZEwgBUJ4sftkDkTOI4PzP0t7cbdKsbFzzGrtaaZziR+0LG+8F
 HgVA==
X-Gm-Message-State: AAQBX9eV0+yO+evCv29pNfoqanFCe9RmOKuGTAVvSk5hF/AiKpSvQlEz
 +LzWI80RkqOav4VzlvrlPrbPrgZz77eSubJOqYo=
X-Google-Smtp-Source: AKy350YASS1jegwR3wvN0AsJVBsnhgNG1eQS/oab9ebCTMBCOb8zim9l7lQBKKPxBTjWilTMqlz73A==
X-Received: by 2002:a05:6a20:4c17:b0:d0:4f09:219a with SMTP id
 fm23-20020a056a204c1700b000d04f09219amr609140pzb.39.1680733149044; 
 Wed, 05 Apr 2023 15:19:09 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:ce11:4532:7f18:7c59?
 ([2602:ae:1541:f901:ce11:4532:7f18:7c59])
 by smtp.gmail.com with ESMTPSA id
 j15-20020aa7928f000000b0058a3d8eab6asm11149051pfa.134.2023.04.05.15.19.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 15:19:08 -0700 (PDT)
Message-ID: <67aff5f7-fa00-097f-89d5-c15e7055d7a6@linaro.org>
Date: Wed, 5 Apr 2023 15:19:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] Hexagon (target/hexagon) Remove redundant/unused macros
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20230405183048.147767-1-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405183048.147767-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.355,
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

On 4/5/23 11:30, Taylor Simpson wrote:
> Remove the following macros (remnants of the old generator design)
>      READ_REG
>      READ_PREG
>      WRITE_RREG
>      WRITE_PREG
> Modify macros that rely on the above
> 
> The following are unused
>      READ_IREG
>      fGET_FIELD
>      fSET_FIELD
>      fREAD_P3
>      fREAD_NPC
>      fWRITE_LC0
>      fWRITE_LC1
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/macros.h | 65 ++++++++++++++---------------------------
>   1 file changed, 22 insertions(+), 43 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

