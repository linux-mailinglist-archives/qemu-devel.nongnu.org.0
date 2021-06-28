Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8943B66B9
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:28:19 +0200 (CEST)
Received: from localhost ([::1]:34218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxu7O-0007pq-ED
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxu5Q-0005r0-4E
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:26:16 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:37510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxu5N-0003uw-6b
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:26:15 -0400
Received: by mail-pf1-x429.google.com with SMTP id s137so6921996pfc.4
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 09:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=K7GBvLooGu6oyfCGMLgyd1N1/7+0VnyWXEApFbvoBeI=;
 b=TgM/gF1X2IesdBsM1DHlQzMeD8bZ02OPe8qH1ahMjklgZHesVAn9xVk+g9BLhQEbeh
 hMnhI5qVga4fgU4DRqssa1pSLOh4yjL8jL6yPBr6U8q53/qyFQws0OWlp/xJ4P85s2qD
 Z9CEf+5WZOw0cObdvFVbLFdoTG80QxY1SmTIIdJK/Zzuj0YB+P5ff0xn0ikl6b364JF3
 3Tn7HlffUpBXmG+LZh2v35jc8wIZ8QReP+134qZ+3He5xO5/2nRJjJ8GxwuvGCAaM8NW
 FvOr5lt7xy0htzBElqGwaZMEydugpw3iris0QY2niA9XEgBCsJRJZW3/2si/U8mhsUtz
 QjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K7GBvLooGu6oyfCGMLgyd1N1/7+0VnyWXEApFbvoBeI=;
 b=lrXdpfSgFk1HUDhK4Lctio9puQEAvdY5dozJPnsXEShqiQQJlzfCYBaAjh3DggEWG6
 ZEsSQlhZuHeMCD8+NVEJ43SqlkiAe8aaV7NG2oCPPqwdkpzJYRSA73Sx+UrvnxTi5hip
 I9hyuPsEF7j39B4E38JzJinl6mdGVpQqsMye9RmBkjlX4/0WVSo8I1pJ7v3jC2dtN7il
 VCEv/3Mh5oZEmhbJOe9v41gLYxUTqKC0xmEJvzWgHYspebTvfh00X/Y7fAq3sORlpeuF
 jD0V8fk6E0h2yYFLeIwMYZ41LkrNKp2pYvqd9mk9dawwBU4QWSBOw9xogV8U8rA8PBY8
 QZ0A==
X-Gm-Message-State: AOAM533jAywGdtK4f4WVCPl4TcGrmdNxYjqUSG9J1q9cKmbkXrMd+1De
 TGcDJsOVtRY3UwtmWQRVbRcQE9tQjUYxnw==
X-Google-Smtp-Source: ABdhPJz4DSawCzFgSN8sdAlQ3Wq7pVT9DIdD2mFL+J0Yhan/fzflm80STlGJu7fU/d/tyfKPs2hg6Q==
X-Received: by 2002:a63:2d46:: with SMTP id t67mr23812998pgt.307.1624897571595; 
 Mon, 28 Jun 2021 09:26:11 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id w2sm15356532pjq.5.2021.06.28.09.26.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 09:26:11 -0700 (PDT)
Subject: Re: [PATCH 10/18] target/arm: Implement MVE VSRI, VSLI
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fde240ca-bde2-f47b-3dbc-00f03acd907a@linaro.org>
Date: Mon, 28 Jun 2021 09:26:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 6/28/21 6:58 AM, Peter Maydell wrote:
> Implement the MVE VSRI and VSLI insns, which perform a
> shift-and-insert operation.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  8 ++++++++
>   target/arm/mve.decode      |  9 ++++++++
>   target/arm/mve_helper.c    | 42 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c |  3 +++
>   4 files changed, 62 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

