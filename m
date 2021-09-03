Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ED8400744
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 23:07:54 +0200 (CEST)
Received: from localhost ([::1]:42518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMGPh-0007j0-R3
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 17:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG76-0003Q0-8J
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:48:40 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG71-0006pw-CL
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:48:39 -0400
Received: by mail-wr1-x431.google.com with SMTP id i6so422068wrv.2
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 13:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JR2N3hW+DAAOOkmrYLuui81slBAvGFUWkGnERbEB/4A=;
 b=oIoi1f5ZWFOc0RmycwGdPB1omD0xRAxTNPvzzN59dsRqEHrjnFus9NLUNjhn6i17pj
 ivO2uKGYQ/5srtBFw7S7dxLFCPr0Dg84Ff6W1/9vJTqoS6LzG+xh4J2hCztqivPqnava
 u/7bE8JnlgID+82FLwTwyyj/Qz3U6Qik1/Tf5wLbcyLfdBYFCdE7+xNUeGNupoQceOtK
 DuiPtlLD47X/8EiY6wq+LG78nSM5X+oluNwRPdUvyRQTAk0pPxYuJQ+0FSqNABy+klPa
 /Gw/OIgSOH/QuL9vGuSTxQAkWanGr1FY2e4K3sb0MB5auKQ+KdAP6aCeWBFl5rG2tuai
 4CPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JR2N3hW+DAAOOkmrYLuui81slBAvGFUWkGnERbEB/4A=;
 b=YqOTyoB51DFmwJK9zfkrc13qi9KvOrf7yAkkVhBzlais8vVpuDdjy8uLJaRjceIKek
 7C8kly4crXwlytz+aMA66HrGzcF6egxVIiZkqT3UhsCN83Tnr7lKZfNu4L6rFH5hrsiI
 zwJxvKig2jEZI+pIc/JNBeRhQ9MISGn4j+6EHtWOxfhlXngIpj1FTGhOj5EGmEIMWQBz
 W8jEY1w8DRZnTq2KZ5DEJj90wOJ/LB7ZXuXNzVLALJWZjsXUCkrwHeVib/19iXqOSGzu
 98bw2qMNCyDX8A+sLpWqs7AM91OFYLVX+t0JFFSmlGfXfUG1Tm28A0tWCy0ijmziXCaA
 +ntA==
X-Gm-Message-State: AOAM531i7g4C4u6nj7Ou6AaVGC2uuMCON27vIQXgQkUKbnng2EazmgVm
 o5tGojE2/sF37eCEk451Nu+6Mg==
X-Google-Smtp-Source: ABdhPJwYxL1wBdNoflELnyXgoIfkyp1X+C47Clew7iV3DpVZ/QyfLSQUi3F7MAdXmgdYugc/uDUBHg==
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr908323wrm.198.1630702113942;
 Fri, 03 Sep 2021 13:48:33 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id t23sm273507wrb.71.2021.09.03.13.48.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:48:33 -0700 (PDT)
Subject: Re: [PATCH v3 30/30] accel: Add missing AccelOpsClass::has_work() and
 drop SysemuCPUOps one
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210903181943.763360-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5b1a24c2-cdd6-ec88-d0d8-540bf5f96c38@linaro.org>
Date: Fri, 3 Sep 2021 22:48:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903181943.763360-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Cameron Esfahani <dirty@apple.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Wenchao Wang <wenchao.wang@intel.com>,
 haxm-team@intel.com, Claudio Fontana <cfontana@suse.de>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 8:19 PM, Philippe Mathieu-Daudé wrote:
> cpu_common_has_work() is the default has_work() implementation
> and returns 'false'.
> 
> Explicit it for the QTest / HAX / HVF / NVMM / Xen accelerators
> and remove cpu_common_has_work().
> 
> Since there are no more implementations of SysemuCPUOps::has_work,
> remove it along with the assertion in cpu_has_work().
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/core/cpu.h             | 2 --
>   accel/hvf/hvf-accel-ops.c         | 6 ++++++
>   accel/qtest/qtest.c               | 6 ++++++
>   accel/xen/xen-all.c               | 6 ++++++
>   hw/core/cpu-common.c              | 6 ------
>   softmmu/cpus.c                    | 9 ++-------
>   target/i386/hax/hax-accel-ops.c   | 6 ++++++
>   target/i386/nvmm/nvmm-accel-ops.c | 6 ++++++
>   8 files changed, 32 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

