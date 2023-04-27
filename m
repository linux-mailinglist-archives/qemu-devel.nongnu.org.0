Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4406F020B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 09:47:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prwKq-0001lK-Kd; Thu, 27 Apr 2023 03:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prwKp-0001l9-8k
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 03:46:35 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prwKn-0002HW-3M
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 03:46:34 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50a145a0957so4094808a12.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 00:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682581591; x=1685173591;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TLERvTyVrI0aGRcyFCunpIOho9bqq2BbtD6Osm4//kM=;
 b=jJYxCovLmc43BUTd6uh4nXa+ykGgCytkvER8argeH2ZTa5qRbpZaS9tkveBI/v0fp8
 sl5WVSHAhxw/L94SFbSf72Y3wE0dQOhzRq1KU2dqyR2uNe+fZzzHkHt41bmoqCiKt7UG
 QV/hK6x0mwooAKmE9yuv4K09zSJzegpEWF3w8pG7Et9gA1yfec+ifIiUXVnWeedmCGLJ
 yp98Ki23GhxOTiLYHI7O2/qhTV7NF8dWFzRrzZ+CRIxaz5viATtb+4yF5vVTeCkWJL2P
 nqa3DdDJ67iaQGz6Coh9vjCJaq8jfrUej9aom5g8IP6AEN8ehSnJUCv9aUAYhD7ZQu/8
 zVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682581591; x=1685173591;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TLERvTyVrI0aGRcyFCunpIOho9bqq2BbtD6Osm4//kM=;
 b=KJRDgo3hFvaZPWUU1V1VSR/UX/R64teGpehTvb9NnR9/f9pRDs0fqv/fCuxM5EJ0Tz
 r8oOt/R5SVBW5fFcAhaK+xcgx6AQb0cWZSOFjZ2LFAbyqhMDVHfqOf44EETE3aAfmQb1
 dhPBLr9LXXVed5+SZ9kzLrR1/jI8cHJHqnmALxFLERv5bDPapi9OuNbJAdB46J170QcU
 jWFtxO34rdHUtD2NmGD3yWiRQbvBck72PHcDPj67PheGcn7/y7GBAJzlEJlPtuzPL+Qg
 mZweiPfhMiouK6v1OSwHmRgf3ICNVCCcomSE3Rxvzee51viuvRBDtmyjfPJ4Hgh0Yvfd
 W6mw==
X-Gm-Message-State: AC+VfDwA7Hz2vfJZ4OYwFNWINADzTF5LSJIRrocJJOcGhm3o7YlobRvQ
 qZCfbhY+bX3Wzyoy++cIKpU8fA==
X-Google-Smtp-Source: ACHHUZ52eCXLYaIRYYz54D6hq1V9CNNYdiXjf/dbir2u+6AZUt/M7I/mksQtieMimlMctsA+VhhJ2A==
X-Received: by 2002:a17:906:728e:b0:94e:6eb3:abc4 with SMTP id
 b14-20020a170906728e00b0094e6eb3abc4mr5266620ejl.4.1682581591281; 
 Thu, 27 Apr 2023 00:46:31 -0700 (PDT)
Received: from [172.23.3.19] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 fx21-20020a170906b75500b009531d9efcc4sm9172372ejb.133.2023.04.27.00.46.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 00:46:30 -0700 (PDT)
Message-ID: <f40409d1-9aed-5b13-6798-867fbfb50a8a@linaro.org>
Date: Thu, 27 Apr 2023 08:46:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 2/2] accel/tcg/tcg-accel-ops-rr: ensure fairness with
 icount
Content-Language: en-US
To: Jamie Iles <quic_jiles@quicinc.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, philmd@linaro.org, peter.maydell@linaro.org
References: <20230427020925.51003-1-quic_jiles@quicinc.com>
 <20230427020925.51003-3-quic_jiles@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230427020925.51003-3-quic_jiles@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 4/27/23 03:09, Jamie Iles wrote:
> The round-robin scheduler will iterate over the CPU list with an
> assigned budget until the next timer expiry and may exit early because
> of a TB exit.  This is fine under normal operation but with icount
> enabled and SMP it is possible for a CPU to be starved of run time and
> the system live-locks.
> 
> For example, booting a riscv64 platform with '-icount
> shift=0,align=off,sleep=on -smp 2' we observe a livelock once the kernel
> has timers enabled and starts performing TLB shootdowns.  In this case
> we have CPU 0 in M-mode with interrupts disabled sending an IPI to CPU
> 1.  As we enter the TCG loop, we assign the icount budget to next timer
> interrupt to CPU 0 and begin executing where the guest is sat in a busy
> loop exhausting all of the budget before we try to execute CPU 1 which
> is the target of the IPI but CPU 1 is left with no budget with which to
> execute and the process repeats.
> 
> We try here to add some fairness by splitting the budget across all of
> the CPUs on the thread fairly before entering each one.  The CPU count
> is cached on CPU list generation ID to avoid iterating the list on each
> loop iteration.  With this change it is possible to boot an SMP rv64
> guest with icount enabled and no hangs.
> 
> Reviewed-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Tested-by: Peter Maydell<peter.maydell@linaro.org>
> Signed-off-by: Jamie Iles<quic_jiles@quicinc.com>
> ---
>   accel/tcg/tcg-accel-ops-icount.c | 17 +++++++++++++--
>   accel/tcg/tcg-accel-ops-icount.h |  3 ++-
>   accel/tcg/tcg-accel-ops-rr.c     | 37 +++++++++++++++++++++++++++++++-
>   3 files changed, 53 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

