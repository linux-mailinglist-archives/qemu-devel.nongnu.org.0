Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8356E3A1DD1
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 21:44:07 +0200 (CEST)
Received: from localhost ([::1]:60742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr47S-0001Hg-KZ
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 15:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr46X-0000Q3-AR
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 15:43:09 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:34581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr46V-0004VA-Ct
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 15:43:09 -0400
Received: by mail-pf1-x435.google.com with SMTP id g6so19327747pfq.1
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 12:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ZZkThZKG7Pw2qTggayKugxE4qKXM96GOTMZoOCt/+aE=;
 b=XnByP3R2XQ4BQdeaBI5xe0EbxW24HO1NpErk34/gbEQWVJNJ/L6CgP2k2+3U4riy9G
 4zNBV0kHIDCqBRNjgWavsDa+rou7W4ksnV+aPekvIgOXa+iFFB41q75bCLVKMfXuKgY0
 BxaLXzKigayF6TspBfSYVJ1jLJCrfben/lMRVepk/RFsvlGFe91mC6RUbx8Rkjgm5MJS
 Ab6gx13FbT1EQfIl6vR5l4w1cY7h3Ryo27jK1wdDi5jAv6VmiAu8Y12aToiRoCwPXNTQ
 K3/9ZwX6sf42sLZPlYRCzRzlDn9rz56nlYdrCIaoOjrS4Kdir0M4zzoWQPfedVoLq1rn
 fc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZZkThZKG7Pw2qTggayKugxE4qKXM96GOTMZoOCt/+aE=;
 b=mr2FvKLBrkXrWidqRPZhdL5Gmj2THHNCHW4AK/y6OReFA2jjogk29ltm0ngRkQQpsE
 UByMaWmuddXKw7cip3RJjc4eO5p+88+VC+V5XPH1/2kZtrByn7bSs5u9ILR+jRt8fAej
 3pca6+g7DugcObYfUPBHeoYhkafpmnvBGS/Ip45ZYSsUy88ecUsaER+dxVyOzV9pZCS3
 nIZMowf/t0HgS/EpagkqKBrETCxsOFwd0RZheMOkSw0Vr0UH9LDB2E71obZB8t/KI15E
 HsqFOZkVxH5dtbHozfHekpnhjOrRFSXcnpXoRSqGkYG9waHsr2MPFzOXedjQCNu0IBqa
 Kp3Q==
X-Gm-Message-State: AOAM533SCuDLiA0UOoTttEQVclnN6WpfKaSqNZ6EFaXJtzaWZDoWIhVr
 rfUP5JlphPaj02f0MqC6urgEHHk5JFSHJw==
X-Google-Smtp-Source: ABdhPJy19pwA3TlxQRngArUcQWw5Y7a3RB0mB6Q2zHJ4/Yc1HgpiVA2GohIzbaAxOd8V774OKpmE3w==
X-Received: by 2002:a63:2dc2:: with SMTP id t185mr1259508pgt.285.1623267784882; 
 Wed, 09 Jun 2021 12:43:04 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 a65sm324677pfb.177.2021.06.09.12.43.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 12:43:04 -0700 (PDT)
Subject: Re: [PATCH 46/55] target/arm: Implement MVE VRSHL
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-47-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <19c37642-13c4-117e-02f5-02342a0f6eaa@linaro.org>
Date: Wed, 9 Jun 2021 12:43:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-47-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:58 AM, Peter Maydell wrote:
> Implement the MVE VRSHL insn (vector form).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  8 ++++++++
>   target/arm/mve.decode      |  3 +++
>   target/arm/mve_helper.c    | 36 ++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c |  2 ++
>   4 files changed, 49 insertions(+)

Similarly use vec_internal.h.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

