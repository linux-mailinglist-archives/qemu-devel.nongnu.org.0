Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AAE40E19B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 18:34:13 +0200 (CEST)
Received: from localhost ([::1]:41020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQuKy-0002aj-3r
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 12:34:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQtwS-0000Gc-3e; Thu, 16 Sep 2021 12:08:52 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQtwO-0000Jz-Tg; Thu, 16 Sep 2021 12:08:51 -0400
Received: by mail-wr1-x42c.google.com with SMTP id q11so10342797wrr.9;
 Thu, 16 Sep 2021 09:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wwHDQQV0ftA9eG68f+sUZ/zG3bwXATLPzLgJRp2Owac=;
 b=j13HcfZLh5WzFIXz+kW8TT+SPO7xglrqQk9tmx5+r+Cl8/wt5woKU8Hdlw+Ah8V8sY
 uyRFZVROES4avFgDn3McPPIv5QgSZPP1JaakRuAa8t42rY+dh/sePCP4FEI7WmpCj4PT
 EOq65ePyNKPBS2AW+iTQNSW0nwoUZqxBTEJzxLcSpN1roSIkCkoGijHFiw9yDsUyqv82
 C/+lKoZdbNJihmfZtTpMytbpVXbmYW+5nGZQqU7U26GAIegYdrYpk9fw/mAKCWwODpKn
 UZh+TKyfUGhqfIrGwFOHOHvg2VQi/QUwujeh5YgNUpGcwO3HqMG4lJIKAKqnLsud8ho0
 64mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wwHDQQV0ftA9eG68f+sUZ/zG3bwXATLPzLgJRp2Owac=;
 b=verWjY5n8zQgfDB3euWEe/DU3IYVdl+Xpxz3MdsTbQdtB2EBdIvD+rNQpByzmWnFo+
 RyHtB0keZyeM+lKjapYQMgRiFOVNdsUoADr2sTe5qRmD3RMeLiEP78rQ9eKNOqmEwlhC
 CXk3oT8lxn63Jo7qcgatzQ8bOLGYyXcpW71dgfgj1G30X/pi3HSyQLQfSC65YO4xndcd
 iOz5Z2IZ4FxzuZS0zR0kii8wCTMGPpGVRwrk7x/MCVI55Nu6AELf5E8jCZjb8/eFSBFO
 9a2/Y+tqDaX3w68MeKyHNq9TtH1k/eFnX6zL9d73+Z/fCNJxnfSIBT7L1aujCSgxpeXy
 pEcA==
X-Gm-Message-State: AOAM533pSRzevMtFNasLfFWxODJQTeP1LoIcd8f/5rVQQJQmCg+T49Sc
 gI6t5OurFOuWv3fuA4SPLsc=
X-Google-Smtp-Source: ABdhPJxlSmWt3aQyOIb7qbKemO8bS+oRQ4pVfG+3D+wXIeUK7zjI0WbrRCFiIcKQLpkcF5Q7qwX9Lg==
X-Received: by 2002:adf:cd92:: with SMTP id q18mr6964548wrj.211.1631808526480; 
 Thu, 16 Sep 2021 09:08:46 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id u8sm8327335wmq.45.2021.09.16.09.08.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 09:08:45 -0700 (PDT)
Subject: Re: [PATCH v12 06/10] hvf: arm: Implement -cpu host
To: Alexander Graf <agraf@csgraf.de>, QEMU Developers <qemu-devel@nongnu.org>
References: <20210916155404.86958-1-agraf@csgraf.de>
 <20210916155404.86958-7-agraf@csgraf.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7e962ac1-57d3-7329-108e-99b06b46d4a1@amsat.org>
Date: Thu, 16 Sep 2021 18:08:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916155404.86958-7-agraf@csgraf.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.488,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/16/21 5:54 PM, Alexander Graf wrote:
> Now that we have working system register sync, we push more target CPU
> properties into the virtual machine. That might be useful in some
> situations, but is not the typical case that users want.
> 
> So let's add a -cpu host option that allows them to explicitly pass all
> CPU capabilities of their host CPU into the guest.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Reviewed-by: Sergio Lopez <slp@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> ---

> diff --git a/target/arm/hvf_arm.h b/target/arm/hvf_arm.h
> new file mode 100644
> index 0000000000..603074a331
> --- /dev/null
> +++ b/target/arm/hvf_arm.h
> @@ -0,0 +1,19 @@
> +/*
> + * QEMU Hypervisor.framework (HVF) support -- ARM specifics
> + *
> + * Copyright (c) 2021 Alexander Graf
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#ifndef QEMU_HVF_ARM_H
> +#define QEMU_HVF_ARM_H
> +
> +#include "qemu/accel.h"

This include shouldn't be necessary.

> +#include "cpu.h"
> +
> +void hvf_arm_set_cpu_features_from_host(struct ARMCPU *cpu);
> +
> +#endif

