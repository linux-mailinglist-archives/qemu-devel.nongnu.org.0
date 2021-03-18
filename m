Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A4B3403CE
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 11:49:22 +0100 (CET)
Received: from localhost ([::1]:47100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMqDR-0002dT-C3
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 06:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMqAi-0001GA-Ee
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:46:33 -0400
Received: from mx2.suse.de ([195.135.220.15]:45206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMqAe-0006J2-HY
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:46:32 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CB923AC1E;
 Thu, 18 Mar 2021 10:46:26 +0000 (UTC)
Subject: Re: [RFC v9 38/50] target/arm: move kvm cpu properties setting to
 kvm-cpu
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210317183013.25772-1-cfontana@suse.de>
 <20210317183013.25772-39-cfontana@suse.de>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <d373d25e-c615-29ec-5a4e-2c3c4c26cc19@suse.de>
Date: Thu, 18 Mar 2021 11:46:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210317183013.25772-39-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Roman Bolshakov <r.bolshakov@yadro.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 7:30 PM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/arm/cpu.c         | 4 ----
>  target/arm/kvm/kvm-cpu.c | 1 +
>  2 files changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 3d6501c2c5..ac01fa0bae 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -786,10 +786,6 @@ void arm_cpu_post_init(Object *obj)
>          qdev_property_add_static(DEVICE(cpu), &arm_cpu_gt_cntfrq_property);
>      }
>  
> -    if (kvm_enabled()) {
> -        kvm_arm_add_vcpu_properties(obj);
> -    }
> -
>  #ifndef CONFIG_USER_ONLY
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) &&
>          cpu_isar_feature(aa64_mte, cpu)) {
> diff --git a/target/arm/kvm/kvm-cpu.c b/target/arm/kvm/kvm-cpu.c
> index b3e97080cc..3b8a8de30f 100644
> --- a/target/arm/kvm/kvm-cpu.c
> +++ b/target/arm/kvm/kvm-cpu.c
> @@ -89,6 +89,7 @@ static void host_cpu_instance_init(Object *obj)
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>          aarch64_add_sve_properties(obj);
>      }
> +    kvm_arm_add_vcpu_properties(obj);
>      arm_cpu_post_init(obj);
>  }
>  
> 

This is wrong, the arm_cpu_post_init stuff confused me. Dropped.



