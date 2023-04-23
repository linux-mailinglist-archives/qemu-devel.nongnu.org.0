Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B20CB6EC159
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 19:25:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqdRt-0001H7-9s; Sun, 23 Apr 2023 13:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqdRr-0001Gp-JU
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 13:24:27 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqdRi-0005ib-Sd
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 13:24:27 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f178da219bso35624205e9.1
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 10:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682270657; x=1684862657;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RCKz5an2wwB+qFYnT3BAz6HcoOuPaLRhngni1Uw9PS4=;
 b=wtzXF/7a6OR/ExQDf+3lIFjaZNUSfbheDETU61gQIEKpd57zYGbUtnn0LcxYswIXDc
 P7kEhWAOXSpiTBkeiGWyKwMouca90+U2hrk8qSVWUsfAd4rRC0GifnorDfddgXsQN1/o
 N0yAOh3FCo2RmMXugK2xja+3jNtLbVAJNFCT9SXZmQZVaw64JI785bqHInlqPrByHOCV
 f1E0P9qx94oK/oJaaRVdnfjhnHdc8n7vUV6TY43CKRw/RSvdRJdtIFofxJheLJh6n9GH
 s/IiMYI/yBbV+jOtszroz5zyJS+wX9xb+otfKgCLJgZOpPtWCGOCC86Fh6ogaohBG0Vb
 4A1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682270657; x=1684862657;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RCKz5an2wwB+qFYnT3BAz6HcoOuPaLRhngni1Uw9PS4=;
 b=T56MpTDkxOWaz41fOwdvQ6k0fsFsEOmAzw/IQZVXZzMvL7vSh8m1JwrWaFu4f5P2Xa
 tMAQdJe9K9NMJSDsolUtX0IYrWFEl1ZRC8kFJ7eizeIeT2NKHyvLXrmufdBPJfXHCqYS
 daYEc9pTrieQ89dQS76hN9b4Pc/Araiq5zMz/Z24GpxCI8rsn3ogacvZ3WTQ+KbUB/Fo
 awtgpF9d4UO3vUniq3ZXQTCHLOFtfQtyE5OLO3VyU+aXqZDackupUflmAQuUTth/Ian6
 LGuXThNd1Q2xuhqYYr5735wOcvP+0a4zMQSG3jjKPa4OfZ5DdF4IbAlVu9YUz0XKK6/y
 0OOQ==
X-Gm-Message-State: AAQBX9d3KGDzAmRB4tdNyFZTaqDaPw6JRmhj42gxPJp6B/Wt5BDj57aT
 wjMgrbejL2Bu1GuQ+YJCuRc0+TXTGWZpIK3IB414lA==
X-Google-Smtp-Source: AKy350ZVdlgIeqWux/yWL1A8XXhTiKvMJPUpKgW2NKwLY+Ja0aKG9ZHpxl89DHJ355Qbh9X6y/umKQ==
X-Received: by 2002:a05:600c:24cd:b0:3f0:9fef:1028 with SMTP id
 13-20020a05600c24cd00b003f09fef1028mr5621902wmu.17.1682270656812; 
 Sun, 23 Apr 2023 10:24:16 -0700 (PDT)
Received: from [192.168.252.175] (8.red-88-29-167.dynamicip.rima-tde.net.
 [88.29.167.8]) by smtp.gmail.com with ESMTPSA id
 r3-20020adfda43000000b003047ae72b14sm616809wrl.82.2023.04.23.10.24.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 10:24:16 -0700 (PDT)
Message-ID: <62ef3866-3097-8b13-e7d5-440d72ec645d@linaro.org>
Date: Sun, 23 Apr 2023 19:24:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 0/2] linux-user: Fix mincore() with PROT_NONE
To: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>, qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
References: <20230422100314.1650-1-thomas@t-8ch.de>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230422100314.1650-1-thomas@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/4/23 12:03, Thomas Weißschuh wrote:
> The kernel does not require PROT_READ for addresses passed to mincore.
> 
> v1: https://lore.kernel.org/qemu-devel/20230416195103.607948-1-thomas@t-8ch.de/
> v1 -> v2:
> * Introduce symbolic flag VERIFY_NONE instead of hardcoding "0"
> 
> Thomas Weißschuh (2):
>    linux-user: Add new flag VERIFY_NONE
>    linux-user: Don't require PROT_READ for mincore
> 
>   linux-user/qemu.h    | 1 +
>   linux-user/syscall.c | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


