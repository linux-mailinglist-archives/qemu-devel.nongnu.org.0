Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F7821BB21
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jul 2020 18:37:22 +0200 (CEST)
Received: from localhost ([::1]:34430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtw1Z-0003IZ-6I
	for lists+qemu-devel@lfdr.de; Fri, 10 Jul 2020 12:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtvgx-0006MH-Vl
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 12:16:04 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:32882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtvgw-0005Mw-08
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 12:16:03 -0400
Received: by mail-pf1-x429.google.com with SMTP id m9so2753635pfh.0
 for <qemu-devel@nongnu.org>; Fri, 10 Jul 2020 09:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5JBKco125G8ctmNQfP5V9Ud8ho8hOBKNgwv5/p7XGOg=;
 b=I6HaVg4G0Qr1ufv8+yDpTgDqgV/5wu+hKLVU2QYJ/vGiHO5u2Gwsd+gabxpaIT5A9r
 H7lK0t0nS7zWr+J8w1H0lX3zm62pvnUg9ColjUYW2G67YYTPoU1/P4rkUN+UDuhEUrqp
 2VrQvi1dNZIn2PmRk3uulzbIuIUu53LddOzLh5Y5ZEXC3GNecy8X6ZHYQAnNBvgaOygx
 4zCJZ6tDV06e3nz3gtKu8IaZv1Yo2GS4d4aoLLyWVz8lJZClGiiaCPKBldhu/lxW27M0
 HAC6GbiVUcwq6ae41jFA+Kg4rQgOHVpkpOGcGgib0u4Pa4f2fIuIsEjIv2OaLLCL/fYs
 L6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5JBKco125G8ctmNQfP5V9Ud8ho8hOBKNgwv5/p7XGOg=;
 b=BjRaG/eAzUujsmpbiMt0l9gV0DyHVyD+BsrzjX1/5KCvCi2K0U15ms4hfe4NN3Acla
 MOUDIMqSKS7DRKK9pEszbFHURsxlGDQUhSFUbg8EDEovBXLNLcpf1aW//ROaMxBF45Yw
 wTh8WfqsfLj/l7tmWaV5Zkyqch+wymTrPSoADmTF3eHdex9Eqh1vJCq+hRBpA5kWYy4c
 44WSPzj12f192de/1hRPZrMnuOOk4AIZXNCSCyLFPwpTYHXQnbLtijU/RP2Gz8ba59oo
 v2IcqBBAKBI3uDpMyI+ezPRIuc6tc6RXedZ0cwh69w3XgyeaWrtgir8VNT8IgSkEMlOA
 eRow==
X-Gm-Message-State: AOAM530Ch+dkTmQh+GGFgyY5FQu5fh8yNOhT6b131e8vPFGDNoOtqi8Z
 vezGcFWize3hEhAtDE21TiNq4w==
X-Google-Smtp-Source: ABdhPJyRpmEfGtXTPJMZofPjde+rsgeNMvsaxZt2vmmck8fxp+Z19aICemIj3D2yBirrJml5nH6mrQ==
X-Received: by 2002:a05:6a00:2bc:: with SMTP id
 q28mr64246459pfs.250.1594397760495; 
 Fri, 10 Jul 2020 09:16:00 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id d22sm6493420pfd.105.2020.07.10.09.15.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 09:15:59 -0700 (PDT)
Subject: Re: [RFC 04/65] target/riscv: fix vill bit index in vtype register
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200710104920.13550-1-frank.chang@sifive.com>
 <20200710104920.13550-5-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6eac5a4a-aa03-314e-e284-9fcf1c21941e@linaro.org>
Date: Fri, 10 Jul 2020 09:15:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200710104920.13550-5-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/10/20 3:48 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> vill bit is at vtype[XLEN-1].
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Alistair, this one should be queued for 5.1 as a bug fix.


r~


