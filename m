Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD4A2DC771
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 20:58:02 +0100 (CET)
Received: from localhost ([::1]:50980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpcvx-0001iD-11
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 14:58:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpctV-0008B8-9Q
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:55:29 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:35466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpctT-0004vg-Pm
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:55:29 -0500
Received: by mail-oi1-x22a.google.com with SMTP id s2so29029700oij.2
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 11:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=holC9FieOMLJMIML1wTWQ69ici2u+YywvFKu6WFDdZY=;
 b=O3gtqoTvxZfzGyD0+GL/zNFVO2U4nKpg3vDRFuBGRUnGfMTAmj93w6d0b1L9/tKjxY
 yBRexS/3Y5xS/FWi8CKCfo15NNaLy9jbN/Z+EoVTy+tiqrcj2CpZFfVHTaWvTzNxlFik
 neY5eO+HX0M0zgw7pykolkxd1aQujNnajGaeXBnmc3DPzlkKZ7a5o+rLo2JTE7seZzUg
 /PuXn2RXZjH3FuQhkdyNYzIE06A6cii5+iG30sQVNAmqrsnJSpYcHn4obEunDk9KpUX2
 T+7qCw24VQVk2g4LEC1TEMata+WfSoSi3iI/zK/jB8hWek8L2DdBThVlFW4AAQ51oS7z
 H3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=holC9FieOMLJMIML1wTWQ69ici2u+YywvFKu6WFDdZY=;
 b=ugvTUywbDNQeYJMmLs2Cz/Y94sWWtvNogefp0LFpd7yW3glV91i4dDNUn7yvoU5Ccn
 HoWQfLYxnhjmNcpvkvpciMFCZ4baJz4KSxvAJtWur3K6VIyKARzS2d5eVEYxGUv7Melc
 X0UHdsqEd1nFq95aSXkCS/EON71VMs1PC9y7zLENZ/cwUk+6urBTyl6SIqYgArIt+n14
 lpdeGk6nff3NRUFDuBL9gPelpRAEQ+VgCw3rl8zn3LINinwuiDMpx+FJiscN7xFsYDxv
 EZz4gUHHzXN/yXAzSakDp4sf459wVqfiUlRancTZmf7rEwyAAmpEdlU+OOCfeTlp/Ln5
 Q0OA==
X-Gm-Message-State: AOAM533GYWIVnx0roAQd2xWCTdkraWxhMbhzJarHKcqoo4l4ccrkS6Ta
 JLi/vhsF5T2fgj+cx42P2Tji2Q==
X-Google-Smtp-Source: ABdhPJyV/OXzVcCqPqiy9u0xSlzP2gKg6mCN5t9yXBwo2NeAvlbFlvVJ4m4nFa9D1qg39SCkHI76Vg==
X-Received: by 2002:aca:c7c2:: with SMTP id x185mr2873996oif.143.1608148526617; 
 Wed, 16 Dec 2020 11:55:26 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id z3sm714009ooj.26.2020.12.16.11.55.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 11:55:26 -0800 (PST)
Subject: Re: [PATCH v1 4/6] gdbstub: drop CPUEnv from gdb_exit()
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201214153012.12723-1-alex.bennee@linaro.org>
 <20201214153012.12723-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <380799b0-cad1-3a36-0164-365aa80e3dbb@linaro.org>
Date: Wed, 16 Dec 2020 13:55:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201214153012.12723-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
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
Cc: Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/20 9:30 AM, Alex Bennée wrote:
> gdb_exit() has never needed anything from env and I doubt we are going
> to start now.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/exec/gdbstub.h    | 2 +-
>  bsd-user/syscall.c        | 6 +++---
>  gdbstub.c                 | 2 +-
>  linux-user/exit.c         | 2 +-
>  target/arm/arm-semi.c     | 2 +-
>  target/m68k/m68k-semi.c   | 2 +-
>  target/nios2/nios2-semi.c | 2 +-
>  7 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

