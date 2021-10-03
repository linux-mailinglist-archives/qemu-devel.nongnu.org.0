Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F274201D1
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 15:53:47 +0200 (CEST)
Received: from localhost ([::1]:47732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX1w2-0005lS-KB
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 09:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX1uu-00053e-2C
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 09:52:36 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:40631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX1us-0003U6-J3
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 09:52:35 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id n6so8497667qvp.7
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 06:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=utoz94AswFNEZVCAxRbVuYGmVbijeNNAewpSo7hyI2k=;
 b=CcG4L5X/JD8O+Uge1vjybIVhtT/nWf1OmB6Qt1xRU+EdnR5AZMk6zLsBAT1CQCDsUj
 CSgZm6PnaEYYbaZgFKt87WGb2XHQEioXJ+lllYqUgXBgAl0zHXNWryZcu7ZYGTur6RI2
 gOg8XwO5aCNvq3tOXgRe6ibuph2JCk0yRj2F//bUn8RfoDVjEYqrVpCq2DTYJGHMUe/w
 MaNLhYusbAZLUGOgLr8sUwvfslLnSxPLlxpdDmgezBLyPpMnwgYRc5071FHbnG2AEGAO
 uQbCxSo49HlmUTF19VgplIJvOU8JcEpEdZcF6JCPjmWimiX+MzoukdJtoKmmjeK4Kzc3
 YCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=utoz94AswFNEZVCAxRbVuYGmVbijeNNAewpSo7hyI2k=;
 b=srlBO4LdKGRILk4KKtdPqkPL7gOyuRsNoiScJXtJMcWBmYIuTreNYmVB6+Hld+fwe2
 RhgBAUwzXBHEOjhcAhb316s0brSfT24gvJDEuRcD0PVHwULxm8yoBdAJu+gwNYXRSqqB
 xB9Zrq8asAs5GFKwSR+P1nmJVENVV2LVr4ktjO1LXzk0rqFyaK2bjTNuVY675thKnr0a
 2cCpNvaYXuUVnLbdjV+kpc3JyQThAXgV5y8aa29KfIrk9NfUpicIGddxE0i3V8nAlPdE
 tZMrIzeaOoUXJH7aQUA+aPQyOs2uZJqXZH6z19x5fWu0Ij+yEzYKnmSloi0DxwEnfrWU
 JG+A==
X-Gm-Message-State: AOAM532VA+DBCP9RBwATBU83hZXN9J/vurj0pGuU/KGbx8Lfo4d46wge
 ztBfoIs5B3q3GCuEad+o3qASsw==
X-Google-Smtp-Source: ABdhPJwseC5qI/CrjXUEuvvSm7vwUcaCCVIIqzAj3tnZkDdnXwf2RnfUY31Du7WZwHMgGYGx6r0zsA==
X-Received: by 2002:a0c:eb86:: with SMTP id x6mr2240148qvo.61.1633269153759;
 Sun, 03 Oct 2021 06:52:33 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id h2sm6335265qkf.106.2021.10.03.06.52.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 06:52:33 -0700 (PDT)
Subject: Re: [PATCH 3/3] target/nios2: Use tcg_constant_*
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211002233054.3575646-1-f4bug@amsat.org>
 <20211002233054.3575646-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ac9352f5-0cbc-6366-851e-5c18a9982f04@linaro.org>
Date: Sun, 3 Oct 2021 09:52:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211002233054.3575646-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2c.google.com
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/2/21 7:30 PM, Philippe Mathieu-Daudé wrote:
> Replace uses of tcg_const_* with the allocate and free close together.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/nios2/translate.c | 14 ++++----------
>   1 file changed, 4 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

