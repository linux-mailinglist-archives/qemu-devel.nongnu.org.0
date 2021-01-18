Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 909CF2F9BEB
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 10:38:14 +0100 (CET)
Received: from localhost ([::1]:57018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1QzF-0001xi-Lo
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 04:38:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1QyA-0001Pk-A9
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:37:07 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Qy8-0004Ph-4h
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:37:05 -0500
Received: by mail-wr1-x433.google.com with SMTP id v15so12091276wrx.4
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 01:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AJ/NAMq6NV6UgYmHJRBoAjqVRaAsE2hxi5/tebO3E+Q=;
 b=DJsHTz7FKWfG1hUN8+akYg9804K6o7eGNJxZXR/tSvY1r/CEZDqsthpZaqjgbLy/oV
 30QD3bm/K2HS8A8WKluhpJqI6786CeXcRPOiXx1u+ZARJgrXUrc84jf1SizBUz11Pat0
 q7dQMEXpSKNKJmuIrPCsbDm+C9Ng6FyeWDsEKXeFDSDXVADBx0o2K3wzkiMsyvESxLsc
 gYKllxx6yWBW9f12vnbhvntephO6yoaH9zUM4LSre3FWsT4aJP5ESefXZLIAxQYn8dR0
 0FK61Zq2+RWt9ETYiLE5T+lqL7hsozB7bvRnN12DqrV7rmUl6wME7kx46qWJtpdyqGDi
 77tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AJ/NAMq6NV6UgYmHJRBoAjqVRaAsE2hxi5/tebO3E+Q=;
 b=o4ieDFwfd9P7m2xK/JqIvxUmD/CCsOrFq2Q6nG2iYqUyq9IugUEiZpgcRVfKzthz+K
 riV7iGKvpXxUogk7MIg4wU7Q1VptKA2dF/c7MjbmqfPlIsJS5U3EMVUt0A3zpRSXvUAg
 ZaGByGbL5CSTSWYvHZ/eQR7ff2qi9gRB7n5t+Gz13i853wSdLGhiG8BZFVUUWkXllsLT
 zcRgt/oZ2OzIKezcQQ4kskG/FddGEPcikYOztvZE8hlbTxasZJsReBe2JsDKMombw7N0
 q492nOwRajciYeORwN7fQf7noZNyd1onBfd4V6ypXg+d7/j6+ugKiAmPMhrn8YZoMP+G
 0i4A==
X-Gm-Message-State: AOAM530H3DLOP2G6zQeF3nAg9DpewVU6ItPTwQgvMmDZ1SN7WXE6fr77
 J0ySj3MivzCwj7IrB7RcpNg=
X-Google-Smtp-Source: ABdhPJxZRKCpIPscdAJDGhvcuomyFkCvWC41aDNTfegv4hT8IA8TOfTR0q0AZmylhWnowTQeNeDR7w==
X-Received: by 2002:adf:b519:: with SMTP id a25mr24667561wrd.263.1610962621793; 
 Mon, 18 Jan 2021 01:37:01 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id x17sm28479647wro.40.2021.01.18.01.37.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 01:37:01 -0800 (PST)
Subject: Re: [RFC PATCH 6/6] softmmu: Restrict watchpoint handlers to TCG
 accelerator
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
References: <20210117164813.4101761-1-f4bug@amsat.org>
 <20210117164813.4101761-7-f4bug@amsat.org>
 <56d3c4ca-8963-b1c3-8635-58f20fcb8e37@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <40633db0-62ac-4a17-cc20-0cab61bb5df6@amsat.org>
Date: Mon, 18 Jan 2021 10:36:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <56d3c4ca-8963-b1c3-8635-58f20fcb8e37@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.252,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/21 10:10 AM, Claudio Fontana wrote:
> On 1/17/21 5:48 PM, Philippe Mathieu-Daudé wrote:
>> Watchpoint funtions use cpu_restore_state() which is only
>> available when TCG accelerator is built. Restrict them
>> to TCG.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> I am doing some of this in my series, and I did not notice that
> cpu_watchpoint_insert was also TCG only.
> 
> Probably we should merge this somehow.
> 
> I thought it was used by gdbstub.c as well, passing flags BP_GDB .

BP_MEM_ACCESS for watchpoint.

> I noticed that gdbstub does something else entirely for kvm_enabled(), ie, kvm_insert_breakpoint,
> but what about the other accels, it seems that the code flows to the cpu_breakpoint_insert and watchpoint_insert..?
> 
> should cpu_breakpoint_insert have the same fate then?
> 
> And is this really all TCG specific?
> 
> From gdbstub.c:1020:
> 
> static int gdb_breakpoint_insert(int type, target_ulong addr, target_ulong len)
> {
>     CPUState *cpu;
>     int err = 0;
> 
>     if (kvm_enabled()) {
>         return kvm_insert_breakpoint(gdbserver_state.c_cpu, addr, len, type);

Doh I missed that. I remember Peter and Richard explained it once
but I forgot and couldn't find on the list, maybe it was on IRC.

See i.e. in target/arm/kvm64.c:

 312 int kvm_arch_insert_hw_breakpoint(target_ulong addr,
 313                                   target_ulong len, int type)
 314 {
 315     switch (type) {
 316     case GDB_BREAKPOINT_HW:
 317         return insert_hw_breakpoint(addr);
 318         break;
 319     case GDB_WATCHPOINT_READ:
 320     case GDB_WATCHPOINT_WRITE:
 321     case GDB_WATCHPOINT_ACCESS:
 322         return insert_hw_watchpoint(addr, len, type);
 323     default:
 324         return -ENOSYS;
 325     }
 326 }

> 
>> ---
>> RFC because we could keep that code by adding an empty
>>     stub for cpu_restore_state(), but it is unclear as
>>     the function is named generically.
>> ---
>>  include/hw/core/cpu.h | 4 ++--
>>  softmmu/physmem.c     | 4 ++++
>>  2 files changed, 6 insertions(+), 2 deletions(-)

