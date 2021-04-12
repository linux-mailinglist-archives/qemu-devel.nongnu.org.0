Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5964F35C40A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 12:33:08 +0200 (CEST)
Received: from localhost ([::1]:46528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVtsQ-0006z7-RB
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 06:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lVtqt-0006AN-N7; Mon, 12 Apr 2021 06:31:31 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:41568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lVtqs-0008R7-5C; Mon, 12 Apr 2021 06:31:31 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso6588881wmi.0; 
 Mon, 12 Apr 2021 03:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l4pcouo8LIApS4Y4u7W5iJnsHZElBrCJsNPIm7qOCNc=;
 b=GcOfTTEFN0xTdzZalfAcz/Mp+J1rgmzi42ruSTSbP/N3Mb/rJL7X+1dq1Sry+P/Frv
 HHHvmiJACaPrNGSo8/mZOjEs6lD3v1/okd+/JJ72dZ08q/Ch/xSYUz0cVs3dtJ7PHicq
 90EuggnQNfKYj5wbXKdmgPBw5XH2kVwwrPOfQ001M3EpLf0wb+IzIDgcbi0wo4X38r54
 nRQEIPAKMXB4czVzJGsw6uAVqS3ECth7qezUtaNBrFrIRT65GVBw/fUHd+I3PI+9BLZp
 t7771SuCz4DI0AkWn8Ef5DnVu1udD+tmsUx41Lhc45M1LGvdfUG+uYqiu203N3D3obeW
 t3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l4pcouo8LIApS4Y4u7W5iJnsHZElBrCJsNPIm7qOCNc=;
 b=CGWi+FAtwrwjPcaJiutuxhvbzrd0A4SW7ME0A0JRGvZcfcmb2f0TyTJTzxvhjicxjt
 l3qbmRghUptdSXy7+FrnpGStWdc2rRfhZxTZftWx5IoflILoo5PS8e78U1WLP6uksSO4
 5NlX5qS7vd/6mB1t+Xw1l17Xq36GiHHPOwuFrEygt/o9sFB5jvPlmIEq2gYNSCMO8BYH
 EUtYu/DHcGpm+XblI3jPWWHmGwrraWkm5IX+wbsroA9qHzUmwH9B2BYIraLFYYSZMAvf
 KWXlpuvzc5PExk2gl2FqWsQih9sbxkV6JgqqkTtDsn0eKc9b6lE7gx5ZfwFVkkO8MGLg
 EjSg==
X-Gm-Message-State: AOAM5328FT2c0Xpkd9aG+JMs0oEruvQuw6ZVBNB6J3NTUY/UTzqP/Tfz
 3ful9Df//KPrSrH/nK5bJWM=
X-Google-Smtp-Source: ABdhPJzd/NqPa7AjJKrLx5/bRMe/OatiYJ5m7GOHPmRhwHTdj4DzRLdZB7eFvfLViiqTvogQSedt0A==
X-Received: by 2002:a05:600c:378c:: with SMTP id
 o12mr26075322wmr.69.1618223487580; 
 Mon, 12 Apr 2021 03:31:27 -0700 (PDT)
Received: from [192.168.1.36] (63.red-83-51-208.dynamicip.rima-tde.net.
 [83.51.208.63])
 by smtp.gmail.com with ESMTPSA id j30sm17299056wrj.62.2021.04.12.03.31.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Apr 2021 03:31:26 -0700 (PDT)
Subject: Re: [RFC PATCH-for-6.1 0/9] hw/clock: Strengthen machine (non-qdev)
 clock propagation
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210409062401.2350436-1-f4bug@amsat.org>
 <20210410131932.i6no5tvvaldyomvp@sekoia-pc.home.lmichel.fr>
 <09a63c3e-aa68-0d2d-b447-db9cd84dab09@amsat.org>
 <CAFEAcA9rqx97D_ZN7MzqqJtz9ajFNK=AAeQu9z65+g35SHD_NA@mail.gmail.com>
 <CAFEAcA-5h5ZjXyX6WbdQ8n=pqNSXTHfrt3fQSQzp6EYJY_zXLg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ab8fcac0-eb15-3f59-1b14-ef6b4cba6e03@amsat.org>
Date: Mon, 12 Apr 2021 12:31:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-5h5ZjXyX6WbdQ8n=pqNSXTHfrt3fQSQzp6EYJY_zXLg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 4/12/21 12:11 PM, Peter Maydell wrote:
> On Sat, 10 Apr 2021 at 16:15, Peter Maydell <peter.maydell@linaro.org> wrote:
>> I do wonder if the right fix to that would be to make TYPE_MACHINE
>> be a subtype of TYPE_DEVICE, though -- machines not being subtypes
>> of device has other annoying effects, like their not having reset
>> methods or being able to register vmstate structs.
> 
> I wasn't quite right about this -- turns out that machines can
> have a reset method, but it is a weird special case method
> MachineClass::reset that isn't like device reset. (We use it
> in a few machine types; if implemented, it is responsible for
> calling qemu_devices_reset() to kick off device reset. Probably
> MachineClass ought to implement TYPE_RESETTABLE_INTERFACE
> instead.)

TIL MachineClass::reset().

- hw/hppa/machine.c
- hw/i386/pc.c

  Used to reset CPUs manually because CPUs aren't sysbus-reset.

- hw/i386/microvm.c

  Removing the microvm_fix_kernel_cmdline() call which is suspicious
  at reset (should be enough once in realize time), the is the same
  previous "Used to reset CPUs manually ..."

- hw/ppc/pnv.c

  "Reset BMC simulator" seems a legitimate case of machine reset.

  Next is 'fdt = pnv_dt_create()'. So guest has changed hardware state
  and we need to refresh the DT for the next guest boots. Could be.

- hw/ppc/spapr.c

  Similar previous "Used to reset CPUs manually ..."

  Similar previous "update DT after hardware physically changed".


Am I correct than half of these handlers code is to kludge the fact
that CPU aren't reset such device reset?

Regards,

Phil.

