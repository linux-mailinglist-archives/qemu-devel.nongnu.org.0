Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BDE42FD18
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 22:43:28 +0200 (CEST)
Received: from localhost ([::1]:40884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbU35-0006l8-R4
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 16:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbU1q-0005Og-77
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 16:42:10 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:36530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbU1o-0000kS-Il
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 16:42:09 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 qe4-20020a17090b4f8400b0019f663cfcd1so10173030pjb.1
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 13:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r18EO4fPyyz0pUIc5NBJ/o1T00Oaz14Tl981lU+wcbk=;
 b=vRwo2SiDZf6abCrWLkuNag7/5VATqoZEx3xns+FpSWrTaF4Y22Jt2fK3U/i91jd/bB
 Bx88733cbfouJNjcshncfhLjubUD8BPr1h3QkcfOBiTNgxYcVfY4kLV1XEZyNhIpXM5u
 jVdICSGFR+2GdBCmS4dLEpb0Kc48xCN+VdJ9mnBQ4t8XrJWEG9JJ52h2T3YI5Imnm52Y
 /uiBW+s38CYbkk2Z49lBw1D/bePA4bk/kzAP/BBQtxESRTI7HK6lhZu8OmbyxqIF7xNt
 e70UNiS/UebApNSOBSFWsz1O/oCC38I1BdvYRJpemsPB3t9XCTwFXilYXi1CycAVXsUm
 Q6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r18EO4fPyyz0pUIc5NBJ/o1T00Oaz14Tl981lU+wcbk=;
 b=wD6/aot4tx9rgzJo+r6R9oNTQEAlBmnIcOLSJsQAXR0dx5ZLhpL2QQEkDEySfZmldM
 YBZqciAhC+hlfNRg7Mh7gyNGefBi+GMsjT5AYEZ100/C8988cFzUNyHmz3eaivRbdkcC
 e515tfAI5SmQzCGNXnVwLx4+/0kmDpfvt6zDJ3Itet6Fbfm9wNjBiXTOn+hMciJhhTEk
 nOmUUyUUAc3PVSr6tueyqY49fM/zasFHo3PLceeeGRt1+vTxYKogNXhSmKDP0M/3KInW
 GBOuWuVn1grmZzmgI3alYDIlMqxWxta1Q0eOHuL4CxEW46XkN6mt3zv9TfmVWlxZz0YC
 tDrA==
X-Gm-Message-State: AOAM533VvoDvRxTxHe59nkCtwBgIOmckwaXQpGESGsr/UITdxY6DSyqm
 8Iiz5xZENXyXQR0Wq0SWFjw9dYwoi7thUQ==
X-Google-Smtp-Source: ABdhPJyOBB3x8wSo71poIXdRpN3PAjK3Zw9G5DRDHp8j/T71GhwxgTgslk6WKZYtcl2h7rTRFREbGQ==
X-Received: by 2002:a17:902:e80c:b0:13f:1140:8ab2 with SMTP id
 u12-20020a170902e80c00b0013f11408ab2mr13023717plg.27.1634330527083; 
 Fri, 15 Oct 2021 13:42:07 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k22sm5510344pfi.149.2021.10.15.13.42.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 13:42:06 -0700 (PDT)
Subject: Re: [PATCH v2 2/6] target/riscv: zfh: half-precision computational
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20211015070307.3860984-1-frank.chang@sifive.com>
 <20211015070307.3860984-3-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6cd34eee-5bbf-5487-ce70-ae07b9b6d368@linaro.org>
Date: Fri, 15 Oct 2021 13:42:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015070307.3860984-3-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: Chih-Min Chao <chihmin.chao@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/21 12:03 AM, frank.chang@sifive.com wrote:
> From: Kito Cheng<kito.cheng@sifive.com>
> 
> Signed-off-by: Kito Cheng<kito.cheng@sifive.com>
> Signed-off-by: Chih-Min Chao<chihmin.chao@sifive.com>
> Signed-off-by: Frank Chang<frank.chang@sifive.com>
> ---
>   target/riscv/fpu_helper.c                 |  82 ++++++++++++++
>   target/riscv/helper.h                     |  13 +++
>   target/riscv/insn32.decode                |  11 ++
>   target/riscv/insn_trans/trans_rvzfh.c.inc | 129 ++++++++++++++++++++++
>   target/riscv/internals.h                  |  16 +++
>   5 files changed, 251 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

