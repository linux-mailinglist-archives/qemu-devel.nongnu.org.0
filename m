Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A48B13D9ED9
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 09:40:02 +0200 (CEST)
Received: from localhost ([::1]:36490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m90e9-0004jA-Mx
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 03:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m90cn-00044d-T4
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 03:38:37 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m90cm-0002W8-Hf
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 03:38:37 -0400
Received: by mail-wr1-x42d.google.com with SMTP id p5so5660217wro.7
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 00:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fO75t05A20gU3QmPd5gF2sdBHYdwtJ9jI6DWrNKFfGA=;
 b=EXKwPLyrh0Onj06E5vvUlPdzbbwFqUoVjJyseQRPi1ogHV8CaM//2DKwXsrPdi4uzD
 /WLnNEDVVN+UuVRat0a2I7sBvMGiAV2CBitycguzrBB+NOl621n5m7axKpPPsey3/H2e
 3l06anWTjSdmqHgkOHwS3qyD/cRork81fn0njuFfiQpUTX0gTgFGU+noFCQQG1Vs5zjo
 IpLHpj88ZorEy9pFEHHLs8GQRnaY/4avAAgG1D+AznQfQpBiJ0xLnBOI4PxOmOL/w+sg
 TEF+lQDCNZWZhhEZWsHml8OSiL2KmjuO+WFhnuXVJoRZdD2kTgm+hCI7sBIilCj+nGVK
 z7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fO75t05A20gU3QmPd5gF2sdBHYdwtJ9jI6DWrNKFfGA=;
 b=CFmxd/VkrQbjrJDUEtjOph3F/5QiFrB/THquvAY7oTiN2KQBAYQhgYRKkZMhgCq4PV
 /ldBSDn37Iilv2QeZu1FvjJ6PktdRRaWxLouM0SguCeQXerpHQS8UMbKUKc58h9iVZ0a
 VaGwrg0RDE1WhYh9+b20uEKkWLnyfW0vmspu9LLYMHmkrnSLXvtyOPw+Y95sC4x991YI
 4x4nGUyr2DoLL9mfPs53W9+8SOt2ZUPeLOLHONog7CuC/u/f8T3fjgmc+yVCktN7she4
 TuGaGcFNt4+JC/XIlQAAGYIFxT/atY3KayYoEbJFpIapFnVPgEanpH650RWaS+ofnaZX
 EP4Q==
X-Gm-Message-State: AOAM533WFicR9F9zasYiq3WZGiQ5plEQbt/eJ3J2X6VSQtpeytWMYheb
 MMMXKuNYPGNN8M6b7nH6x3zE34zfXLK9JA==
X-Google-Smtp-Source: ABdhPJzruteS9IOQXWnU/Rzad8cQPbAYYWvu2yn/ZwY739Sw50T01J6MWv/swWhs6n9MOq+cc81RBA==
X-Received: by 2002:adf:82ae:: with SMTP id 43mr3270622wrc.73.1627544314434;
 Thu, 29 Jul 2021 00:38:34 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id b15sm2327250wrx.73.2021.07.29.00.38.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 00:38:33 -0700 (PDT)
Subject: Re: [PATCH for-6.2 34/43] target/mips: Use cpu_*_data_ra for msa
 load/store
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-35-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <eea564b6-5218-548f-64e2-6395c6e780aa@amsat.org>
Date: Thu, 29 Jul 2021 09:38:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729004647.282017-35-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.277,
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

On 7/29/21 2:46 AM, Richard Henderson wrote:
> We should not have been using the helper_ret_* set of
> functions, as they are supposed to be private to tcg.
> Nor should we have been using the plain cpu_*_data set
> of functions, as they do not handle unwinding properly.
> 
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/mips/tcg/msa_helper.c | 420 +++++++++++------------------------
>  1 file changed, 135 insertions(+), 285 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

