Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D998109C31
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Nov 2019 11:20:24 +0100 (CET)
Received: from localhost ([::1]:52217 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZXxG-0001vW-Sy
	for lists+qemu-devel@lfdr.de; Tue, 26 Nov 2019 05:20:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57422)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iZXs9-0005e4-F9
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 05:15:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iZXpM-0004ul-TI
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 05:12:13 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:42943)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iZXpM-0004uJ-MZ
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 05:12:12 -0500
Received: by mail-wr1-x442.google.com with SMTP id a15so21702752wrf.9
 for <qemu-devel@nongnu.org>; Tue, 26 Nov 2019 02:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0qtQ/hyBWID+1umsgm3sBAyeOMVbobugTFybBrHw58E=;
 b=YQW7E9QgGYjVJYbWLczKPxU1t+Ljjv61Fe4fK+E0Z//nz+KqtsPtG902CTpvQ19EDU
 4O0K51X11sMw3aG/gg47DfuLfOkkfNNkdlemgMWtHPS+0kIoLa3kOZ85TaejvCQqetsa
 rlN22ypCy/PBba0sDbZXjdNi+XDtvvtMJ8eMqj2U+l+KNu3MdPjaegQYYs3xdimYnRKF
 yBMBo0f5aoOjY/6eAWDh3JXaqvQoJHduFdkR9iPsUONmWa2EpsmV+G8NIs7XzFR6EKFV
 U6PY0+N/2RKN91vB2a8y7fiMg/GyVCNIVysI5MrGLBN5+wejwZ9DKScGe2PJ/GSdK0Wj
 m6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0qtQ/hyBWID+1umsgm3sBAyeOMVbobugTFybBrHw58E=;
 b=fbakAOao8Q45qNeuSg/BOBfbEUYRjsKSwsRGnsfYhKN47HbeE17M/UEtVO8O+8qQwl
 YHxHLKnIEqPZelA4azUit0g0MPJYYhWcvdtWsKkeKzjZY4ST68Wu9f1Ar4bMTIkXBC+e
 M4IAB5ZRPORIxu64AtnOErqBEXfhPGVmWDP/wCgwaai32Rfy/K4tVMaYrqDc15pS36o+
 HhxgBHhLs+KQ0Z/6xaBDOUgz28Zcg3qRoqj4B6QUMdmK6wFT/KznwhLDgb1vO1ukA64T
 2w3HR/gqoCq5B8xtK425hWS/aBRou9HzJMD1SVvwFF/qOxkKM9vTauFj9BmtMg16dhpb
 cjtg==
X-Gm-Message-State: APjAAAUhBYQK2YDP49UbaablOqdeiFUVsIKtyVkzoJFlnF/0ai/OvDLK
 AWUJ2f+gO5khF2XD6U/nouiDYHRKI77MKw==
X-Google-Smtp-Source: APXvYqy8jOThm4GVME1+zZe+8H2yF9Eg3omLSA8ZrF9QDsgULgmPCkozO+309KezD7ThOTtDvzqWHg==
X-Received: by 2002:a5d:46c1:: with SMTP id g1mr15433412wrs.200.1574763131174; 
 Tue, 26 Nov 2019 02:12:11 -0800 (PST)
Received: from [192.168.1.14] (88-107-188-217.dynamic.dsl.as9105.com.
 [88.107.188.217])
 by smtp.gmail.com with ESMTPSA id s17sm2451525wmh.41.2019.11.26.02.12.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Nov 2019 02:12:10 -0800 (PST)
Subject: Re: [PATCH] target/arm: Honor HCR_EL2.TID3 trapping requirements
To: Marc Zyngier <maz@kernel.org>, qemu-devel@nongnu.org
References: <20191123115618.29230-1-maz@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8f112583-c29c-11e2-c023-f4eb13831894@linaro.org>
Date: Tue, 26 Nov 2019 10:12:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191123115618.29230-1-maz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/19 11:56 AM, Marc Zyngier wrote:
> +static CPAccessResult access_aa64idreg(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                       bool isread)
> +{
> +    if ((arm_current_el(env) < 2) && (arm_hcr_el2_eff(env) & HCR_TID3)) {
> +        return CP_ACCESS_TRAP_EL2;
> +    }
> +
> +    return CP_ACCESS_OK;
> +}
> +

The only thing I would suggest is to call this access_aa64_tid3, because
tid{0,1,2} also need to be handled in a similar way, and we'll need little
helper functions for those too.


r~

