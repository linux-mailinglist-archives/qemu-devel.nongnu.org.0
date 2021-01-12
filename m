Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 390742F27FB
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 06:50:05 +0100 (CET)
Received: from localhost ([::1]:49734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzCZA-0000M8-AK
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 00:50:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzCVG-0006e6-KS
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 00:46:05 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:35160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzCVC-0004bi-Ee
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 00:46:02 -0500
Received: by mail-pj1-x102a.google.com with SMTP id b5so967868pjl.0
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 21:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0btZZyxLbPp+zlpmT4LbQ6qGRS+kr24F+fkm0s4Esnc=;
 b=xIJhEPle0E64Iewc8aQ1a6h9z+gVY6pFbo1u5fyP+wQcIxN+mC9mprQqOt399MaCXZ
 Ukl36hypr8IVCo/6cDYGkQYkrQQU43nagXaVaKLfEgfZ6TupcEjoRxEkvY0aUkFMNd8/
 UvKAabewO7e+K0ZAu+VivGIDarMJreTBiG6jLFk7Vvw+JYTRnpTrB+WydyD1u5bFR2E1
 3C+/oT4hOtd/erNVsyGx9ne4x4RmYGnjJnp3KbT2092Ge1zXHe5KE87Oh7ClIVwx4pCg
 ELKGXffb7p6tiXzbrUp58/hzo2XjEWmS/vCKG2yWW02+osF3KSCdgtaXimcqH3Ccxe6T
 DKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0btZZyxLbPp+zlpmT4LbQ6qGRS+kr24F+fkm0s4Esnc=;
 b=eGTL7PqhdAZeeD/C5mIyOKbVvMA/eZxz8UIbEGjX0xw09hkksYO763xg5ePvUWaMAq
 g2b+ui2EmdScrToOwv3FX9ftw+r6OLFLiwG8NGZkrdE9PqdoUhHjyTf+RNvIhZRMg1X3
 +MZhC4N+nMxNbPOqr1IvJRPgo5fBxjcbwpFnwRDmtA5iTLlElayBzCcjlQcHJF0jBm7+
 UDM2CrbjfDKtTOkC7VQxGNpTRpRhvtKPZlY1LPErqc/VF/PiPHxB1vKIbU8+FNlluuLl
 2AItV53Z9bPUxcR6Rr/gpFDGaLWgIQNrMDfrtUUnX5HlBXtjjh6louMeU9rEjSYMFn87
 rC5w==
X-Gm-Message-State: AOAM533vLp3YWALt++iNKoz5oIMP9pAu2qTevIHAcI4/0SR8mOKRrHwp
 pcZWAmeiq8DtuEEcbHxollkvYA==
X-Google-Smtp-Source: ABdhPJyvD3aHzslT9iXVng3kD6opQiX520ZQoSnSjZi3MBxVZE1enxCn1nso3sCgzYEOvbzYZtsWCw==
X-Received: by 2002:a17:902:6b89:b029:da:fc41:baec with SMTP id
 p9-20020a1709026b89b02900dafc41baecmr3544914plk.39.1610430353146; 
 Mon, 11 Jan 2021 21:45:53 -0800 (PST)
Received: from [10.25.18.36] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id 4sm1442426pjn.14.2021.01.11.21.45.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 21:45:52 -0800 (PST)
Subject: Re: [RFC v3 11/16] target/riscv: rvb: rotate (left/right)
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20210112022001.20521-1-frank.chang@sifive.com>
 <20210112022001.20521-12-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6c66108c-2b31-a080-1349-32ba5a3a2dc1@linaro.org>
Date: Mon, 11 Jan 2021 19:45:48 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210112022001.20521-12-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/21 4:19 PM, frank.chang@sifive.com wrote:
> From: Kito Cheng <kito.cheng@sifive.com>
> 
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn32-64.decode           |  3 +++
>  target/riscv/insn32.decode              |  3 +++
>  target/riscv/insn_trans/trans_rvb.c.inc | 36 +++++++++++++++++++++++++
>  target/riscv/translate.c                | 36 +++++++++++++++++++++++++
>  4 files changed, 78 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

