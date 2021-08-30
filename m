Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD743FBE79
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 23:44:28 +0200 (CEST)
Received: from localhost ([::1]:35688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKp4t-0006fS-9d
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 17:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKp2y-0005fO-Rx
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:42:28 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKp2x-0004eV-E6
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:42:28 -0400
Received: by mail-wr1-x433.google.com with SMTP id x6so16193603wrv.13
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 14:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ppMDxWMCzrcAOV5ZI0ApFbFnCECBR9z9LgKHk41fDvI=;
 b=mdbX/ltrEEipnKGznrEq4L+EwIQvwXbsqP2iRHcRkv0IIly01FZFsnV1ZlhrzGoiRB
 BbcTX9jr33y/CSm8iDFafwRWiusYE9iso7m6tRIJVC2LBcN89V0nCkheiE3f1q4pNRCE
 zQ8nmP2ZtdEK5/8avbovv3dHKo+bFbJZfgzgwfqblCBlreY43b1H4s4E8qjIfCy0mqgt
 L4E0jrTg0J817oZzYtQrRtotdvidfqihIHVgb2CtiXophSOv1GPNkynZE/mtEDaT3VZk
 7l0m8v0ZK+mOnaOoiX/lj+TFTvhgSDyg8nTdlAXIeT9B6RNvv/Su8fglOcLdYYINSsbz
 YvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ppMDxWMCzrcAOV5ZI0ApFbFnCECBR9z9LgKHk41fDvI=;
 b=nO5jXRVpr9CtLf5+YwvEfbzWQIFwjP3l6WyOpPYCnHbpKeU+P9tN1w8ndRXi8zcfN4
 KOqeeJkCm21/4jqsIjFXcBqTkgiR9CWx09dT4K9tIKgdacsCy6oZABy4H5q2MSxzKfrd
 3LkhRMjVC8KPuzJ9nXfYJlu1LQjhQitu9YKj+RW1LSKLGbt7JX635gvCFDNKjUmFx6lJ
 575uP6bFLn31YP8Ed5YWac8YTPYU0p6nk3HndX1iR5Y/lRYjXyRLHE0VPXLV3gnDCORG
 jmChAawmN2bVqMU0Czl/h51xdO572cuW6TmHYycAtbuROC7ihsWMZ6zJ9YgbVZ/qCMPf
 Kmtg==
X-Gm-Message-State: AOAM532cRVBmsmMJ1zHecqEPIAe4BRQxdEExNj3px/xKGt9jMOHdl4Km
 YmMexOyJ6wPBBCA1gpG7idBXucLYr8o=
X-Google-Smtp-Source: ABdhPJzmt+wXKTP+BmKnflGqUkem7z+KdvWf0CIVwCnflpqfECiCv9N88ZwiuK+sOTiSOkHrokZnSA==
X-Received: by 2002:adf:c442:: with SMTP id a2mr28368629wrg.228.1630359745559; 
 Mon, 30 Aug 2021 14:42:25 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id a10sm573044wmj.44.2021.08.30.14.42.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 14:42:25 -0700 (PDT)
Subject: Re: [PATCH v3 28/66] plugins: Reorg arguments to
 qemu_plugin_vcpu_mem_cb
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-29-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1c22e5bb-116e-6af8-5527-4585bd901642@amsat.org>
Date: Mon, 30 Aug 2021 23:42:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818191920.390759-29-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.932,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 9:18 PM, Richard Henderson wrote:
> Use the MemOpIdx directly, rather than the rearrangement
> of the same bits currently done by the trace infrastructure.
> Pass in enum qemu_plugin_mem_rw so that we are able to treat
> read-modify-write operations as a single operation.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/qemu/plugin.h         | 26 ++++++++++++++++++++++++--
>  accel/tcg/cputlb.c            |  4 ++--
>  accel/tcg/plugin-gen.c        |  5 ++---
>  accel/tcg/user-exec.c         | 28 ++++++++++++++--------------
>  plugins/api.c                 | 19 +++++++++++--------
>  plugins/core.c                | 10 +++++-----
>  tcg/tcg-op.c                  | 30 +++++++++++++++++++++---------
>  accel/tcg/atomic_common.c.inc | 13 +++----------
>  8 files changed, 82 insertions(+), 53 deletions(-)

(now v3)
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

