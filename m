Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE362B7DB1
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 13:40:02 +0100 (CET)
Received: from localhost ([::1]:59546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfMkj-0004Eb-Ha
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 07:40:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kfMjn-0003nR-IX
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 07:39:05 -0500
Received: from mx2.suse.de ([195.135.220.15]:46394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kfMje-0004i2-OC
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 07:39:03 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1772EAC41;
 Wed, 18 Nov 2020 12:38:53 +0000 (UTC)
Subject: Re: [RFC v3 8/9] module: introduce MODULE_INIT_ACCEL_CPU
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201118102936.25569-1-cfontana@suse.de>
 <20201118102936.25569-9-cfontana@suse.de>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <ad2ebb19-88de-edc6-70ee-fb7fc65d1169@suse.de>
Date: Wed, 18 Nov 2020 13:38:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201118102936.25569-9-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 07:38:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 11:29 AM, Claudio Fontana wrote:
> apply this to the registration of the cpus accel interfaces,
> 
> but this will be also in preparation for later use of this
> new module init step to also defer the registration of the cpu models,



this is not true anymore, so my commit message here needs fixing.



> in order to make them subclasses of a per-accel cpu type.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  accel/kvm/kvm-all.c         | 11 +++++++++--
>  accel/qtest/qtest.c         | 10 +++++++++-
>  accel/tcg/tcg-all.c         | 11 +++++++++--
>  accel/xen/xen-all.c         | 12 +++++++++---
>  include/qemu/module.h       |  2 ++
>  softmmu/vl.c                |  6 ++++++
>  target/i386/hax/hax-all.c   | 12 +++++++++---
>  target/i386/hvf/hvf.c       | 10 +++++++++-
>  target/i386/whpx/whpx-all.c | 11 +++++++++--
>  9 files changed, 71 insertions(+), 14 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 9ef5daf4c5..509b249f52 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2251,8 +2251,6 @@ static int kvm_init(MachineState *ms)
>          ret = ram_block_discard_disable(true);
>          assert(!ret);
>      }
> -
> -    cpus_register_accel(&kvm_cpus);
>      return 0;
>  
>  err:
> @@ -3236,3 +3234,12 @@ static void kvm_type_init(void)
>  }
>  
>  type_init(kvm_type_init);
> +
> +static void kvm_accel_cpu_init(void)
> +{
> +    if (kvm_enabled()) {
> +        cpus_register_accel(&kvm_cpus);
> +    }
> +}
> +
> +accel_cpu_init(kvm_accel_cpu_init);
> diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
> index b282cea5cf..8d14059e32 100644
> --- a/accel/qtest/qtest.c
> +++ b/accel/qtest/qtest.c
> @@ -32,7 +32,6 @@ const CpusAccel qtest_cpus = {
>  
>  static int qtest_init_accel(MachineState *ms)
>  {
> -    cpus_register_accel(&qtest_cpus);
>      return 0;
>  }
>  
> @@ -58,3 +57,12 @@ static void qtest_type_init(void)
>  }
>  
>  type_init(qtest_type_init);
> +
> +static void qtest_accel_cpu_init(void)
> +{
> +    if (qtest_enabled()) {
> +        cpus_register_accel(&qtest_cpus);
> +    }
> +}
> +
> +accel_cpu_init(qtest_accel_cpu_init);
> diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
> index fa1208158f..9ffedc8151 100644
> --- a/accel/tcg/tcg-all.c
> +++ b/accel/tcg/tcg-all.c
> @@ -104,8 +104,6 @@ static int tcg_init(MachineState *ms)
>  
>      tcg_exec_init(s->tb_size * 1024 * 1024);
>      mttcg_enabled = s->mttcg_enabled;
> -    cpus_register_accel(&tcg_cpus);
> -
>      return 0;
>  }
>  
> @@ -201,3 +199,12 @@ static void register_accel_types(void)
>  }
>  
>  type_init(register_accel_types);
> +
> +static void tcg_accel_cpu_init(void)
> +{
> +    if (tcg_enabled()) {
> +        cpus_register_accel(&tcg_cpus);
> +    }
> +}
> +
> +accel_cpu_init(tcg_accel_cpu_init);
> diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
> index 878a4089d9..6932a9f364 100644
> --- a/accel/xen/xen-all.c
> +++ b/accel/xen/xen-all.c
> @@ -185,9 +185,6 @@ static int xen_init(MachineState *ms)
>       * opt out of system RAM being allocated by generic code
>       */
>      mc->default_ram_id = NULL;
> -
> -    cpus_register_accel(&xen_cpus);
> -
>      return 0;
>  }
>  
> @@ -228,3 +225,12 @@ static void xen_type_init(void)
>  }
>  
>  type_init(xen_type_init);
> +
> +static void xen_accel_cpu_init(void)
> +{
> +    if (xen_enabled()) {
> +        cpus_register_accel(&xen_cpus);
> +    }
> +}
> +
> +accel_cpu_init(xen_accel_cpu_init);
> diff --git a/include/qemu/module.h b/include/qemu/module.h
> index 944d403cbd..485eda986a 100644
> --- a/include/qemu/module.h
> +++ b/include/qemu/module.h
> @@ -44,6 +44,7 @@ typedef enum {
>      MODULE_INIT_BLOCK,
>      MODULE_INIT_OPTS,
>      MODULE_INIT_QOM,
> +    MODULE_INIT_ACCEL_CPU,
>      MODULE_INIT_TRACE,
>      MODULE_INIT_XEN_BACKEND,
>      MODULE_INIT_LIBQOS,
> @@ -54,6 +55,7 @@ typedef enum {
>  #define block_init(function) module_init(function, MODULE_INIT_BLOCK)
>  #define opts_init(function) module_init(function, MODULE_INIT_OPTS)
>  #define type_init(function) module_init(function, MODULE_INIT_QOM)
> +#define accel_cpu_init(function) module_init(function, MODULE_INIT_ACCEL_CPU)
>  #define trace_init(function) module_init(function, MODULE_INIT_TRACE)
>  #define xen_backend_init(function) module_init(function, \
>                                                 MODULE_INIT_XEN_BACKEND)
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index e6e0ad5a92..df4bed056a 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -4173,6 +4173,12 @@ void qemu_init(int argc, char **argv, char **envp)
>       */
>      configure_accelerators(argv[0]);
>  
> +    /*
> +     * accelerator has been chosen and initialized, now it is time to
> +     * register the cpu accel interface.
> +     */
> +    module_call_init(MODULE_INIT_ACCEL_CPU);
> +
>      /*
>       * Beware, QOM objects created before this point miss global and
>       * compat properties.
> diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
> index fecfe8cd6e..3bada019f5 100644
> --- a/target/i386/hax/hax-all.c
> +++ b/target/i386/hax/hax-all.c
> @@ -364,9 +364,6 @@ static int hax_accel_init(MachineState *ms)
>                  !ret ? "working" : "not working",
>                  !ret ? "fast virt" : "emulation");
>      }
> -    if (ret == 0) {
> -        cpus_register_accel(&hax_cpus);
> -    }
>      return ret;
>  }
>  
> @@ -1141,3 +1138,12 @@ static void hax_type_init(void)
>  }
>  
>  type_init(hax_type_init);
> +
> +static void hax_accel_cpu_init(void)
> +{
> +    if (hax_enabled()) {
> +        cpus_register_accel(&hax_cpus);
> +    }
> +}
> +
> +accel_cpu_init(hax_accel_cpu_init);
> diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
> index ed9356565c..249b77797f 100644
> --- a/target/i386/hvf/hvf.c
> +++ b/target/i386/hvf/hvf.c
> @@ -887,7 +887,6 @@ static int hvf_accel_init(MachineState *ms)
>    
>      hvf_state = s;
>      memory_listener_register(&hvf_memory_listener, &address_space_memory);
> -    cpus_register_accel(&hvf_cpus);
>      return 0;
>  }
>  
> @@ -911,3 +910,12 @@ static void hvf_type_init(void)
>  }
>  
>  type_init(hvf_type_init);
> +
> +static void hvf_accel_cpu_init(void)
> +{
> +    if (hvf_enabled()) {
> +        cpus_register_accel(&hvf_cpus);
> +    }
> +}
> +
> +accel_cpu_init(hvf_accel_cpu_init);
> diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
> index f4f3e33eac..2e715e2bc6 100644
> --- a/target/i386/whpx/whpx-all.c
> +++ b/target/i386/whpx/whpx-all.c
> @@ -1642,8 +1642,6 @@ static int whpx_accel_init(MachineState *ms)
>  
>      whpx_memory_init();
>  
> -    cpus_register_accel(&whpx_cpus);
> -
>      printf("Windows Hypervisor Platform accelerator is operational\n");
>      return 0;
>  
> @@ -1713,3 +1711,12 @@ error:
>  }
>  
>  type_init(whpx_type_init);
> +
> +static void whpx_accel_cpu_init(void)
> +{
> +    if (whpx_enabled()) {
> +        cpus_register_accel(&whpx_cpus);
> +    }
> +}
> +
> +accel_cpu_init(whpx_accel_cpu_init);
> 


