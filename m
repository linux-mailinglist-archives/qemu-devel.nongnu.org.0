Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E089E3FBE58
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 23:30:56 +0200 (CEST)
Received: from localhost ([::1]:49022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKori-00047f-VT
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 17:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKoqO-0002tl-N5
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:29:28 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKoqN-00043R-4w
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:29:28 -0400
Received: by mail-wr1-x42a.google.com with SMTP id q14so24387993wrp.3
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 14:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i/fPr4rj6ONeOeQSL+81TvzPicYneetzIRW0l7yZW7M=;
 b=dr8QptcxLHSDvIusFjdKkBxN9ue3u02x+s8El0+v2vQQsEfbv7CSRCFhAPH23Ibwnt
 Lis4gUIEBQFRRRAXJPiDHy+uxJxA9dESrRcvUQEq5c44zi7SB4RYZnDStd4nm9dprksC
 o61EGp8/kFZsDlvgxji1z/4bsyBjurWU49dstTkpvXR6lr/jfxgJ7UHtX+EkdmZCG5ww
 27u4apzAkTohRezIIt2rCFbhXN40+eYH3kVvA3WVWLhPh8uCiwjVVXjvimQAXCAfS6oE
 F4d/jxrk1AjItQCYtWVEjTF8IoOLFOvwIkkcs7uq64jRlbYSOhz8wVucAO1EM0/vLFQr
 1QYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i/fPr4rj6ONeOeQSL+81TvzPicYneetzIRW0l7yZW7M=;
 b=nVfQeHCSrcHlhpVcpeIfpZ8kbS4OnVsZL8GYfYjfb8SQYxwRSAjsYGLZhpjfScf9hO
 LwQbxkGwViCN+0cbPkclhi115GjUbn2gSq2qeLpvPCrpq1oe14LRVxSyESX0+ra3PafW
 8gRJbgYX1V4mAEfuclfNws8wII+dQG/lKEJTcttfqbgYiOWp6dLoBi+2R6s1kqpNrNAw
 DVgnodUKzJKJzVlSAsuxwADDXAoqXwtZbvPpKKyXCmRLu4zz8DBK870Gw7SWCTnV1CiT
 53BUAYfdqMJV14xM4CM6FU8MGZpZkZezkPXtzk76i4aMgSutRPKMeoC0BcEEMlducwuA
 K5PQ==
X-Gm-Message-State: AOAM5330VS1beCnjfIfdCygZ2c0PjpKWIdXb25p1uZY3FEF1gHpTb80a
 08zi6eAd6ufuOQ+IySGYxMJI3YsCfAg=
X-Google-Smtp-Source: ABdhPJyUhbXhvw5RsalLueaxXtyY/YQqrbJVmJRmqEZD9oBKcx6jozqy+GS4QIYRLomIOiJuDaElwQ==
X-Received: by 2002:adf:9e01:: with SMTP id u1mr12874666wre.420.1630358965534; 
 Mon, 30 Aug 2021 14:29:25 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id f20sm583640wml.38.2021.08.30.14.29.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 14:29:24 -0700 (PDT)
Subject: Re: [PATCH v3 66/66] tcg/riscv: Remove add with zero on user-only
 memory access
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-67-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7e971ac6-bd81-80af-0b6f-dc6502986101@amsat.org>
Date: Mon, 30 Aug 2021 23:29:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818191920.390759-67-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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

On 8/18/21 9:19 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/riscv/tcg-target.c.inc | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)

=)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

