Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A833E520590
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 21:57:15 +0200 (CEST)
Received: from localhost ([::1]:52608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no9VJ-0001ej-75
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 15:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1no9T7-0000ml-U5
 for qemu-devel@nongnu.org; Mon, 09 May 2022 15:54:58 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:35506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1no9T6-0004ce-58
 for qemu-devel@nongnu.org; Mon, 09 May 2022 15:54:57 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2f7c57ee6feso157180767b3.2
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 12:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9POuLCjJRKjPs4Qiw3GOb6CC+jq/9fZcHov7A6+j2gE=;
 b=uGDLkeMHEDSkUIsc9seaSzcPSGWJzWa0h/oIPM/kWfoue6xiGvO2aSjKuBa8TpfASp
 iM6N6MYY+NrdmnOFDS6xqHEG0uqtsayE97WWUz60zStIaQXouhxMl7ZvDdYaHwxbVTqJ
 2Ylh8Av/SYfpIByXaPghatwbeOI41Cp3rSaQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9POuLCjJRKjPs4Qiw3GOb6CC+jq/9fZcHov7A6+j2gE=;
 b=HNOaB5GOEVFB/mVF8MnZ8GFqV+E87MJXCLYsX5jO/54tb6A8yiY+ko6a0o+Vd6AdO8
 eXWO+O3ntbLEl3opSe2Ncqp/hm42edD+58HFbwYXw55pM4m0XxkHnPB3nRJDDgcqb+dF
 ta4z3mXF3eUP2eaiBCqvEycOhQtWjbjafuvtrhpDCpHhHs+92Ncs1GDpyARIHdfH38Yu
 LICT8dNnx5fIs4/fT29kAu4mnqCOFLVcxFi3w4ATHkJ1xGPTt3xqJ3ixc62Cv/BeuyWg
 kfLg+Rk58N2F+qYXd+0MfBmIs7NK798/guusevxWcMAPRIlnkCgUXpmZ4gjXbqGDr2fN
 Y38A==
X-Gm-Message-State: AOAM531GpWf2Wv/P090uVyVsRFLyPb6DU4SQjgqZEENLoE3dyccoxZua
 D3dM9ny5NhD3gxp7VR/rMKJR4QU1cdrnw55erq/u
X-Google-Smtp-Source: ABdhPJzAw10aG1O6+EZhbMDYJn3J26SD/T4r4aRciiDNHhZUpxreFiIVTnoySWJcj7KIrzlwGy+RiYh1xAeLDcITb5Y=
X-Received: by 2002:a05:690c:16:b0:2db:cfed:de0e with SMTP id
 bc22-20020a05690c001600b002dbcfedde0emr16141271ywb.271.1652126094803; Mon, 09
 May 2022 12:54:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220429153431.308829-1-apatel@ventanamicro.com>
 <20220429153431.308829-3-apatel@ventanamicro.com>
 <CANzO1D0DxbM=KAwU1E4ZpMfdBpojqX-5+tYGDmtKoQujScuC6A@mail.gmail.com>
In-Reply-To: <CANzO1D0DxbM=KAwU1E4ZpMfdBpojqX-5+tYGDmtKoQujScuC6A@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 9 May 2022 12:54:44 -0700
Message-ID: <CAOnJCUKCXs29mimFY4-dvWguQyRJsOvAy5pVHm3Y5Dr65-AtOw@mail.gmail.com>
Subject: Re: [PATCH 2/3] target/riscv: Add dummy mcountinhibit CSR for priv
 spec v1.11 or higher
To: Frank Chang <frank.chang@sifive.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=atishp@atishpatra.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 4, 2022 at 2:53 AM Frank Chang <frank.chang@sifive.com> wrote:
>
> Hi Anup,
>
> I found that Atish has already submitted a patch to implement the mcountinhibit CSR:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg879349.html
>

Yeah. I think it depends on which series is merged first. The PMU
series actually uses mcountinhibit.
However, latest OpenSBI patches detect priv version v1.11 based on
mcountinhibit presence.
We need mcountinhibit support to test any v1.12 patches anyways.

If PMU patches are merged first, we don't need this patch.

> Regards,
> Frank Chang
>
> On Fri, Apr 29, 2022 at 11:44 PM Anup Patel <apatel@ventanamicro.com> wrote:
>>
>> The mcountinhibit CSR is mandatory for priv spec v1.11 or higher. For
>> implementation that don't want to implement can simply have a dummy
>> mcountinhibit which always zero.
>>
>> Fixes: a4b2fa433125 ("target/riscv: Introduce privilege version field in
>> the CSR ops.")
>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>> ---
>>  target/riscv/cpu_bits.h | 3 +++
>>  target/riscv/csr.c      | 2 ++
>>  2 files changed, 5 insertions(+)
>>
>> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
>> index 4d04b20d06..4a55c6a709 100644
>> --- a/target/riscv/cpu_bits.h
>> +++ b/target/riscv/cpu_bits.h
>> @@ -159,6 +159,9 @@
>>  #define CSR_MTVEC           0x305
>>  #define CSR_MCOUNTEREN      0x306
>>
>> +/* Machine Counter Setup */
>> +#define CSR_MCOUNTINHIBIT   0x320
>> +
>>  /* 32-bit only */
>>  #define CSR_MSTATUSH        0x310
>>
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index 2bf0a97196..e144ce7135 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -3391,6 +3391,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>>      [CSR_MIE]         = { "mie",        any,   NULL,    NULL,    rmw_mie           },
>>      [CSR_MTVEC]       = { "mtvec",      any,   read_mtvec,       write_mtvec       },
>>      [CSR_MCOUNTEREN]  = { "mcounteren", any,   read_mcounteren,  write_mcounteren  },
>> +    [CSR_MCOUNTINHIBIT] = { "mcountinhibit", any, read_zero, write_ignore,
>> +                                             .min_priv_ver = PRIV_VERSION_1_11_0 },
>>
>>      [CSR_MSTATUSH]    = { "mstatush",   any32, read_mstatush,    write_mstatush    },
>>
>> --
>> 2.34.1
>>
>>


-- 
Regards,
Atish

