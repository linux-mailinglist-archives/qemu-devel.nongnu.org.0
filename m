Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F6B6E267B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 17:09:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnL2i-0002t1-Ha; Fri, 14 Apr 2023 11:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnL2f-0002sh-2h
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 11:08:49 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnL2d-0003kv-6F
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 11:08:48 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 bi22-20020a05600c3d9600b003f0ad935166so2615114wmb.4
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 08:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681484925; x=1684076925;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GqkW9ged0IbFmUFAeUkeO1vFqi0UBKCHWpz57vZH/dE=;
 b=lEYysKHFc6j5Mh9iX3EGK80VADJ9AeQdEX+r7BErQv/Js10KklCLzqzAiOMPkoSzMq
 OWiFG189GovWQBQFVA88av+aAAjKdSJkjiseYc+w63d0X834LOzq/uRTVunbL3X/kaag
 jy/+L4rMu3NXUvSRcO0KmWDpazPGMuup6QmN8pP76CuuKKDq4Kaxd+NYBlf3txVkX7r6
 7Hfbccgg2XbvFZSyX/zxI54PvZn9Gi/eUXKbjSm+xpbuz7kSvvcWYACw6Bo9yiHeGtx9
 7I6LyWPm24YQTQM1dGhiXTLD1T4MAKbzOJnYIt2U1O4TCRMyfNogS5zy7awUm3F3wTvg
 7N6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681484925; x=1684076925;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GqkW9ged0IbFmUFAeUkeO1vFqi0UBKCHWpz57vZH/dE=;
 b=LtCoBCSPjAmj1y0ODwul1WOzNurOFpHjmzhQyYjQpfleOEzqyhN4J3k4O0/avLjEBl
 mV8odme+XJ4DsWUKUeDHrj/Qdm+wH9QrxpLORNj1TSv9aDJG8OMcILTA+ttZCRBLpQHp
 m0HBau4+fYzxMGftoGbqPrHPjSXAqpaniIPeVQC+tFmAggAHD3gk+K260vcIXZNPGd0e
 sR+jL5296e79UjN68O72I9Sbt4RdM9GRYFLBSm+Hdm2xxGXwmU2Yr2OSn0ShgswsN1mm
 //i5Fc0CqQ8CbJtHQBZVRDQjZEJYoyIhBtUZf7e/hwpF9H7aA5XsfqLDibt3C3vskacg
 GSVw==
X-Gm-Message-State: AAQBX9c3fWnna7yQJP8Rta130W/8d6x5JjHanc7E3Wu2pAIVChk58HOY
 xc2vwM1YPYq0uNwOGStI8YVL1g==
X-Google-Smtp-Source: AKy350Z3us0PYjPI0XJMMhYZ84Ui90yFFiKFeCEH73xYAfIe4mCq3fugz8hDQ7DCFJLLIudP+PZpQg==
X-Received: by 2002:a1c:7506:0:b0:3ee:3e07:5d26 with SMTP id
 o6-20020a1c7506000000b003ee3e075d26mr5140225wmc.24.1681484925542; 
 Fri, 14 Apr 2023 08:08:45 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.204.198])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a05600c2cad00b003ede2c4701dsm8073228wmc.14.2023.04.14.08.08.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 08:08:45 -0700 (PDT)
Message-ID: <2a429670-cefd-db55-61a6-f0a5bd3625ae@linaro.org>
Date: Fri, 14 Apr 2023 17:08:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 23/40] igb: Share common VF constants
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
 <20230414113737.62803-24-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230414113737.62803-24-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.282,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 14/4/23 13:37, Akihiko Odaki wrote:
> The constants need to be consistent between the PF and VF.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/net/igb.c        | 10 +++++-----
>   hw/net/igb_common.h |  8 ++++++++
>   hw/net/igbvf.c      |  7 -------
>   3 files changed, 13 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


