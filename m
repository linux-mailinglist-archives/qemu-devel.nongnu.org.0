Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2613920B6
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 21:16:41 +0200 (CEST)
Received: from localhost ([::1]:41846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llz1E-0005qg-8y
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 15:16:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llyvb-0007kS-E7
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:10:53 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:37463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llyvX-0005QB-Tf
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:10:51 -0400
Received: by mail-pl1-x62f.google.com with SMTP id u7so1108189plq.4
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 12:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dXelkWnYtJip8Hj8PgMvx9Qvrr/PKdw12CX1b+MCrk4=;
 b=SoCA2Vo0slU3zamERsZGrEdCcAPXcxDh6shRE5i6VvZSn767QEKFQYXKJrpkWQ8QFG
 Yke5dZ7GmLblH9PkaeNgUiSVy5kIt+/yYq8QBh1VZfv5atDXJx64sGDHOIupPjEAgDH+
 vDeUYbnwCiNCqMpv4RLOsIp7rjLnbQfdLZJtCRdriHL6KWMHuGfiBT/GWivfgmY1sEkD
 xMh1+eEKzP9L7ybDxCMLdqn6NsVcnxPSogiXagUrxjJdAGDe1u56PtiLq9U7JSJqNhYO
 ackAU+BxqsAmz0eYiwwS4/LxLubKvlrIsMCbguamXVPHXcqQbfRc3jFrgxLv5IsHsZ1i
 a9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dXelkWnYtJip8Hj8PgMvx9Qvrr/PKdw12CX1b+MCrk4=;
 b=EWBz8K4aS65TApOpLscQyThnpAFXSkasL5TZwb4Kspzw8dp6HmHeLDbsMSoZPPow2i
 1iDiHiMXp2P6xMtWXtZOUDUnpR1ksRaH02i9TOT6nWRgeH16d3wctGh5chKqWUGbLDf9
 lPgN2tPIIw6VBTk8bg2bNd/vUqzNh3KbOJNLkM7XQzUoxOv7+n1CvSf032ZNC/daCS+C
 SDJRCzNfFO64qqAvgTDcn3LAoYnlaLbf8TNh33J82TsmJY2L2k5QvnfkvDIBIHanUIm5
 JnyJnmpC3UWs17x+Fjm1W32jXl2FmqIEPCzGl0lAXlwqitmaBrVM9Vy9VG+Q9albFtr3
 L6Fw==
X-Gm-Message-State: AOAM531JePJHxbTr7fZbntylPF+AVLXmAdsox8g+5e9qbKVw6yJGtP61
 Tgpupw3c9Gl0m1ork3nQo9qKhA==
X-Google-Smtp-Source: ABdhPJy5ltRWf5G0rOH8/Ab7PVz0QlvhbqYCo4yu4faBowvBpyXDz2dSwygJgE2yuMr0/THGRpM6RA==
X-Received: by 2002:a17:90a:748b:: with SMTP id
 p11mr37802174pjk.94.1622056245491; 
 Wed, 26 May 2021 12:10:45 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 s123sm7170pfb.78.2021.05.26.12.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 12:10:45 -0700 (PDT)
Subject: Re: [RFC PATCH 15/15] softmmu: Build target-agnostic objects once
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210517115525.1088693-1-f4bug@amsat.org>
 <20210517115525.1088693-16-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b64b8451-b9a8-feb1-489a-0cef61cd76ca@linaro.org>
Date: Wed, 26 May 2021 12:10:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517115525.1088693-16-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 4:55 AM, Philippe Mathieu-Daudé wrote:
> Various softmmu objects aren't target specific. Move them
> to the generic softmmu source set.
> 
> For our 31 softmmu targets, this is in total 330 objects
> less to build!
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   softmmu/meson.build | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

