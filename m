Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE1341F23C
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 18:37:22 +0200 (CEST)
Received: from localhost ([::1]:43276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWLXF-00055g-JA
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 12:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWLUW-0003ju-QV
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 12:34:32 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:36629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWLUV-0006k8-9t
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 12:34:32 -0400
Received: by mail-qk1-x732.google.com with SMTP id p4so9709272qki.3
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 09:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=fXM9N5tnq2moWBT/kcjda9tO0kiSuwnQK43uWjgag+Y=;
 b=YHo54dhrrl5J8RQmeqaEu7SM7A+sJ0iK6tSlQAebn9PQLnD2rQU25aD2D3TBveseZ4
 3w4ok9C//unX6lPdbUeC0zeATDd4YegpwGNAzmui8ewwlSUY5nEyX3eEXgA7arnz5HgQ
 32afKpLfQRwABvGluv7zCiGwfvL89GcLtKIh5kWqHHG++THORaLK3lhfsRq1bodzsMfk
 zJ/0mLKIrNqwdz4gLY90TySA0grkvGdyawE98ekPJ/L32PN/hOsoQaaEeDO5R3JiuFdX
 ium+Jk4y8vuQrkl9Tk5l8NTnle3OUhwdn3x0UeoAG7L+c6ku3pPajHit4VPCEvLtC04y
 h95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fXM9N5tnq2moWBT/kcjda9tO0kiSuwnQK43uWjgag+Y=;
 b=ymkuj4mBvY7iXG4Y/25M9bCi72TLHhp2ZcOxphQgeA8etDZhDm/D542Ggw+8vW0m0c
 6VFhTDOTIJ8N/2CdDaCYP07PCvp5EjOE0MjJiq0ad//3dVOve+QnzxzxHFafFsyLJyo1
 CaQCHXfMR/y55Cx9v1gVRTzY9a4CchysqVJEXdWgFhCaekgVOBaPwyxfwk8M51E1mztB
 Sz/LaJx12Bu6t0lyFj+JS2JsIw5Xiaz9TJpshS1XpHHYaBo0C5/DlD1qYFzcRLDTO13d
 Z4tFkHEZWwOqEUJPdW2YrLUUMiI+8umuI+asD5JrYJqvg5L3f4hN6XnSBPEItDWAuS8Q
 ry3Q==
X-Gm-Message-State: AOAM533ZcIoJ/7ofD1IZ0byorN577Qxwau2imAJqAEfWhoViILwg6ibo
 VZ9Gm8ewF0aSCfpzz0ViZQegeyTMxUkRXg==
X-Google-Smtp-Source: ABdhPJxsCGVxou9ZkE414UmTvRwp/mox7taCdV3BWgjP+kbAdNdRH4xgJmHFAFz5jf0x5EAcTr74Fg==
X-Received: by 2002:a37:9144:: with SMTP id t65mr10507841qkd.170.1633106070276; 
 Fri, 01 Oct 2021 09:34:30 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id b20sm3481676qtt.2.2021.10.01.09.34.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 09:34:29 -0700 (PDT)
Subject: Re: [PATCH 3/3] hw/intc/arm_gicv3: Support multiple redistributor
 regions
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210930150842.3810-1-peter.maydell@linaro.org>
 <20210930150842.3810-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ee2ee990-b939-b99c-2cda-ed24ed0fccbb@linaro.org>
Date: Fri, 1 Oct 2021 12:34:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210930150842.3810-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.127,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/30/21 11:08 AM, Peter Maydell wrote:
> Our GICv3 QOM interface includes an array property
> redist-region-count which allows board models to specify that the
> registributor registers are not in a single contiguous range, but
> split into multiple pieces.  We implemented this for KVM, but
> currently the TCG GICv3 model insists that there is only one region.
> You can see the limit being hit with a setup like:
>    qemu-system-aarch64 -machine virt,gic-version=3 -smp 124
> 
> Add support for split regions to the TCG GICv3.  To do this we switch
> from allocating a simple array of MemoryRegions to an array of
> GICv3RedistRegion structs so that we can use the GICv3RedistRegion as
> the opaque pointer in the MemoryRegion read/write callbacks.  Each
> GICv3RedistRegion contains the MemoryRegion, a backpointer allowing
> the read/write callback to get hold of the GICv3State, and an index
> which allows us to calculate which CPU's redistributor is being
> accessed.
> 
> Note that arm_gicv3_kvm always passes in NULL as the ops argument
> to gicv3_init_irqs_and_mmio(), so the only MemoryRegion read/write
> callbacks we need to update to handle this new scheme are the
> gicv3_redist_read/write functions used by the emulated GICv3.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

