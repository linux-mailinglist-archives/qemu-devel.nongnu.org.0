Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1982B354320
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 17:02:17 +0200 (CEST)
Received: from localhost ([::1]:36380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTQk4-000430-3t
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 11:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTQWN-0004qh-Bb
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:48:07 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:45998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTQWL-0001g9-PL
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:48:07 -0400
Received: by mail-pl1-x629.google.com with SMTP id l1so5760332plg.12
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 07:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GvIRblvu84vKJmgGjYs4Rj6a92WUu2cI3XfXfNo0nSQ=;
 b=RPEvYoDhtgC4mnuLFnhqTD591Y+ef37CkXEUX402P/BAAJeAK4pqd0a4CIlb4C8pD0
 ur/7DL90h6Aq5tA9zalCMlnICwobHJcaMpEV7UaPMHCBs3Me5q4X6LbvSOGYODztXimb
 nGFnJP3WGzS5jqFjMPgAkwVbbhFqIdVzQPGwrM2JrYmz/J//w2jk6AejVkdrR01DttAR
 Eq+LB9anRJlT4bCaQpdoEmFSQUbKyMkQMHtx/v7Md1PQN5QvqI5MXjL9uC1/54ZsfuGz
 v/RoAKeGwC8FjpkQZBqbcfJTGp+XvFK0RPLmqrRUvZ7/fuBck6kZ7x/cZCWlm6D2bMUw
 cqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GvIRblvu84vKJmgGjYs4Rj6a92WUu2cI3XfXfNo0nSQ=;
 b=g+ejum5MxH/Ov907111iqJRG5wZoA2McFhNT0wk1yYkkGsKUIDDSLupx60pXiN+jS0
 JQS2cCjeAUCDB0sNLLsBnPBsvcxxhG1Y54UV+xUjar2907BfcXejEvnpwr+PSSOJApwY
 nIdK/Ivd+Ix3mjFuX+d2HoGvXFa4k9M5kByCD6m8IwXq0NjNuMf8khJVjEklipXieIgo
 m0lYzJhk6r4RozM7s6yXyhNhGSx43b1O8jlT2kfCyEFvcMKagQUdakkLSL0K8LNweGjv
 ouQECietcMQmhl3NNi0ZtYtib6XFrXL8LljszmRUnMO36V9MAzGGSmwflWszbFxdOeDK
 E8vg==
X-Gm-Message-State: AOAM532xF4/FF0DgZs59cQ9w1OX9mAS1jPYI3Q/XbkHZFoK07j8HDxt4
 tKiyVnmDL+uqiSL/Q3zFg1tQXA==
X-Google-Smtp-Source: ABdhPJw8aqavt8ocArSiqJlL4XOAluIX0BuCjuOhPwceJkFGpRIC+G/yPWHIEcn+ICjveaekCzYFzw==
X-Received: by 2002:a17:90b:3892:: with SMTP id
 mu18mr3198122pjb.7.1617634084286; 
 Mon, 05 Apr 2021 07:48:04 -0700 (PDT)
Received: from [192.168.73.67] (50-200-230-211-static.hfc.comcastbusiness.net.
 [50.200.230.211])
 by smtp.gmail.com with ESMTPSA id o1sm16518114pjp.4.2021.04.05.07.48.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Apr 2021 07:48:03 -0700 (PDT)
Subject: Re: [PATCH] target/nios2: fix page-fit instruction count
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <161761084874.267629.6627766310804625252.stgit@pasha-ThinkPad-X280>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9ca1dc54-305b-2a72-810f-9b9c1e8c468f@linaro.org>
Date: Mon, 5 Apr 2021 07:44:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <161761084874.267629.6627766310804625252.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: marex@denx.de, pbonzini@redhat.com, crwulff@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/5/21 1:20 AM, Pavel Dovgalyuk wrote:
> This patch fixes calculation of number of the instructions
> that fit the current page. It prevents creation of the translation
> blocks that cross the page boundaries. It is required for deterministic
> exception generation in icount mode.
> 
> Signed-off-by: Pavel Dovgalyuk<Pavel.Dovgalyuk@ispras.ru>
> ---
>   target/nios2/translate.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

