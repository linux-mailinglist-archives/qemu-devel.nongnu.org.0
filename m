Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE0743D600
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 23:43:59 +0200 (CEST)
Received: from localhost ([::1]:33732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfqiE-00061M-G6
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 17:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfqh4-0005I0-5c
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 17:42:46 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:38428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfqh2-0001xM-1U
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 17:42:45 -0400
Received: by mail-pl1-x62a.google.com with SMTP id i5so2966247pla.5
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 14:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DDbg65TAA+zPhHLYqz37PHw2GkJWA1Dwol9fSOQXtQM=;
 b=a24nJPgqGZJY+4Txygt4Bpq8GXfkA5acWJEy15teYIEm2JB/0mWzm4fsPz4+6+ivo1
 t3+PiyjLMwVptKOxhspVrSQLmk/E5L7+v6vtJ9lYwsDmmGURe/VlglpAI7q6s0/+oGLZ
 PVxbnsRX096/3kO+UEIv/Mxrr6WUOPr7WEnZaYxM3TgK49qx7X6gktqL2CEJcY6+7XRO
 ds8rcJnZCEvmYTVdsm47aZ9ISHzyNQB1PxntcNdR+A/9bueABri9O39+K7TbT453p0xH
 PsAJ2tevzamKpukyZAYzDqcppDzGZpEC6szeVDZDz/Pg02HEbaFudOAZ0dkwpfyB1yz6
 ZoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DDbg65TAA+zPhHLYqz37PHw2GkJWA1Dwol9fSOQXtQM=;
 b=Q7/O+2Bx5M4Q3WJEJhCkTCsL3VMngZH/kPaSVJC2tvriTgzo91RrZt7jwVS7AhiQ6C
 ptYcXxcqkhcOlQ1Kr2sjVPPOlC2RnlKu0u4mT097G8IsH04QQ6ZKqdfTjSWl9e7jyaMS
 h+VddrmtrWEvCNzmkHDDhcfTS+zeRzptuG4QWFezjUj7oB8o1h3nUA99IiIj+Pd0H7MD
 k38KKbe604emYxxgJJxxK2sgsKu8dz0oQouUhXL/NZj9veOJkguzb9Dlj7Ie4hJQJFC7
 w824S8HTpLaq3xy1nzZ6z3ln+wbjhGsA1QclBk4aibRoFigLFTgplZEo3LLkjMKdrdpR
 4mlQ==
X-Gm-Message-State: AOAM5302DfipqGoJipra/PmikQt1UswG1/N0YAO+ZhK8GjTsEW0xhV7+
 bLLK+xHS3ttt38paEgF4XqiYjQ==
X-Google-Smtp-Source: ABdhPJwGGSCnKKZc8i5h5LihQ1jImTs5DnWoPACS8EwbLUFhh4AhehPD/1Wcw2UZaswtipmsAYTnxA==
X-Received: by 2002:a17:90b:4ad0:: with SMTP id
 mh16mr292371pjb.2.1635370962454; 
 Wed, 27 Oct 2021 14:42:42 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z124sm890349pfb.108.2021.10.27.14.42.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 14:42:42 -0700 (PDT)
Subject: Re: [PATCH v2 13/32] target/mips: Convert MSA load/store instruction
 format to decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211027180730.1551932-1-f4bug@amsat.org>
 <20211027180730.1551932-14-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <27fde2cf-e8ca-1c01-4cdc-08ab56e9bb94@linaro.org>
Date: Wed, 27 Oct 2021 14:42:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027180730.1551932-14-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 11:07 AM, Philippe Mathieu-Daudé wrote:
> Convert load/store instructions to decodetree.
> 
> Reviewed-by: Jiaxun Yang<jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> v2: Add TRANS_DF_x() and use an array of 4 functions (tip from Richard)
> ---
>   target/mips/tcg/msa.decode      |  5 ++
>   target/mips/tcg/msa_translate.c | 86 +++++++++++----------------------
>   2 files changed, 32 insertions(+), 59 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

