Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC56E3FBEA4
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 23:58:52 +0200 (CEST)
Received: from localhost ([::1]:54602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKpIk-00032s-W9
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 17:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKpE7-0007iq-2Y
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:54:00 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:33388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKpE5-0003NE-I6
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:53:58 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 j14-20020a1c230e000000b002e748b9a48bso749956wmj.0
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 14:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EAFisgytDExTseLj4g8yNeag3uiKia2iNBCIjJZUOgs=;
 b=GfCyFl+T1mVUXfiCdZkxs7dZ+ByTGOirmCoyp8xkfW1UFo1lGHWzpfhRth6qbC4+Kg
 ABC9BNDm53pdXWI0B6w4NvGOdXAq7rYLnqrr9X0nni1HNISbl1m1577LLovHQeI7jQjE
 3N3t0zgJCF1vRwg98r0Bn3KDrxfnnNPtd+DB7AkcMVxFQtWzJB+k2zLSlg3bzaW5X3Xs
 pnB3lLm/D3FFgcGS0angX+xieMYe9xgsQwnXJEV2rElvoloMiEeKWmaF7UFQE5YIsioe
 ntE/xoXy6NOFz5pOr2jgaCBEaBNWZhYdOoawLxN5cN005ZHCmYwJVtiFkorXUXZzo6Bw
 /Ofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EAFisgytDExTseLj4g8yNeag3uiKia2iNBCIjJZUOgs=;
 b=GY/0X/hjpgXWNm73YPqLye21a4rFcndpZyo2kSSZIoEaely9htS5crscRy0AKJg0tw
 YFA7LmNh9q4KyXRM9SSIkU/RBzszpN2hL11n7SIMue6VX4gZDpq49ChcJuCBzXE2+1Hd
 0oRac7GxEYG7SHdmcmciszamA9/5HbNNaTicJdb986EA9TaS8O3yMcO307Rs0KKnkw5F
 Z9P+mMlxMBSYjZTd9AHUCydYDetP8BrJNDKY5Cu8s8oqgO2/rtx+byP2f6G13I5vlnwx
 sD1UNqjieuQqWEKCRNv8ZWIgbbVDFIsXptDks8VaXdFdT4+fWNRLM+2U6RJMHzP4xLOL
 jH1A==
X-Gm-Message-State: AOAM5327alLbwFeOgqky8Bq5aevuGn2GTHWQOMLFyliq6vZs1BcUQwkD
 2ZKdHsyeGkCnJQttLxGEplISKm1crA8=
X-Google-Smtp-Source: ABdhPJw+55Eh0mB+QfCouMlrXmCxe6VXDqu0u/kra8jyXZMyqnAq5sBwg89YJFjMHR6T9MF6lJRtYA==
X-Received: by 2002:a1c:ed10:: with SMTP id l16mr1038178wmh.8.1630360435844;
 Mon, 30 Aug 2021 14:53:55 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id s12sm16750810wru.41.2021.08.30.14.53.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 14:53:55 -0700 (PDT)
Subject: Re: [PATCH 32/48] tcg/optimize: Split out fold_xi_to_i
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210830062451.639572-1-richard.henderson@linaro.org>
 <20210830062451.639572-33-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <96aad409-0b0d-bffb-725f-4e3361ec6550@amsat.org>
Date: Mon, 30 Aug 2021 23:53:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830062451.639572-33-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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

On 8/30/21 8:24 AM, Richard Henderson wrote:
> Pull the "op r, a, 0 => movi r, 0" optimization into a function,
> and use it in the outer opcode fold functions.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 32 +++++++++++++++-----------------
>  1 file changed, 15 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

