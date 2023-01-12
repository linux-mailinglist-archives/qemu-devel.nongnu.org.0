Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1106670BE
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 12:18:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFv11-0003dh-7d; Thu, 12 Jan 2023 05:40:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFv0r-0003Vw-Ap
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:40:53 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFv0p-0003bt-Ot
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:40:49 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so16259373wmb.2
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 02:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m67ugAdbKYSNSav5w5qEXHd4/zuos+D88hv2WZ39E0w=;
 b=S5YVQ6MlvYxxRCNvISX+coopCM1yDlIioYHklUOVfH1/+Sl0IMRwc7LFZps1SWTIyp
 tPZEGG6khE+Oj+Xm3610WHO/WCCj00TBZoYF7TvayAZyTfL6hKtWi1ZMQvlQMWXADIov
 riQ5SdIgxOdLALMJ37lEbNNIBPWA5WjTDlQnyteI4e1ua9CGEFsxXdy2KE9h27vvn9DU
 GovPEyUfJI2qzKTsY415pUhDv7WE5eQcjDCYDsozM0iYsDKAgm6SBBXRJtyZHnHhZZJy
 C0Cv/LkN4DEGy51jutPmSJt+lO/AXb7O42MzqLSTvAqkpoXBcA9vLU4PDEXDDeJ701w6
 EM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m67ugAdbKYSNSav5w5qEXHd4/zuos+D88hv2WZ39E0w=;
 b=Ggocu6qBqSZXwLu7q9sf0kM0wEuBLXY4+Yt1oLnZNEBMf7qoAG5G+GlB59FZLL29ZK
 BWVDY3xwzFUzA/ZD4xwNm64gVuIPIkd1X48mB9H4bKr61rMqQRsa3OrLnONt8bIFhyvm
 DO89d6oFh85AuXi3t3UhcYuFPnxJuqn3jQXr3/Ctc9D4fu9YjIqFHE/Fs2gFrCfVNy+I
 AdDrNcUC923qWDy2xPmpKj7uqvJxSIHMhEN2Fhr52iW9+MlL5GyJAFJzsKPxc8TJGA7M
 Yv7KG17EQE+RXSlo5S/tn7el+11jzJ1+3QEgSScrqCHjTxBu2D7y1N2vzRHrcikL37Ey
 ADxg==
X-Gm-Message-State: AFqh2kp4FNpSqw7RO+itPp2Prsj8ObTuCKy+GGxZ12pl6LXgD6w5AbOg
 JC5/YoGwwCL61cwADdfnkbLsNA==
X-Google-Smtp-Source: AMrXdXv+fT5jou7ER+HEG9DAq3iq8/P4kYKnE9z5emyrrwT1p+cUvg66WtuJocZCrZZCjK2PtQY7cA==
X-Received: by 2002:a05:600c:4f84:b0:3d9:f758:e280 with SMTP id
 n4-20020a05600c4f8400b003d9f758e280mr8772835wmq.24.1673520045852; 
 Thu, 12 Jan 2023 02:40:45 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c358900b003cffd3c3d6csm23409024wmq.12.2023.01.12.02.40.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 02:40:45 -0800 (PST)
Message-ID: <f270ae78-a05f-c659-6889-27a75e5c5f6c@linaro.org>
Date: Thu, 12 Jan 2023 11:40:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 03/31] fsl_etsec: Use hw/net/mii.h
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
References: <20230112095743.20123-1-akihiko.odaki@daynix.com>
 <20230112095743.20123-4-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230112095743.20123-4-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 12/1/23 10:57, Akihiko Odaki wrote:
> hw/net/mii.h provides common definitions for MII.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/net/fsl_etsec/etsec.c | 11 ++++++-----
>   hw/net/fsl_etsec/etsec.h | 17 -----------------
>   hw/net/fsl_etsec/miim.c  |  5 +++--
>   include/hw/net/mii.h     |  1 +
>   4 files changed, 10 insertions(+), 24 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


