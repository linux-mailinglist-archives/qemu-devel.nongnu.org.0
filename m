Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 086664328BF
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 23:05:42 +0200 (CEST)
Received: from localhost ([::1]:53528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcZpF-0001kv-4c
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 17:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcZm5-0000Lv-QH
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 17:02:26 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:44915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcZm1-0003ZW-GX
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 17:02:25 -0400
Received: by mail-pf1-x42d.google.com with SMTP id v8so11585949pfu.11
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 14:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nepWElV9WX/Tqfi609AqP+9nlIGc7HSZ9neGpbtWYQA=;
 b=kwu7FbrVHeAchBI8XTpJ1jArt3p99o8rOAgQimn5uVJRFujMp75yZZyOe5t54xpNku
 hSal4cPAFXKojSB01PvK+CHu0AGym8SgSLyKg8Cs8QEAl8Z7m8YZ3KlEU5IqrnAdJir9
 oEnVlisFJMTwWjYEqNl05APbktkF66Nx/3rsOLu50dLZzdUxhWlrVvd7HgbQpQVkVSQm
 3HO2SzzP++ULKGx2tlfv/jrDQm67vWRMQz+xWo/mnvXmZ087l737AJ8yHeldbrq/chBG
 Bo5djULIw1f04MT1zk+B+7cG4WFRBBdyEygogNTLBdTcviXDT0bhK3LEEpL5saSvgSkE
 7Xpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nepWElV9WX/Tqfi609AqP+9nlIGc7HSZ9neGpbtWYQA=;
 b=4Fc9Q2Z+YuYkn+pEjw/Opd85b+U4o2EdkMTve9AAyc0xxwNaf5mKxgm4dQvaGtAnwl
 BtbiHgaq4q7Bw1OPMz8OGp4qOgsAnLFDSSb6XnJYNnQVcKgrovyZbEnzQ5hDWw92y+iU
 svTrlaD2dBfuulP75TKIS24VbLeTUuRTgtHsmBeDVTOoszpVpCEcWK1gJ8/oHAK4v3PG
 jERF4+i3BURKjY1E/ZPIiypQ6WfeEKJCAlxUOcpMBPc3ejDU3t8SaJMNvMn425TpXDQS
 sJFixHafhNO9e40l0U5cMbW6jLFlVPXGsAXEcI+l3+vlWC65f8xBzGFbFEdUnK4/3BvH
 IHmA==
X-Gm-Message-State: AOAM531WX40dr0fFRwhFB5879h7eAr7iOzuIYy3XrXz/d8dyd+6EBQhI
 cbS6JMA6KsqG5vdW8VhghmyAXA==
X-Google-Smtp-Source: ABdhPJxcYIgCNFdCKAHTFCI04XSCUjLnXxVqDq78zADj6SYeh7ydpcE4glJdfR94H9RZPOPQrsiGHw==
X-Received: by 2002:a63:1d58:: with SMTP id d24mr25836775pgm.316.1634590939718; 
 Mon, 18 Oct 2021 14:02:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t14sm13756823pga.62.2021.10.18.14.02.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 14:02:19 -0700 (PDT)
Subject: Re: [PATCH 1/2] Hexagon (target/hexagon) more tcg_constant_*
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1634031081-25450-1-git-send-email-tsimpson@quicinc.com>
 <1634031081-25450-2-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <897a7b6d-828a-134f-6b20-b6decbcf0063@linaro.org>
Date: Mon, 18 Oct 2021 14:02:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1634031081-25450-2-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/21 2:31 AM, Taylor Simpson wrote:
> Change additional tcg_const_tl to tcg_constant_tl
> 
> Note that gen_pred_cancal had slot_mask initialized with tcg_const_tl.
> However, it is not constant throughout, so we initialize it with
> tcg_temp_new and replace the first use with the constant value.
> 
> Inspired-by: Richard Henderson<richard.henderson@linaro.org>
> Inspired-by: Philippe Mathieu-Daud<C3><A9><f4bug@amsat.org>
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg.h        |  9 +++------
>   target/hexagon/macros.h         |  7 +++----
>   target/hexagon/translate.c      |  3 +--
>   target/hexagon/gen_tcg_funcs.py | 11 ++---------
>   4 files changed, 9 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

