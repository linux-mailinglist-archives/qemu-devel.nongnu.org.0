Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 629C550AB06
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 23:55:35 +0200 (CEST)
Received: from localhost ([::1]:58154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhely-0006KP-Ex
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 17:55:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhekb-0005aC-Qv
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:54:10 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:36480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nheka-0000gZ-GL
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:54:09 -0400
Received: by mail-pl1-x62a.google.com with SMTP id q3so6677352plg.3
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 14:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=WjOa9gQpxYm/9MhKmVjBt6xEUSF1n2q0VJrIkcXhJ+M=;
 b=H3l0/HmIXCU8pbD11KWnenw5EN/M2W9DtrdwOJD1t+4KtWdpErnr8+q7zgNNEeJkDE
 L/VNfR9SLMR3oTy5iZbMJDkfzqWNvHfzrBIx9EIveaPQYsBhP9fIEWjY6+/KHiU9hb8b
 mj14ItD/RRcCF9Bt4427o7Km33V+qM11nTLyJJJ6W63od+fTf9Z2g5ABk9lUr/HONbIH
 2jRN3RrDTI0RV5NssavqpD5GLsL9jAzMGZtrdtSf2zDcMEP7IJbGkhZNOLqWMJR5Xkpn
 AZRg0e39PN8D5KGSQj+m/1IGfuuvzyXPu7WCa1HeoVRa0BxOV3NdunJEaAqF5LAJcKQe
 98Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WjOa9gQpxYm/9MhKmVjBt6xEUSF1n2q0VJrIkcXhJ+M=;
 b=w7pUWzMRmfDcaGRkcwlSxh+SCQJSSALIEm4TQEITO5w7qVNGZLS8aVn3tKWAr4IeTP
 hfuTsiYm/GOuswvXF+d8X4yBiL62YVuCmF1rAD8/HVhGAFERoqcIq4rvn7rOkoJpq+Fi
 qucCbgbmO1/1+yeDSyW9I8GHEICUZ7xMpBfPwEpijyz7LOfFsMW8EMkn1+XBdqj16PhK
 ePnTpvku5si6rgtvSRdV3aj9lZI82SEy9X6HG0wI3Pb1POI3+1Xy5pwEnB+wlRJSwhU2
 v7r4KJUTDKFexw0ySQx1Apc0M7nSvOdJVxTpw6PSoEw/11RR7Lf60LTq2WVtGF4qCkgK
 FWTQ==
X-Gm-Message-State: AOAM530jv0uIJgNNyBvTn9U13lMaytHuem9TkSWypnAlXxOPYX4KOo4o
 g/qWmn8M4XfcTrZTrsbEbx/HAQ==
X-Google-Smtp-Source: ABdhPJxbyt6re6q/p8M8J/gVjOiJJzbUzLp93bYcAkPDFwG1voOL5+tCntGPZfJr3ew5r7KeypuRZw==
X-Received: by 2002:a17:90b:3b4b:b0:1d2:e3fe:e1a1 with SMTP id
 ot11-20020a17090b3b4b00b001d2e3fee1a1mr12701592pjb.239.1650578046947; 
 Thu, 21 Apr 2022 14:54:06 -0700 (PDT)
Received: from ?IPV6:2607:fb90:8060:946d:d891:f23c:e53:9d47?
 ([2607:fb90:8060:946d:d891:f23c:e53:9d47])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a056a00181800b0050ad1c98289sm84832pfa.116.2022.04.21.14.54.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 14:54:06 -0700 (PDT)
Message-ID: <252cb944-8047-563c-1c37-41105bf3afd7@linaro.org>
Date: Thu, 21 Apr 2022 14:54:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/6] target/xtensa: use tcg_contatnt_* for numeric literals
Content-Language: en-US
To: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org
References: <20220421213917.368830-1-jcmvbkbc@gmail.com>
 <20220421213917.368830-2-jcmvbkbc@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220421213917.368830-2-jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

On 4/21/22 14:39, Max Filippov wrote:
> Replace tcg_const_* for numeric literals with tcg_constant_*.
> 
> Signed-off-by: Max Filippov<jcmvbkbc@gmail.com>
> ---
>   target/xtensa/translate.c | 28 +++++++++-------------------
>   1 file changed, 9 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

