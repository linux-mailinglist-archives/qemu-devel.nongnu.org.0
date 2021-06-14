Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C4E3A5F31
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 11:34:49 +0200 (CEST)
Received: from localhost ([::1]:39542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsizY-00057l-9N
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 05:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsiy7-00045z-Hf
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 05:33:19 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:34697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsiy6-0000y4-6B
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 05:33:19 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso9008110wmc.1
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 02:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OjMtDuKYVySnXuFo9LOOiklkKRO70Pg80eQ50nK27CQ=;
 b=ESTGLrRrvL90klkUeT3meXdTyk7dn0MJqiZYSj4kxFnpjdKj/8WqED4/Wepd+sOE+w
 IeAKMIs4f48cf4YRhNJk3jUPxNZRn/IXQ1dt5565dp9zJ/pszQ34lTG3THNXmr6BMVZW
 F+wG/okx3DgwhcMlFMO1DAV3sLOwq65zhje9hIRuRJtqHl/2QL/PJwU2skds1yo+7ISr
 KPOsAxvf5jmoN9KTd9QGQfcmlp8+Fq2modmdXiE1/RFLDT0DKvU7qbeKn1T2VwqVhDBe
 Hzl5cQVPKpczbtR7JTYD4nCEvv8lW2FrYA/RWutW4oqNS3lBdhyy1tObBm2ccmjwWsDB
 XhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OjMtDuKYVySnXuFo9LOOiklkKRO70Pg80eQ50nK27CQ=;
 b=fXMBDYQmIWTYXtXSKJb4S8MMlAsYw+/IiE8VUFSEmEZl5wKfLjQQEcUyJwbOo1/43m
 psBNzfMVr4aJJvxRXimIW2jkg/9aSrbeXgPvOS2zuJGgHjGhofAdKyeyuvElp5LpX4pw
 aA0bKNHP/TILpGUOnBbX/TNZxuAf03WKwQPZiySeqiY6ipnoy5En+6GrW20SNmrrQTe5
 Ar4U3ZynkdxCkRNyzV8xcq2XnSoQ+73wqCgSuA0uuoB4qQNFBdu8cYfFJtAOT2I+okp9
 VHF6qyHHEgvxrLMMYkcTk4WSuvQ3P7ISTxnbCeLmZ1sr6mpPeRS0ks7dPa88pVatLKKf
 eIeQ==
X-Gm-Message-State: AOAM530Iv04VDTD57EyzXrTBua1pnlfmIhtsYq6NRRhPT827oU4zEmau
 RswVuOvRgSEeVKFq+uEEZDecAUFsjCabMg==
X-Google-Smtp-Source: ABdhPJzqjiEiiAMxFjePEznfLc2NHynPhLa9P2pMIgKqX4rzo4R7sHPxClvNpaZGiOix+2h0Z7b6Vw==
X-Received: by 2002:a1c:a3c3:: with SMTP id
 m186mr15929454wme.154.1623663196512; 
 Mon, 14 Jun 2021 02:33:16 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id i16sm12535647wmm.9.2021.06.14.02.33.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 02:33:16 -0700 (PDT)
Subject: Re: [PATCH 15/28] tcg/tci: Support bswap flags
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-16-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <aa421da9-7f2a-76fb-f092-9b5a6613eed8@amsat.org>
Date: Mon, 14 Jun 2021 11:33:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614083800.1166166-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 10:37 AM, Richard Henderson wrote:
> The existing interpreter zero-extends, ignoring high bits.
> Simply add a separate sign-extension opcode if required.
> Ensure that the interpreter supports ext16s when bswap16 is enabled.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c                |  3 ++-
>  tcg/tci/tcg-target.c.inc | 23 ++++++++++++++++++++---
>  2 files changed, 22 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

