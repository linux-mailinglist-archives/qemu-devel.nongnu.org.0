Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F2A418D03
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 01:09:46 +0200 (CEST)
Received: from localhost ([::1]:58920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUdHF-0001eR-6x
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 19:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mUdG8-0008Mo-6M
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 19:08:36 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:42984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mUdG5-0003kc-Um
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 19:08:35 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id a13so10061972qvo.9
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 16:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WFPKgVbRPd6LuBZiMidW9WWN0ZLrrkNW00YLNTCJKsE=;
 b=oV06Wk58172UhmlPrzOp/BnutzG+t4gV/ik1RHEYE62m0poM0zvwH1D/WqMdCcwjgk
 H9A56kyGHsLPCEUCm4V/P7KhZ/xTvcSQchaqRNGnwOy+p3DKqCdf7vVQ1MX1DGn9JHRs
 09fCzg7w+dEq8U8t7Kl2CvZicPCRCLmr4xSrL+6xi7L2lI/1Mp4Iot5fKnT6Jnv62wh0
 IzWNUEuglIFU6MtgVtaUGnp7Aq3Fok04FxlMi+Z/aB8PC1Ktgyc4nyANZ9afetbGd+LS
 lYubKSdPs5Ah0x81rMWALA1+eKjAM7CjBy2Jd4XTei2VxYn4wHZT+mObeB96jwSVUHV+
 5JAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WFPKgVbRPd6LuBZiMidW9WWN0ZLrrkNW00YLNTCJKsE=;
 b=WfmUnfAUm5n9uDDPUA6GGdgipqCEHYlk6zDjw9dJByJNJyziM6OIOJ2NFfPJMgYdiR
 cbxN3/bqcAWB1rQjs0TzmudJCM4GhPHm495cmqpys2Pu2Nv2Xzwciogo0jtmrDw9+eDG
 wSCAx8I68lL0czD2COnzR8SDUO9Jel7d99BRTLoZGuXtLtM1HAXZfDfSe3FKcqcfjl1n
 oAng7SU7ARyyf4Z4t/XWMMKlsNeSxKMv6YkOi/UFStPoxHch49kSOuXKcuotB66Q5htl
 pcsMsnsS2EIXu9dV7372uQne6EVaO2OcGPL+lhgkqRb39at5QXTzyH9kLjSAJVJK9HCJ
 0x4w==
X-Gm-Message-State: AOAM532HYcMKib+joqR1xPBj0HNMI1JLbmfoSvPOVi1G4dFPCo+ICzrx
 31+t2evwoAnCLhPOaMOamHfHMA==
X-Google-Smtp-Source: ABdhPJx/K0rep6NcSI3QK1igrSpIEmh0wEXLyNbrkdKGG3aeJ9R9a4IpiZBTJZhKB0lPv92r5jVPlA==
X-Received: by 2002:a0c:aac2:: with SMTP id g2mr21257398qvb.41.1632697713025; 
 Sun, 26 Sep 2021 16:08:33 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id u12sm9643277qtw.73.2021.09.26.16.08.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 16:08:32 -0700 (PDT)
Subject: Re: [PATCH 1/2] bsd-user: Only process meson rules on BSD host
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210926220103.1721355-1-f4bug@amsat.org>
 <20210926220103.1721355-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e43cf822-c23d-1ddf-398e-71f78ea05b43@linaro.org>
Date: Sun, 26 Sep 2021 19:08:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210926220103.1721355-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2d.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.478,
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/26/21 6:01 PM, Philippe Mathieu-Daudé wrote:
> Reported-by: Warner Losh <imp@bsdimp.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   bsd-user/meson.build | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/bsd-user/meson.build b/bsd-user/meson.build
> index 03695493408..a7607e1c884 100644
> --- a/bsd-user/meson.build
> +++ b/bsd-user/meson.build
> @@ -1,3 +1,7 @@
> +if not config_host.has_key('CONFIG_BSD')
> +  subdir_done()
> +endif

Why here and not in the parent meson.build?


r~

