Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9446A3F0D42
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:23:37 +0200 (CEST)
Received: from localhost ([::1]:34134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGT28-0000Dl-M3
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGT0y-0007Dv-7E
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:22:24 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:43995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGT0w-0000MC-QU
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:22:23 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 k5-20020a05600c1c85b02902e699a4d20cso2668596wms.2
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1RT61as49+NsNfwLefKiTJaN7UraOrTrJ0rJmR17JCE=;
 b=E4OntXl5qjmK3bRbjAJc9AGrjtZ+/DMNJAC/ln6SIYHwNRIQ9CewzheaFugaB4DdGC
 alaWi5keto1+gb28PWZYf4QNUZQUNOiBQzoWfAQtzAK7avfOsU2i72MRhC/TA9z3KdIw
 4VnM+72LHUWs5eLkQLJ8fEQkFIVpN1d1ZjCTGeR3hnwxrxoI7dRG6K6uets8BLSFarWY
 +GLH72YMyjr+80rnaRCggv5rYEqnFNkGZGe6Ql/zed3WeAK9mlqhhalJ98pyqEgNr2km
 uUT1HKpLJlRlDsHdzIh6TJTfvOOKTI8YEPz4w+bZ4pjagtGN9VIF7fS1s2lgW2onbmJP
 vh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1RT61as49+NsNfwLefKiTJaN7UraOrTrJ0rJmR17JCE=;
 b=Kl/ibrmZO27CQ3zetfIFyylp5J8Q2zLsGOpXQsPd8Doo3mNE4LpKyCi7pKY4nbNOVb
 qijYMowTP0aqHpzqsa2IBaH8cJ6X14GNGTQPowbMHGLH7tQ7asjT659WqxDge+cwxO4H
 2N/jXy0o3kqPErM04eb4zscdAe93q9XYnKeTH95H9pJup3X3qGuPy0wh03ayoczw3mYW
 Ijou/aQ4T3fV/z+wBe0NWPkuA4sYT39NOJo101a8YBFN5HQRueitem5YZS802GzPP6CH
 /SllTbZXA3IgD8sTmK0ZX1IOAUQzqtGBpqe4Mh0TGBNqr12DqfnIeV3BSD8bK/ub/MFv
 qqcw==
X-Gm-Message-State: AOAM532q3iNO2u6AI0UERwOBR9oqfHD/3EAV5WIqHB3A5TS4ZLsZZrLr
 E5vIojW7meKYx9DCmmFmc2IRatJDmYw=
X-Google-Smtp-Source: ABdhPJzRuWgvvDRKBTgO8zXS3n0usqqWooOcH1cD6lfKkZM3jjhcTos/rT3X5yRg+rD/vNvWy2mg4w==
X-Received: by 2002:a05:600c:1991:: with SMTP id
 t17mr10268891wmq.120.1629321741169; 
 Wed, 18 Aug 2021 14:22:21 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id g12sm1183610wri.18.2021.08.18.14.22.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 14:22:20 -0700 (PDT)
Subject: Re: [PATCH v3 57/66] accel/tcg/user-exec: Convert DEBUG_SIGNAL to
 tracepoint
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-58-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8b2defb4-5e51-45bb-c50b-9e4dc9c1358e@amsat.org>
Date: Wed, 18 Aug 2021 23:22:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818191920.390759-58-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
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

On 8/18/21 9:19 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/user-exec.c  | 9 +++------
>  accel/tcg/trace-events | 3 +++
>  2 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

