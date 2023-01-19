Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D438D67437B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 21:24:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIbRR-0005aI-9j; Thu, 19 Jan 2023 15:23:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIbRL-0005Zo-Jm
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 15:23:15 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIbRJ-0005Ps-7r
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 15:23:14 -0500
Received: by mail-pl1-x62b.google.com with SMTP id k18so3388371pll.5
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 12:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JVuMDJdVofjGpB8oWS5bKImgnoVP1TYrTjU9S2MDus4=;
 b=yeWBoPEc2AQPaOI7Pm/8veah3bSR/IcHCRj4cRbEXh70TsSjHJvmN2hY7MhfJTzWl7
 hTzViPsNk6jRzZOgiddyZ27L5t3Ip49bxIgg/4Fs2g0q51d6CMjhxyu3+JFa77rOMm22
 7Q9usxjRcbLQLfGTNLaYH6CTpBNy/6ViHLSjTQXnRVprM++kInC4cjHY6n8hhhXQw4R6
 CaEzo75ENzB4JZumnaDYWtNOTiTH4BlKtTOOtp4dmzNoncyOnWLU+RwtvZwdyPOO/dHX
 D0ErbN74ns3w2AMIr+ybGOZ34+l44WHWNrLeVaPt58J8ZzO1BaXt/HsBJ1IIx3KSVygv
 GGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JVuMDJdVofjGpB8oWS5bKImgnoVP1TYrTjU9S2MDus4=;
 b=biaywop1f2KpKeeXL+1qbIorHcCnD0Hr78zV0dObp7mxl+ckCfiq0EZT7ARte/pPvQ
 3+1hdBqfTfNuLsdWEjQpf/rEKDeQ2jsmKsy7NdBWVdF5I7p/Ye/Lsqc6EamdwEOk5zR3
 IbtI3+VRH+u6tSX5FZbduMtbufdg4jy4WIL8Jm0qNdjNxWFU+6gtN1b7T1fKeBnht3Pw
 Q5yj47LW/+QQEmUrjYArHuN9usrhiz6TE+HbjIX5W8C0xFdzmn1mqErbI2NB7mI7KXMw
 kWKo8ImN465TL1bJa9+0oGa+YhjpE7bXCuPtbQLnSiiOwheIk/1NyunJg3oyPx0bBmWB
 323Q==
X-Gm-Message-State: AFqh2kprUJOqHPTWxDALOAHbVAdYRtUIsfCTqdAnp0VWWKSFfPWUM53e
 co3ow5kdGISxZ2TXneHpIoDS2w==
X-Google-Smtp-Source: AMrXdXsWJI9de8iWQUYaSZXxwqaswELcPSh7dXHYdgdJ7PHNTizP7gd3Sh/tEUuGYtSKXiL1KKQcyw==
X-Received: by 2002:a17:903:40ce:b0:194:d09b:7986 with SMTP id
 t14-20020a17090340ce00b00194d09b7986mr3005254pld.23.1674159791946; 
 Thu, 19 Jan 2023 12:23:11 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 l15-20020a170902f68f00b00188c04258c9sm9250454plg.52.2023.01.19.12.23.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 12:23:11 -0800 (PST)
Message-ID: <a6738525-6d87-b15b-5bdf-4a932c95e024@linaro.org>
Date: Thu, 19 Jan 2023 10:23:08 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/3] tests/qtest/vnc-display-test: Use the 'none' machine
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Laurent Vivier
 <lvivier@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20230119120514.28778-1-philmd@linaro.org>
 <20230119120514.28778-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119120514.28778-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

On 1/19/23 02:05, Philippe Mathieu-Daudé wrote:
> If we don't specify any machine, an architecture default
> might be picked. But some architectures don't provide any
> default, such ARM:
> 
>    $ make check-qtest-aarch64
>    ...
>    19/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/vnc-display-test
>    qemu-system-aarch64: No machine specified, and there is no default
> 
> Since we don't need any particular machine to run this VNC
> test, use the 'none' machine.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   tests/qtest/vnc-display-test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

