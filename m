Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 927683AFD27
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 08:42:13 +0200 (CEST)
Received: from localhost ([::1]:50446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lva6u-0002pd-Cs
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 02:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lva5x-00028h-9l
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 02:41:13 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:41654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lva5v-0006ay-65
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 02:41:13 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 y13-20020a1c4b0d0000b02901c20173e165so1510056wma.0
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 23:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DVRIjhoanfky4j0z/1DHGh+UDIEQBRqPE26Wt7BW7pU=;
 b=GKOX/RXbpjdRuRW7WA1MD7oqtPQ/fvY3sCmxk2cCigRcsfD1a0iYR81OI1UvNGDHFZ
 J/Tg/w7NOOAdcBUAy9/701dIGa63ea83v8UDYiIhYC4wSB08LOYf2g3bEJB8TCFvRFiv
 aMnyOxtvXXxZhyg74elHfGjc+saMVQpge74N4/+r9leZFs/2iTKs3UWrBNmT755H/0Zk
 cgcUbgYIsEyHJh8v1nDLgwmO/wokI+dXathEYowK9TIMCCnwnTqdFG7tcA+q87uYDJty
 YtX+ADMvJE+3xw+DjJL4O1gOMAJZRRk5UUf05EL3n54ivlnhuw38YCrbF+0+sMK0B82H
 wImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DVRIjhoanfky4j0z/1DHGh+UDIEQBRqPE26Wt7BW7pU=;
 b=FTG+ptZJlUG5GdjX145QNKFGpg1iwvWpN2OZnudNPbwiSKLaKkWNv0Uttq5mQ4RQfp
 6y773q5XyK7OKa+uZpHfHG6SZXsG1g3Y6JySX5i2BhTiZ1M6/grozhdchgNH8/gGxFqn
 10CFEFs9HWFrBKMsRQ2b/XE7vz7fdCBo+poi+DwSJwgFt/SbyuyO8TWnJQwI3HjsVArm
 zj1DPkK8oP1lir1oswLf6o8JeJEqiKPJt93gg18mg60cKxo71Ksl+xtrWLL3opvIgoQH
 Awf6Dc0t0gLpntgdDti34/rhLk01ZZLHv+zWzZryQvwArHqgn10+tzjxTZ4eMJSo6ZAU
 Iv8Q==
X-Gm-Message-State: AOAM530/XYoJJTrFqSemyfgcvWLj6v/PUrHEdtXW57g5X4Te5Vex00E6
 jRoZQ049zfxiq/5QnZAUG23g/3Q7YF57mw==
X-Google-Smtp-Source: ABdhPJyhW8dqtDMJ3hVkavzM1C+3U3mOYf6xDMcqW8kOXnX/7+l3O0GJ3wOWCXm6uy2mFjDN7zwmSQ==
X-Received: by 2002:a05:600c:2306:: with SMTP id
 6mr2557669wmo.32.1624344069501; 
 Mon, 21 Jun 2021 23:41:09 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id y189sm1340353wmg.6.2021.06.21.23.41.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 23:41:08 -0700 (PDT)
Subject: Re: [PATCH 18/28] tcg: Make use of bswap flags in tcg_gen_qemu_ld_*
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-19-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <39c98a55-3f76-6ee4-adf2-1b438528bd91@amsat.org>
Date: Tue, 22 Jun 2021 08:41:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614083800.1166166-19-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 10:37 AM, Richard Henderson wrote:
> We can perform any required sign-extension via TCG_BSWAP_OS.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg-op.c | 24 ++++++++++--------------
>  1 file changed, 10 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

