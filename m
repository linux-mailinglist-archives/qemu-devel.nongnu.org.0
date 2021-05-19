Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 337DA38933F
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:07:25 +0200 (CEST)
Received: from localhost ([::1]:56174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljOjE-0007T8-93
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljOhQ-0004ks-6B
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:05:32 -0400
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34]:34616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljOhO-0003Ou-7o
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:05:31 -0400
Received: by mail-vk1-xa34.google.com with SMTP id n131so2102128vke.1
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 09:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GrAA7Lmeelx5tVVrhgBkYUrmc2FlhjqDXqgC0PxGqeU=;
 b=wSqWQCCaIaSMBUmAp7rW0IYf8j3sLEBmFlJbZUw98/HU/yqoZCBdbQ9t2HsWXjJX7y
 R7g4Vj8Bdy4/D0L2nT/mpKmttBZjm6EK8Jqj4iX6BRhmO/aJk91OAmJiu723zJMWPS6E
 JGzaM/aYGi8dwORFinjyOFfUET0g+M6UbQNOxdhtFI1XBN7l73AN5UspqE0LInMi1fdm
 l9YtV0uanuz53aFWBLRChBs7Be5yCnHe+bZs1AWCmFhRJZ4rIs87M2iE3du0ENnGx6Ib
 +SwR7jyHAGg4aoZTaGxp4LV65bjGg28IsVI0rHJAW16GLTObQVM1220jDlgBHl6pPWSC
 TiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GrAA7Lmeelx5tVVrhgBkYUrmc2FlhjqDXqgC0PxGqeU=;
 b=tJMD6I4yduLDx2quQOz3whYGdVkRPCr2H3BNMuqMOYBu9L5ifRPwLlFCzzHL2+agWx
 uHpUCREOdJ8VnVWRdqRpOi/iwpweye2vwjOQRM071myAAue7XWd2AvcDBgbvlzuxWY2Z
 XeV37w/7p58IMoLMV1gpj9M9d+PvzXlOYyaJAYCNtYY65entanmmw/BGKKxr4n75VPp8
 /NdxOqA4LiMKkjLjrjvZSLJNHtDfnEupd9oN2zA/Uzfs+Sa5cn0dg7Zld3I67kbZDy+R
 ac5+1S/YQuBI6Dp/CdRqIuHhXmOMMCB9eZtVYNCsfluhWhhEkWmOzwjUBcHQp4Lz22QA
 yBXw==
X-Gm-Message-State: AOAM533a+jKGQv5kzoVD5M2tJGamGyZvd/d4wfsjAk1gQ4HixPnzjZrg
 6fno6Ryeb5A/hbnRME9pU0T3ww==
X-Google-Smtp-Source: ABdhPJwX6zEkpmooZYomlcYfYCynDUOu7cNiVrngLYcXN+GHkRkzLyaIDVwFcgwJCrqbKAbxtdAW7g==
X-Received: by 2002:a1f:9686:: with SMTP id y128mr13814657vkd.23.1621440329131; 
 Wed, 19 May 2021 09:05:29 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id t65sm9735vkc.18.2021.05.19.09.05.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 09:05:28 -0700 (PDT)
Subject: Re: [PATCH v2 4/7] target/ppc: overhauled and moved logic of storing
 fpscr
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210518150515.57983-1-bruno.larsen@eldorado.org.br>
 <20210518150515.57983-5-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7a4c0761-45aa-be4f-83b9-c753d6667790@linaro.org>
Date: Wed, 19 May 2021 11:05:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210518150515.57983-5-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=richard.henderson@linaro.org; helo=mail-vk1-xa34.google.com
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/21 10:05 AM, Bruno Larsen (billionai) wrote:
> Followed the suggested overhaul to store_fpscr logic, and moved it to
> cpu.c where it can be accessed in !TCG builds.
> 
> The overhaul was suggesting because storing a value to fpscr should
> never raise an exception, so we could remove all the mess that happened
> with POWERPC_EXCP_FP.
> 
> We also moved fpscr_set_rounding_mode into cpu.c as it could now be moved
> there, and it is needed when a value for the fpscr is being stored
> directly.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> ---
>   target/ppc/cpu.c        |  43 ++++++++
>   target/ppc/cpu.h        |  12 +-
>   target/ppc/fpu_helper.c | 238 +++-------------------------------------
>   target/ppc/gdbstub.c    |   6 +-
>   4 files changed, 65 insertions(+), 234 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

