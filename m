Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7014381E4
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 06:49:35 +0200 (CEST)
Received: from localhost ([::1]:48542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me8yM-000192-Ug
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 00:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me8xY-0000Ju-Tp
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 00:48:44 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:42737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me8xW-0004Uc-Jh
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 00:48:44 -0400
Received: by mail-pf1-x42f.google.com with SMTP id m14so5428017pfc.9
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 21:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CbwGZkp95T99x1s7X7y3TMUA17rVI0k4T11Mvm/lS3U=;
 b=pg9u7nNA9I9e2kqaZ+WmeAk1S10wWybWHJpRHt5c8BCEKUN0f3SGUl92waCRNbH5fU
 0chxAMpVPtGABsBYZ9TwG6S+x1TC2lWlKsyZ4JxKReatysBCnuBhcEF2JUt/1ZgkDKcR
 Tbhh0q1Dv8+8og8H+1OvLL8qs9N/V+ZVocwXioE//Sv5t7Num8J2XxthLe8OTjR39STZ
 uIRXNfdc7UMxu+EBAfmO9yHsDEoYlw3N5G7XKBjN/I6ZhhEoTmtGzIQU13jEJrvkC9lI
 rbfCVXTKwJFsvXVmkOi9VNpDtGAruTBu6jSfANvNjqqdw451JTIZqeaLujZpQAmZdycy
 /SoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CbwGZkp95T99x1s7X7y3TMUA17rVI0k4T11Mvm/lS3U=;
 b=hUiDOfCfRsy/ZELu3S8t+wAHe9lnZVW65nXtXMqUgZ6341pwtBk4JkoV0AJdjBPmXV
 YwP1g3pcrAR9hqx5nctwYTB6H+mWwmB7Le1yjCk4fCwsatFHCDvz8TrYvc0a2Rpu6PXV
 OPFf0++JGC/fBPYJUM08I2KHB+oVVXJ1irrI7MQ0jMOccXd1gLYIN1LHzd6DEWnagTaH
 MdFnbrU4z6ljJUpg4LssW/P+n06YKVIy8avYvMN8vNm/r6P2pDKKdpGxKVITXg0y+KoW
 mAlEtfeCcHht0OcCRYDRyU7Sk9nTs8bn5u32rdHSmhPFiW07mBr0qMXofGUPLarVBTi1
 tVwQ==
X-Gm-Message-State: AOAM531U2P7bkRmHziWqNri/CiiDiVyvFyacBndpXn2yIzRWoLvgOt+d
 +RUSRzqrXa/GaMe9BxzHg7gUag==
X-Google-Smtp-Source: ABdhPJxT/WCzbVCaaLi/U85+9dYF2aua9WX+rJ3mdS1VkOA5TphfBwOKyUn0da07PEYXOUycP/jyMQ==
X-Received: by 2002:a63:7308:: with SMTP id o8mr2989089pgc.77.1634964520870;
 Fri, 22 Oct 2021 21:48:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id d13sm12374626pfu.196.2021.10.22.21.48.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 21:48:40 -0700 (PDT)
Subject: Re: [PATCH 17/33] target/ppc: Implement Vector Insert from VSR using
 GPR index insns
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-18-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b31767a1-b11c-0535-46db-1b47da675ed6@linaro.org>
Date: Fri, 22 Oct 2021 21:48:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-18-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.742,
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Implements the following PowerISA v3.1 instructions:
> vinsbvlx: Vector Insert Byte from VSR using GPR-specified Left-Index
> vinshvlx: Vector Insert Halfword from VSR using GPR-specified
>            Left-Index
> vinswvlx: Vector Insert Word from VSR using GPR-specified Left-Index
> vinsbvrx: Vector Insert Byte from VSR using GPR-specified Right-Index
> vinshvrx: Vector Insert Halfword from VSR using GPR-specified
>            Right-Index
> vinswvrx: Vector Insert Word from VSR using GPR-specified Right-Index
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn32.decode            |  7 +++++++
>   target/ppc/int_helper.c             |  6 +++---
>   target/ppc/translate/vmx-impl.c.inc | 32 +++++++++++++++++++++++++++++
>   3 files changed, 42 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

