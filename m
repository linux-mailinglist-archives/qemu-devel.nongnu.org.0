Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BC72CCBE2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 02:53:44 +0100 (CET)
Received: from localhost ([::1]:57758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkdoV-0006Di-4d
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 20:53:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kkdmw-0005fT-3N; Wed, 02 Dec 2020 20:52:06 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:36554 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kkdmt-0007HR-JI; Wed, 02 Dec 2020 20:52:05 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 0E57141386;
 Thu,  3 Dec 2020 01:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1606960320;
 x=1608774721; bh=cA8kL0/Kz6I6dZEXpMSUbZOIuGtKSt+iZCngSO6+0rM=; b=
 Xb+l4A/GCD+Rsf7g/zsoBuLH653qLlgVYK6CpR6UPQBk7jlq24CER0eRwrNwyGK2
 msKQcbw3n5YHZ2fOU8kbrnVeNptAqNFvPotGL76OqrRw6CMtwFiT32RHugnOHMW5
 snQ/3/wKZXjUj8Z1xlCo41Jwq6O2lIqe9lyNNHRuVqg=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yAIig5KBlows; Thu,  3 Dec 2020 04:52:00 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 5106A41333;
 Thu,  3 Dec 2020 04:51:59 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 3 Dec
 2020 04:51:58 +0300
Date: Thu, 3 Dec 2020 04:52:18 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v3 05/10] hvf: arm: Mark CPU as dirty on reset
Message-ID: <20201203015218.GA82480@SPB-NB-133.local>
References: <20201202190408.2041-1-agraf@csgraf.de>
 <20201202190408.2041-6-agraf@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201202190408.2041-6-agraf@csgraf.de>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 02, 2020 at 08:04:03PM +0100, Alexander Graf wrote:
> When clearing internal state of a CPU, we should also make sure that HVF
> knows about it and can push the new values down to vcpu state.
> 

I'm sorry if I'm asking something dumb. But isn't
cpu_synchronize_all_post_reset() is supposed to push QEMU state into HVF
(or any other accel) after reset?

For x86 it used to work:

  static void do_hvf_cpu_synchronize_post_reset(CPUState *cpu,
                                                run_on_cpu_data arg)
  {
      hvf_put_registers(cpu);                                                                                                                                                                cpu->vcpu_dirty = false;
  }

Thanks,
Roman

> Make sure that with HVF enabled, we tell it that it should synchronize
> CPU state on next entry after a reset.
> 
> This fixes PSCI handling, because now newly pushed state such as X0 and
> PC on remote CPU enablement also get pushed into HVF.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  target/arm/arm-powerctl.c | 1 +
>  target/arm/cpu.c          | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
> index b75f813b40..a49a5b32e6 100644
> --- a/target/arm/arm-powerctl.c
> +++ b/target/arm/arm-powerctl.c
> @@ -15,6 +15,7 @@
>  #include "arm-powerctl.h"
>  #include "qemu/log.h"
>  #include "qemu/main-loop.h"
> +#include "sysemu/hw_accel.h"
>  
>  #ifndef DEBUG_ARM_POWERCTL
>  #define DEBUG_ARM_POWERCTL 0
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index db6f7c34ed..9a501ea4bd 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -411,6 +411,8 @@ static void arm_cpu_reset(DeviceState *dev)
>  #ifndef CONFIG_USER_ONLY
>      if (kvm_enabled()) {
>          kvm_arm_reset_vcpu(cpu);
> +    } else if (hvf_enabled()) {
> +        s->vcpu_dirty = true;
>      }
>  #endif
>  
> -- 
> 2.24.3 (Apple Git-128)
> 

