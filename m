Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 465873A19B
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jun 2019 21:51:35 +0200 (CEST)
Received: from localhost ([::1]:60190 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZhNG-0000Cv-FH
	for lists+qemu-devel@lfdr.de; Sat, 08 Jun 2019 15:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38546)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh3I-0000qp-AQ
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:30:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh34-0000Mu-3q
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:30:48 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:42347)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZh2v-0000HV-08
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:30:34 -0400
Received: by mail-ot1-x344.google.com with SMTP id l15so4903686otn.9
 for <qemu-devel@nongnu.org>; Sat, 08 Jun 2019 12:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LMzQk4Y7khwLZeHTip54tBG4cBcy0DJX0SruCB6JJ4U=;
 b=yeVtzwklONBmkIaFgKN0xHGdZ8iAs7ZXe+kt/tE0zFx0jgz4sm7s6h2iE8nd8VoTHC
 wCBwAuLM3btTkjFONGgBDCkSpeRaHrAU3gu9OG/wI9rfKKA8a9MGNbJejJP//0lwuLeT
 KvbfeL8GTBlrG2jTsTAwaW3opqVxj0vsO9J1g4/1JdSRdndEhaC2g6+s368KdeI3xJIf
 5ovPbQPuj2FKHtLuV5gxD8/uqAywflFX8bA2ZfX1MwJGhdocqbBc2D/5nqA3nwLA7LsO
 ets1htpNO9nDreE9vbuWtdZFaofX33LhMFAvQgjwcYlV1JNqU2R8ZNYdKEVCijR70qVN
 eUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LMzQk4Y7khwLZeHTip54tBG4cBcy0DJX0SruCB6JJ4U=;
 b=VRVZGdJtHRPSOWq1efJ9JAUXunAv47/14+Kjbj4jb7mEtTmJX45KfgT728DFnyLhvs
 +g8DrNonj1WyhnExkBwhh0Y1sIGqkfHmzrzYNKZXudBMexWWsfsQa/RvRhM9XqAGJaro
 GFc6HPn9rQJaXpJr+zwaaIn9eGzbjnlQch2PHCM8kJJhKyzV2ajBMi2UwSW4wtl0i8zu
 PhWpeuVlQIOU/X29zZE9SQzI44ZuvX5PlxhpWPNECtCdfXUm06TVJhgKIwbWLE0CanMe
 amkQ00VcQf0NANWDALb98ukpvt5abn0KLNoO/RVPhP/9yTuEJLnav6S8kXkFNTYj7XlO
 UcRA==
X-Gm-Message-State: APjAAAUZGfSY1MDeIcZq0M/d5sZxweOPrW3Cf8Zf5NAF62CLBMsKSkfb
 COwAUh+6qHCuntWR0umbLwudjTeiL0Tmjg==
X-Google-Smtp-Source: APXvYqxkJ75jAngHjIO1+uY3UWFcyySOLPWqbl6G+LUHs0F7HorvMm47toFaCPq4hHFaBHaUEKgQ0Q==
X-Received: by 2002:a9d:14a:: with SMTP id 68mr4850155otu.96.1560022231748;
 Sat, 08 Jun 2019 12:30:31 -0700 (PDT)
Received: from [10.219.49.199] ([187.217.230.84])
 by smtp.gmail.com with ESMTPSA id r7sm2066437oia.22.2019.06.08.12.30.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 12:30:31 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-38-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <023f5fcf-9efc-478d-aaac-b70a31228ef4@linaro.org>
Date: Sat, 8 Jun 2019 14:14:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-38-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH 37/42] target/arm: Convert double-single
 precision conversion insns to decodetree
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

On 6/6/19 12:46 PM, Peter Maydell wrote:
> Convert the VCVT double/single precision conversion insns to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 48 ++++++++++++++++++++++++++++++++++
>  target/arm/translate.c         | 13 +--------
>  target/arm/vfp.decode          |  6 +++++
>  3 files changed, 55 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

