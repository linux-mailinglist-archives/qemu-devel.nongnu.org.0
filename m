Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF45349461
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 15:43:36 +0100 (CET)
Received: from localhost ([::1]:48582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPRCx-0005KN-8A
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 10:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPRCB-0004qq-DP
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:42:47 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:37578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPRCA-0001Lk-1R
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:42:47 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 t23-20020a0568301e37b02901b65ab30024so2143121otr.4
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 07:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VIJRDx/J9AXAk8I9/VGAO9rc7rkB2I0YPtlQqQCNuvs=;
 b=rHR4KgjTwlmiH0M4b6guPEnUT+Zs2q6Nz5gU0HxZ31LYKIr8OZ81FHL5m7TE+zQXsw
 8rnVyLLDvcgkEbLKgBvacuYUbiYTll2w8o75dYpam0hOydDuux3EtJ/NEfwTnbF9ZK9l
 CjJfBbJOzoj2Zqkp7tW855dYKftyVzv2lLXAlYM2oKAPclmbs05aPc7lMCrXUUEw2cNc
 PZub5LKFup8NrEUYpGujEdxGSSqsONn6rLpv/fqa9oQx7aKDQ3PAvfb7z0c+C2kmg80o
 vlnT45WYbcjCEpwD3NzbxdJMOf/pvuDvH9CUdIXpKxDOEulHxnyjk58xLN6H2zBT5Abl
 zF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VIJRDx/J9AXAk8I9/VGAO9rc7rkB2I0YPtlQqQCNuvs=;
 b=nn/y6cQwO0g2Pt3LtWC0uMfhliiGf6TdiclkV0ErfEUKmHDi+5C7whU6J7zolS6i8S
 +PVe9mXO2Vjk2xF0Jv6T+CX4k2EwVlGNgLqGsQTEvZW2ksR9TahiJeOnUlGrcrxr51VH
 IL8hxU756fHCBgCh4fdPT0d2g5pdJEerlwf4IXE6aslNfwNXepnyD9SngIj5hyxhAFri
 L68PLLO7k5WWkAXomNw/6ju15YXMdYzRGAPRvfNVbig2glq3/XMKV6RLhvERBfZu0TZb
 VFZoUXxqQHM34PcQ55CDplsgUnoV9jcU9qyunHVTN3CxCYv9i3Zhc+iaF+l4tDhtCWM6
 cGSw==
X-Gm-Message-State: AOAM530zLOF8fD2dHemz09vXVOfjBTIkthHmPofVS/sQ88Ckg63CLflv
 6z/jmcoao75RA3nLAJq1NkW9yQ==
X-Google-Smtp-Source: ABdhPJwFdxWW2nMmG0eFFSSPZL+UlfP9cr2HqLlccVBYFGt7wJLeiXaCB50haU6LtWkuM0urAIe5aA==
X-Received: by 2002:a9d:8b4:: with SMTP id 49mr6897238otf.216.1616683364237;
 Thu, 25 Mar 2021 07:42:44 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id d206sm1138494oib.56.2021.03.25.07.42.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 07:42:43 -0700 (PDT)
Subject: Re: [PATCH 04/15] Hexagon (target/hexagon) decide if pred has been
 written at TCG gen time
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
 <1616640610-17319-5-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3070fe5c-fcca-c674-f47e-f5424ce5e72f@linaro.org>
Date: Thu, 25 Mar 2021 08:42:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1616640610-17319-5-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 3/24/21 8:49 PM, Taylor Simpson wrote:
> Multiple writes to the same preg are and'ed together.  Rather than
> generating a runtime check, we can determine at TCG generation time
> if the predicate has previously been written in the packet.
> 
> Test added to tests/tcg/hexagon/misc.c
> 
> Address feedback from Richard Henderson<richard.henderson@linaro.org>
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg_funcs.py |  2 +-
>   target/hexagon/genptr.c         | 22 +++++++++++++++-------
>   target/hexagon/translate.c      |  9 +++++++--
>   target/hexagon/translate.h      |  2 ++
>   tests/tcg/hexagon/misc.c        | 19 +++++++++++++++++++
>   5 files changed, 44 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

