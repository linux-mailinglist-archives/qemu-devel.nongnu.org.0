Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D932CB0AF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 00:15:40 +0100 (CET)
Received: from localhost ([::1]:58570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkErz-0005ym-E3
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 18:15:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kkEpq-0004s3-7T; Tue, 01 Dec 2020 18:13:26 -0500
Received: from mail.csgraf.de ([188.138.100.120]:53502
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kkEpg-000817-Sb; Tue, 01 Dec 2020 18:13:25 -0500
Received: from freeip.amazon.com
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with UTF8SMTPSA id E57C1390038F;
 Wed,  2 Dec 2020 00:13:12 +0100 (CET)
Subject: Re: [PATCH] arm/hvf: Optimize and simplify WFI handling
From: Alexander Graf <agraf@csgraf.de>
To: Peter Collingbourne <pcc@google.com>
References: <20201201082142.649007-1-pcc@google.com>
 <5b691ccb-43bb-5955-d47a-cae39c59522c@csgraf.de>
 <CAMn1gO5i7CGet6rDVMwYf40vCMU61n7b=TTTTZzWSDbn+FGL1w@mail.gmail.com>
 <8cc9052b-da85-de93-9d54-d4d0730054ec@csgraf.de>
Message-ID: <835a98b6-e108-7479-489e-6c5d8d00408d@csgraf.de>
Date: Wed, 2 Dec 2020 00:13:12 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:84.0)
 Gecko/20100101 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <8cc9052b-da85-de93-9d54-d4d0730054ec@csgraf.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 01.12.20 23:09, Alexander Graf wrote:
>
> On 01.12.20 21:03, Peter Collingbourne wrote:
>> On Tue, Dec 1, 2020 at 8:26 AM Alexander Graf <agraf@csgraf.de> wrote:
>>>
>>> On 01.12.20 09:21, Peter Collingbourne wrote:
>>>> Sleep on WFx until the VTIMER is due but allow ourselves to be woken
>>>> up on IPI.
>>>>
>>>> Signed-off-by: Peter Collingbourne <pcc@google.com>
>>>> ---
>>>> Alexander Graf wrote:
>>>>> I would love to take a patch from you here :). I'll still be stuck 
>>>>> for a
>>>>> while with the sysreg sync rework that Peter asked for before I 
>>>>> can look
>>>>> at WFI again.
>>>> Okay, here's a patch :) It's a relatively straightforward adaptation
>>>> of what we have in our fork, which can now boot Android to GUI while
>>>> remaining at around 4% CPU when idle.
>>>>
>>>> I'm not set up to boot a full Linux distribution at the moment so I
>>>> tested it on upstream QEMU by running a recent mainline Linux kernel
>>>> with a rootfs containing an init program that just does sleep(5)
>>>> and verified that the qemu process remains at low CPU usage during
>>>> the sleep. This was on top of your v2 plus the last patch of your v1
>>>> since it doesn't look like you have a replacement for that logic yet.
>>>
>>> How about something like this instead?
>>>
>>>
>>> Alex
>>>
>>>
>>> diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
>>> index 4360f64671..50384013ea 100644
>>> --- a/accel/hvf/hvf-cpus.c
>>> +++ b/accel/hvf/hvf-cpus.c
>>> @@ -337,16 +337,18 @@ static int hvf_init_vcpu(CPUState *cpu)
>>>        cpu->hvf = g_malloc0(sizeof(*cpu->hvf));
>>>
>>>        /* init cpu signals */
>>> -    sigset_t set;
>>>        struct sigaction sigact;
>>>
>>>        memset(&sigact, 0, sizeof(sigact));
>>>        sigact.sa_handler = dummy_signal;
>>>        sigaction(SIG_IPI, &sigact, NULL);
>>>
>>> -    pthread_sigmask(SIG_BLOCK, NULL, &set);
>>> -    sigdelset(&set, SIG_IPI);
>>> -    pthread_sigmask(SIG_SETMASK, &set, NULL);
>>> +    pthread_sigmask(SIG_BLOCK, NULL, &cpu->hvf->sigmask);
>>> +    sigdelset(&cpu->hvf->sigmask, SIG_IPI);
>>> +    pthread_sigmask(SIG_SETMASK, &cpu->hvf->sigmask, NULL);
>>> +
>>> +    pthread_sigmask(SIG_BLOCK, NULL, &cpu->hvf->sigmask_ipi);
>>> +    sigaddset(&cpu->hvf->sigmask_ipi, SIG_IPI);
>> There's no reason to unblock SIG_IPI while not in pselect and it can
>> easily lead to missed wakeups. The whole point of pselect is so that
>> you can guarantee that only one part of your program sees signals
>> without a possibility of them being missed.
>
>
> Hm, I think I start to agree with you here :). We can probably just 
> leave SIG_IPI masked at all times and only unmask on pselect. The 
> worst thing that will happen is a premature wakeup if we did get an 
> IPI incoming while hvf->sleeping is set, but were either not running 
> pselect() yet and bailed out or already finished pselect() execution.


How about this one? Do you really think it's still racy?


Alex


diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
index 4360f64671..e10fca622d 100644
--- a/accel/hvf/hvf-cpus.c
+++ b/accel/hvf/hvf-cpus.c
@@ -337,16 +337,17 @@ static int hvf_init_vcpu(CPUState *cpu)
      cpu->hvf = g_malloc0(sizeof(*cpu->hvf));

      /* init cpu signals */
-    sigset_t set;
      struct sigaction sigact;

      memset(&sigact, 0, sizeof(sigact));
      sigact.sa_handler = dummy_signal;
      sigaction(SIG_IPI, &sigact, NULL);

-    pthread_sigmask(SIG_BLOCK, NULL, &set);
-    sigdelset(&set, SIG_IPI);
-    pthread_sigmask(SIG_SETMASK, &set, NULL);
+    /* Remember unmasked IPI mask for pselect(), leave masked normally */
+    pthread_sigmask(SIG_BLOCK, NULL, &cpu->hvf->sigmask_ipi);
+    sigaddset(&cpu->hvf->sigmask_ipi, SIG_IPI);
+    pthread_sigmask(SIG_SETMASK, &cpu->hvf->sigmask_ipi, NULL);
+    sigdelset(&cpu->hvf->sigmask_ipi, SIG_IPI);

  #ifdef __aarch64__
      r = hv_vcpu_create(&cpu->hvf->fd, (hv_vcpu_exit_t 
**)&cpu->hvf->exit, NULL);
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index c56baa3ae8..8d7d4a6226 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -62,8 +62,8 @@ extern HVFState *hvf_state;
  struct hvf_vcpu_state {
      uint64_t fd;
      void *exit;
-    struct timespec ts;
      bool sleeping;
+    sigset_t sigmask_ipi;
  };

  void assert_hvf_ok(hv_return_t ret);
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 0c01a03725..a255a1a7d3 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -320,14 +320,8 @@ int hvf_arch_init_vcpu(CPUState *cpu)

  void hvf_kick_vcpu_thread(CPUState *cpu)
  {
-    if (cpu->hvf->sleeping) {
-        /*
-         * When sleeping, make sure we always send signals. Also, clear the
-         * timespec, so that an IPI that arrives between setting 
hvf->sleeping
-         * and the nanosleep syscall still aborts the sleep.
-         */
-        cpu->thread_kicked = false;
-        cpu->hvf->ts = (struct timespec){ };
+    if (qatomic_read(&cpu->hvf->sleeping)) {
+        /* When sleeping, send a signal to get out of pselect */
          cpus_kick_thread(cpu);
      } else {
          hv_vcpus_exit(&cpu->hvf->fd, 1);
@@ -354,6 +348,7 @@ int hvf_vcpu_exec(CPUState *cpu)
      ARMCPU *arm_cpu = ARM_CPU(cpu);
      CPUARMState *env = &arm_cpu->env;
      hv_vcpu_exit_t *hvf_exit = cpu->hvf->exit;
+    const uint32_t irq_mask = CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ;
      hv_return_t r;
      int ret = 0;

@@ -491,8 +486,8 @@ int hvf_vcpu_exec(CPUState *cpu)
              break;
          }
          case EC_WFX_TRAP:
-            if (!(syndrome & WFX_IS_WFE) && !(cpu->interrupt_request &
-                (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))) {
+            if (!(syndrome & WFX_IS_WFE) &&
+                !(cpu->interrupt_request & irq_mask)) {
                  uint64_t cval, ctl, val, diff, now;

                  /* Set up a local timer for vtimer if necessary ... */
@@ -515,9 +510,7 @@ int hvf_vcpu_exec(CPUState *cpu)

                  if (diff < INT64_MAX) {
                      uint64_t ns = diff * gt_cntfrq_period_ns(arm_cpu);
-                    struct timespec *ts = &cpu->hvf->ts;
-
-                    *ts = (struct timespec){
+                    struct timespec ts = {
                          .tv_sec = ns / NANOSECONDS_PER_SECOND,
                          .tv_nsec = ns % NANOSECONDS_PER_SECOND,
                      };
@@ -526,27 +519,27 @@ int hvf_vcpu_exec(CPUState *cpu)
                       * Waking up easily takes 1ms, don't go to sleep 
for smaller
                       * time periods than 2ms.
                       */
-                    if (!ts->tv_sec && (ts->tv_nsec < (SCALE_MS * 2))) {
+                    if (!ts.tv_sec && (ts.tv_nsec < (SCALE_MS * 2))) {
                          advance_pc = true;
                          break;
                      }

+                    cpu->thread_kicked = false;
+
                      /* Set cpu->hvf->sleeping so that we get a SIG_IPI 
signal. */
-                    cpu->hvf->sleeping = true;
-                    smp_mb();
+                    qatomic_set(&cpu->hvf->sleeping, true);

-                    /* Bail out if we received an IRQ meanwhile */
-                    if (cpu->thread_kicked || (cpu->interrupt_request &
-                        (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))) {
-                        cpu->hvf->sleeping = false;
+                    /* Bail out if we received a kick meanwhile */
+                    if (qatomic_read(&cpu->interrupt_request) & irq_mask) {
+ qatomic_set(&cpu->hvf->sleeping, false);
                          break;
                      }

-                    /* nanosleep returns on signal, so we wake up on 
kick. */
-                    nanosleep(ts, NULL);
+                    /* pselect returns on kick signal and consumes it */
+                    pselect(0, 0, 0, 0, &ts, &cpu->hvf->sigmask_ipi);

                      /* Out of sleep - either naturally or because of a 
kick */
-                    cpu->hvf->sleeping = false;
+                    qatomic_set(&cpu->hvf->sleeping, false);
                  }

                  advance_pc = true;


