Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB02A39C253
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 23:25:32 +0200 (CEST)
Received: from localhost ([::1]:60198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpHJr-0006HZ-Ro
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 17:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpHIR-0005M8-0K
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 17:24:03 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:41792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpHIK-0002A2-Rs
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 17:24:02 -0400
Received: by mail-pg1-x52d.google.com with SMTP id r1so8851610pgk.8
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 14:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9cuhrvDS6Oe5GMt/RbqcFA1uOEgOG8TedSRL9cEKj0s=;
 b=KYHKemfT5uXSGq2Bs5e0FsKHXbXy0Zi6BFBz/9YFv8qQzhc+quflSUgmlandV8qRGO
 v+x1WBCiYAMGZRdHleNn17i+JRspq4DAfXcJTlYsXnmtT8SBbbaycT+ZJfOJrvUACti0
 pNzB1/mrMsfrNFtw7zl63/bDz+P68RKFV97mAfTyK8XUvBuOOYxxjU5AyJf6YzOR7iEK
 EPZYrdFKSIUQWTK/vrQrvBpFMnMdZbgMP3n5gGKd+qyGkboUoIJElyVYqez660LG7Wei
 5o/JhKZIadSRrVNCzD/L0EtpaKNTMKdGYLGQr+Ny3pI+2RecR/YKPpGdQD0FwcRaiKI8
 nJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9cuhrvDS6Oe5GMt/RbqcFA1uOEgOG8TedSRL9cEKj0s=;
 b=VR1AulkdjGnOxudVMdTOS+KZKrfmnoJwg2hr9STAD2nmKoO/bvxsdWz2oKQwLhrDQP
 YUTBYf6qbFLjdEIKsVRd6b8J3DbbySNdCAwDn3C4HlBMCmSxOgjnJzc6Qd6oEXzJGpVa
 DvwPQzbZ0YynL+L3D2UGWV412cnnf8YFzapzZEshMRsXwt8uGjOa79NH9OcKoIEocAxp
 8WAuf/fHZbHQ9C7fAZGZuNXdBbNGuLkTpFrifVmGokkTC19P3w5MuJ6+MPWi9swggHGj
 WKqCuQF9B7s6M36TuiAgwuCJ2VSHhLZyGB/vYpvkeIjGCPHEMo3vg6fjHl38WG3QqWcN
 DIOg==
X-Gm-Message-State: AOAM533R44qs7UQS8fXSCDKdVQ1nRukXNhUbSMaPdYVDdQAkpUS5mV6X
 p4d3wvEU5ovdX/kKCPiaCrRsvg==
X-Google-Smtp-Source: ABdhPJw81vFVqevyqxlInxIsaWlqOCpKcznYnzdut0ki8lpzpvUPoqMu5anyNtvxgRr+gUB8TEzg0A==
X-Received: by 2002:a65:4948:: with SMTP id q8mr6843725pgs.375.1622841835185; 
 Fri, 04 Jun 2021 14:23:55 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 n23sm2696786pgv.76.2021.06.04.14.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 14:23:54 -0700 (PDT)
Subject: Re: [PATCH v16 14/99] accel: add cpu_reset
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-15-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3dfdf0a7-8113-3162-fe00-f497f1191d48@linaro.org>
Date: Fri, 4 Jun 2021 14:23:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-15-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>,
 "open list:X86 KVM CPUs" <kvm@vger.kernel.org>,
 Marcelo Tosatti <mtosatti@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:51 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> in cpu_reset(), implemented in the common cpu.c,
> add a call to a new accel_cpu_reset(), which ensures that the CPU accel
> interface is also reset when the CPU is reset.
> 
> Use this first for x86/kvm, simply moving the kvm_arch_reset_vcpu() call.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   include/hw/core/accel-cpu.h | 2 ++
>   include/qemu/accel.h        | 6 ++++++
>   accel/accel-common.c        | 9 +++++++++
>   hw/core/cpu-common.c        | 3 ++-
>   target/i386/cpu.c           | 4 ----
>   target/i386/kvm/kvm-cpu.c   | 6 ++++++
>   6 files changed, 25 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

