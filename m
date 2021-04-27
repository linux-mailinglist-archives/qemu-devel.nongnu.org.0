Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5014F36CBB9
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 21:34:03 +0200 (CEST)
Received: from localhost ([::1]:38442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbTT8-0007pY-ED
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 15:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbTS0-0006xz-Ri
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 15:32:53 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:36621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbTRy-0003NV-5b
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 15:32:52 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 f15-20020a05600c4e8fb029013f5599b8a9so5726212wmq.1
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 12:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iaCx0Nuipfnohz/MGAAOyFmzQUIB+nn+ZOkbT93ESBs=;
 b=EZ4Q4dmm/7KI0RDl1Jr8eylRxlrNDtepQBBRzJE6bfWbuz613OdT8XU+7YcE1vK9Bn
 B0wvDCrdtj/CCD461E3EXKkyfNYIU8ZFAG7fm8QBujGYauVzuyzqooYl/Y7H5n0uRFsC
 tWdZpO0d6ixq0llfgOlRDsL9m79MJ/XwOx16rBUqzbphUP4gle33W9Mf/Oksd17lRICq
 9BhNhYwL9B8yQp4a8IOsk9XkRweozcsugzcC404n+lucAEcMmbZ5+8b5Th5yNwPEfCqD
 upJoLkHOIeKFv6MRK3+1gy2Mr10MJ9bJBqTkTbB/8qVUFuwvGCleYTq2AVjw0qXl7lSU
 OAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iaCx0Nuipfnohz/MGAAOyFmzQUIB+nn+ZOkbT93ESBs=;
 b=mbqQcIBKerLJVdFmANooSsKTfY+AHqTvz27vxjjcFgzyHSeue9ntUuCdNtemnkGnw8
 Zfp6lUSKxSnxrDcNqRekQ/iMc4gS2ar0F0Wp9nV6FRPSrJQXWuopuKg1BmQyEV2rTjuZ
 wNUPMHOJCq77aCfVphQGvn4R5paetrSHw2bNUh7HhKKqeyWJHWxGCTeg8sKQThx0Qdf7
 6m8pFVusMPRMcWvhQkeJ1d0XQhXMecPPi7rjotBkA7TJM6wDTuTnb2+YmgoGaxqushs0
 dc3JPVqzv6tMRLpLxCWq5mmsskhYfI7FupEnbqOhCWMfMgzm4IBKx39j5c9YwhSPPOrp
 97vQ==
X-Gm-Message-State: AOAM532OiUjnYLYSfeTNv/jK2jVxlSGjpbuomyn6TBGKYBJuNhYUpjvH
 v56AuPdhtA8Jvwh5BJKgMi8=
X-Google-Smtp-Source: ABdhPJx3eklkDuIVJ8IMmexPfOs1zMCxweQKgryndvNVS95FCeDkhUZG0Dqr9rQODc2hNqEhf1USYA==
X-Received: by 2002:a05:600c:4fd4:: with SMTP id
 o20mr6151457wmq.166.1619551968589; 
 Tue, 27 Apr 2021 12:32:48 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id z7sm5426001wrl.11.2021.04.27.12.32.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 12:32:47 -0700 (PDT)
Subject: Re: [PATCH] target/mips: Fix CACHEE opcode (CACHE using EVA
 addressing)
To: qemu-devel@nongnu.org
References: <20210420175426.1875746-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5bb2dc77-432a-d594-8f8d-bdb34bebf00f@amsat.org>
Date: Tue, 27 Apr 2021 21:32:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210420175426.1875746-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Petar Jovanovic <petar.jovanovic@syrmia.com>,
 Filip Vidojevic <Filip.Vidojevic@Syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/20/21 7:54 PM, Philippe Mathieu-Daudé wrote:
> The CACHEE opcode "requires CP0 privilege".
> 
> The pseudocode checks in the ISA manual is:
> 
>     if is_eva and not C0.Config5.EVA:
>       raise exception('RI')
> 
>     if not IsCoprocessor0Enabled():
>       raise coprocessor_exception(0)
> 
> Add the missing checks.
> 
> Inspired-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Thanks, applied to mips-next.

