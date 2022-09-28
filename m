Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB135EDC5D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 14:12:54 +0200 (CEST)
Received: from localhost ([::1]:40902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odVvp-0004UB-FV
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 08:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odSvy-0007sy-Gv
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:00:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odSvu-0006TS-TT
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:00:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664355646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ws0mxhivjKUIgvTzB8kXlPgTHypInkLtZwdsZddi4NA=;
 b=CeKdEkJG2+DBSDhFRr0hkLHFy2prsja+vbZcO3YEGBL/YHPQKCH7T5aTnSs8LIe4sVW63H
 Ize1vv6SaQD221m4/KFMPiRW5BYodI2OjmBR3KJV+B7ac18M/xW0REl4e8vgLMr0Vfnm6x
 ZF69iIiyQTTsknD08VUoqtPCmXNSQs8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-280-HGOa3e7jPn-fQAFoPSSLRg-1; Wed, 28 Sep 2022 05:00:43 -0400
X-MC-Unique: HGOa3e7jPn-fQAFoPSSLRg-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay21-20020a05600c1e1500b003b45fd14b53so1480790wmb.1
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 02:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ws0mxhivjKUIgvTzB8kXlPgTHypInkLtZwdsZddi4NA=;
 b=D+8/c2IIacHQh1T54tGxbFRrL7Py3EDS17vNDDeDgCjkT7nbEWUcrzdOQVFzjxPvSu
 yVzxy0Xfy7BUjeW83QFXhawcxVN/r89zLHPe7on+T7BZn/SFcWlf0PDSg68Zm9MQWkcG
 PfNQ6DgnTzEs/FP0EmnD6NOl/r59sBeeFfd96XMq571nP0i10io+pBuKH2L0BNXzv1dj
 Ix6aRl3UjuG5niiaoPH2I7Qcp2lHADiWEI+cUSM7OCoJ8OIX+p3UG40jLVy/HCcuT6mk
 7I1qk8pFgRbjqTiMLwgGnumWWhmEP+jOlkszqtoCULq1iDl+EluLodVWidcAOlpINPkc
 VQ7g==
X-Gm-Message-State: ACrzQf1znpPiO3p7yzOW2ApZRsL0xjOd9Y8fe4BZbv2giiR37ot9CCDC
 z2ULbUPtW1zmqDSLgpVTKYeouz2AzUQ7wIRlKtwD/7saFBGfnPUIYJdedQqvNJk1OXPHURC7kCE
 vfHpCQuTidMotGWg=
X-Received: by 2002:a05:6000:144f:b0:22a:7098:6472 with SMTP id
 v15-20020a056000144f00b0022a70986472mr20190530wrx.685.1664355641994; 
 Wed, 28 Sep 2022 02:00:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Rlw+3BGY5S5WyORmE2egqKNtujc3hD/hora97QSYCaG/Rhj6Gw2dKJFUhGy4u9l5RRAxQQQ==
X-Received: by 2002:a05:6000:144f:b0:22a:7098:6472 with SMTP id
 v15-20020a056000144f00b0022a70986472mr20190500wrx.685.1664355641634; 
 Wed, 28 Sep 2022 02:00:41 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-89.web.vodafone.de.
 [109.43.176.89]) by smtp.gmail.com with ESMTPSA id
 m17-20020a05600c3b1100b003b476cabf1csm1435993wms.26.2022.09.28.02.00.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 02:00:41 -0700 (PDT)
Message-ID: <a0125f4b-9953-0a15-1c17-23af8e14e329@redhat.com>
Date: Wed, 28 Sep 2022 11:00:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 31/54] accel/qtest: Implement a portable qtest
 accelerator
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng
 <bin.meng@windriver.com>, Eduardo Habkost <eduardo@habkost.net>,
 Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
 <20220927110632.1973965-32-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220927110632.1973965-32-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/09/2022 13.06, Bin Meng wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> Currently signal SIGIPI [=SIGUSR1] is used to kick the dummy CPU
> when qtest accelerator is used. However SIGUSR1 is unsupported on
> Windows. To support Windows, we add a QemuSemaphore CPUState::sem
> to kick the dummy CPU instead.
> 
> As a result of this, the POSIX implementation via signal is no
> longer needed and can use the same path as Windows.
> 
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - Replace signal by the semaphore on posix too

This does not work - it breaks running with KVM on Linux. When I add this 
patch, I get:

$ ./qemu-system-x86_64  -machine pc   -smp 4 -enable-kvm
qemu-system-x86_64: ../../devel/qemu/util/qemu-thread-posix.c:86: 
qemu_mutex_lock_impl: Assertion `mutex->initialized' failed.
Aborted (core dumped)

I think "SIG_IPI" is used for kicking a CPU out of the kernel mode there, so 
you cannot simply replace it wrt KVM.

  Thomas


>   include/hw/core/cpu.h   |  1 +
>   accel/dummy-cpus.c      | 15 ++-------------
>   softmmu/cpus.c          | 10 +---------
>   accel/meson.build       |  1 +
>   accel/qtest/meson.build |  1 +
>   5 files changed, 6 insertions(+), 22 deletions(-)
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 500503da13..2f46c37dc1 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -326,6 +326,7 @@ struct CPUState {
>   #ifdef _WIN32
>       HANDLE hThread;
>   #endif
> +    QemuSemaphore sem;
>       int thread_id;
>       bool running, has_waiter;
>       struct QemuCond *halt_cond;
> diff --git a/accel/dummy-cpus.c b/accel/dummy-cpus.c
> index 10429fdfb2..3769d3db0a 100644
> --- a/accel/dummy-cpus.c
> +++ b/accel/dummy-cpus.c
> @@ -21,8 +21,6 @@
>   static void *dummy_cpu_thread_fn(void *arg)
>   {
>       CPUState *cpu = arg;
> -    sigset_t waitset;
> -    int r;
>   
>       rcu_register_thread();
>   
> @@ -32,23 +30,13 @@ static void *dummy_cpu_thread_fn(void *arg)
>       cpu->can_do_io = 1;
>       current_cpu = cpu;
>   
> -    sigemptyset(&waitset);
> -    sigaddset(&waitset, SIG_IPI);
> -
>       /* signal CPU creation */
>       cpu_thread_signal_created(cpu);
>       qemu_guest_random_seed_thread_part2(cpu->random_seed);
>   
>       do {
>           qemu_mutex_unlock_iothread();
> -        do {
> -            int sig;
> -            r = sigwait(&waitset, &sig);
> -        } while (r == -1 && (errno == EAGAIN || errno == EINTR));
> -        if (r == -1) {
> -            perror("sigwait");
> -            exit(1);
> -        }
> +        qemu_sem_wait(&cpu->sem);
>           qemu_mutex_lock_iothread();
>           qemu_wait_io_event(cpu);
>       } while (!cpu->unplug);
> @@ -67,6 +55,7 @@ void dummy_start_vcpu_thread(CPUState *cpu)
>       qemu_cond_init(cpu->halt_cond);
>       snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/DUMMY",
>                cpu->cpu_index);
> +    qemu_sem_init(&cpu->sem, 0);
>       qemu_thread_create(cpu->thread, thread_name, dummy_cpu_thread_fn, cpu,
>                          QEMU_THREAD_JOINABLE);
>   }
> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> index 23b30484b2..2a992d0d5f 100644
> --- a/softmmu/cpus.c
> +++ b/softmmu/cpus.c
> @@ -437,19 +437,11 @@ void qemu_wait_io_event(CPUState *cpu)
>   
>   void cpus_kick_thread(CPUState *cpu)
>   {
> -#ifndef _WIN32
> -    int err;
> -
>       if (cpu->thread_kicked) {
>           return;
>       }
>       cpu->thread_kicked = true;
> -    err = pthread_kill(cpu->thread->thread, SIG_IPI);
> -    if (err && err != ESRCH) {
> -        fprintf(stderr, "qemu:%s: %s", __func__, strerror(err));
> -        exit(1);
> -    }
> -#endif
> +    qemu_sem_post(&cpu->sem);
>   }
>   
>   void qemu_cpu_kick(CPUState *cpu)
> diff --git a/accel/meson.build b/accel/meson.build
> index b9a963cf80..b21c85dc0a 100644
> --- a/accel/meson.build
> +++ b/accel/meson.build
> @@ -17,4 +17,5 @@ dummy_ss.add(files(
>   ))
>   
>   specific_ss.add_all(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'], if_true: dummy_ss)
> +specific_ss.add_all(when: ['CONFIG_WIN32'], if_true: dummy_ss)
>   specific_ss.add_all(when: ['CONFIG_XEN'], if_true: dummy_ss)
> diff --git a/accel/qtest/meson.build b/accel/qtest/meson.build
> index 4c65600293..a4876fc0f2 100644
> --- a/accel/qtest/meson.build
> +++ b/accel/qtest/meson.build
> @@ -1,2 +1,3 @@
>   qtest_module_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'],
>                       if_true: files('qtest.c'))
> +qtest_module_ss.add(when: ['CONFIG_WIN32'], if_true: files('qtest.c'))


