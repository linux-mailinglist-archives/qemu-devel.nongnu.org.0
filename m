Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C70201EBD
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Jun 2020 01:46:21 +0200 (CEST)
Received: from localhost ([::1]:49238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmQiC-0001aa-DZ
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 19:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmQgt-0000Gm-KC
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 19:44:59 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:45277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmQgs-0002Ur-4O
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 19:44:59 -0400
Received: by mail-pl1-x643.google.com with SMTP id d8so4579287plo.12
 for <qemu-devel@nongnu.org>; Fri, 19 Jun 2020 16:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Oz/8lmGaQ/euwDwUdlzaSW8+tINnaGVYs5pfXT02Two=;
 b=U8zMX6SlZBCvtbncKyowmbWXt/w7LYSyfj49vTBBkIz7cy+PtsicV4wNy0siSWhSVN
 e08MbDg5BgUvMf1Bna+e9b0LK6BBylhGLWrLvKxgb8ORx1Oa1nfCTk6meg4WynyG4dpH
 m1MD2T6Iw105L/QPf4hkq+6+ZovjnGFXKiewAarAc9qldTvI4cNFdv8EfWUu/inFqqoe
 7b6c7OODN86NNLoy0CtjIwFIsXrCV/Xjw4YD54+zZZrNChjxe6nlv6prj+dKDDERfz5z
 ZC+8swlwaAcYpUMiXY0akV0Ihnjngce6LvfA4D5EEgltFEVVG5zJUYecuiwIdyMfyVlM
 aTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Oz/8lmGaQ/euwDwUdlzaSW8+tINnaGVYs5pfXT02Two=;
 b=Iqwlsz2i7GayYjXmjlXgqdaz7y8JWM2s3vlqeGx9N+GzCNb/UEljIa1bNMelUAh+rs
 CkFjtJHpfZQ24x8fD8lt19BcB0WTL/lZT3rqAp39l6YMNhN9g6MEeXKfUiCgkI8pPb9h
 6VaZSct+wjJGQFGRGKRVkhyfFHSGp4HPPuMmO2htbk2FZIgUCakTQim7x9+C9jI/V2U7
 27RH0jjwNMHvlqsTMftmpl1s6Vzz1UJSgCXI5Tf1iBy8LaSXd20Jc6YQAbv/LHfKQU68
 EU4LrKd0K/hDfTtP5mCMXj7FBAZkxJ7Zxlwr5SPTHebQ5MpbMNZRpnd6018WBx+zEc43
 XHdA==
X-Gm-Message-State: AOAM530PGFCdYoqWqYVlRjbRj6V1fcgljW4fC7+/EX6CwiPth3ZkghuT
 qn4y8gVdmXvtvlWj/kbIxEUSbRcRPHc=
X-Google-Smtp-Source: ABdhPJzMFqcgqA7aPnp2oCk38ibJQInvw4AYbnjftoj5tB75AmX0HCCik3MnyLJbBTdEvx4WaanbdQ==
X-Received: by 2002:a17:902:ff06:: with SMTP id
 f6mr9780266plj.22.1592610295717; 
 Fri, 19 Jun 2020 16:44:55 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id f200sm6896281pfa.62.2020.06.19.16.44.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 16:44:55 -0700 (PDT)
Subject: Re: [PATCH 15/21] target/arm: Convert simple fp Neon 2-reg-misc insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200616170844.13318-1-peter.maydell@linaro.org>
 <20200616170844.13318-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <16597338-096c-06c0-3b5b-9966bfe0b19b@linaro.org>
Date: Fri, 19 Jun 2020 16:44:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616170844.13318-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

On 6/16/20 10:08 AM, Peter Maydell wrote:
> Convert the Neon 2-reg-misc insns which are implemented with
> simple calls to functions that take the input, output and
> fpstatus pointer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.h          |  1 +
>  target/arm/neon-dp.decode       |  8 +++++
>  target/arm/translate-neon.inc.c | 62 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 56 ++++-------------------------
>  4 files changed, 78 insertions(+), 49 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


