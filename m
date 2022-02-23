Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 413144C0FDC
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 11:09:23 +0100 (CET)
Received: from localhost ([::1]:34360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMoaI-0005xR-2l
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 05:09:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nMo4a-0001Go-Qd
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:36:38 -0500
Received: from [2a00:1450:4864:20::529] (port=42573
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nMo4X-0006Pv-5Q
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:36:36 -0500
Received: by mail-ed1-x529.google.com with SMTP id i11so41454991eda.9
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 01:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tlDVXyqQ3vQesf3io0TBXqCgPAJM7vpijbGnEykKrQc=;
 b=c6bujDHrgE0N4ps89rFrO0MVX5TkUC5qNglxtLUj1eRfDFIX77BdPWXBJrwOK52A4L
 4WI23oQ3NIkTdBgCl2Hz0HG6SRV5seAMUp2BeYEtczmyqPNXVbtDBu9Bj4Wa1cJ9ZOXM
 vD23UjP76lA7SROTz67XRku4HOboJ7dsT48pBqu8YcgaLujo+JTYmXVN0VP3YeF9yDRb
 5UTmb2Xu2ImfwTrIHbxg0VMFyB4/w8fB4wsU4Al0c9lQNSDZ+wguKPNwahZ8u2rhWBOb
 lMZP/ssu67C9+SLV2HDeDsZ2ZPsiCSnMOAV88NO8OZQ/uyMmmAH7R39frm/EtkLCkrbz
 lXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tlDVXyqQ3vQesf3io0TBXqCgPAJM7vpijbGnEykKrQc=;
 b=4Fxn4Oi2jTqW5dtYAc8L0ASuMe6GQPXch+jzIrl6Y1eOYixP/gfzzECvMQJDAK2VdZ
 0CnBwr+TGq+Fgf/Sr/h210mNGT14MB1TGrUOn+4v4h9hNIul1g9s+rP49sjACyAg1Qs+
 0zGpCy5NCcVpLPnXm+WClpnctwlV9sS+QdBUDMBJ976gNZz6kCzxpR1YHLPoXEhCfsWJ
 Nrp5m2crhM7IWChu8SOog+z5tkiju6ze6bRnXABvVGsrXSBeuEYrOpW8nv2TCLsNKDn4
 ANUI++nERYR3Q7mdq9noFh66GXsLG322DFHXO6xlw12ySRxefZUxUQGGRnN71BV+PsJy
 gK5Q==
X-Gm-Message-State: AOAM531MzuVc60aZKzi9iWHATLxw1vs00IHG+338wIcxuXGoGqFrKAWk
 mTSZA8OvHS0R9h2rtt956Wg=
X-Google-Smtp-Source: ABdhPJwpAoA/3ICzXCzSeHzyVf34tSBJtnJMivd39VWskCV9v9YhKWo3P+esO6aQFpAAGiWevbcqNg==
X-Received: by 2002:aa7:d403:0:b0:40f:739c:cbae with SMTP id
 z3-20020aa7d403000000b0040f739ccbaemr31086556edq.267.1645608986671; 
 Wed, 23 Feb 2022 01:36:26 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id y21sm7076441ejq.185.2022.02.23.01.36.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 01:36:26 -0800 (PST)
Message-ID: <93318cc1-bf62-34dd-190c-1961a4716f75@redhat.com>
Date: Wed, 23 Feb 2022 10:36:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] whpx: Added support for breakpoints and stepping
Content-Language: en-US
To: Ivan Shcherbakov <ivan@sysprogs.com>, qemu-devel@nongnu.org
References: <010e01d82875$d3cc0ec0$7b642c40$@sysprogs.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <010e01d82875$d3cc0ec0$7b642c40$@sysprogs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: armbru@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/22 06:25, Ivan Shcherbakov wrote:
> This adds support for breakpoints and stepping when debugging
> WHPX-accelerated guests with gdb.
> It enables reliable debugging of the Linux kernel in both single-CPU and SMP
> modes.
> 
> Signed-off-by: Ivan Shcherbakov <ivan@sysprogs.com>

Hi,

in general this patch is really good work, thanks for contributing it!

Just a couple notes:

> +enum whpx_step_mode {
> +    whpx_step_none = 0,
> +    /* Halt other VCPUs */
> +    whpx_step_exclusive,
> +};

Please use

typedef enum WhpxStepMode {
     WHPX_STEP_NONE,
     WHPX_STEP_EXCLUSIVE,
} WhpxStepMode;

and likewise for WhpxBreakpointState.  (In the case of WhpxStepMode I 
would also consider simply a "bool exclusive" in whpx_cpu_run).

>   struct whpx_vcpu {
>       WHV_EMULATOR_HANDLE emulator;
>       bool window_registered;
> @@ -156,7 +163,6 @@ struct whpx_vcpu {
>       uint64_t tpr;
>       uint64_t apic_base;
>       bool interruption_pending;
> -

Please leave the empty line.

> +    if (set) {
> +        /* Raise WHvX64ExceptionTypeDebugTrapOrFault after each instruction
> */
> +        reg_value.Reg64 |= TF_MASK;
> +    } else {
> +        reg_value.Reg64 &= ~TF_MASK;
> +    }

Out of curiosity, does the guest see TF=1 if it single steps through a 
PUSHF (and then break horribly on POPF :))?

> +/*
> + * Linux uses int3 (0xCC) during startup (see int3_selftest()) and for
> + * debugging user-mode applications. Since the WHPX API does not offer
> + * an easy way to pass the intercepted exception back to the guest, we
> + * resort to using INT1 instead, and let the guest always handle INT3.
> + */
> +static const uint8_t whpx_breakpoint_instruction = 0xF1;

Makes sense.

> +    breakpoints->original_addresses =
> +        g_renew(vaddr, breakpoints->original_addresses,
> cpu_breakpoint_count);
> +
> +    breakpoints->original_address_count = cpu_breakpoint_count;
> +
> +    int max_breakpoints = cpu_breakpoint_count +
> +        (breakpoints->breakpoints ? breakpoints->breakpoints->used : 0);
> +
> +    struct whpx_breakpoint_collection *new_breakpoints =
> +        (struct whpx_breakpoint_collection *)g_malloc0(
> +        sizeof(struct whpx_breakpoint_collection) +
> +            max_breakpoints * sizeof(struct whpx_breakpoint));

> +    new_breakpoints->allocated = max_breakpoints;

Why separate the original addresses in a different array (and why the 
different logic, with used/allocated for one array and an exact size for 
the other)

> +        enum whpx_breakpoint_state state = breakpoints->data[i].state;

Same comment on coding style applies to this enum.

I would have done most changes for you, but I didn't really understand 
the breakpoints vs breakpoint collection part, so I would like your 
input on that.

I have queued the first two patches already.

Thanks!

Paolo

