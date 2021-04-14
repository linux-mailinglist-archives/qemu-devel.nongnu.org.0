Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D854835FC63
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 22:11:59 +0200 (CEST)
Received: from localhost ([::1]:50270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWlrj-0003Tx-0k
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 16:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWlpF-00027p-33
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 16:09:25 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:42927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWlpD-0007ch-8N
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 16:09:24 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so11427732pjv.1
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 13:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BbA8fbcTT0B1RIoGjbjBT05V2h3+vOiUtemmgv9qvIc=;
 b=bE+7yUy8YWGlD0A/J+N2eH469R887eKzoxrxKk70OG6sWRw1N4hRWsG/DxEyFE+4AR
 yx6a9rSlghcOQRzKIibBwOT52ODMiJRw8OcZSnqml1PY34bv54WcgXRujiLiaqLWzqHp
 mA+dQL9h8148oa0gAnQejt94k8jiKdP+kfJYQMQvg6oSA835yHIWGeAcUJ31FHleon3u
 Wzshczt80tHLSSZzFUEZS4bE3AuFOD0VfzvdHPywJB7u+h81t8Giy3/UX0OtfFY/nGig
 nnhiU34oTCkqxU5wguxQM7AffIkHKWvJrFfDIfoY4QS7ho+EtatKtE9YY/GVkC4gnMEf
 64Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BbA8fbcTT0B1RIoGjbjBT05V2h3+vOiUtemmgv9qvIc=;
 b=cBH+wlFD89owTMMpdbOBcF4xlMv50jvIq7CWmmbhGd9hPxEvjmzXJ33tnXnC9CMtSx
 ZCGUtDr0Ja0wPiKYj5V7+mBaTN+sRoTmx3b/+wkYYakfOBetDHbzyl7uVyVTestwVj4h
 lUIAsGVvHXS9BnoZ/PNXdQbPJQHUzXTkKwNnUbXsg0H2jrR3Ayp1kz9tBqj8HpteOFhk
 drlquqoFDOO/ozN2ZtwFPxOS4dH6AYCJgWTPQ2vaA7GaPfOokgXwWBa1h+QyAM/cnM9W
 fazj8NDq5lVttoxj6tYgRTXotwAc4BXc7JvU3t7UCgs5K7DWb8l91hukajWpFFo9P5DS
 KkGA==
X-Gm-Message-State: AOAM532nPcXnzVfxXLZcXr7U58wwUTIeWojRSrr8fmJ0MKWXPgJ5hEFf
 Cv8eY4B9k7+m1rHxx6BvES9KFw==
X-Google-Smtp-Source: ABdhPJxOh+h82tHCzbCRgVK74afIS743KillSbQnzG+X3R1znO1DRwwjTMz88hLCQiyDLOsags+3aA==
X-Received: by 2002:a17:902:ee11:b029:e6:f007:71d with SMTP id
 z17-20020a170902ee11b02900e6f007071dmr26538423plb.15.1618430961857; 
 Wed, 14 Apr 2021 13:09:21 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id l10sm341908pga.8.2021.04.14.13.09.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 13:09:21 -0700 (PDT)
Subject: Re: [PATCH v3] target/ppc: code motion from translate_init.c.inc to
 gdbstub.c
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210414145947.30155-1-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <74b629d5-0b7f-e53c-2d2c-29de23c564b7@linaro.org>
Date: Wed, 14 Apr 2021 13:09:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210414145947.30155-1-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: farosas@linux.ibm.com, lucas.araujo@eldorado.org.br,
 luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/14/21 7:59 AM, Bruno Larsen (billionai) wrote:
> All the code related to gdb has been moved from translate_init.c.inc
> file to the gdbstub.c file, where it makes more sense.
> 
> This new version puts the prototypes in internal.h, to not expose
> them unnecessarily.
> 
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> Suggested-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>   target/ppc/gdbstub.c            | 258 ++++++++++++++++++++++++++++++++
>   target/ppc/internal.h           |   5 +
>   target/ppc/translate_init.c.inc | 254 +------------------------------
>   3 files changed, 264 insertions(+), 253 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *pcc)
> +{
> +
> +    if (pcc->insns_flags & PPC_FLOAT) {

Watch the extra blank lines.


r~

