Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64614365BA1
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 17:00:21 +0200 (CEST)
Received: from localhost ([::1]:37426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYrrQ-0001St-FT
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 11:00:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYrpy-0000CL-Iz
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 10:58:50 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:52176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYrpw-0006Nv-PJ
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 10:58:50 -0400
Received: by mail-pj1-x1029.google.com with SMTP id lt13so11129297pjb.1
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 07:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MwFLhjJ98Jxl0NSak8+vovFDLDfoeRwLqXzPPtAlpX0=;
 b=I0x9M3DiA4FBZypxcHjmTr3P7U2QPmN5Fh+urjvROrZcULbmZudF6GFfmsfx5GtLkI
 WPUdzKUxRqzFzssZU0j0Oeq8c1w0uaL7A3Bmmy73nypOgM8eQQJ2EMtsCZAi2q4NSIAt
 W4Do35SK1HTzNvBH5iXENz+Jsc344yQjqAbLUwRrmqFRJkSZ2wmJAmOTdu3Q64brg3OX
 +5JR6NzD5m4wFD6yp7eruC5znzl9okM4yMhqG82RR3XftpUhysyKPzvoncke1NDBbGwB
 XRFiYuu5fI8jse8XWNVFK9fxOdR2PP3aZgvBhCU2P17HsqRTWoA3Vzi/v3w2JCro0Yfl
 m/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MwFLhjJ98Jxl0NSak8+vovFDLDfoeRwLqXzPPtAlpX0=;
 b=NIOnkd+T6Zig7skqyZzASXI2D59dKUdeJ/AiXDJmhLQdfZIOYnL6XaBusmLcMQFq1o
 V415uGSjMAN3M3nH93PT+89NOYFYbpRa8pKJFBSZQowqqrlzzrpxYj97Fov7RGG40/Du
 XpFC+uRYKjYxdUCnpeyzZ4rQxmP7NASfcuh3KPTiSgTUm3145Wy6+D4XMtjtUhq85nmt
 bNvhK2Qzr9xvcH3hg/goHxMo+To8VPjyeUw9N4iK1XjITWOEtx0OI0WETO0mBXZPu/un
 sFSWcPOUP85YM7c/7rABZPXSIrVjz4P1nocG6O+Zft1B4PAC30e6aoQMagjSoIPZ4g8j
 +ocA==
X-Gm-Message-State: AOAM5324rA4ZUD3xUvxX7jy9xS6MePpBZOpKcQ+rCgMUc0XN55jXUD6F
 nbE4iuT1KgidDnTUSwMVmruClw==
X-Google-Smtp-Source: ABdhPJwSj/t6Bn4eksv9mVxBobiXzjTCiOciTCQs/YbhZGx59fV4D90/Ka2DbQ0KQS2OaEnDzLsZtg==
X-Received: by 2002:a17:902:d112:b029:ec:9f20:3438 with SMTP id
 w18-20020a170902d112b02900ec9f203438mr13456606plw.7.1618930727483; 
 Tue, 20 Apr 2021 07:58:47 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c9:59f9:3594:91a:8889:c77a?
 ([2607:fb90:80c9:59f9:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id l132sm7818696pga.39.2021.04.20.07.58.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 07:58:47 -0700 (PDT)
Subject: Re: [PATCH 2/2] tests/tcg/ppc64le: tests for brh/brw/brd
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org
References: <20210420013308.813323-1-matheus.ferst@eldorado.org.br>
 <20210420013308.813323-3-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b2d3f35e-e796-8751-3b15-9a45cdd58266@linaro.org>
Date: Tue, 20 Apr 2021 07:58:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210420013308.813323-3-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: gustavo.romero@protonmail.com, f4bug@amsat.org, qemu-ppc@nongnu.org,
 bruno.larsen@eldorado.org.br, alex.bennee@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 6:33 PM, matheus.ferst@eldorado.org.br wrote:
> +#include <stdio.h>
> +#include <assert.h>
> +
> +int main(void)
> +{

Oh, also, there's nothing in here that requires stdio.h.


r~

