Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5311497A0A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 09:13:34 +0100 (CET)
Received: from localhost ([::1]:56728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBuTl-0000YU-OS
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 03:13:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBuD0-0005MF-OT
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 02:56:14 -0500
Received: from [2607:f8b0:4864:20::42b] (port=37387
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBuCy-0001fq-QJ
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 02:56:14 -0500
Received: by mail-pf1-x42b.google.com with SMTP id p37so15153076pfh.4
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 23:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dTA7B7YwhZo/CfGsq+HdQYfOE7m/WD1pPEXixsDQtlA=;
 b=jFc4NPGO/OK9jbn8zVfW8GjbxyrJEKL+JE5dbP6IJvMzmwmFFV8w1dmutTR43FxGkh
 oxGXbqbdJQ8jFAUxQcXIqDDPIe5jhRQ0axC2UMUOd8DmBrLfntQqeh//estbUcly2TGr
 ko8xBFBF7j1detE3TmwRlefLXw0dMtaHzY+QW/KJ6Ww1MJslbWOoLXy6WBXa7IRjg2UM
 YThZ8VBqULLaJ9UUgwyuiheUPkIvWhzl1/HaBGCGu7pVHoWAK5CqLA74aZ5ADRjstCrt
 BisV6sQJbJ9KY+4RE/6LTThh3L2wpCv0yIoKIt30N6VF6yZaPmFseA0ef3qCr/HjqmOC
 6ZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dTA7B7YwhZo/CfGsq+HdQYfOE7m/WD1pPEXixsDQtlA=;
 b=rPEWw8k3n8TXtIWuFuSfErBQFGvk6PBwNIsQvWyv3WuFB0CkmD8RdCxfO7t/lh6KPD
 E51UU9i+GGRnYPpmp3ok4xW6fuRptPE2C5FudpKzLLaE5scf1Yp7Doa6cXlktKJXsGbC
 qeduEjU85LAUJPrbwMOU2ma79W6Lcsc6yfO4VDxoMfBKNolWBaDdG1gCFAeXpkT5OgA2
 xBmQ9B+Ozwc/IaYxRFdw92IsIta4+oNX0Yz+tHqqg6Y5yQeDwyrNzgsxwIrj7knuE408
 bT7XhDUEP86XS9cr+u7hjzLXm2HKI1t1Jzk8hxqYaAEBacK/BAFoRR3Qfh+5XHuEmW1Y
 a+CA==
X-Gm-Message-State: AOAM5320or4T80IodeXIZW3UczRqNqr6HCoEAGNzYRdblZovdtFpQ5X5
 WPsRqVW/BPfypBVWJjQlcxG9zA==
X-Google-Smtp-Source: ABdhPJyVNfkfqBRswZaOspM45Azgzat0cl1Khs/Kj9JpU2x6nmf1bfkBq2YRJ4G1s9Jtzpsl+2TcnA==
X-Received: by 2002:a63:84c3:: with SMTP id k186mr6155288pgd.473.1643010971365; 
 Sun, 23 Jan 2022 23:56:11 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id b12sm15468082pfv.148.2022.01.23.23.56.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jan 2022 23:56:11 -0800 (PST)
Subject: Re: [RFC 2/5] target/riscv: Introduce privilege version field in the
 CSR ops.
To: Atish Patra <atishp@rivosinc.com>, qemu-devel@nongnu.org
References: <20220120200735.2739543-1-atishp@rivosinc.com>
 <20220120200735.2739543-3-atishp@rivosinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <936ade43-0fc9-56a5-f7a3-17180128a985@linaro.org>
Date: Mon, 24 Jan 2022 18:56:05 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220120200735.2739543-3-atishp@rivosinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/22 7:07 AM, Atish Patra wrote:
> +    [CSR_VSTART]   = { "vstart",   vs,     read_vstart,  write_vstart, NULL,
> +                                           NULL, NULL, PRIV_VERSION_1_12_0 },

I think adding all of these NULLs are hard to read.
Better to just add

     .min_priv_ver = PRIV_VERSION_1_12_0

to the existing entry.


r~

