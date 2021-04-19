Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D13364CAD
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:58:57 +0200 (CEST)
Received: from localhost ([::1]:59510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYayu-0003ca-8r
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYZe0-0005fJ-Ju
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:33:16 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:36452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYZdy-0007Wg-R9
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:33:16 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so21007356pjh.1
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 12:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MmDB4owqZbuyCZ8Tp8EL3bZV8Z/vjc6yTXibm2k/PXo=;
 b=kiJJ08A0MVRj9i7I5FDod94Ac/NnvX4N1+ped4luIYrmpKJNqOwULvKJyvZji4Z7m2
 nQFjBNrXtA5j7RJIGi5WsVE3uGNam6egLFk6qbPXCC0KyTuhJwDVETYNf0Hu4PrjjkaA
 EuWuOLuYGR4GERDTZYKhqUwFFwKqdG+9ZSL+EKRsBSWYE6not42ArcHQULAYOrfRfNBk
 F+PUP1UrjWt7INbMk5DHvCjl9nvBwPM4dc5zLRoXCk0daLN/2Ul2pFzvGcWffo6DT4tK
 hR4NUOoONj7dKxwHGsBhe2dg4SM4y1Q2Tfai++om+6mALWdEGifqQ+CTGb8N8cVuWZQa
 H22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MmDB4owqZbuyCZ8Tp8EL3bZV8Z/vjc6yTXibm2k/PXo=;
 b=QASkvE2d2bUkPDDL66nxkgL956vmcGPKZgsIkukk7Jsm2tvSwKAlA9Q0xPzGZJ6Gjy
 BAwtQXGsjcsb1KT6y49/Fwy/KosNBsQBAhsE6hLHh50MJFSTJz3t6zhnsYGKaasXqL4w
 48J5tHAc3rrie74ez/umdDy+Nwo1VKWLwLHgli6e8TCwTu5tfYcbqrr0C6x4KFJZG1vq
 3LjOxjEXbMU/pfZgRxRymSspqgbv0aAtoDhvIPmKKVyYTuWMjYarXJ1QxEBJdJtdPMgO
 XQkryEg/cL1L3rd+90Ei8Uc/BhmgYSc7ZNZ1MZavorm8WjH1zzKyyAgX4Spi8jpA7680
 ZCZA==
X-Gm-Message-State: AOAM533kdNIziQSITOcqiPa5VHczUKfjiZhymr2767Kuyd/znMiSFu1R
 nzJIDXv5/29fLsXXXqXlmAhptQ==
X-Google-Smtp-Source: ABdhPJySIUVebKR5EJGcyb0iS+0vUc59EMxVVq+ppaMUQBs2/cZJ5JlDLETlJ/OCVhFICqPPboiqrA==
X-Received: by 2002:a17:90a:cb85:: with SMTP id
 a5mr752197pju.124.1618860793541; 
 Mon, 19 Apr 2021 12:33:13 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c7:aba4:3594:91a:8889:c77a?
 ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id k3sm13710895pgq.57.2021.04.19.12.33.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 12:33:13 -0700 (PDT)
Subject: Re: [PATCH v3 18/30] target/mips: Restrict cpu_mips_get_random() /
 update_pagemask() to TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210419191823.1555482-1-f4bug@amsat.org>
 <20210419191823.1555482-19-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <02afe1e1-3103-574a-417b-17181b788d2a@linaro.org>
Date: Mon, 19 Apr 2021 12:33:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210419191823.1555482-19-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 12:18 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/internal.h         | 4 ----
>   target/mips/tcg/tcg-internal.h | 9 +++++++++
>   2 files changed, 9 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


