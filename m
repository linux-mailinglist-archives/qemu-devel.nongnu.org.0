Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E19A434BE38
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 20:23:42 +0200 (CEST)
Received: from localhost ([::1]:37436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQa4c-0003Za-19
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 14:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQa36-00034t-OI
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 14:22:12 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:46747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQa31-0007VM-8u
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 14:22:08 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 68-20020a9d0f4a0000b02901b663e6258dso10137482ott.13
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 11:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g+8TRjYDiWL+UY3xHpYkRwSkm1Zwk1QbGs/tgMWzj2A=;
 b=sN7V44T2y6OJky/pGhy5Dd3qmw2Fe40HoroVrGIdsZDJYDhml/VUVsperRqrJtBqdU
 Ha8jqA6dE/aCKjCWbG4yZuzjyxEKpJy7w3afPSn8eRzcVPwKUR2EGwBfOHw5wLqFn2qH
 9q5fYKb/0yX+uT0pUvtFGg4wS+WgwR/TGRJzrXF8LI6RKZnkXn3HbatOmBmzVBnbdMGn
 UhN3NPrc7mBzCyALw15/BwKv50H5z7bUqdt7n6ApnKlcxISHhRnYOzSjsVTN7NL3Alyj
 43NHb5Bqp8PTAestNXIJ/4TZQYx84nh8HQAsAP0p2Xdb76Enj+YBGlJWfYlJ1kd3/Tee
 OT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g+8TRjYDiWL+UY3xHpYkRwSkm1Zwk1QbGs/tgMWzj2A=;
 b=C3D5s5UIw693YRTlvrDyLx1Y3Okzyb3HIT3IONBT9bW57twqmPmulfF5AdJJVBI8El
 044QvzuOWOc2e/3rVjT/UFelib+sE5rMLht4lTdqotFlMN0UQwRikDysftiZuxDrl4jO
 gzQqCHv7GhK3XSEbi4ezCyrZVahPbaPuChERYQGiIp8SBbNA/obch40tHl+342159l+V
 KB9XcZKqpH2xgaCcZZB+A47tXp0XOWDg9nDhxxOUczW1jaDXU0BqRRjaA9x/pLe69wkK
 +89NKNTQX8MGn69MbfkMcS5dFMoJC+rqzQ1fvko36zf1gjukx+QEuRyreNwd5u7njUwI
 iZww==
X-Gm-Message-State: AOAM530YZl3pA292t5yCz8dIKZgIUzBMOt218/99meI4vo1mqxhCxJoK
 UmUNtG0F6VseiL2ZJTt86ZHVmg==
X-Google-Smtp-Source: ABdhPJxbdPhHjbygb3TvYx1z+uw6k7s7IYtMcyTprRq3ErjM4F9+74BMf8RKd19LLyMYgwuLJMWrhg==
X-Received: by 2002:a9d:74d4:: with SMTP id a20mr1829379otl.301.1616955720084; 
 Sun, 28 Mar 2021 11:22:00 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id k24sm3123997oic.51.2021.03.28.11.21.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 11:21:59 -0700 (PDT)
Subject: Re: [RFC v12 51/65] target/arm: cpu-sve: split TCG and KVM
 functionality
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-52-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <573a18c3-dc67-12f9-9cdb-826cf3c9ec00@linaro.org>
Date: Sun, 28 Mar 2021 12:21:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-52-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> +++ b/target/arm/kvm/kvm-sve.h
> @@ -0,0 +1,30 @@
> +/*
> + * QEMU AArch64 CPU SVE KVM interface
> + *
> + * Copyright 2021 SUSE LLC
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef KVM_SVE_H
> +#define KVM_SVE_H
> +
> +/* note: SVE is an AARCH64-only option, only include this for TARGET_AARCH64 */

A pointless comment given that kvm itself is aarch64-only.

> -void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
> +bool cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)

The commit message does not mention the interface change here.

I'm not sure about the rest of this patch.  It saves a miniscule amount of code 
in a kvm-only build, but I don't know that it clarifies things at all.

As yet, the other arm hw accelerators do not support SVE, but I assume that's 
only a matter of time.  The ARM Neoverse cpus support SVE, and will require Xen 
to have an answer soon.  (Apple will do whatever Apple does, given that it fabs 
its own ARM cpus, but I expect they won't delay SVE forever.)

It's not clear to me what bits of the kvm code here is really kvm specific, or 
if we'll have to move it back.

I'm tempted to leave it alone for now.


r~

