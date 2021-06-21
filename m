Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC0C3AF213
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 19:37:24 +0200 (CEST)
Received: from localhost ([::1]:60818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvNrP-0002g0-3a
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 13:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvNpI-0001b1-GY
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 13:35:15 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:42728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvNpG-0005ic-9F
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 13:35:12 -0400
Received: by mail-pl1-x629.google.com with SMTP id v13so8964413ple.9
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 10:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JGkrghVKw3TU6kJ1kxdLP1/wiKtrP+uQFv7rHYItPsw=;
 b=s+qv1f1ouJbOEqd0o0muGwNkz5982s6UVTvy7HbKRmpVSGwQTos7ZvK9m165iqOWe6
 LALTyF1xZmqiUT821XTLpZn9ZDZjjTm2Qj0DsnBiIe2U6IF1ieVQXTSB5wTmy42FIw8L
 XUuVRNJgQc8YIpGRhY7s3UHKjCtiS2p+52JxNbcNL4D52NGBIC3+Pq4DxOMbELruE6vV
 IuV2s7qTdnJ3DRdVbyKAs98attKrMKl4DsdtVvvtcmgiUW2TvfER66b7LMs5U0wCB26o
 AntUlEvOrpaDYnsaBFYvWOdjW6obvvXmBqw8Imebu1xS/Nbk1kgPDC9rYr/chX870Rej
 SzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JGkrghVKw3TU6kJ1kxdLP1/wiKtrP+uQFv7rHYItPsw=;
 b=DSd7ttBEVNrtmmB94OEP7hVVj5w4OUcU2+NT5AnvYlCIXlB6xZe9c5sl2O/NMtvaqx
 UEimFIp8owO7JVezshUk5ZqcPJqFnyuUxoy99DlPvPOEq0pEyuZGbfcpQ/SonVWUTN+s
 NshXXQSpo6stXQ21MlnDU4PGLqAiZdXQojrUDRkmm8fX2Tx8VSZ7WSbpUGqsX6PDDZve
 5Sj0d77z/ySXq1cxGOXUQNn0BNemaDjmPC2vcaOV0v85y0IRBtfhrkBY58hUez+6yAkc
 J68XUEqotmaRVLkPeIsLOrgIUtaWq1IsGk1Jca2rEm4+fpclpa5Vl9UDcw1Hmc0hEy4A
 N6Ag==
X-Gm-Message-State: AOAM530Kr8bfxiwqbPrzXRhYNwQ/hu/IeC1RgEa8p8nb3TFk2Rqkw23n
 GlfWSdO6sg2E5hx/UBDeBdZrnRQezNbbYQ==
X-Google-Smtp-Source: ABdhPJxgfN1+idmZ6pdmbPSNgQi5yqpYVqLufo7WmfGi8mXoZK/12UrhMFtTA6Y/ciyiG9neb50+cw==
X-Received: by 2002:a17:902:b210:b029:11a:bf7b:1a83 with SMTP id
 t16-20020a170902b210b029011abf7b1a83mr18883900plr.84.1624296908419; 
 Mon, 21 Jun 2021 10:35:08 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id n8sm19652936pjo.1.2021.06.21.10.35.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 10:35:08 -0700 (PDT)
Subject: Re: [PATCH v2 09/11] target/cris: Move delayed branch handling to
 tb_stop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20210620213249.1494274-1-richard.henderson@linaro.org>
 <20210620213249.1494274-10-richard.henderson@linaro.org>
 <20210621171547.GN477672@toto>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e3269f64-a1d3-6955-843f-1d86b931fa60@linaro.org>
Date: Mon, 21 Jun 2021 10:35:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210621171547.GN477672@toto>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/21 10:15 AM, Edgar E. Iglesias wrote:
> On Sun, Jun 20, 2021 at 02:32:47PM -0700, Richard Henderson wrote:
>> By moving the code here, we can re-use other end-of-tb code,
>> e.g. the evaluation of flags.  Honor single stepping.
> 
> Hi Richard,
> 
> Unfortunately this patch seems to break one of the CRIS tests.
> tests/tcg/cris/bare/check_xarith.s

Hum, that's currently marked

# no sure why
CRIS_BROKEN_TESTS += check_scc check_xarith

> I have an old image with the test-case built in the rootfs...

Can you share that?

r~

