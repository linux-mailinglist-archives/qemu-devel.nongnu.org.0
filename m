Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C809540AF82
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:48:02 +0200 (CEST)
Received: from localhost ([::1]:40086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ8n2-0002ro-VQ
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQ8j2-0007JJ-Ii
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:43:52 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:40638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQ8WR-0001ti-L4
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:30:52 -0400
Received: by mail-pf1-x42e.google.com with SMTP id y8so6841131pfa.7
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 06:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q97mLxvRKkZCchy79NqrbXGUA15yi/wG1jclLaH25bM=;
 b=G6pgnwT4gbJWUnYMsCszp/y9fnKOgD/Cbrf5VBGbA9d0ByYpf7NJF94xmbyR/Qw0Wv
 AoOw8Vb12v3Y/WvqxsZ4B4lMxS3Z1ISyXQYTLUmwqOojjWg93QXEimakbOXSbwKtWbLC
 diIDXOhbITe1SzCuIpkJiuGQoHRj/nvcgYeEDc23onp4CzUIuwZa4Cay00CKiC+STidH
 HpOHEQ4qxTh7kmo7am17oOUt8QXDbX18cizmSOx8VGKyqppOKd5TPnC5z6AOUzwj8XGp
 XbJXY4QfswmHHARFvuaAW8mpPFZhIItXNWbRIEfoOtNj4e0sGX6dn/5CDwVPcjCdeWFW
 lU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q97mLxvRKkZCchy79NqrbXGUA15yi/wG1jclLaH25bM=;
 b=tPm3GyTR5tbEWfSI4pPnbX75Xju1pdWE3Q1BVSjXH/HdFGaOkf7qHyz2b2fkfMgEg4
 DoUGRpL1TjFKjklKLsA9U7wcGUd7VDUmFZq368tiI2bhhGZk32wn7AX5769/biOZ+1E4
 7x/07PU4Rez1lviU5Ni9YO5fux+Qe5lYQyXSKAVcPd/W+0lmVBVPFDbN797L8KrBmEev
 btRb6Ik24Ezg38MHgPx2j71z3Wt0FP3nf11ArOOOtfxKwWtbKNZWyVKJb2tjo6j0Z/RD
 C9xDFerHLDWusBbmqLRDVu/JcLxJPEbp/ii/6j+oGsUSANK2jG6DUHfIVuryZATJ4LKO
 R1Sg==
X-Gm-Message-State: AOAM5314CiOZXTQlbKW31us7TnBe7nsTn9Y+ygietZCV1OnUGMO7S6Kz
 pVfLTMZjYB1Vm1XqzZvxo+0RyQ==
X-Google-Smtp-Source: ABdhPJzZ4D7+TFK2zLf/RAlrdlG9rmUyTcFW9OezyHVcIe2Ud7viIbZUMmG1hoXyoLtyqgLJLVgtUA==
X-Received: by 2002:a05:6a00:ac8:b029:320:a6bb:880d with SMTP id
 c8-20020a056a000ac8b0290320a6bb880dmr4755912pfl.41.1631626250009; 
 Tue, 14 Sep 2021 06:30:50 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm11728268pgn.32.2021.09.14.06.30.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 06:30:49 -0700 (PDT)
Subject: Re: [PATCH v5 04/21] target/loongarch: Add fixed point arithmetic
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1631624431-30658-1-git-send-email-gaosong@loongson.cn>
 <1631624431-30658-5-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f1260a8c-9ca7-d3e6-5dd3-b9582648f963@linaro.org>
Date: Tue, 14 Sep 2021 06:30:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1631624431-30658-5-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 yangxiaojuan@loongson.cn, laurent@vivier.eu, peterx@redhat.com,
 alistair.francis@wdc.com, maobibo@loongson.cn, pbonzini@redhat.com,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 6:00 AM, Song Gao wrote:
> This patch implement fixed point arithemtic instruction translation.
> 
> This includes:
> - ADD.{W/D}, SUB.{W/D}
> - ADDI.{W/D}, ADDU16ID
> - ALSL.{W[U]/D}
> - LU12I.W, LU32I.D LU52I.D
> - SLT[U], SLT[U]I
> - PCADDI, PCADDU12I, PCADDU18I, PCALAU12I
> - AND, OR, NOR, XOR, ANDN, ORN
> - MUL.{W/D}, MULH.{W[U]/D[U]}
> - MULW.D.W[U]
> - DIV.{W[U]/D[U]}, MOD.{W[U]/D[U]}
> - ANDI, ORI, XORI
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Signed-off-by: XiaoJuan Yang<yangxiaojuan@loongson.cn>
> ---
>   target/loongarch/insn_trans/trans_arith.c | 322 ++++++++++++++++++++++++++++++
>   target/loongarch/insns.decode             |  89 +++++++++
>   target/loongarch/translate.c              |  78 ++++++++
>   target/loongarch/translate.h              |  19 ++
>   4 files changed, 508 insertions(+)
>   create mode 100644 target/loongarch/insn_trans/trans_arith.c
>   create mode 100644 target/loongarch/insns.decode

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

