Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E662DA414
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 00:21:53 +0100 (CET)
Received: from localhost ([::1]:59648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koxA8-0008UV-9l
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 18:21:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kox9H-0007sp-NA; Mon, 14 Dec 2020 18:20:59 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:36059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kox9G-0005Be-0t; Mon, 14 Dec 2020 18:20:59 -0500
Received: by mail-wr1-x444.google.com with SMTP id t16so18066939wra.3;
 Mon, 14 Dec 2020 15:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eRGJOJapbYTLhennksy5XMq0os+hhvlnWvTrWZ3R/G0=;
 b=OPXLC4wPwUyeACSIAbq2XDuPtOBRu03NnLKCZcTLI+NM/31FkJXNxBFbjqUOHaiKia
 j3CvbPThYc0wpqO6hojRzt599XO9G4Aq0ZV4rFhoWsu2seBKcUkOJSJTaW9D6p8MFUgu
 9CwxNMs+33QF62+L4ZkKSHhfDWlLFyycmhx6YrXEZ6QnHJGU8Hnk9kn7Wbp+C85JKKaV
 Fu5K/zAXAIK0IGhV+Zeff22xdxUnLmgMh6DQFBaPvRMIJOVFFa8XPxLO84KY//3ngy9O
 NTaip+kw/z14d7TQ8JrMCC2hq5HQRSThFMk0aAS63VORpEs9pQTkxoYAx7+BP65zrF33
 OLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eRGJOJapbYTLhennksy5XMq0os+hhvlnWvTrWZ3R/G0=;
 b=qaWR0jx3r8ojbp9Fp2LSv1omEmaYA0B5xpqCMuGHDqL4SBwz/VxyCMAA70fvx4R0/y
 h4a/cwwKyd66eDtMq3riUmQLcV++HeY1pcXUVB4s/xvZN/sWQKBMrQQGPzJZm3ZrwfW2
 a+WbtGSolL8DgMEmxGCeNcrDKaU1op7FmbOOf7ROlgpOFDc8qSLIGtYDGNHqkuFiuXWe
 MRl+pJpbt4A4/N9f3a6yenJGckoLHR6UaZ8VaN1fOeQrcJgKqEHQOv+W6JN4XTYxsNDV
 h0CU1PKh3VELM2+RcAoLyr6Vv2DvfI8ECWBQA5bJ7c85yVNIH0LDUyVUDOy2zgMwi6fr
 GNxA==
X-Gm-Message-State: AOAM530lYa83Pzgw6RoF97LLMiRijbI6TaeN7ZZEp+rKjbV958fXG79A
 m0MEA8rg1JEUL6mFHwuOudE=
X-Google-Smtp-Source: ABdhPJwy1r+5VM9cVQcV0vVm1BPrUDz3E7z3AF/3Gayyyf014COY8bNFx978bCPjw2Y/8zdma/4f9w==
X-Received: by 2002:a5d:54cc:: with SMTP id x12mr30800647wrv.132.1607988055857; 
 Mon, 14 Dec 2020 15:20:55 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id l1sm33912888wrq.64.2020.12.14.15.20.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 15:20:55 -0800 (PST)
Subject: Re: [PATCH v1 1/1] intc/arm_gic: Fix gic_irq_signaling_enabled() for
 vCPUs
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20201214222154.3480243-1-edgar.iglesias@gmail.com>
 <20201214222154.3480243-2-edgar.iglesias@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ad4f6973-3170-606b-6404-0e31960ca0ec@amsat.org>
Date: Tue, 15 Dec 2020 00:20:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201214222154.3480243-2-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: damien.hedde@greensocs.com, peter.maydell@linaro.org,
 Andrew Jones <drjones@redhat.com>, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 figlesia@xilinx.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/20 11:21 PM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Correct the indexing into s->cpu_ctlr for vCPUs.
> 

Fixes: cbe1282b568 ("intc/arm_gic: Implement gic_update_virt() function")

LGTM but better double-check with GIC specialist ;)
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  hw/intc/arm_gic.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index c60dc6b5e6..af41e2fb44 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -141,6 +141,8 @@ static inline void gic_get_best_virq(GICState *s, int cpu,
>  static inline bool gic_irq_signaling_enabled(GICState *s, int cpu, bool virt,
>                                      int group_mask)
>  {
> +    int cpu_iface = virt ? (cpu + GIC_NCPU) : cpu;
> +
>      if (!virt && !(s->ctlr & group_mask)) {
>          return false;
>      }
> @@ -149,7 +151,7 @@ static inline bool gic_irq_signaling_enabled(GICState *s, int cpu, bool virt,
>          return false;
>      }
>  
> -    if (!(s->cpu_ctlr[cpu] & group_mask)) {
> +    if (!(s->cpu_ctlr[cpu_iface] & group_mask)) {
>          return false;
>      }
>  
> 


