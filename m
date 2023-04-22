Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDB96EB78E
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 07:10:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pq5Uo-0000nr-05; Sat, 22 Apr 2023 01:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pq5Ul-0000nT-Sr
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 01:09:11 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pq5Uj-0003Pt-CC
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 01:09:11 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f19afc4fd8so490545e9.2
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 22:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682140147; x=1684732147;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z/Qi466Vnjs0n0QyWA/HB+yOGHDknMcKGPwn4qXIDNI=;
 b=AGqV2J1uUf0aA1I7rznRFeVXrJO2fMaaiJ09LCgU9I+5q7k665Eyw2l8+kGADpwt//
 ZDAbiG2AII6SkBrXz2Uv3xrAkKl4n/tutFWPwnm2LSAEj4wTecqbCHfikyl3rN7tJjQK
 EdBMRLayCbC26pedjFxEqexuCJ4dxtGWMkfAhOJgCPbrewvTyq94FRsYECtxsl4o7GAN
 ow9h3rFl9sziho5tguCMgSrL8O+OiiVvszlQxaeSKQYUNxOwDCks34sONlMlG/vCJF9u
 B0tezX0wyXS1fQdJeFjub5X5l5NELUnwAnI4OhAGAMYfpJwZDdZnrutjTjPhiVtINN/g
 IdNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682140147; x=1684732147;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z/Qi466Vnjs0n0QyWA/HB+yOGHDknMcKGPwn4qXIDNI=;
 b=f9GHYZm1MRBOwZQ7CmtPgfu5qZVaJWKzgEuXBHxC9tx2PNrbe4mI7jWTvxLULj8wIX
 GwoBAzKSEIgKiBmTmp0zd6ogx3oSUcmFd6zTU7+xNmYOx5wHPm4/CnvxD3hzy2mBaPzi
 4+1Ec+i+dGLHSGLNEQ9jH+a4+N0vDWd9UDQR2e7Ij1FIAtztaYH/K7vHHJbKyKbM2KUe
 5LlD+SIbfT54MCo0u+BMsqp6VjBGj13pjKHPAmER/EzNZRyryzt9vFl9I2TpqMvUCJOC
 01EN4L3D1lfsbKcx8ePUjvrw75D/HiAaef+yP5j8K11GLPtZRVBuAWy3SPUHHHS0w28l
 tyFw==
X-Gm-Message-State: AAQBX9dVSUzDjVj2YgLiyq1ThGPOgphiLE+NROvwNf+yACOK7c2xhk93
 scUTsUzhCaiCQNQN0nPU/4Ehzw==
X-Google-Smtp-Source: AKy350ZooN7mzmL3DvgtaTA5gsjDzBwMu4uBdMmHDIIx2p9ziMYoUrX3o8vXBYLY0czNwnnrQs1xyw==
X-Received: by 2002:adf:fdcc:0:b0:2fa:14c8:3f22 with SMTP id
 i12-20020adffdcc000000b002fa14c83f22mr5189483wrs.30.1682140146746; 
 Fri, 21 Apr 2023 22:09:06 -0700 (PDT)
Received: from [10.43.0.111] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 f12-20020adfdb4c000000b002f9ff443184sm5803987wrj.24.2023.04.21.22.09.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 22:09:06 -0700 (PDT)
Message-ID: <0c8413a9-99b6-dfff-3c80-534048738c19@linaro.org>
Date: Sat, 22 Apr 2023 06:09:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/20] Migration 20230420 patches
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
References: <20230420131751.28534-1-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420131751.28534-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
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

On 4/20/23 14:17, Juan Quintela wrote:
> The following changes since commit 2d82c32b2ceaca3dc3da5e36e10976f34bfcb598:
> 
>    Open 8.1 development tree (2023-04-20 10:05:25 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/juan.quintela/qemu.git  tags/migration-20230420-pull-request
> 
> for you to fetch changes up to cdf07846e6fe07a2e20c93eed5902114dc1d3dcf:
> 
>    migration: Pass migrate_caps_check() the old and new caps (2023-04-20 15:10:58 +0200)
> 
> ----------------------------------------------------------------
> Migration Pull request
> 
> This series include everything reviewed for migration:
> 
> - fix for disk stop/start (eric)
> - detect filesystem of hostmem (peter)
> - rename qatomic_mb_read (paolo)
> - whitespace cleanup (李皆俊)
>    I hope copy and paste work for the name O:-)
> - atomic_counters series (juan)
> - two first patches of capabilities (juan)
> 
> Please apply,

Fails CI:
https://gitlab.com/qemu-project/qemu/-/jobs/4159279870#L2896

/usr/lib/gcc-cross/mipsel-linux-gnu/10/../../../../mipsel-linux-gnu/bin/ld: 
libcommon.fa.p/migration_migration.c.o: undefined reference to symbol 
'__atomic_load_8@@LIBATOMIC_1.0'

You're using an atomic 8-byte operation on a host that doesn't support it.  Did you use 
qatomic_read__nocheck instead of qatomic_read to try and get around a build failure on 
i686?  The check is there for a reason...


r~

