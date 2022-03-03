Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E69F4CC853
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:46:34 +0100 (CET)
Received: from localhost ([::1]:47492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPtHM-0003qP-Tk
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:46:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPtD9-0000p6-P1
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:42:11 -0500
Received: from [2607:f8b0:4864:20::102a] (port=35571
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPtD8-0004V7-5W
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:42:11 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 mg21-20020a17090b371500b001bef9e4657cso5604610pjb.0
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 13:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=TE7TSG9N6Q6UjVPyXL/SmFdubjpx3rQQwlWbc92XhA4=;
 b=mD3mmbC2t7il8R7PJEQlG37TLQj01wUEYUN553ORX69Yfq1Ud1x7+kQOb0dn6D1AsL
 e21iSOUpWw2yXC4pFa9gMt6S8ox1YjQzG3P1NZBqBDLCVMxajUZiyKw9IZUfW/zuoj2Z
 Q8pxdmIXntxJGrW7URgDKDkOf+mE+1RvwwOIAHwv8BeDCg5gUeddHzXLLYiAU78EMxz7
 iZfjPhh0lGx2jXBLG8EvOgmAsiFYBwljnoCkjrWGGRPW74ELULMB0Np3ZXHnR9XcfHM+
 1uMJIa/Xrwxyxj/1t+WHzcuH9NrGVrUwS1Aa7girE7N0Qs+0shpCL9ihH2Fln9GUfQgC
 QDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TE7TSG9N6Q6UjVPyXL/SmFdubjpx3rQQwlWbc92XhA4=;
 b=5ZSduia7BT2g/lmb/U/7QonQGFElwDbXYDn8Oqqe06cj63qIa1qHQvkW5MyZj4Ct0Y
 4F1bHCLThkJkxA9qi7XdppH4uSmpJus9ShBk/rKMDgOF/oikzBwg4BK/KWn6Vlu+SlzK
 1TaYF5C/oCfHDQabqikBHbx5R559pY82cR3pE7aDZKKuaO33pI1rdMUKlCjtO0DNLN5L
 k/x2GpYFYWBRcZ3Ez/5pfuj5PyyhjojkNM7aYvy1KjUKyxnqVMkAh6NGhSNjC1UnyneI
 0g/IZDvk+P/eJJ6EFGN3r6bsY1NJXiD/3BMYJsthk9UU/nDVdy8K0JQKLFCgRI1eeA6+
 ST4A==
X-Gm-Message-State: AOAM5304uEANNSq46Fq2976Lt56QyI32jDFQkofCl+9UGmBUJY6rXomV
 sslTDm608hNc1O9QMfa+FxbR9A==
X-Google-Smtp-Source: ABdhPJw0V8uAu60P9H1j4Wujr8FbFqr8tn4sbynuRdxoW4+CO/w7CHcxUBGhePV/x8FVaQKuwmb/gQ==
X-Received: by 2002:a17:902:8bc2:b0:149:1ce6:c28c with SMTP id
 r2-20020a1709028bc200b001491ce6c28cmr39034452plo.164.1646343728792; 
 Thu, 03 Mar 2022 13:42:08 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:119c:490c:a4ee:8e8?
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a056a00198b00b004dfc6b023b2sm3347315pfl.41.2022.03.03.13.42.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 13:42:08 -0800 (PST)
Message-ID: <773c0a33-b9e1-1539-6b0f-90ebe7c5144a@linaro.org>
Date: Thu, 3 Mar 2022 11:42:05 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/5] hw/intc/arm_gicv3: Specify valid and impl in
 MemoryRegionOps
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220303202341.2232284-1-peter.maydell@linaro.org>
 <20220303202341.2232284-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220303202341.2232284-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/22 10:23, Peter Maydell wrote:
> The GICv3 has some registers that support byte accesses, and some
> that support 8-byte accesses.  Our TCG implementation implements all
> of this, switching on the 'size' argument and handling the registers
> that must support reads of that size while logging an error for
> attempted accesses to registers that do not support that size access.
> However we forgot to tell the core memory subsystem about this by
> specifying the .impl and .valid fields in the MemoryRegionOps struct,
> so the core was happily simulating 8 byte accesses by combining two 4
> byte accesses.  This doesn't have much guest-visible effect, since
> there aren't many 8 byte registers and they all support being written
> in two 4 byte parts.
> 
> Set the .impl and .valid fields to say that all sizes from 1 to 8
> bytes are both valid and implemented by the device.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

