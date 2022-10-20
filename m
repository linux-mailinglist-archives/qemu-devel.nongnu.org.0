Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B71606B06
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 00:11:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oldkj-0008My-AP
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:11:01 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oldjn-0007Ng-Tj
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oldjf-0007A8-LR
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:09:55 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oldjd-0002v6-VT
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:09:55 -0400
Received: by mail-pl1-x633.google.com with SMTP id d24so586332pls.4
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 15:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kRyDyXFD+MsKZUngB9slDVzm5SfOz76h98eWmrwGaxc=;
 b=coKHSVPin56s+WnRbXQq5BIklDjeB4Jcwv4OHQOyC9rKrRxLQcq6Ew+OQ4t9roYuSG
 TL8/vdqj0B7OuvQnJCAATFt+WrkoJKcfdukGB3lrr3YFHiQI+g1uNFsMqI2w4JSsCiDp
 CMsYhSJB6d+w5sOw9CE6eRM6gXuihbtPOI1KU6q1ID99dOnIi37IiR6SM67QJltxvQlT
 Dw4fbLM/sb6LdTwCED3zlW8XKmglgyUOaHC2PU0XsIPzWChKBPio94YN9T/NHzWNlHQW
 JNXg8IHzp3xmxvqR3mGk+QEnwkT4JqmTIQNs4A6cIVCC0juQ2HpM37vBFKAOlW7bo+5p
 NuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kRyDyXFD+MsKZUngB9slDVzm5SfOz76h98eWmrwGaxc=;
 b=FvVH04BoS8BsFY+wqNQV1ZtzUBfChuJT+f2N38PV9VNAEDykwP6VhPikhLWeFgCDbS
 ZnfSaqB6wGMN9wZIJu1e9h+hu2xmR8OnPFI9rl7dgSrxUhyPEWRkOnyV4Qde1x2f0CYg
 JBPpE3pKSH3ktJW3lV0KT4EpFjwd02QzOjZsUiUJ6k/PJ3xpThIcSWsXvzs3r/jHAXpS
 qoKj/HA11lLlbRCGSGY2T7s9zjDQz3lueWKHwT/DpUY/ISeSR06bPZouFSIMDo22iSrq
 sO8APtWNwd6RKYmKNtKNPanpc+528DsfvozQD2L8UlF3czDB7FSXGkvCRb/097fvpkBG
 khVQ==
X-Gm-Message-State: ACrzQf24rvUHGHloRC075cTsoQw1wJ2F6fYZNVNYk+kw08Cd0Pg3Mz9E
 qdzPe+9rVESHd6yBY2vULWi3/DLQOP5QMWLd
X-Google-Smtp-Source: AMsMyM4O9+W278my8Gl1wru7YMmjZVaSNmBDpPbGqqbxKfnjY2mnvfggMpD/WAC6bsUCoPu8XCK6oA==
X-Received: by 2002:a17:902:7596:b0:186:603e:9cb8 with SMTP id
 j22-20020a170902759600b00186603e9cb8mr6236278pll.155.1666303792481; 
 Thu, 20 Oct 2022 15:09:52 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a170902d2cd00b00183c67844aesm13572197plc.22.2022.10.20.15.09.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 15:09:51 -0700 (PDT)
Message-ID: <db03813f-ef50-c845-b955-88c6f63533c5@linaro.org>
Date: Fri, 21 Oct 2022 08:09:43 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 05/26] configure: fix the --enable-static --disable-pie
 case
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221020115209.1761864-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/22 21:51, Alex Bennée wrote:
> The previous tweak was incomplete as it missed a leg.
> 
> Fixes: abafb64b6d (configure: explicitly set cflags for --disable-pie)
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   configure | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

