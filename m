Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB5032FF84
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 08:38:05 +0100 (CET)
Received: from localhost ([::1]:55932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lInzI-0004pi-PP
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 02:38:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIny2-0004OR-6X
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 02:36:46 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:50744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIny0-0003rl-PB
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 02:36:45 -0500
Received: by mail-pj1-x1030.google.com with SMTP id b15so1408945pjb.0
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 23:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B44GK6A7P2gxKsCuQHjdI82m65yK6wxwIZt0yEU3i2I=;
 b=JDjM3BAa7F+vzLfIuinND9OOKH3HscqcguQmTDE7HF6genm/EsC//gv0O3tz7K3TJZ
 YYADXcT01Bykz7IeZXmUpBb0Srtcu+4fMsOEB+HPZ5EU3IH74GrheqJ14ITVEHZLf7dH
 K9jYhUCQ9TleXoZJnn8wkCU6/5vBEfuGISa8Z4LOgtXMyAnVgHKu2V6jZ2xf1rou2yaP
 z/LwE5QTouQpERJmn+hvQh8+LEJBHPYjo3PGp7rjbvBGOCNEz3/7PmWZI5ceYdJKhaF6
 kD7KfaUtiVbxoY482ZFfgT26tm3/46S6V89JFIYX+eZty1jiMLnwdv2CRoP0ZqMKY+ZV
 3Pwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B44GK6A7P2gxKsCuQHjdI82m65yK6wxwIZt0yEU3i2I=;
 b=fTN7x3P/bdHx+2kYuE8xL/BE6v025CiEqdjMuPd1Jcz/ip1nCNAIuHsfKElw5vpJyx
 cBh/P+8TeahluJdqzHqGoM5T8t7/3+OsUnt4I55LzSF8fYDrIMi6Z1uGZ6/juknAnrFu
 StzpqwK3frLjW0ctSEW4kXguVcluWxBpliE4DS007x9q9da++h1xJzOQ5WYOKkjg/bnj
 yokjlyzCV3UrhzyDcb/W6/vHknIKFxXqtkAwzrEBMXi31TTyzNBK65gcIDByh3aNGwW5
 Dveh9j9SS6wn65lfJhyfHeZZ8jWpE1plHAQU7S2J+fJsr2wQHZ96JSfa/BZErMvRBO19
 5Gsg==
X-Gm-Message-State: AOAM530gJuHQD35WoHE2gMzcGyLJFJMcEqUMyiMegrFppBkBw4xyZyBy
 s4ScWVU47ZLJwjOlD73RzpWKLw==
X-Google-Smtp-Source: ABdhPJyIyO+7M742SxNuXoNIzymEByrw4uARfFrO8WzAe2cisFqPRj21cb9lgv3O/5Wuex+/qlgx7A==
X-Received: by 2002:a17:90a:a403:: with SMTP id
 y3mr18792674pjp.227.1615102603351; 
 Sat, 06 Mar 2021 23:36:43 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id t4sm6773534pjs.12.2021.03.06.23.36.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Mar 2021 23:36:42 -0800 (PST)
Subject: Re: [PATCH 2/2] target/tricore: Fix OPC2_32_RRPW_EXTR for width=0
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org
References: <20210305132629.755627-1-kbastian@mail.uni-paderborn.de>
 <20210305132629.755627-3-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7cbdc0e5-9281-82af-510f-a5351df8f1c0@linaro.org>
Date: Sat, 6 Mar 2021 23:36:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210305132629.755627-3-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: david.brenken@efs-auto.de, georg.hofstetter@efs-auto.de,
 andreas.konopik@efs-auto.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/5/21 5:26 AM, Bastian Koppelmann wrote:
>       case OPC2_32_RRPW_EXTR:
> +        if (width == 0) {
> +                tcg_gen_movi_tl(cpu_gpr_d[r3], 0);
> +                break;
> +        }
> +
>           if (pos + width <= 32) {
> -            /* optimize special cases */
> +                        /* optimize special cases */
>               if ((pos == 0) && (width == 8)) {

Indentation is definitely off, both with the unrelated comment change Phil 
pointed out, and in the new code block.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

