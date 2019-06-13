Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1A144EC2
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 23:54:38 +0200 (CEST)
Received: from localhost ([::1]:45952 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbXg5-0000rc-K8
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 17:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52099)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hbXNJ-0000yt-Kw
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:35:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hbXNI-0003dA-Fc
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:35:13 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:38334)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hbXNI-0003c9-6a
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:35:12 -0400
Received: by mail-pg1-x544.google.com with SMTP id v11so242261pgl.5
 for <qemu-devel@nongnu.org>; Thu, 13 Jun 2019 14:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n4y/JuQDvgzbZDtApL7lR7eGa7Q2dW+PtCzkJl0mpnM=;
 b=eMG92JBdPblydN74EAbYU/Nzsa8ekzzWzjOmqZgVbgVQWgThCD7mipFsxZa404Uh1p
 YkT085uMubpYeyTd/Y4WNcgyNU8LTPhJaGhNwSoEPWe+ytQTezT/tRzl9bbVuBVMdAXw
 uuwGwIP1nC+YX5++Tb4GOXNwEIxu3rzdu/QLdI4Z87jRxvjQRCjLlHj+WIzhnNiURYYP
 RE3o/ifbnxFgrud+lm9KPOPJ11XIUkfF0eaq4A3c7zm3r1/e+dmS0QX/Rn/v9YUwIpl8
 6eUzLguTSHBk7r2xAFWG2oMmcU+1rKOcmir1oCOLhrU8B22oNnYzvGdDb5wnJUA7RL1m
 v9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n4y/JuQDvgzbZDtApL7lR7eGa7Q2dW+PtCzkJl0mpnM=;
 b=CNzl2O5kFUUmN8VZTztC+7rlxEM/4Xbuvv5kDNlLPU2Aj3il0HxsMJnCmdIFIPjTjG
 xNJplNq6relAoaFFlVDVCaYC97GNUZ9UfUFRBQyEbaRfuCsKViwfEKcz/m9Yf6ZLUvj7
 gBUGzjhLrBvuUTb4D9aSuWkns+tlUKDBtkMehlRMWn7GAOrFP0Dqy1PezF36GmmdOvjo
 wBzlPjMAvsRabptg9p6JIPpF0b77iYVyvuy1A/g7+XIATmEHxgMfpE5yu8nSM+9fpTjy
 /uiRgNNNpIBTuQpkRNV0O4fxj72QXP8DNHNU4Kd4Q66RFDryXG0Eb2+aNwHchrSWyZYx
 oFmQ==
X-Gm-Message-State: APjAAAXgIOIiAkLOjaU+zzwl8z8jyPfSUXa+h+/qyT2PKhxHmZJ+Mkit
 FhOLf8lE0Nsvgp8jNfzun/2mbD+aKSc=
X-Google-Smtp-Source: APXvYqzOkttcy8nu09TII3H+D3PdsjMGKLKgQMLtukyz0OpchOXniH1xtcQ6kk5K9AKWNSrhmv548A==
X-Received: by 2002:a17:90a:9bca:: with SMTP id
 b10mr7569124pjw.90.1560461710950; 
 Thu, 13 Jun 2019 14:35:10 -0700 (PDT)
Received: from [10.10.150.239] ([149.199.65.200])
 by smtp.gmail.com with ESMTPSA id u5sm673204pgp.19.2019.06.13.14.35.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 14:35:10 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190613163917.28589-1-peter.maydell@linaro.org>
 <20190613163917.28589-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0a2c1c9c-6e4d-ffba-31fe-057cf394c592@linaro.org>
Date: Thu, 13 Jun 2019 14:35:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613163917.28589-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-devel] [PATCH 12/12] target/arm: Remove unused cpu_F0s,
 cpu_F0d, cpu_F1s, cpu_F1d
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

On 6/13/19 9:39 AM, Peter Maydell wrote:
> Remove the now unused TCG globals cpu_F0s, cpu_F0d, cpu_F1s, cpu_F1d.
> 
> cpu_M0 is still used by the iwmmxt code, and cpu_V0 and
> cpu_V1 are used by both iwmmxt and Neon.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


