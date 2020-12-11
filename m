Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A7A2D7DED
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:22:01 +0100 (CET)
Received: from localhost ([::1]:55684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knn3I-0006lF-Cd
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:22:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knmFx-0007s8-0v
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:31:01 -0500
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41]:38770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knmFv-0001rq-6V
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:31:00 -0500
Received: by mail-oo1-xc41.google.com with SMTP id i18so2321283ooh.5
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 09:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zEkonvWBCoRhQW0ZRR/bbk5DdZBzKwciItVBYqQ/Gxg=;
 b=r77VfrcB4POcJQvfIaThLta06tIxLtQ6/y/G6cH/hpMm9QddcCXKi5wM7UZRK6f6YI
 Akt3AciGV6Us5C7Gl8QNWosqsn5ENUdVKObMfxdZWTwo/+ZeGWIkkTqoRAX568eiS4Mp
 ANiMZRlbYQJfnam/gS4BMSmOJ/Ss7ZqL0i1dxuA2kpkvI2LFnoxZPJpIRgUvXbuZEKzp
 a+YOD2gRkDH6xPgA62zuTpthRdmp6V175jzLEjgzBFO67MY+cvfyyzcrZeTJ1ixe3OaP
 3PAsrYd1C+JqHf1GrclRPvtWYW/bCNxyEZZiHzntZlJWNoWv4lMXwG1ZdPcHBL40Iz3E
 9Iwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zEkonvWBCoRhQW0ZRR/bbk5DdZBzKwciItVBYqQ/Gxg=;
 b=uoDkRp+gf1ND3BQD9wY7B0Pu7yOiThfgb4CaPwNQuB8928+mOldiYWIMiL4PuIUsWM
 +WpWhHP64EftZEOIsBn9VCZHFrTbhYr0bY+xaFRggsm/Mhnlw7aVDZMQ9gSKLi1hqV+S
 EQR/qJdHAmJC7I49COfastJ1+yuBZ5Gaq6mPAaCDK5p1xpKq0CAwZWjRe17COBjFNoRA
 BM09HRWJaZeHIFthS35pqOOhumI8659ERsqzaT6ibYvycZTWmnoL1F1WmNEwK/oabYR+
 6Qq+2gmhW0uvUOvAcm9RpPgrshC1Hc+oGkm+1fq3tSYeZN+gMVe1t031NKhFGrfPCrxd
 8jvw==
X-Gm-Message-State: AOAM533ieSd0iOvJ21LhrQvHlEBEWG4jrqyyCfltLGi9NcZ0BHFD9/c5
 hao006t6DLSJF0oFGt+kY3jkpA==
X-Google-Smtp-Source: ABdhPJykQLuJR3nvjwDlQwHbRyooRy6WfT42HLmsgg35ABjlrlnTR0M87xd/9S2vThilUYthDuoP3A==
X-Received: by 2002:a4a:d5d3:: with SMTP id a19mr10953622oot.61.1607707857931; 
 Fri, 11 Dec 2020 09:30:57 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id r12sm1931694ooo.25.2020.12.11.09.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 09:30:56 -0800 (PST)
Subject: Re: [PATCH v11 19/25] cpu: Move cpu_exec_* to tcg_ops
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-20-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3433b2ce-ddb0-7f7d-c69c-733e199be939@linaro.org>
Date: Fri, 11 Dec 2020 11:30:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211083143.14350-20-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c41;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc41.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 2:31 AM, Claudio Fontana wrote:
> From: Eduardo Habkost <ehabkost@redhat.com>
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> [claudio: wrapped in CONFIG_TCG]
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/hw/core/cpu.h           |  6 ------
>  include/hw/core/tcg-cpu-ops.h   |  6 ++++++
>  accel/tcg/cpu-exec.c            | 12 ++++++------
>  target/alpha/cpu.c              |  2 +-
>  target/arm/cpu.c                |  2 +-
>  target/arm/cpu64.c              |  5 ++++-
>  target/arm/cpu_tcg.c            |  7 ++++++-
>  target/avr/cpu.c                |  2 +-
>  target/cris/cpu.c               |  2 +-
>  target/hppa/cpu.c               |  2 +-
>  target/i386/tcg/tcg-cpu.c       |  6 +++---
>  target/lm32/cpu.c               |  2 +-
>  target/m68k/cpu.c               |  2 +-
>  target/microblaze/cpu.c         |  2 +-
>  target/mips/cpu.c               |  2 +-
>  target/nios2/cpu.c              |  2 +-
>  target/openrisc/cpu.c           |  2 +-
>  target/riscv/cpu.c              |  2 +-
>  target/rx/cpu.c                 |  2 +-
>  target/s390x/cpu.c              |  2 +-
>  target/sh4/cpu.c                |  2 +-
>  target/sparc/cpu.c              |  2 +-
>  target/tilegx/cpu.c             |  2 +-
>  target/unicore32/cpu.c          |  2 +-
>  target/xtensa/cpu.c             |  2 +-
>  target/ppc/translate_init.c.inc | 16 ++++++++++------
>  26 files changed, 54 insertions(+), 42 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


