Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F14E2407E99
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 18:29:14 +0200 (CEST)
Received: from localhost ([::1]:48324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPSLy-0004XT-2V
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 12:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPSKy-0003rh-I1
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 12:28:12 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:34617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPSKx-0006rq-2B
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 12:28:12 -0400
Received: by mail-pf1-x42d.google.com with SMTP id g14so6612382pfm.1
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 09:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c0I7eAdjTS9iAkI7ss1t1Q9/vdq+Vq+A/NDcjzTtvwU=;
 b=TPrtMKFM8AkYiU7m6xtMnBtaW5I8tGo/AJAkQubIpxM2agC1vvnHG0dE/uJFLEzAKc
 e7yMT7b0C+PKAZDTw0Pbt7K0Y0KSYt4VjI2M/NFBAV6AHxaM+SuZ/Sxici9ijR46zYGa
 59FVOBRdrr6aQGE5ydl9ryVkXpQzOJankt/+D+8HwO1vsZLRYNe+qeS3zsZZMJK69knj
 xT9uQnror0b/GQd0RlRj184ravDGtkp3upSXtmkaEDJN54LiExFTP1zVI6RL0uvV9q9a
 Msy+aZTDpKXaoo7Ywmwi0gC/BhQjp+brmi97Z60QzdGnafI1IA2rcmvxFQ3cg8NuTL10
 FjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c0I7eAdjTS9iAkI7ss1t1Q9/vdq+Vq+A/NDcjzTtvwU=;
 b=o88Vr1RVCpp+ApodWqrspe6ilqxba8AKGrity6cq4zOWOjLlZXrESqK4bNvKy/DK4n
 ZaOIDSkvYmNKyQDNW/bHE5XQ4xgeVWlbZRQPH1OI2ggYRinonCYITElWpYUzN0wXmVmi
 40g88MbxfWhpw3XYrd4R0jkQxCRM3qGihiSVsHmLJQU++UhWuD++wU+fH0ABDlKrwX4M
 KFLv8lbTtLfDgQA9m5xJZ0F2PD36QKLu5AIq489FKIb9QKZq+uBIK4QjihpBK7xWTHIG
 UX3mA0T6mlA+VgD3V2Pqf5BiB9h++SK49tIebO0NVYPM45sOCXzBI5YbaufyjfinRLOk
 9j6g==
X-Gm-Message-State: AOAM5333eb3Xhe20JPkQXy+adikbQjl2JaDeqnUWZa52dTr1K+O7uHfN
 kfh0MuHNBikJscT0LnS91/JiiA==
X-Google-Smtp-Source: ABdhPJzHP8Riy6v1Dtyb8xYEJFNgvHsyoMwjAZLnInO4jjP2Y/cnJ5mwnL0UGYghoC2E/A/WmtYpow==
X-Received: by 2002:aa7:88c9:0:b0:3fc:38d8:fc32 with SMTP id
 k9-20020aa788c9000000b003fc38d8fc32mr7054977pff.81.1631464089447; 
 Sun, 12 Sep 2021 09:28:09 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id d22sm4234106pfv.196.2021.09.12.09.28.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 09:28:09 -0700 (PDT)
Subject: Re: [PATCH v2 7/9] linux-user: Split linux-user internals out of
 qemu.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210908154405.15417-1-peter.maydell@linaro.org>
 <20210908154405.15417-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <12d3f905-864c-30eb-e274-e3f37c5c1b27@linaro.org>
Date: Sun, 12 Sep 2021 09:28:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210908154405.15417-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.584,
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/21 8:44 AM, Peter Maydell wrote:
> qemu.h is included in various non-linux-user files (which
> mostly want the TaskState struct and the functions for
> doing usermode access to guest addresses like lock_user(),
> unlock_user(), get_user*(), etc).
> 
> Split out the parts that are only used in linux-user itself
> into a new user-internals.h. This leaves qemu.h with basically
> three things:
>   * the definition of the TaskState struct
>   * the user-access functions and macros
>   * do_brk()
> all of which are needed by code outside linux-user that
> includes qemu.h.
> 
> The addition of all the extra #include lines was done with
>    sed -i '/include.*qemu\.h/a #include "user-internals.h"' $(git grep -l 'include.*qemu\.h' linux-user)
> (and then undoing the change to fpa11.h).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

