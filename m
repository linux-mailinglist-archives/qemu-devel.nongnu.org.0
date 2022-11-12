Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD07626735
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 06:51:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otjOe-0004e6-Hj; Sat, 12 Nov 2022 00:49:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otjOS-0004dc-05
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 00:49:28 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otjOQ-0005YO-7k
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 00:49:27 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 f5-20020a17090a4a8500b002131bb59d61so8807211pjh.1
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 21:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z48ZrzrkWelkm7CZgwdxVdBpd3xzXj7MJO/rISEsX9s=;
 b=LQKRZfnyYi3xCI+3GGrSYD8luHWGb5N/mOC9K1DW3n5imBaZAWgtfjlRP7jvSm1y2M
 B1jrDnaalkzkBexP8n/CsDPsDDSnI0dtOYUWT1Qha0oGeJnPy4AsQbwpQWcQQ/4gtPMj
 5YtYkQ9UU+dp3E1/4w16GRZDuzRovWRCkXWdtVE6yu6wkABqJS8wQIrsh24LY6oZB0wn
 Vt4hthdpPxyjZFy1RGGwtHgGmA+w0TCFCx94muAnLfS69MHqflWGe+wlDcq+sSbyJp2/
 Y1c0kG/IUZ+oijwxy0Ylscl7GaahAZF1pQMxKa58tZWcX9JSLz+Qhsk1erH7ujREKVZu
 fhzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z48ZrzrkWelkm7CZgwdxVdBpd3xzXj7MJO/rISEsX9s=;
 b=N+43HJhm83j201IZMVGSaie0OkIiMvpnbJIh1Ch+BR3VoAjkmY78ezKrijKGhmsrCZ
 zB0AYEvgw8Key8VqcT4C1FovhNQSRk61MK+tARqucn01Gjg7MAL+U0ZR7o5hTnWm4FGf
 5AR8DyNUI5oX7ZfYk2+8/OWZgOksDR/JKN4VixbgWsF+6Tsw1zTmCp4kszN7ZE7GRRxE
 qzdaynd7/AT9aGwCqshSR9T0lEhSW6rOSZK96iecjO14iD19IVw+PgQJ00cVFJohIdy7
 mi63ZDoVwoXjpenpp4voW6JSK6ltwgVCyijea0viBGNrdAAizvOEiOQT76KEsIYje3Cb
 s/NA==
X-Gm-Message-State: ANoB5pk+XSs0o+kB39LAxX3NfcLFaJFc+cjDDAi08XW0opF5derTIsig
 6wdWi8WlwW4yJClLjzI+GibvhA==
X-Google-Smtp-Source: AA0mqf4+9suJa1M3ta91oRZPYPUeq5oUuS/JQZez6tWBE95lkzDvSEqRdLSnl557ASUtleEGzkqUPQ==
X-Received: by 2002:a17:902:e052:b0:172:f5b1:e73b with SMTP id
 x18-20020a170902e05200b00172f5b1e73bmr5664989plx.58.1668232164479; 
 Fri, 11 Nov 2022 21:49:24 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:8228:b676:fb42:ee07?
 (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:8228:b676:fb42:ee07])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a170902f64500b00186da904da0sm2711334plg.154.2022.11.11.21.49.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 21:49:23 -0800 (PST)
Message-ID: <9d64f949-e1fd-1436-fefe-bf3c156d8d6e@linaro.org>
Date: Sat, 12 Nov 2022 15:49:16 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 13/20] target/i386: add explicit initialisation for
 MexTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, Wenchao Wang <wenchao.wang@intel.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 "open list:X86 HAXM CPUs" <haxm-team@intel.com>,
 "open list:X86 KVM CPUs" <kvm@vger.kernel.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-14-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221111182535.64844-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/12/22 04:25, Alex Bennée wrote:
> diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
> index b185ee8de4..337090e16f 100644
> --- a/target/i386/hax/hax-all.c
> +++ b/target/i386/hax/hax-all.c
> @@ -385,7 +385,7 @@ static int hax_handle_io(CPUArchState *env, uint32_t df, uint16_t port,
>   {
>       uint8_t *ptr;
>       int i;
> -    MemTxAttrs attrs = { 0 };
> +    MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
>   
>       if (!df) {
>           ptr = (uint8_t *) buffer;
> diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
> index b75738ee9c..cb0720a6fa 100644
> --- a/target/i386/nvmm/nvmm-all.c
> +++ b/target/i386/nvmm/nvmm-all.c
> @@ -502,7 +502,7 @@ nvmm_vcpu_post_run(CPUState *cpu, struct nvmm_vcpu_exit *exit)
>   static void
>   nvmm_io_callback(struct nvmm_io *io)
>   {
> -    MemTxAttrs attrs = { 0 };
> +    MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
>       int ret;
>   
>       ret = address_space_rw(&address_space_io, io->port, attrs, io->data,
> diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
> index e738d83e81..42846144dd 100644
> --- a/target/i386/whpx/whpx-all.c
> +++ b/target/i386/whpx/whpx-all.c
> @@ -791,7 +791,7 @@ static HRESULT CALLBACK whpx_emu_ioport_callback(
>       void *ctx,
>       WHV_EMULATOR_IO_ACCESS_INFO *IoAccess)
>   {
> -    MemTxAttrs attrs = { 0 };
> +    MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
>       address_space_rw(&address_space_io, IoAccess->Port, attrs,
>                        &IoAccess->Data, IoAccess->AccessSize,
>                        IoAccess->Direction);

All three of these are hypervisor callouts to handle i/o for the guest, just like kvm.


r~

