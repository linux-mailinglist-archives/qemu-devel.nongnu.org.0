Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36865355EF0
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 00:47:30 +0200 (CEST)
Received: from localhost ([::1]:57620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTuTo-0000vI-OX
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 18:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTuSa-0000OO-90
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 18:46:12 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:36765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTuSY-0006bd-Dm
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 18:46:11 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so238462pjh.1
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 15:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YcGn4addl8oz00Mb1R7WDdCX+qJS/EZLrrrAYSnDdc4=;
 b=yLvSvlNEjXWCMJukcJDGErdigpGpqe9xNuA2pZmQUxhY2aYA7+Zd/Hd0XuJ+b7qANo
 4OKjIbLlnu3F1v4q0FzUfbDALPc8qO/rgnXTUFS1waLGYjADiSheQfNbZRIbXfebyebu
 yXQnJ45jz0GiiS7icvBoN5o5LgdXUlx+dYCbrdRon/SBYVb/QZfw0uVadtv9t4hkCCXJ
 HsTGzqj0YNzMxp1FVuoHA9saImLpZr+A/OuOQee7q41F1HMt1lUd+j3oLBWPkCZXlJm7
 Gl3KJq8cLOjq2BmdsdDbbLLMjdmN/QKwg0r9DG8t6vicBMPqEQ3jgcn/wW3TmtoK6gJj
 yp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YcGn4addl8oz00Mb1R7WDdCX+qJS/EZLrrrAYSnDdc4=;
 b=ppDnsqsUmHtMEMbbJ2IpMrgO5/gkS9RdLEudNMWqTNFhbVFXg6GFlCI87FQPO1/S3a
 TEZDAufGCYQVWiwKmwCHsT09Vjd6+PrnFN+xi+vXwCoxsY3AAgTkY+lKH3pMaFWzEO9E
 zmofAx8470ml1ZzWfgXzUF3CabcTGcppXpbCpmLV9qAzKxncPXpC6jxFQqDTKqHVH11g
 itEQh0s0Gat8DfcRCXcEf43u7nYoQMbJ8VgYPBiWmxhNvi8OVv/nmF+0xAZY11quEmQy
 qPyW3uB5pBOh/vbAArfcU9q5GiWp3hU4s6kwiYcRvYLiOCPSDz+HnZtXhU3RgerSwyJ6
 0l7w==
X-Gm-Message-State: AOAM532j0JZSqXI5EDGqlj1VWZzmnty/jQAq5hqLANQO+37x8AC8tQKz
 Oyrl/bIC/3BT278tCXFytfPO1g==
X-Google-Smtp-Source: ABdhPJyjifCsazRmFdomMwBG0X9faSAKqSojdukWG/uH6xSN7ydZFzw54s0/iK/I9Ouk3Eeba5m24Q==
X-Received: by 2002:a17:902:d706:b029:e6:90aa:24e0 with SMTP id
 w6-20020a170902d706b02900e690aa24e0mr449322ply.42.1617749168488; 
 Tue, 06 Apr 2021 15:46:08 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id k27sm17592161pfg.95.2021.04.06.15.46.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 15:46:08 -0700 (PDT)
Subject: Re: [PATCH v2 19/21] Hexagon (target/hexagon) load and unpack bytes
 instructions
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
 <1617249213-22667-20-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2d07f8de-f52d-0af1-a441-86352cb64004@linaro.org>
Date: Tue, 6 Apr 2021 15:46:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617249213-22667-20-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
> Test cases in tests/tcg/hexagon/load_unpack.c
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg.h              | 108 ++++++++
>   target/hexagon/genptr.c               |  13 +
>   target/hexagon/imported/encode_pp.def |   6 +
>   target/hexagon/imported/ldst.idef     |  43 +++
>   target/hexagon/macros.h               |  16 ++
>   tests/tcg/hexagon/Makefile.target     |   1 +
>   tests/tcg/hexagon/load_unpack.c       | 474 ++++++++++++++++++++++++++++++++++
>   7 files changed, 661 insertions(+)
>   create mode 100644 tests/tcg/hexagon/load_unpack.c

A couple more inlines, but,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

