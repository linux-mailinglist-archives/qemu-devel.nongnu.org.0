Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B569C2CA63A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 15:52:13 +0100 (CET)
Received: from localhost ([::1]:46468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk70m-0004m7-I0
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 09:52:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk6yR-0003cp-Ij
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 09:49:47 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:35131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk6yQ-0001KX-3Q
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 09:49:47 -0500
Received: by mail-ot1-x343.google.com with SMTP id t18so1870752otk.2
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 06:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ZfI39b/MhHgruLj54W4f8gxdfNCOgpb/s2TAouOGLbA=;
 b=ynkfsoMCJ3fFNQkFlL2pvjkOeBNpazOKzXZdvzyI/55wsBVLtSYuS0a/5O3dL5zwGZ
 y89W3Q1pGon5i3HIOrz+v9Qq0Pp2Ni8x99nB2lvarcR6hxFvNbrZsA+pp43Mix/tRj+y
 vbKGiqP/Iqye1R/aopfqFN8WOnPg0xQSdRvpkW28vgB76a7NlnZioPMpYNpuoAxSE7IT
 eL/OKCavaH5U6cfJLEzotYZa6GJl3SxaHUpixisG3WkR7r6GIMJtfLEwKGgruEygdTag
 +ooQXRrnPXhhgknxK0h/4mrP9NohCxp9vipHFD6r2GaIco57TdNP03UBQ6P/bOKAgB8E
 HsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZfI39b/MhHgruLj54W4f8gxdfNCOgpb/s2TAouOGLbA=;
 b=Yo03PygjyS8kv92G7/YU0FVkQlvk/PMzOv8b5b3tRziOCzGsqRfKre3+Z3vs+qiE7m
 P42vddQmwjf5LiGZNOXttUAtm9zqNoK5euZBK4c/1NRn1FtP97OOKYx0L/25G0C3V18I
 FewciuyS/9RXtd0K7yU85++oNloYXmYDxDU2c4t6sF+l+Gb2LdlQ6hnYcWgrbcBXX1bN
 cooyo1bIMm7nzusP+II90QIX77B9VH3FM4YTiAp6nFdiUKDhHvk1rC5wpBcBlfZm5gWT
 zw3JpUrCjTA+3ABQEtMEwIUIuWImUHRTIFz4GXTh2cxI2fPYLNqVM1oelBGJ8gnoE5LI
 dqYA==
X-Gm-Message-State: AOAM532pVByggZ1xMRaH0wG1X0IP+1YeyyPiMAkH8rE5sK6kqsLE4225
 tAe4Kdsy5HB2CTDFHT2snlFaL0/ihXhcKgZq
X-Google-Smtp-Source: ABdhPJyMoFlJcpUqA6h8ARJCuV2ezY2awl9OofIOzZFtHXaZzbfJS3c02jLuDMfGLMjo1MC6WM9S1w==
X-Received: by 2002:a9d:6847:: with SMTP id c7mr2008470oto.134.1606834184751; 
 Tue, 01 Dec 2020 06:49:44 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id a20sm419583otp.54.2020.12.01.06.49.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 06:49:44 -0800 (PST)
Subject: Re: [PATCH v2 19/28] target/arm: Implement new v8.1M NOCP check for
 exception return
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <57cfda82-0807-05c2-7b7a-56140becc0e5@linaro.org>
Date: Tue, 1 Dec 2020 08:49:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x343.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/20 3:56 PM, Peter Maydell wrote:
> In v8.1M a new exception return check is added which may cause a NOCP
> UsageFault (see rule R_XLTP): before we clear s0..s15 and the FPSCR
> we must check whether access to CP10 from the Security state of the
> returning exception is disabled; if it is then we must take a fault.
> 
> (Note that for our implementation CPPWR is always RAZ/WI and so can
> never cause CP10 accesses to fail.)
> 
> The other v8.1M change to this register-clearing code is that if MVE
> is implemented VPR must also be cleared, so add a TODO comment to
> that effect.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/m_helper.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


