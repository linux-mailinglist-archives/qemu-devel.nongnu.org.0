Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC243FBE0B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 23:22:03 +0200 (CEST)
Received: from localhost ([::1]:40908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKojC-0006od-TO
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 17:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKoep-0002l2-QF
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:17:33 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:44673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKoeo-0004a9-9n
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:17:31 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so917810wml.3
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 14:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P4tDNk90nPgz4lvE5jREfHccDlQkcoeXN4i2RORcRm4=;
 b=IxVa+n+2fH/1IhhsztPH5+hjJP1s3n5KGGphGT3ccMJKQPG79rp4tmbn8ASGayr/U4
 zEQKpMaAszK7oOb79TbeNUZLTdc5rceo7aNIoSnaT4+T4ZQmXosYJiKLU4qb8CCSmVsP
 asPqS5l/YqTzfOvVQId1DGi1VCzdi+AX2Lfz4TCxxS+hmX73Uq/tDKzIfSTXMuJyRvKs
 WH37pLGptn2xQeQE1+UMCWjMOHp/npMAIZ41GiUoJ+oBRVes2e+P3OrggM2MDoz59NRh
 TAB5WhZBzqxFuUTVBvpI7Mpi9jL8fUG3pQZgVRNvLH8upTL+rTzozSC7HwiLqsnm7ahP
 YHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P4tDNk90nPgz4lvE5jREfHccDlQkcoeXN4i2RORcRm4=;
 b=FEhXaAn3rAN3LdQ2okRb58nHkosDjh97gunIQnl6SB0j+su7Q4IwY03NNp4Bj80vxK
 0KJbC6DxV82NGTxoqo5NMg9HKgcWrY4l/S/JhjzDUBcIfznh2LABNwLP6GFnSDZYo5Qj
 /fPZ04Kt3h/UB9MYdS+FKFHQ/qiJeCBR/MqEfluC+QrR/fPSd3k5FYqF6jl4x4EjdIlx
 xpXTDmx0WNyhMxC3h3/rco9S7EDGGKJaJ89HPFSyUcPqwvQtMFzYOW5lwlc6rp8wEhm8
 ouWQfhOxW4WbpHgyxcB2m6qfBiW7HdAi1U/NFRFReKj4/ckCO5bfJrmXC4mXrKSAiAwq
 wXhA==
X-Gm-Message-State: AOAM533xsWSJvEdlOff+uEzB22+X8FIE0g42P5D+ik7BD2/97vp376ir
 lOy+QkaQymGPaPqxZIqXjWclZkdURxQ=
X-Google-Smtp-Source: ABdhPJzZVDUiDE3Ved5ZClYUgghb2hTaH6cSO9BsZr786zka+tQG4LZ7040O47mnA3hlsSNJJIj+gg==
X-Received: by 2002:a1c:f314:: with SMTP id q20mr945802wmq.154.1630358248411; 
 Mon, 30 Aug 2021 14:17:28 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id a77sm638965wmd.31.2021.08.30.14.17.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 14:17:27 -0700 (PDT)
Subject: Re: [PATCH 27/48] tcg/optimize: Split out fold_bswap
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210830062451.639572-1-richard.henderson@linaro.org>
 <20210830062451.639572-28-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ffcf55e5-e1e6-ebdd-75b3-d82b8d7175d6@amsat.org>
Date: Mon, 30 Aug 2021 23:17:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830062451.639572-28-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

