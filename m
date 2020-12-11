Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC622D7DF2
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:22:07 +0100 (CET)
Received: from localhost ([::1]:56270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knn3O-000751-Sq
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:22:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knmR1-0003gB-FD
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:42:27 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:35363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knmQu-0005rS-3O
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:42:27 -0500
Received: by mail-ot1-x342.google.com with SMTP id i6so8962364otr.2
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 09:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A29MbtjCHatk3MA6C2kKupkg6XX8YOAvI6UJgiYF200=;
 b=wXFaVGeZ20fQ8FCzFA0ksdyyFyLTnvgD25eCs8FkYv32INphflO2cr5gpEbTpG6ToQ
 4Tlzq5MdsZ7nIKGgp69TGN1G8sj2uCUC5139GAXq+pw2jmL6OVLGKg9qVNUoipKFjhqg
 g5owfOYcGZShkZrbCROoFyUy+GvYNP23UOZBPVpkhg+jp8+cgCdr2PCInll6+0s2SZvt
 76579hHr3WwLYJHK8c41nnljQ25pV2Ndbm9WEqRRzHWt3iuNcEzeFA28JaH1LAMKBRGT
 hSBNQdq9w+2pmBT7konZJpEq5/YQ2qJ+uLBZm+W4VsU7uF+4RRYsslOTPvhNaWUNSkRm
 ODJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A29MbtjCHatk3MA6C2kKupkg6XX8YOAvI6UJgiYF200=;
 b=dEHkfgMR5Fk4GUZ4wfd438mvBNSdhe/wIKNYqK3WS/qsahNmy98CTOVN+g+r8/d3D6
 q7imOomGtLkIEPBJxyujbVevlicNAahtaUiHV6ult9TlBjSkuT//a8c4bXfDMkQHuCef
 uhevNriQgTbir+krDriHFVhPwsqfIiCmYrx7NRBeSVDfAvuHiMim5LInWnt3pCtXb3Mp
 7Oq+PK53rGck3OxvWL2CPUIV3AxVboOy9Eb+7bVGb8EOHHrUi9mLjCaWCx2d97jfmthd
 xIbC8fCe6oGlw7W64PVCJF3Wy9F7Bwdcmr168QtrWLdEu3uO0f0Xd0qEBZt9k2PctU2j
 qnpg==
X-Gm-Message-State: AOAM532khp+jm1pTQ8YRAOtqDwQCIOS237qEnufuQiPf2gUVY9/rerKX
 k0R/euECEGMAMZYm3rbNH9BmQg==
X-Google-Smtp-Source: ABdhPJxrKeXlbShC4gnv4sP0erXFrqLEUovDoMnzvBXrpjoGzccTpQy27zqB1DOxytt1IUoX+mWpQQ==
X-Received: by 2002:a9d:19cf:: with SMTP id k73mr10807920otk.360.1607708536234; 
 Fri, 11 Dec 2020 09:42:16 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id z12sm2066606oti.45.2020.12.11.09.42.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 09:42:15 -0800 (PST)
Subject: Re: [PATCH v11 20/25] cpu: Move tlb_fill to tcg_ops
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-21-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <589d394e-f9b9-3888-91cc-75f3b471a764@linaro.org>
Date: Fri, 11 Dec 2020 11:42:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211083143.14350-21-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
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
>  include/hw/core/cpu.h           |  9 ---------
>  include/hw/core/tcg-cpu-ops.h   | 12 ++++++++++++
>  accel/tcg/cputlb.c              |  6 +++---
>  accel/tcg/user-exec.c           |  6 +++---
>  target/alpha/cpu.c              |  2 +-
>  target/arm/cpu.c                |  2 +-
>  target/avr/cpu.c                |  2 +-
>  target/cris/cpu.c               |  2 +-
>  target/hppa/cpu.c               |  2 +-
>  target/i386/tcg/tcg-cpu.c       |  2 +-
>  target/lm32/cpu.c               |  2 +-
>  target/m68k/cpu.c               |  2 +-
>  target/microblaze/cpu.c         |  2 +-
>  target/mips/cpu.c               |  2 +-
>  target/moxie/cpu.c              |  2 +-
>  target/nios2/cpu.c              |  2 +-
>  target/openrisc/cpu.c           |  2 +-
>  target/riscv/cpu.c              |  2 +-
>  target/rx/cpu.c                 |  2 +-
>  target/s390x/cpu.c              |  2 +-
>  target/sh4/cpu.c                |  2 +-
>  target/sparc/cpu.c              |  2 +-
>  target/tilegx/cpu.c             |  2 +-
>  target/tricore/cpu.c            |  2 +-
>  target/unicore32/cpu.c          |  2 +-
>  target/xtensa/cpu.c             |  2 +-
>  target/ppc/translate_init.c.inc |  2 +-
>  27 files changed, 41 insertions(+), 38 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


