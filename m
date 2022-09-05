Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B07E5AD6D6
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 17:49:48 +0200 (CEST)
Received: from localhost ([::1]:33942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVEM7-00085S-HX
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 11:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVEKe-00064o-Ve
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 11:48:20 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:50942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVEKd-0003rH-6s
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 11:48:16 -0400
Received: by mail-wm1-x331.google.com with SMTP id j26so5488482wms.0
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 08:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=G+Encb835y7NEoCUZIVOMFOEiz+b6nALgrqyT0dm/ps=;
 b=qUbJ+qVPHiGqy6Ajn50YsfdTvOa7LPHShPeQjSP5FqAuiHpRQGivwoLmxpKb2cZBNg
 b1lfrhBWNfL5rUuMvC6Fta5+ws2A9kMi0JH+ogkiAPzsmXCjNCFe3kgLQklYFq3pRFcK
 AkCAow6IyWHr3FpFraPOWqxS+fndo7+JSTyHJ5fhp8JJazR2Tsh/FULLSljI+lbw9e1W
 AR17qFVCmmu8v80OV7ASyh0RoAcctQm4y1d1s9Nr/BhriPjRvRZspdu/N2BnB7TB0Tvf
 HMpaPeBF6HYdJnGa7lYOfW6lyYIEMMZgwf6qLR+C3UkrjYQN7yUzTcNjOyZw5f8bueTH
 hB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=G+Encb835y7NEoCUZIVOMFOEiz+b6nALgrqyT0dm/ps=;
 b=AOvPzkEHBNNUXxbA4g8E2ZVS0+h+N72Yy+Xu8xQ0FWUj6idLqwxY02RcNgsIWJpBUf
 eeluvEETqFJtOSyzBLcfKmx568W9yFgIxrfUGIoqw5TQfBPNOilea8Ota/3/vQJdTHZE
 BFdsIDnhaB5Hfve7UdvW5RjibtSXcA0Ka9O3cAyNLythoRBZ8HqlizxpAGQi2OlHlh3w
 eJ3koB7lac/h/q/uyl3rm/mpSL14RcQZJ6siNYgzeSI3yJ0QIQjRDbVd/t5HIZv2t6CG
 gPgh1eqijFgDpxhECGRGrtoJ0Ge4QZA1Xo9zosJ3ICvXzavdA6y2olokeVSMc+2finc/
 23Qg==
X-Gm-Message-State: ACgBeo1Rsg2pZKr2q5m27kSAliOgGeGp/BMRPyg7Ch8rDGIGC6VAlBuO
 jASokToptup/Yo7u5wjEbvY55Q==
X-Google-Smtp-Source: AA6agR7nRGcOwS4QCtmspkh1i7W9/gVTZ8HSxbRKSFsqvtppsjcEabdIqv8bHKnZTBHy6HScJNPZxQ==
X-Received: by 2002:a1c:3b04:0:b0:3a5:487c:6240 with SMTP id
 i4-20020a1c3b04000000b003a5487c6240mr11109791wma.152.1662392892434; 
 Mon, 05 Sep 2022 08:48:12 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9?
 ([2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9])
 by smtp.gmail.com with ESMTPSA id
 co4-20020a0560000a0400b0021eed2414c9sm9589829wrb.40.2022.09.05.08.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 08:48:11 -0700 (PDT)
Message-ID: <b0200ea9-2849-0fa6-5535-f44b0b5580bb@linaro.org>
Date: Mon, 5 Sep 2022 16:48:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] target/ppc: Move fsqrt to decodetree
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, matheus.ferst@eldorado.org.br, lucas.araujo@eldorado.org.br,
 leandro.lupori@eldorado.org.br, lucas.coutinho@eldorado.org.br
References: <20220905123746.54659-1-victor.colombo@eldorado.org.br>
 <20220905123746.54659-2-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220905123746.54659-2-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On 9/5/22 13:37, Víctor Colombo wrote:
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> ---
>   target/ppc/insn32.decode           |  7 +++++++
>   target/ppc/translate/fp-impl.c.inc | 29 +++++++++++++++++------------
>   target/ppc/translate/fp-ops.c.inc  |  1 -
>   3 files changed, 24 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

