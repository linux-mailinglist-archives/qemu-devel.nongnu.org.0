Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361F53A5F4C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 11:43:48 +0200 (CEST)
Received: from localhost ([::1]:49140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsj8F-00043l-AF
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 05:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsj7T-0003Jy-FI
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 05:42:59 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsj7S-0008Nq-4t
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 05:42:59 -0400
Received: by mail-wr1-x42a.google.com with SMTP id c5so13782386wrq.9
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 02:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wDpmjTGyj3lrsBw98P7wjmZ2NC3NtDWuUaryH5s1gh8=;
 b=BkQZi5SvjmqZYxqQxycG7mI4HgvvJ7vO8cIQtly46hGsvteUkiJaARsxzaTq4j03AD
 Xxcz17BWqdFcn5/7docpT38Ao651jEwzgL+DSe3JCIl0xYO69ok0DL1z787rXbxYc0+a
 oCMlb2zVcxlUC5TvXvdwdZtGVZH6pvP2kQQppqCsbSgu9/6HxlVjSujKacDO1n/xvyvV
 HDjPeZXhlcwsZiIZJCNlzE2hIfJ0mQxEzk1KppFNs9vY+BieCTy5EpI/w0Aq4hlIbv04
 ruChe/YpdhCzRXp+aXncGuNj0Yhm+mYJJE65xQdcN1+DnTXkWAfP2p3flG0oT2d42Nsi
 a8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wDpmjTGyj3lrsBw98P7wjmZ2NC3NtDWuUaryH5s1gh8=;
 b=sH+rv2USjSuruxy4/oRcJM448Z1cLldOk5On5q/n/9bYqgLd3KNQkc1hoQj3bC+i62
 fmkIQkj1JJtjz5Mt42flNfRIUX0HsBbrv9RLzcZ9D32DKPh8wZfjVtXEHkePBox/sfKs
 zQXWu/iFDgKGwBfSf5JNLRhcRGxuxBexO65E9b+tOQt9rwbfsz7YD2F24nRyi/Zi3qgE
 p/K0endZUwWBIpfMCwWHQMnSVzRttggFdFOB3mTEumXfC+SYBIWq2TivjgHsAgC8H1sv
 noDq9x28oD3mIfc6IZFa4wl0/xnoYE+4Fl84PCEa5L2/DPv+xHkwt8VPzXZItTX2bTDE
 56hQ==
X-Gm-Message-State: AOAM532/HiXNK6c8UPs7+9eEdyR1XrzivWHYi8CmShDWeA1eoTK1DwBV
 HgK0xXNGjtKN6ZVIva2JgZk5tjPgrDpPkA==
X-Google-Smtp-Source: ABdhPJyQTn7LovqBBnqiYevkWtBgw/is4V/VmvghbyeFiE1ORPvebTcwvcPTZM7TVTfPDyLXmZsc1A==
X-Received: by 2002:a05:6000:188:: with SMTP id
 p8mr10441053wrx.296.1623663776823; 
 Mon, 14 Jun 2021 02:42:56 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z17sm10366592wrt.60.2021.06.14.02.42.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 02:42:56 -0700 (PDT)
Subject: Re: [PATCH 22/28] target/arm: Improve REVSH
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-23-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <80afa8b5-6eba-5faf-e229-063c4edda852@amsat.org>
Date: Mon, 14 Jun 2021 11:42:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614083800.1166166-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.144,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 10:37 AM, Richard Henderson wrote:
> The new bswap flags can implement the semantics exactly.
> 
> Cc: Peter Maydell <peter.maydell@linaro.org> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

