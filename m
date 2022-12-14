Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFC364CCA6
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 15:49:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Svv-0001EY-H1; Wed, 14 Dec 2022 09:40:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5Svs-0001Dq-Au
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 09:40:28 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5Svq-00085i-EL
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 09:40:28 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 ay8-20020a05600c1e0800b003d0808d2826so2831167wmb.1
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 06:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jeULsbiz1VOTaU1DP3nbh1Vq2nwqyPViRI/210eCQ7k=;
 b=ZDkWnaKjw8l9Es7uc0ArZHWJALeUGsz4CaqeNjauXH+SNIjEEV3SSjLRCoVcXkDXfy
 +p6KZPmMzeg04JE1fR1KRW6/K+XYlaj1JlyYlR7AYMUiP9kToje2M0XXR+0MULU7bmsQ
 aEVPmb5K7adlbKd8xfbg+l72Fcth+8SAsVHCfK0S2lRWChKYhOnhOxo0P+tqx2ubPsXl
 NRLpsveSexfqXwgJJvPjn53s8YyANQp3dsD7aBHlXdjoN75Fhoq7E5PZE+/52lP26yPi
 eST8XwZstagtMsmO/uhTeTMv2AK/hMNPIYl81YJBbltDzBXFSpVASs1Yn92phY0CXQGv
 YWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jeULsbiz1VOTaU1DP3nbh1Vq2nwqyPViRI/210eCQ7k=;
 b=mlTzdGQj4WvYgeQJWv/2xLimgHxqMmMv0sba/Dn6LeQTMXFuUKBX+dov5awutbsIwl
 OSe3C947ypqaRsMCWHX5zBqX5Q0bmDSKkSOxhf63ikr6n7KJX6iNjM2/5S2/gyXKxP+h
 ZsV+akoSclVpzH40IQl+35OjTlBiUGGGO05r2LiEIRPDCcDTNn3ecsYtaNQ2jDjEx/EQ
 6LGhc1ELrLiMM+rjR40SpuUpkg5clMtWpUi2fiTkam2V6VPPDbpexUPT9dRe+Spp+fHy
 fHXE5tLqRL8D/Oui2eHEOINQ2fHwN60YiwzVuYvv1BVTm4uNR7w/qnnPxDnl1Nvf+spe
 vy8g==
X-Gm-Message-State: ANoB5pnayDGk3xTFo2MgAyNEa402X28lex9YObtTKxuzzC85qHtgRa81
 plxSjnSroIEgVEpRqEQbUHrDlpdLqfihRSBGR8I=
X-Google-Smtp-Source: AA0mqf4oWuzTFQBPazG2fbGADlDWb9HWU+z2p+8lgdtiIWoK7cFkBd1smAeGuQ78piX44QqBm/D5iQ==
X-Received: by 2002:a05:600c:35c6:b0:3c6:e61e:ae8b with SMTP id
 r6-20020a05600c35c600b003c6e61eae8bmr23559399wmq.27.1671028824230; 
 Wed, 14 Dec 2022 06:40:24 -0800 (PST)
Received: from [192.168.1.25] ([84.76.199.78])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a7bce0b000000b003d070e45574sm2776611wmc.11.2022.12.14.06.40.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 06:40:23 -0800 (PST)
Message-ID: <0506350d-c999-9f99-6a55-da45f6949abf@linaro.org>
Date: Wed, 14 Dec 2022 15:40:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] gdbstub: Have syscall_complete/[gs]et_reg to target
 agnostic typedefs
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20221214143659.62133-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221214143659.62133-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

On 14/12/22 15:36, Philippe Mathieu-Daudé wrote:
> Prototypes using gdb_syscall_complete_cb() or gdb_?et_reg_cb()
> don't depend on "cpu.h", thus are not target-specific.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/gdbstub.h | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Subject should be:
"gdbstub: Make syscall_complete/[gs]et_reg target-agnostic typedefs"

> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> index f667014888..1636fb3841 100644
> --- a/include/exec/gdbstub.h
> +++ b/include/exec/gdbstub.h
> @@ -71,9 +71,6 @@ struct gdb_timeval {
>     uint64_t tv_usec;   /* microsecond */
>   } QEMU_PACKED;
>   
> -#ifdef NEED_CPU_H
> -#include "cpu.h"
> -
>   typedef void (*gdb_syscall_complete_cb)(CPUState *cpu, uint64_t ret, int err);
>   
>   /**
> @@ -126,6 +123,7 @@ int gdb_handlesig(CPUState *, int);
>   void gdb_signalled(CPUArchState *, int);
>   void gdbserver_fork(CPUState *);
>   #endif
> +
>   /* Get or set a register.  Returns the size of the register.  */
>   typedef int (*gdb_get_reg_cb)(CPUArchState *env, GByteArray *buf, int reg);
>   typedef int (*gdb_set_reg_cb)(CPUArchState *env, uint8_t *buf, int reg);
> @@ -133,6 +131,9 @@ void gdb_register_coprocessor(CPUState *cpu,
>                                 gdb_get_reg_cb get_reg, gdb_set_reg_cb set_reg,
>                                 int num_regs, const char *xml, int g_pos);
>   
> +#ifdef NEED_CPU_H
> +#include "cpu.h"
> +
>   /*
>    * The GDB remote protocol transfers values in target byte order. As
>    * the gdbstub may be batching up several register values we always


