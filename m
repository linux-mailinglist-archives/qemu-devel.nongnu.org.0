Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C5E6742E3
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 20:33:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIaes-0001e6-LV; Thu, 19 Jan 2023 14:33:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIaeo-0001cH-Gf
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:33:06 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIaen-0002dW-0e
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:33:06 -0500
Received: by mail-pl1-x630.google.com with SMTP id g23so3226290plq.12
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 11:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=41qtdYYie3EWz7dMm4FELsIloNmYeXq5rclko5ciTEY=;
 b=S/6c3PRfZ5XfxgqRGntRVvjbhmsKpBejnG5Ax0kh3WRqVgZdod2ppth4kVWAvgartc
 /KUQ/Fb7BH9sdRkG1kwvgkHWxJI4zUAZ6eN4/QjjSceVXJVoDUa6lQpLSTZ3Z7++QksE
 oEuARHt1IOZ3r/s3LqXzeaCXmRszyckjqyGGHcmlI91L1mQQcfpBVkAkVO9UqTc+U419
 bIf3PixcXfmFF6JHaadObR8xaliCrVwXvkJxf3nJDq2yms8lPrpIFJr7liBjcLCHZXxn
 Izjd2QcHHfyTi/7RkhDN4IqrkZjjgCZ7olBxd9T00fXdgge5noKgGE6y4qbai0DFyPiN
 QnMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=41qtdYYie3EWz7dMm4FELsIloNmYeXq5rclko5ciTEY=;
 b=TQsfC4qx8wj6x+Q/56XucWR3ISfMy9xGxhAb+PpCYgrkSNCPymshge3z0+rbzJKguM
 IF/NGclHPub5wXQy7cRIRXwY+aNJln2ylOu+UhzOV0G38o+F7I4EaASyLxwXpewECDtC
 AipDiUfTHFge9ytCML9Ip+o8+zQg8SI0JBNiqH5pTMkIbPS2RJGpVxtmDCJA0VLumRe8
 5zdHAB1Eo86l97tPRwlv68y2Dl+AtI0sHStSZzFKig4gAdXfR0XBt+q49zHB1kfKo9ez
 6GEKSUhLXW1o8P5C+xFp+SjgbfgSGqpn/WCBymlYY4WILoO97KcBL3+zhyGbkmUDKNGr
 PT1Q==
X-Gm-Message-State: AFqh2kqp8WvVXCKgogcm9/397+15D2FJ86lo4lyUJx0B2v3+UJiKOOJN
 b1gd/TK6WiotoxP14YSxRt74dQ==
X-Google-Smtp-Source: AMrXdXtPWjLI6ygZe00MCrFyp0RWa7jf2MG6/sVDnuY/p4jdbwkJeJJb5QurkKzRA1o1rW4XklcZpw==
X-Received: by 2002:a17:903:100c:b0:194:85db:e20d with SMTP id
 a12-20020a170903100c00b0019485dbe20dmr11586931plb.38.1674156783417; 
 Thu, 19 Jan 2023 11:33:03 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 21-20020a170902c11500b001869b988d93sm18653782pli.187.2023.01.19.11.33.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 11:33:02 -0800 (PST)
Message-ID: <2e9e9182-e60c-51be-f610-b933d7950dab@linaro.org>
Date: Thu, 19 Jan 2023 09:33:00 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 15/18] tests/tcg: skip the vma-pthread test on CI
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230119180419.30304-1-alex.bennee@linaro.org>
 <20230119180419.30304-16-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119180419.30304-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 1/19/23 08:04, Alex Bennée wrote:
> We are getting a lot of failures that are not related to changes so
> this could be a flaky test.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: Richard Henderson<richard.henderson@linaro.org>
> ---
>   tests/tcg/multiarch/Makefile.target | 9 +++++++++
>   1 file changed, 9 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

