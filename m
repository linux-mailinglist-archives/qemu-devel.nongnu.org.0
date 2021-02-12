Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E59BF31A586
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:39:42 +0100 (CET)
Received: from localhost ([::1]:35438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAeI2-0003PX-0x
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:39:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAdeG-0002C0-Cj
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:58:36 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAdeE-00039t-Mb
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:58:36 -0500
Received: by mail-wr1-x429.google.com with SMTP id g10so444859wrx.1
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t8B6++dNnJlEmFLBJYl3fvBBEfgMCe5HAvlAGlcgs+A=;
 b=jsCkklIMciEYzE050tjWnoyqaQYKdvx7OMDGU5HG9X5Yl6M4AMz9rDYLs0TbI9fpUI
 gmQ9mv2i06A53LoFCrHNtr2UoI6nxfUKJjijiLiMTwRTN1PrIVkDbzhBafE7OE7N61+e
 vbinEmkS5/nqmC6Earvbn/TLVRvFc8JnBYQbFisGrl1cge/xJG/RbOMV7r/SPyDceT3d
 8NjYQoAxm+AAPheZ4fQQY6Zywb1o0C1YV6DZfHw+EeljZUl1y/etKdvJc+ptgOtEeTa5
 2WIzwZ4hYFLAEdQhOBCEx0CNwBt4C7jjmWlHMYgt/iRYUauXBo1k3ydnrG5tn0/4L4Oz
 9rBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t8B6++dNnJlEmFLBJYl3fvBBEfgMCe5HAvlAGlcgs+A=;
 b=O+h35K3S/b5vb+qJOS93ZLv3YEAN63rBNSYQJSlvxb5NmmEwSQLn0l/RSLET5ax167
 EM08IpH3rnW1/NxhyxTv+SRl6oKq4qqlWaGCab2gBU/N6BxK71qjqbncJzL6hHj2jvWB
 FRZi5aGF8YpKZQDxmyRq/tTtJTagfiWjfLOtK01FgT9CVF+2HDTaQKTcCuokrqTtLoyb
 ATSaOeKOdM9xke7jTo8wnOhB6bOEG5O5DYqVNoihh+E/B9gSKE4CO90Z5HS2zkX54spf
 j2uc4Y7KnD6TDWvFdNsi5ZMC39kQlLGBdDxT4b3q1bxMX9Mz5jLjSGHplAsY1fhYjPRL
 NAZw==
X-Gm-Message-State: AOAM531uClJ3Cctgxwx7JCmTum1+VZqZMpTBxJm3Rki06uhitI8dwz4g
 wlbhhQaZq7S5I/LdrJwRi94=
X-Google-Smtp-Source: ABdhPJz4h9KL/0Rl/dx2dl6KHT1zyhRXrMgceXqM5piNnKiuc2alW6u/aLPtvwMF9G4hxT6wQ3oyEA==
X-Received: by 2002:adf:f8cd:: with SMTP id f13mr5079130wrq.381.1613156312737; 
 Fri, 12 Feb 2021 10:58:32 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r124sm15810510wmr.16.2021.02.12.10.58.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 10:58:32 -0800 (PST)
Subject: Re: [PATCH v7 03/31] exec: Use uintptr_t for guest_base
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
 <20210212184902.1251044-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <424171eb-45ac-e559-2f0f-795781f65da6@amsat.org>
Date: Fri, 12 Feb 2021 19:58:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210212184902.1251044-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/12/21 7:48 PM, Richard Henderson wrote:
> This is more descriptive than 'unsigned long'.
> No functional change, since these match on all linux+bsd hosts.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu-all.h | 2 +-
>  bsd-user/main.c        | 4 ++--
>  linux-user/elfload.c   | 4 ++--
>  linux-user/main.c      | 4 ++--
>  4 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


