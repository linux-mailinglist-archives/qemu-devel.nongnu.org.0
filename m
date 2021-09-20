Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5FE412961
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 01:23:06 +0200 (CEST)
Received: from localhost ([::1]:50514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSScr-0004lI-5p
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 19:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSaR-0002fN-CV
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:20:35 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:43917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSaP-00084p-SN
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:20:35 -0400
Received: by mail-pg1-x52c.google.com with SMTP id r2so18926503pgl.10
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 16:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=boTgFHd2YeacQjsYM97MOMD1qCiVXmxIRnBtiXUCRdI=;
 b=TzwhLKMinsCM/QBdCTO/TWEZgxT3ad+D+96RyLjbclWHvLynL2VEBpVJv4N/SVNLPc
 OqaKVhHIkeoc3miEunOeRi7comsEdyaRnKAdSXfQx9ysz3nkDyCeNUWczbqjK5pnvaYc
 c8Bs3oMcH34JKDwLNu3gc/csKkovsIDvJHaizQmTssRMliGMRKYaqsrdy1IC+Wo+MUFH
 pwz5795qKxLSkWdU0ak6xS0d4TCi5Efdj+KUl0/k4PW07k7+3VTRedb3vMAeeU6jUbm7
 WqeqquIwXX07jm1ymI0UkS/NMzbViUOYu4yLW5n29Afy7aMwZ5LFgbePxPnH7fHrKCJl
 zi6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=boTgFHd2YeacQjsYM97MOMD1qCiVXmxIRnBtiXUCRdI=;
 b=UTzRGIAZTOlX4Vwv5+cbFAZUmupPvYRo0hDGke1Ow9NiIMXa5XSKSLs90305g6ERtC
 1Pk24PZ46hZiv9Z2Vz5BFYmD9jqHKxUVGUE3CeUZdxPAtme4oXprSQx93ExVbf8xU79X
 aNhEFZfDYvyP9HJX90Ni4JouH2WNnofET4+KZ2B003B2kTUTEmpHO1rVPzpCaf3mD04q
 ViK5Rmc6/KNOBr8MfN17atiqmyGhZbiXzUog9bdrzB65cmJ5IB+VdcUjJ/tPhHhXLmHQ
 /nUig99Mhxk71gcozZyfjFbgamSQ94yoDRQ7UfBjBTk2m3QgnGuidJur8O3uaCtjLWg8
 S80Q==
X-Gm-Message-State: AOAM530BF7how9jA2ih+dAKhsSog60x+fpHFvlzlCrh2yC71MKY1UULa
 vi9q/06syFM61LplSC+G8DLA3Q==
X-Google-Smtp-Source: ABdhPJxOX9mJe7FXYf74ZrwuDMrYZHgdR8tGFnGFURqrJjSHH3yuvMp1LsdJK+QRfrKeOwfXablkBA==
X-Received: by 2002:a63:4a18:: with SMTP id x24mr25378492pga.209.1632180032627; 
 Mon, 20 Sep 2021 16:20:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm430576pjb.39.2021.09.20.16.20.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 16:20:32 -0700 (PDT)
Subject: Re: [PATCH v3 18/30] Hexagon HVX (target/hexagon) helper overrides -
 vector max/min
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1632173065-18522-1-git-send-email-tsimpson@quicinc.com>
 <1632173065-18522-19-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <191102cf-8447-6b4d-5940-d58e565a9432@linaro.org>
Date: Mon, 20 Sep 2021 16:20:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1632173065-18522-19-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

On 9/20/21 2:24 PM, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg_hvx.h | 34 ++++++++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

