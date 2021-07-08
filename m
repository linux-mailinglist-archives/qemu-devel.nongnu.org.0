Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DA43C164A
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:48:20 +0200 (CEST)
Received: from localhost ([::1]:56774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WGA-0002Ou-Us
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:48:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1VsP-0005pW-9g
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:23:45 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:36665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1VsN-0001RC-LO
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:23:44 -0400
Received: by mail-pl1-x62d.google.com with SMTP id x16so2281377plg.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gp40QHdhaFLHu+1mODo9nWPs89GXDC44AsCODPKm4G4=;
 b=TUlo1A/HeAzXSEccCxmcNwKEe+DSJ6rogo432I9iLs7f3YLBUS3ItMFWDH3ytM1+JE
 gydKg3L1o1Oa0VjfwCeanLr2HUVP7nV1r5Y5MT9lP/leHgegP4e9vLYNHZLVdTrTgmiD
 X0W6ByLqAU7cmwVJ5hp4WuSbfyPnO03FO2NGXf288sh4yD89ogseJXkWzOjMT/5dkcrL
 mK0YDQXLAK7sDJXczblBBZOVM7g5ZlEkklWCsueTF57iuTvzipn7Yv5TVjE4H1trvF9y
 rzKmw6HcXa6Eb+FtS98RcZMhAJyKjTzOqJ/GHJ6uo9OTPHNeScQ4b0gbblw7mKLrJBmx
 zxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gp40QHdhaFLHu+1mODo9nWPs89GXDC44AsCODPKm4G4=;
 b=jKoqqgfNLKWP2UE5Wb+wKM0YJSSaaZPuKI1bjIGc8ih1mPqwo+GT14Fg1VdjBg61UJ
 GzrzoJymElwxBC2rVsu3ezeSCjjqnfwVjXI7uP01gQrHe1tkeLXLx2oiaiAUXloxZ5hY
 u6H8Zu3g9rPDXZX/CTS2kUnkDjiBfnMc/cBTr3CwKLRQPW6g/nXrHMQsIWSYXfgj8ndU
 eoRJ5KYS9b1RkKwoxN+SBgB87Ng/qn4szl9QM5+npp0Q3kro9U+RAu/mZEkiGFiT6N2Z
 oOTDTejhONcL2m/hED3UDQQ6VsGoGN2QJwowD9hIsn+YeH0ca4YnN839HFMP9yErI7XY
 uK2Q==
X-Gm-Message-State: AOAM533Q8paEiqgr6AHMmsMHoqvTVXduxIZ97zU4spGAPWHg/ChvrAdU
 CunEmYykMdSa190H1oMDeEKnaA==
X-Google-Smtp-Source: ABdhPJyGNmKkkKmlmvBMfCgHD0z61dQC+SeR1PRG9Ikb3EzL+6vSD0hfSW852cAFASVH9CJ9hIGGyA==
X-Received: by 2002:a17:90a:de89:: with SMTP id
 n9mr5385069pjv.221.1625757822197; 
 Thu, 08 Jul 2021 08:23:42 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k10sm3151777pfc.169.2021.07.08.08.23.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 08:23:41 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Implement MTE3
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Collingbourne <pcc@google.com>
References: <20210611190653.754648-1-pcc@google.com>
 <1b726e8c-5f6d-856e-72c1-8d835f28aec2@linaro.org>
Message-ID: <34772e1d-a33d-73bb-f6fc-0b74b326dc01@linaro.org>
Date: Thu, 8 Jul 2021 08:23:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1b726e8c-5f6d-856e-72c1-8d835f28aec2@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, qemu-devel@nongnu.org,
 Evgenii Stepanov <eugenis@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 8:08 AM, Richard Henderson wrote:
> Cc: Peter.

Bah, nevermind.  There was a v2 that already went in.


r~

