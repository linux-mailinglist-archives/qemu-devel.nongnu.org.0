Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1777F2C5E2A
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 00:33:54 +0100 (CET)
Received: from localhost ([::1]:42210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiQls-0005tt-NU
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 18:33:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kiQkt-0005Ld-2P; Thu, 26 Nov 2020 18:32:51 -0500
Received: from mail.csgraf.de ([188.138.100.120]:37550
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kiQkk-0007i6-NN; Thu, 26 Nov 2020 18:32:46 -0500
Received: from Alexanders-Mac-mini.local
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with UTF8SMTPSA id 6C6B83900279;
 Fri, 27 Nov 2020 00:32:39 +0100 (CET)
Subject: Re: [PATCH 4/8] arm: Synchronize CPU on PSCI on
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201126213600.40654-1-agraf@csgraf.de>
 <20201126213600.40654-5-agraf@csgraf.de>
 <CAFEAcA_XZu07Fg3G05VWYDYTJfMSAzOH5yyd=rFLJVa73juDtw@mail.gmail.com>
 <785c216b-d4b5-b65f-1ddf-4c6374b72ece@csgraf.de>
 <CAFEAcA9QUfBQpmH=8_A+xDm53GkkOgFEDnkTDXOX_1A-bFg0Ng@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <284d0cd2-268b-b937-3a6e-d074ce28baee@csgraf.de>
Date: Fri, 27 Nov 2020 00:32:38 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:84.0)
 Gecko/20100101 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9QUfBQpmH=8_A+xDm53GkkOgFEDnkTDXOX_1A-bFg0Ng@mail.gmail.com>
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 26.11.20 23:26, Peter Maydell wrote:
> On Thu, 26 Nov 2020 at 22:16, Alexander Graf <agraf@csgraf.de> wrote:
>> cpu_synchronize_state() sets the CPU registers into "dirty" state which
>> means that env now holds the current copy. On the next entry, we then
>> sync them back into HVF.
>>
>> Without the cpu_synchronize_state() call, HVF never knows that the CPU
>> state is actually dirty. I guess it could as well live in cpu_reset()
>> somewhere, but we have to get the state switched over to dirty one way
>> or another.
>>
>> One interesting thing to note here is that the CPU actually comes up in
>> "dirty" after init. But init is done on realization already. I'm not
>> sure why we lose the dirty state in between that and the reset.
> Yeah, it sounds like you need to figure out where the dirty
> to not-dirty transitions ought to be happening rather than
> just fudging things here...


When init is complete (system is ready to launch), the CPU state is 
pushed to HVF and dirty is set to false. So by design, a normal 
cpu_reset doesn't have vcpu_dirty set.

How about this patch instead?

Alex



commit 8c61bc4d613b01e251b6b2f892d1a55a333c6e37
Author: Alexander Graf <agraf@csgraf.de>
Date:   Thu Nov 26 02:47:09 2020 +0100

     hvf: arm: Mark CPU as dirty on reset

     When clearing internal state of a CPU, we should also make sure 
that HVF
     knows about it and can push the new values down to vcpu state.

     Make sure that with HVF enabled, we tell it that it should synchronize
     CPU state on next entry after a reset.

     This fixes PSCI handling, because now newly pushed state such as X0 and
     PC on remote CPU enablement also get pushed into HVF.

     Signed-off-by: Alexander Graf <agraf@csgraf.de>

diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
index b75f813b40..a49a5b32e6 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -15,6 +15,7 @@
  #include "arm-powerctl.h"
  #include "qemu/log.h"
  #include "qemu/main-loop.h"
+#include "sysemu/hw_accel.h"

  #ifndef DEBUG_ARM_POWERCTL
  #define DEBUG_ARM_POWERCTL 0
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index db6f7c34ed..9a501ea4bd 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -411,6 +411,8 @@ static void arm_cpu_reset(DeviceState *dev)
  #ifndef CONFIG_USER_ONLY
      if (kvm_enabled()) {
          kvm_arm_reset_vcpu(cpu);
+    } else if (hvf_enabled()) {
+        s->vcpu_dirty = true;
      }
  #endif


