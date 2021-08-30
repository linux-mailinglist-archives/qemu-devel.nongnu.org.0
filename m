Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA5E3FB30D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 11:21:08 +0200 (CEST)
Received: from localhost ([::1]:41184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKdTX-0002mr-H3
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 05:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKdRE-0000jh-S9
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 05:18:44 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:34619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKdRC-0001EQ-5d
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 05:18:44 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so11036042wmh.1
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 02:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PqyI5+DuEnGz7g39olx1hPoSGf7vw/at6+/hZmuFDgg=;
 b=XbiKpmpee4v06SLp7uKoouV2Oxrcjoomc0d4jOJG3g+QMcw9qtNrShQ3cruguu56u9
 Fi/81RLLqXwD0Ti3aI5bb+0/aHDKRBCxyOnwFid70uD/eZxE9ftT92yToHjXhlnOT4vx
 Jb+24WNuB+COEHdpTFYL3qv3DVJGE5WrRgp1Tvm5UrAD9tKMHmEOQ83yvHAysz+1ro2o
 sUCGzQi4GhvMzNiUNuGtY+y/+04pvx0MCBcc5PBx2drzUkIgiZt+Nwv+/Nb1wwb8s23B
 rzs0k1MD2FFVS5qK3OKYYDH0j2ihm//14u0aEXn0MN0wfOYK7QOz8oNpZv1Mb+4GMtnW
 yFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PqyI5+DuEnGz7g39olx1hPoSGf7vw/at6+/hZmuFDgg=;
 b=DLyYJzISSz4sWFBYHG6+8kUqtDPCwQQJODHqKOhrYEM2zA4DpKNcDBMwEXbb0E/LJ2
 D7h/aoaoR4Azw6H4p0co4RassP5t+XARH2EAR+e5k1IHf42cmUn8CCqN81tzuUJLfsSW
 RyIKRZixHwY/DyyEFDUd8R/Bf7xxo3U5JVqswgdirgqbHZ9Z5uRiKqyKqDuhLSrFODkT
 Yhezfwk3oqhO4KKUnbAanF2sTctn9nJvn/FrCFCSey3Qi3HZoJDqvgoClv/6jyJr8bsi
 iro0Xq9y7SeJevYaWQcZIFHP62PrJRYWqtZX0e2BrMEjkIIvEJazd7aZtgkFALkZwJyy
 DSQQ==
X-Gm-Message-State: AOAM532b0MK9ESqYnNvsTiq4fUmiirDhKgrZeKblq8DZJyCERFqaxeeb
 CM2rkNh5hwR63kOHJVJABItd6BEX0M4=
X-Google-Smtp-Source: ABdhPJyPvVaRqg6bvAEwjz+FFXQpwOlUOPdN0ThdYqj7KcI1/slnU9KQEkvG2R5DAkF1BxMK2CoL5w==
X-Received: by 2002:a1c:a5ca:: with SMTP id
 o193mr31234506wme.160.1630315116408; 
 Mon, 30 Aug 2021 02:18:36 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id w1sm18295603wmc.19.2021.08.30.02.18.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 02:18:35 -0700 (PDT)
Subject: Re: [PATCH 07/48] tcg/optimize: Split out copy_propagate
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210830062451.639572-1-richard.henderson@linaro.org>
 <20210830062451.639572-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d6566f9e-2497-3cd0-6355-28da2c1e627c@amsat.org>
Date: Mon, 30 Aug 2021 11:18:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830062451.639572-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.58,
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

On 8/30/21 8:24 AM, Richard Henderson wrote:
> Continue splitting tcg_optimize.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

