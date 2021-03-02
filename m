Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B717329662
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 07:19:14 +0100 (CET)
Received: from localhost ([::1]:58534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGyNF-0004JE-40
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 01:19:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGyLu-0003QO-50
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 01:17:50 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:39591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGyLs-00071C-Aj
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 01:17:49 -0500
Received: by mail-pj1-x1030.google.com with SMTP id d2so1237024pjs.4
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 22:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sbQ5K5CdgkvIO/GyAdJrjtI8JVfRjNdFoFwcJ20I+/E=;
 b=wy9MCaFNcEUeYoDuTW87Gq7WD+b0wMnvweOHOHyt//OKx2x9rWurdugX6H0J9j1gem
 nuQGklSpC2w4CGmiKHTtWS9o5P3czmbNbUg2OxUqBRdXfwh9ycCTzBqbmFJF3FprH1l9
 S2rP+H0fbWHsxywRwHscErLf84/WGOWviLFOgo9Hja0QPKuZGdFiwCGIGUL/7CnIcokZ
 5pdjstvoSyltIniTIAXkuEYsP2ICaYxPukmvkVXWM1emtZKxtYWA8tG2ivxq/8tS7Jcj
 dbP8FwjRdrx+1vj2nN29aY32W8e13SBU+yZnVMUit3bFszqINs700FsTJJ2SBq9TynNM
 ozJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sbQ5K5CdgkvIO/GyAdJrjtI8JVfRjNdFoFwcJ20I+/E=;
 b=nbDqIR7t6l4pgFACet3qySvJHhxA5lsCVt8vQpfAnXF30UwUWa8lxhQ/R98MxnSIO1
 Ty/sBgsBeFBz1Y2a2x4Vk73zQzCLDKPNssiCwN7hMJvHnopdc41KdLslnCZKBXPGa2Hi
 JD7kgfDFXCNYeWdK/M5UoESRtT7fsR5U58nLqu1CFJnPRgCX+7s9W+eUkHII1X39dMB0
 3ZrJ3xwGBLYxEATiVcotikNqbyI1VuR5ONW7BFJAYNhKImHK66GU87ST9yV/43ubO+6j
 yRs4d2MOEk695DjFVdZpXAfeEqwywfGskEzJumwPAd60VFDwZuKZa8Ht5K4U8pVJJn8C
 lm0Q==
X-Gm-Message-State: AOAM530i48eb9swA6vm2lt7b3JWQTZQhokIo8LAYb/hged40+fZAmhu8
 2ZoUykmBR8cJ6RnnJh0X8vQrInQgw3STfQ==
X-Google-Smtp-Source: ABdhPJw/AVe5eq9sEa0Q4XgBeCe7QJUBiI/v47UomQ9z8FAm0r6w0cnOoqNaXgo1buewFRe8RleiEg==
X-Received: by 2002:a17:902:9e12:b029:e4:9f35:7dfc with SMTP id
 d18-20020a1709029e12b02900e49f357dfcmr2211749plq.28.1614665866612; 
 Mon, 01 Mar 2021 22:17:46 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id v15sm18037570pgl.44.2021.03.01.22.17.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 22:17:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC v2 06/24] target/arm: split off cpu-sysemu.c
To: Claudio Fontana <cfontana@suse.de>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-7-cfontana@suse.de>
Message-ID: <4b776b96-7d5c-da73-9372-2b657a43f4e7@linaro.org>
Date: Mon, 1 Mar 2021 22:17:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210301164936.19446-7-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 8:49 AM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/internals.h  |   8 ++-
>   target/arm/cpu-sysemu.c | 105 ++++++++++++++++++++++++++++++++++++++++
>   target/arm/cpu.c        |  83 -------------------------------
>   target/arm/meson.build  |   1 +
>   4 files changed, 113 insertions(+), 84 deletions(-)
>   create mode 100644 target/arm/cpu-sysemu.c

It'd be nice to rearrange this into tcg/ and kvm/.

I think we could do with some macros like

#ifndef CONFIG_KVM
#define KVM_ERROR  QEMU_ERROR("kvm is disabled")
#endif
#ifndef CONFIG_TCG
#define TCG_ERROR  QEMU_ERROR("tcg is disabled")
#endif

Not sure where to put these, but certainly not arm specific.

Then,

void arm_cpu_tcg_set_irq(void *opaque, int irq, int level)
     TCG_ERROR;
void arm_cpu_kvm_set_irq(void *opaque, int irq, int level)
     KVM_ERROR;

     if (kvm_enabled()) {
         qdev_init_gpio_in(DEVICE(cpu), arm_cpu_kvm_set_irq, 4);
     } else if (tcg_enabled()) {
         qdev_init_gpio_in(DEVICE(cpu), arm_cpu_tcg_set_irq, 4);
     } else {
         g_assert_not_reached();
     }

So arm_cpu_kvm_set_irq can go in kvm/ and needs no ifdef.

I'll let folks interested in xen and hvf figure our what needs doing with the 
above.


r~

