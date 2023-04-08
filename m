Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F966DBC94
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 21:16:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plE2F-0007jJ-Sz; Sat, 08 Apr 2023 15:15:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plE1w-0007iV-5W
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:15:34 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plE1u-0004ip-CM
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:15:19 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 q15-20020a17090a2dcf00b0023efab0e3bfso3999741pjm.3
 for <qemu-devel@nongnu.org>; Sat, 08 Apr 2023 12:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680981316;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0P1IpatEkoKAE94v3x75BOBCAVTwE9iieBx8rgyawYY=;
 b=uFKb82CJiaXVzIhOQtPbt+SCIk89ETaqtEsFlnnbpkSlanZz7oPPYqI+CtrS7B+lea
 4g6+upMeq9peYJc7FzsCGc+LoVr4xAuF2GlxPlX1iqPKkj/TgXkEpp+1ofGc7HBjbnC5
 tECH7REyuuJPpnbJ2qaZh2CrrOwkk187GoSmE1nLhhV2jVkP8YGQ6hmS+IonwlMDQDKy
 6eKZ5i76LNTSJQMMlhtAxemtVpakQXhKNY4ScjmE1tWsfR3yv2utDHFBqb5WAy1xJ4DA
 hTW9w/m2EGJFUY9j26DFn7aot2ZEsd6GSngqdJEuzam1Wot40Ny/VLb7P1/V99lhkLmJ
 ZO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680981316;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0P1IpatEkoKAE94v3x75BOBCAVTwE9iieBx8rgyawYY=;
 b=IoVm38hiIYRmu5Je+L9jceEfFJvihsjNvZk3muO5dWiLPxqM+UpqgZ+BM/BePdY1qw
 okmtXQfqgsKYDUdI61NhKJzVcGzOkhPHIt3rUs7c8fcYEHZVkIvG57/X4lcmKOHYhJzk
 sVp0J+AipZu3OZq2X0ozWfudzT4qZBwiS2IqCSFtQNcIccUzgu1N1TmXlrGzyaD0/smY
 WromlYe9s0eVXpRyUo3szsYKL+D01pufgSDH4Au+eB64Ug0VkljgU182XY18lhqngTYK
 H9gvK+7Iv8VOyvio+3LINW/r6G/GdJX1vwxstkbhyNo46HEwjubBrAMIOY9ws3iy1amK
 KQVw==
X-Gm-Message-State: AAQBX9dW7LgC4gkVzy55goH84OVobm/f8n/2BEwKsm2uyQXf/QTOGlKD
 WrtmjiYyEBvUQsrzQwrNX2n9pg==
X-Google-Smtp-Source: AKy350ZwD4XJrPez0bV0UNMXQiTV7HIKAGwkmhx1XBTvag/WwzuTUC7HAUOnJ/liJEvEv1KkoE+TBQ==
X-Received: by 2002:a17:903:706:b0:1a1:af64:380c with SMTP id
 kk6-20020a170903070600b001a1af64380cmr2572563plb.27.1680981316210; 
 Sat, 08 Apr 2023 12:15:16 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:fcd:4458:21c7:367e?
 ([2602:ae:1541:f901:fcd:4458:21c7:367e])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a170902744200b001a5266b90aesm1566024plt.122.2023.04.08.12.15.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Apr 2023 12:15:15 -0700 (PDT)
Message-ID: <ec3175a6-e793-9ad0-3afc-15db35281385@linaro.org>
Date: Sat, 8 Apr 2023 12:15:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 14/16] bsd-user: Implment core dumps
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: reinoud@netbsd.org, riastradh@netbsd.org, ryoon@netbsd.org,
 jrtc27@jrtc27.com, kevans@freebsd.org, Brad Smith <brad@comstyle.com>,
 Stacey Son <sson@FreeBSD.org>, Ed Schouten <ed@nuxi.nl>
References: <20230405213612.15942-1-imp@bsdimp.com>
 <20230405213612.15942-15-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405213612.15942-15-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.113,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 4/5/23 14:36, Warner Losh wrote:
> From: Stacey Son <sson@FreeBSD.org>
> 
> Bring in the code that was originally copied from linxu-user/elfload.c
> and moved to elfcore.c. This code then removed the Linux specific bits,
> replacing them with FreeBSD specific bits. The commit history for this
> is not at all what we'd like (it was done in one go by sson in
> 227070562fc in one commit, with very few followup tweaks). Since the
> original commit, this code has been moved, and updated by sson and ed
> slightly. That makes it hard to split into smaller commits.
> 
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Ed Schouten <ed@nuxi.nl>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/elfcore.c | 1318 +++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 1315 insertions(+), 3 deletions(-)
> 
> diff --git a/bsd-user/elfcore.c b/bsd-user/elfcore.c
> index c49d9280e2d..2905f2b8414 100644
> --- a/bsd-user/elfcore.c
> +++ b/bsd-user/elfcore.c
> @@ -1,10 +1,1322 @@
> -/* Stubbed out version of core dump support, explicitly in public domain */
> +/*
> + *  ELF loading code
> + *
> + *  Copyright (c) 2015 Stacey D. Son
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License
> + *  along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +#include "qemu/osdep.h"
>   
> -static int elf_core_dump(int signr, CPUArchState *env)
> +#ifdef USE_ELF_CORE_DUMP

Would this ever be unset?

Typo in subject.
I'm not going to review this one line by line, but

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

