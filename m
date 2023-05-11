Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C296FF17F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 14:29:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px5PE-0002Gq-PM; Thu, 11 May 2023 08:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px5P9-0002G4-Jj
 for qemu-devel@nongnu.org; Thu, 11 May 2023 08:28:20 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px5P7-00074l-Sm
 for qemu-devel@nongnu.org; Thu, 11 May 2023 08:28:19 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f42d937d61so26820995e9.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 05:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683808096; x=1686400096;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lbsghNYPpJx+TtjlBH9qRVIbLWhU5fip4K1QIG2SFH8=;
 b=pSIo3xwbWgAo2dZZfcpmdnJGbMfKS6n8k37zedENRH1x0gnGYQvmd/Ayj+Gb0XwnpE
 oJL+MY+MTVTxgUAJEh3x0rNcvOBAl787z1LQh8M7lVc7oua0+t67aXQOtt6li/U3HU2d
 5ZUDEz50WwV9iK0wV2jwJBVRkEssApMoFWLEZxBIcJqimGWJL0NVcMHuiUTt1ZrGiKJJ
 fiDUKR0kwpxUqaWyjsbMmEJCinbbDIjx1OvLUnPmjTtH0xIw9XkbxRmcD93kOHbRJaLe
 NnxbFSw+rbO+isAbGVpU+kWTdQwMC2gKU3YfNZ2CmjdglUQvXDHXS7tVkX4k2N78tpI2
 YGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683808096; x=1686400096;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lbsghNYPpJx+TtjlBH9qRVIbLWhU5fip4K1QIG2SFH8=;
 b=PVw/mJ0PPBflqtOPeAI6XlHAohfgBN4bWvVV/GnFlqKXM8qmjgPUfWieygoCJ5xTGS
 zTYCqhzpBvM8Zt7e1+0VdjQUbkozgPtV9hpzimg2lFbBS9zElUkZAjvklC1Tf37zPTVr
 CAyKX2lIHqavsf3oRoxAhL/uZUPx7gbQMUZ3OdxUsp46LPLvbO7QeE7XYeQ3QhbocuFj
 RI5+1KADfBDtCwiEbK359EYZhlnZ/2I304Ixw6G+FwfcHLJM8oWjNLxwP5pDCRgKkAx6
 D7iu2PJEo4pL/cYlQHd03en6lqQAaDySAjhk3AIlyJLXWy9Ys+x0Dq8xDF9HqSXEHaIj
 jVng==
X-Gm-Message-State: AC+VfDyWFa/I3TQFhT60AIt3qGeltc8gZ4qeRWDVWtr9e3EfzASDwNwr
 hVqwBg6DNI3K1/0ytR2PDunzM2obbKS+f2sX8/3amw==
X-Google-Smtp-Source: ACHHUZ66mBu1c3lrho+wRDmqPhBd3KxAjH72tN0hFay0RyvIFZYPA9naLHl2xwtw/Z0hFL7b+i+mbA==
X-Received: by 2002:a7b:c84a:0:b0:3f4:241a:e648 with SMTP id
 c10-20020a7bc84a000000b003f4241ae648mr11720785wml.24.1683808095808; 
 Thu, 11 May 2023 05:28:15 -0700 (PDT)
Received: from [192.168.110.227] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v23-20020a5d5917000000b0030632833e74sm20422628wrd.11.2023.05.11.05.28.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 05:28:15 -0700 (PDT)
Message-ID: <c51bdbe0-767d-10bd-1ce1-15c5984ed54a@linaro.org>
Date: Thu, 11 May 2023 13:28:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL v2 00/53] tcg patch queue
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20230511104919.875195-1-richard.henderson@linaro.org>
In-Reply-To: <20230511104919.875195-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.124,
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

On 5/11/23 11:49, Richard Henderson wrote:
> v2: Remove poisoned symbol CONFIG_RISCV_DIS from disas.c.
>      Wasn't visible from x86 with gcc or clang;
>      was visible from macos clang;
>      was visible from native riscv clang.
> 
> 
> r~
> 
> 
> The following changes since commit fff86d48a2cdcdfa75f845cac3e0d3cdd848d9e4:
> 
>    Merge tag 'migration-20230509-pull-request' ofhttps://gitlab.com/juan.quintela/qemu  into staging (2023-05-11 05:55:12 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git  tags/pull-tcg-20230511-2
> 
> for you to fetch changes up to 335dfd253fc242b009a1b9b5d4fffbf4ea52928d:
> 
>    target/loongarch: Do not include tcg-ldst.h (2023-05-11 09:53:41 +0100)
> 
> ----------------------------------------------------------------
> target/m68k: Fix gen_load_fp regression
> accel/tcg: Ensure fairness with icount
> disas: Move disas.c into the target-independent source sets
> tcg: Use common routines for calling slow path helpers
> tcg/*: Cleanups to qemu_ld/st constraints
> tcg: Remove TARGET_ALIGNED_ONLY
> accel/tcg: Reorg system mode load/store helpers

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


