Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B43552584
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 22:12:46 +0200 (CEST)
Received: from localhost ([::1]:51260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3NlN-0005XC-5Q
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 16:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3NiQ-00042H-0O
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 16:09:42 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:37667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3NiO-0005xx-BX
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 16:09:41 -0400
Received: by mail-pl1-x632.google.com with SMTP id p2so1276731pls.4
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 13:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=OjubFBawc2vGWHuA71NElY6a51cmMcSppc+wSgN9TXA=;
 b=LhAkq9FpFIY1aZrkh7/WAMK8MS/BrrHdSLM41bMSFI8f4ax4KppoaS1Tf/KmEXfpmn
 kuKY1OeBVtFwLFdoNycxesvWpO47F/9QI5IrG11ZBN9XDBITrhfLV9m1jaJZjjDES1J4
 cj22L4KT3ghT+tQI4nJkoX42IKdKUbBNTwtIjjboHilTXE8UmD9pIoP+7c4pNHnyo/YR
 11vcV/UCZkjFIjGzCHbl2ebRPQae97rZcVgIUVrEX+MO8w3M/FvJ3n2oAcfiFrubxNGp
 ayVF3wNaRzAI0hVZp0nDICbS0oweFXaO5mqNyC9EcHUyAo9BW1yLOFz0p55fe7n5Of7m
 tgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OjubFBawc2vGWHuA71NElY6a51cmMcSppc+wSgN9TXA=;
 b=lEoeEEdhkc0fuLzTQ4ym8c+p0w8XGnH9pZQsbyhSBpWcDNRjSp7oWxsmwLe4G7w9pe
 C65wTNQHTV/jrM47A3mz7XBaYkwuJlKjKPkS+uKt3as7sLveB3qUf5ycC+M5PNfb/YsI
 H/I6+p3LkbYyvkerMiEyNUYk0xicIJSaIku1XaE2AYXEHiIsuXi2KGzAf0zXoTnOvW+d
 PPDXz3kN8PYgjeelQ9jkPv70qMzI7E3+RdcoUkPxAsSWnbGig1p/s6tzKWtO9wyXbWzT
 nIeE3Wvi4gP0WPgCz8NgOURl6eRcuhKJudJbMpWOFBhS+k1t19oOBRNkcNNml6ai2Aqo
 cmSw==
X-Gm-Message-State: AJIora955z1HxkehzRUbg3mXh/2r39XxM6sf50KnZltulxCId+tjLQOv
 rrn4iYkZPBczYpBZ6A3w52MllA==
X-Google-Smtp-Source: AGRyM1s59pzEyp5+QNkfay8Xf11FNxMbQ1qFX6kDIwPxEsIJjW6iDE0ayNYtVXgrbtUtDKzMrPuzmQ==
X-Received: by 2002:a17:90b:3149:b0:1e8:505c:9c13 with SMTP id
 ip9-20020a17090b314900b001e8505c9c13mr39667608pjb.111.1655755778863; 
 Mon, 20 Jun 2022 13:09:38 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:a3e0:8a80:7b85:aea6?
 ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 i19-20020aa78b53000000b00525167c5ab5sm4364168pfd.81.2022.06.20.13.09.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 13:09:38 -0700 (PDT)
Message-ID: <086aaeb7-7af7-2a98-bf47-17bba3677d08@linaro.org>
Date: Mon, 20 Jun 2022 13:09:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 06/13] accel/tcg: Reorganize tcg_accel_ops_init()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
 <20220323171751.78612-7-philippe.mathieu.daude@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220323171751.78612-7-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 3/23/22 10:17, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Reorg TCG AccelOpsClass initialization to emphasis icount
> mode share more code with single-threaded TCG.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   accel/tcg/tcg-accel-ops.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)

Queued to tcg-next.


r~

