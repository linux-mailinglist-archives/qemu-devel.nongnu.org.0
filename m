Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 503803AF6F1
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 22:45:39 +0200 (CEST)
Received: from localhost ([::1]:54894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvQnZ-0004DD-Ss
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 16:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvQmW-0003Uf-0Q
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 16:44:32 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvQmU-0008JK-K8
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 16:44:31 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d11so18741980wrm.0
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 13:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ntwA6+oMA8O/bUEPuZLxPQSN9TzeDfYnRtkqEP1Ly6Y=;
 b=s8whivGRJCKH0FSYqdFuvptobQHUairg0UkrTs14aljRR6kJRcP5QtcHbgPWIMsWUQ
 FbOgjYqvTzoRvuuA96+0s++x2HX/dyK7ePZeig7t89Bk3QrCI03hJyggQbffhcLsnVdS
 GynoUHRxvOJJ1MzHqKCWRaw9+JLVbvevDU37F6tAyRnqMGySmTdDw3EkA0DxwTMk71qY
 Ol8JjmzYRlDzUrUz2OH+jgcpDQ6PFRWKaa5jRnO6+EinVoYTlfNPaJgyy8thN1KLl/tU
 XI0X3r2UjDkZIJQDSVdIrfxIq984Gde67bBIbqhjHrfWzNgLERlpOp08AHwNU1A5CdMd
 XTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ntwA6+oMA8O/bUEPuZLxPQSN9TzeDfYnRtkqEP1Ly6Y=;
 b=k3bdUHF0dNXKDO4vRg9cvJspVVS0dpt/sDDXFdqLPb2OhDzOYqm25xA6Y7EPJE9ZSF
 vpjoNsXqFnuws436+vcdq2PwO9BYCqAKZA2pEfdXdDxxKz5L0euhxe+cLXJ+HMW2EIuD
 Beg5F+0a1W2y2Oo6OUNOyUBy/aMfMHN9xKFxzjbioAKzy/NLxu669ecXpjB9+Eivufr6
 MCQdNhBv4SIKKEfbRviAdVTC3eDfxk4XxnzSVkntO4AIYsN6OA1JshXYJ+VB68qyagnZ
 h9EdAELAYqWF9sntYDOa4LLjRNfu6pI19mP2t8XPG9z3KXg9lyP1VeaK+o3ntrzVFFto
 VBNQ==
X-Gm-Message-State: AOAM532YYxVg6st2V+lv1TvWzCTP8P53l/ldu8URkGvMmVwTBibiXo1F
 YwOo7E+5yNQX9GUNBpRtcGn7RB/F9zyweA==
X-Google-Smtp-Source: ABdhPJxRqARvus/VahPIkN7yAFdSkEA3T8X2IzEgqDQMQ39dEiyFuv/ZYqaaL7j7Vh6I5oh9RXhX0A==
X-Received: by 2002:a5d:4646:: with SMTP id j6mr342078wrs.370.1624308268226;
 Mon, 21 Jun 2021 13:44:28 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z14sm7590791wrv.68.2021.06.21.13.44.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 13:44:27 -0700 (PDT)
Subject: Re: [PATCH 05/28] tcg/ppc: Split out tcg_out_ext{8,16,32}s
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b0afcd3d-ed3d-ee37-c926-88f82ee3eb54@amsat.org>
Date: Mon, 21 Jun 2021 22:44:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614083800.1166166-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
> We will shortly require these in other context;
> make the expansion as clear as possible.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/ppc/tcg-target.c.inc | 31 +++++++++++++++++++++----------
>  1 file changed, 21 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

