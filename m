Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C62313768CC
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 18:30:59 +0200 (CEST)
Received: from localhost ([::1]:43144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf3NS-0008H2-Rn
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 12:30:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lf3Lx-0007S1-1W
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:29:25 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:45674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lf3Lv-0007aB-LE
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:29:24 -0400
Received: by mail-pf1-x433.google.com with SMTP id i190so7932191pfc.12
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 09:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NkrKVZy+fgyD1kvikyvZStAcGpeN0amBnxhbrI6xMXg=;
 b=W4zAKXm/CheFFCtbat574FIcjx6kq9LDA+umUw2H+YdDV28BU8buzKObc5AG/vb+Xk
 cbga9nRXauxyfmZyUD087HEne6eJ9RcjzSkabHOIsvIhNLPqvwSrhi23W7JsQROzSQ7a
 XCCsy5CrRtP4B0r/D8qznkHu0sAH3U5V/yXS1NcppiBWlz10t53BAGd3IVA+G7NsUTfU
 XLBKRVpQ4ZO4xfRqQrdnzJWqL98nm3TwAPI38LSayBDBk7IBIw+YeXC68+QhP2rnf/td
 Kw/M4tX4PRsoYZiHY7sOWU8YEO/3MI2FvqswsMVrfxLvN1yd5H0nY6ZmwHZz1qcxR7PT
 8a6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NkrKVZy+fgyD1kvikyvZStAcGpeN0amBnxhbrI6xMXg=;
 b=UtwUqrP26h0PBXA2PGWXyGCbqCY7Uhm+oMnOO08Y/tvC+jacIosU0xF39Z/wGaqUYo
 XDKhc5VHv9+tb6iZDQGEcX9SA0QesuEoGcenghzOWHE6faLAg5Ca9Som5/ezQFpB4LpX
 LS42YlqSnq9jvoc82rwM6Qrhyd2tqqYyFKX8YZHGDvW9gVBb7czXDcgMsb7b+gjD4q4g
 X/da04sS8CT9PAmAezgZdQUWwAuK8EFRH1oUaAQirbs+y2XMtHIyOQLU/JOZA63r2H+W
 U7jykRUN1vdjphsMK3tfMuwGTV9rrmXtj2ov+J2NwUyGXeFqGjWddqliXg+XDJH9UAOk
 4zgg==
X-Gm-Message-State: AOAM5320arks4UdhJVJkJgh6jEqSo2W21dZUTrhASiJPyUZZ+exMDAUW
 Wph1eL0SjMEM9dVbfW0euyGojA==
X-Google-Smtp-Source: ABdhPJwBpKiU2Oi1l1PS8Exp2JcIT7YV1lO8rlU7LkpDTiCmzMZUSIwIKlmr63GzzPCsfBIcZq/QDA==
X-Received: by 2002:aa7:98de:0:b029:28d:f7e0:ac3a with SMTP id
 e30-20020aa798de0000b029028df7e0ac3amr11068226pfm.26.1620404962312; 
 Fri, 07 May 2021 09:29:22 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id j24sm4741778pjy.1.2021.05.07.09.29.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 09:29:21 -0700 (PDT)
Subject: Re: [PATCH 09/23] hw/net/e1000e_core: Use definition to avoid dynamic
 stack allocation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-10-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fc07317c-a686-7f5e-7c97-cb67ebbd21dc@linaro.org>
Date: Fri, 7 May 2021 09:29:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210505211047.1496765-10-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Jason Wang <jasowang@redhat.com>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 2:10 PM, Philippe Mathieu-Daudé wrote:
> The compiler isn't clever enough to figure 'min_buf_size'
> is a constant, so help it by using a definitions instead.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   hw/net/e1000e_core.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Fix the commit message along the lines of patch 7.
But the patch itself looks fine.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

