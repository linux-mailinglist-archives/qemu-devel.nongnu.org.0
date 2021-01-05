Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C257A2EB2D1
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 19:52:44 +0100 (CET)
Received: from localhost ([::1]:39750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwrRj-0005sl-SS
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 13:52:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwrQv-0005Ot-PR
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 13:51:53 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwrQu-00020l-AX
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 13:51:53 -0500
Received: by mail-wr1-x434.google.com with SMTP id d26so182514wrb.12
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 10:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XpxomBOSnzSualdrs65a1CN4FcPwGiEcCRJKP8yk+jI=;
 b=DrmKcIkGvUH/+RxEwLI/XDg2Gma9lgl/JUGcS57mJdCDppWa5qZEgnGACTgEqGmLrJ
 fI++8N0wNeJCBKqAgRC+PzPdZZOvgtSfP3keAocWvoqeSQoUagKl56syK40qwb43flvg
 uohgHwN8JWJinTrVowJuh+5vLrNiT34Oq23mOIbjniKrwNo77v1oUepuqdy7yA38bxLd
 LIY9eMWQyh9hmajHI8ZENuPQ+kn0tylrUaaCt17kBQMJjK/pH2sRX0Vo76H3dLSE83/U
 jurqZA7ugLK7wA+5/NLvrvIbS6sTsLuA0pqThJEC6Wpy5DBRETW5wRZ8z+T0fwX6DvgL
 iuCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XpxomBOSnzSualdrs65a1CN4FcPwGiEcCRJKP8yk+jI=;
 b=qLHeC266BEyzaDTVUzsDajoOH7bEsgjb3r8HH5szTj43pL0BeQodgkmKWlxcS3UpiJ
 uYednPL4d0cW06sZBb0mzjM7yZbiqIwGJJTx7D2kvjBbMxbXcRUOHsdhitS5Pc4rgtgL
 3aUyVaLsu/COzN6UfzehM1Q53VfIrKCeYrz1YlT6ARb7Ib+YoKjPjOTs8IIpQy0GE+vN
 yWFvBJJQUj6ziL/RAgy5XkyVwVoOIK/B8jik48qHqiQ8FxEy413KsEyyR8M4bw7V9tQT
 Jiqje9yV19ofD81pQVwxMLcnzO5g4CaXDwv1ngfGdhVl16L7xJlCXYprnuEC7qJdHbpc
 28GA==
X-Gm-Message-State: AOAM532lN9zOZ/HSbckhobdvadi2IO6Q4rok+2zp3U9uISXKzbNJwwBT
 5TmNCjH4y7iOLjNq53iNvco=
X-Google-Smtp-Source: ABdhPJyKqO95dv1qbhDDeWrn0jaSw7zBzyWgHui7yJ3LXpCMPBke/J3aevOVUbBfkE8jjoznVCbFLg==
X-Received: by 2002:a5d:6204:: with SMTP id y4mr927191wru.48.1609872710981;
 Tue, 05 Jan 2021 10:51:50 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id u10sm54229wmd.43.2021.01.05.10.51.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 10:51:50 -0800 (PST)
Subject: Re: [PATCH v5 25/43] tcg/tci: Push const down through bytecode reading
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210105171950.415486-1-richard.henderson@linaro.org>
 <20210105171950.415486-26-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <32f5ac48-e2b2-90d2-49bb-0cc6e36bb17c@amsat.org>
Date: Tue, 5 Jan 2021 19:51:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105171950.415486-26-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.249,
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
Cc: Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/21 6:19 PM, Richard Henderson wrote:
> Reviewed-by: Joelle van Dyne <j@getutm.app>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 60 +++++++++++++++++++++++++++++++------------------------
>  1 file changed, 34 insertions(+), 26 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

