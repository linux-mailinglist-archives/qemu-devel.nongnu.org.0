Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF114327639
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 03:55:23 +0100 (CET)
Received: from localhost ([::1]:33926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGYiQ-0006ks-PR
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 21:55:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGYgq-00064h-4l
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 21:53:44 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:33878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGYgo-0006e9-DT
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 21:53:43 -0500
Received: by mail-pl1-x632.google.com with SMTP id ba1so8996074plb.1
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 18:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cypz1KHQjt6A+fyjHuZPnoMCU5MzBZVr/w5/EwPioD0=;
 b=VTeKJqD0sMmBStZIzNO0LdubyBABoN8dwyzDlRXBV6ZyjaEeduXoKEo5tUSfZDKinc
 pJVtvGIYWUaYugAz5CxXhP6ZI9ic5YdJ7u940e9HFIfeV7KNknSsHMPToYdCre7yvPou
 x6xiq4V+wHAfxVs+rPBvGZ5tHIrSuvNpo1jy1qP3i7Tih4qzo3SCjKsIc5+3ziD7jyG+
 LRShxNFWKp8JAOktKsa3WR5k1vYwCH1z6p4imOmiar7aFv5+uQDgtuwT+lgZsby89g0i
 AaQLzXZUTfw78N+c7iUK+4ibYzURA9fP73OKMzRg1JgC+Ci81do8FqP2o3r9xIFx8dJa
 KAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cypz1KHQjt6A+fyjHuZPnoMCU5MzBZVr/w5/EwPioD0=;
 b=KgRjtCmVIo5OPN95TuQalBFugXEl7//yazdOm1TVKnfkiX0uFunhFUUPlTm8woV010
 SSpkqKPmIq23BBZcu4V01hmu0zp3T1K0skZiTRiHxMRXOqt2saHHgthAtnLscCZCorM5
 r3T16ObfXjhA2B2gVnQFBi5R04ZyWL8FoaKh1WPj1cXzLA0SEUSMHTmTBWpEwpvsYPCE
 CFxDVKPja/wtrfJZu8lUT1YIcs5Tj0KIcsD1nheQTN845/51vGTPrjqeiNwZ5Zb/rCG/
 ESZ5S7/ZNsfKWmC4nDvxbsM0hwJn6un5hdKNtJOR56BSCzDWwq7Rjr3Pvaq53vkoABc2
 PAag==
X-Gm-Message-State: AOAM530s146lODgR5NX59bMAZ6/rJtz6+kMEicUb43jI44yQS+Ia6bwg
 PO25oN0DbE4cjHJi9KnuJEACBw==
X-Google-Smtp-Source: ABdhPJw4D5Mv9rj0WTxhKWBsaFXeK+s0Nb61NhcLbTPYWw2hkvt9TxYKWvBnm4eqEWLwejE7LnoQig==
X-Received: by 2002:a17:90a:8901:: with SMTP id
 u1mr14916159pjn.21.1614567220782; 
 Sun, 28 Feb 2021 18:53:40 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id r4sm15176063pjl.15.2021.02.28.18.53.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 18:53:40 -0800 (PST)
Subject: Re: [PATCH v2 03/24] hw/arm/mps2-tz: Correct the OSCCLK settings for
 mps2-an505 and mps2-an511
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <07e2a884-fca9-5712-f509-c6a1081f631d@linaro.org>
Date: Sun, 28 Feb 2021 18:53:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 3:51 AM, Peter Maydell wrote:
> We were previously using the default OSCCLK settings, which are
> correct for the older MPS2 boards (mps2-an385, mps2-an386,
> mps2-an500, mps2-an511), but wrong for the mps2-an505 and mps2-511
> implemented in mps2-tz.c.  Now we're setting the values explicitly we
> can fix them to be correct.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/arm/mps2-tz.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


