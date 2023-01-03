Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9931465C5EB
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:18:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClrJ-0008LD-9l; Tue, 03 Jan 2023 13:17:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqL-0008Fe-6o
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:19 -0500
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqI-00056j-8S
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:16:55 -0500
Received: by mail-yb1-xb33.google.com with SMTP id v126so34041752ybv.2
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S6gy49NRXRLFFE5s1na1TaFkAznzQHxJE+Ljk8WSLD4=;
 b=ofgqJnSPThvRJ0JD31W6iKRL2F+GVKLzLgJ1s7Un4Lz9SQudO1EMa+sBPaigPUmFIc
 LM3DIgLeQ9MMwLKH4gpTLwvdgMoHLzZ2gQqkHkuBSdTlQBq6Wc8LlxqWITRRIDZ3jgI5
 s6YN+DlHGlNlWwKyczvSXZ8JQKgcnKbXhYbPgfbGhKBNL1u+DV8C5tWiYE7vq/te/Hem
 eqQpZ6t8Fg6itFtWGovY22fMOEwcUYrL7Zr/V4Mv3qiH/pXw59gCW3qweGwNpWqVudG9
 DNNyz6XZQizBVP11Nzfxu3cTNkTbz2apsnMdoU9i5ym6/RoksEWL26jQi2XpQzF9Ka0D
 0XNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S6gy49NRXRLFFE5s1na1TaFkAznzQHxJE+Ljk8WSLD4=;
 b=hcSNzdNBtTVyr/JL/PjiORRCVfFRFHfPqbSAo58KjesEy8RvNmrkF37bqdJTP+nXCI
 QprWJ5Y9pDWpIA9F3fQnNEJuSVU9meKBW9Qhn+vNhbPdQcqWlPpSAoSQXlGXczoqkUGw
 w29jMPw68FQLDRuRQOsNOe/nP6nNBju5sfcKqbyFCXyBZX2JwLoTojmeTorZbIpEi9NW
 392sb79kMZO1NQiVC/c7nLibOw7UBZFEOaJkUsPXlcfI4kB+KyQpb7d28psJBaQ+DzCh
 t8SHPJIyOl6By0ZMsUGJqGchQ8S4aWFR+iFbdRjJVYAUWqa9S5Zni/SO8+Sz5nqSJIIw
 Y2cA==
X-Gm-Message-State: AFqh2kozasITLCoS7O5cUBdj29rw99EOzo5chDwmwlNXMkIYe7QMOYR4
 WpAVfLqJQkut4tottDutFNkRJmT0X1RNLyj+nhI=
X-Google-Smtp-Source: AMrXdXsxVgWIQWHZtV38MARJ5lrc8k+Ipy6FcppYpnmxWjmKMq8Zuuv3zuAkB4dBgGiQO8BwU6oRAw==
X-Received: by 2002:a25:6d06:0:b0:6f2:63ac:49bd with SMTP id
 i6-20020a256d06000000b006f263ac49bdmr39943561ybc.38.1672769811811; 
 Tue, 03 Jan 2023 10:16:51 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:16:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 00/40] Toward class init of cpu features
Date: Tue,  3 Jan 2023 10:16:06 -0800
Message-Id: <20230103181646.55711-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=richard.henderson@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The specific problem I'm trying to solve is the location and
representation of the coprocessor register hash table for ARM cpus,
but in the process affects how cpu initialization might be done for
all targets.

At present, each cpu (for all targets) is initialized separately.
For some, like ARM, we apply QOM properties and then build a hash
table of all coprocessor regs that are valid for the cpu.  For others,
like m68k and ppc, we build tables of all valid instructions
(ppc is slowly moving away from constructed tables to decodetree,
but the migration is not complete).

Importantly, this happens N times for smp system emulation, for each
cpu instance, meaning we do N times the work on startup as necessary.
For system emulation this isn't so bad, as N is generally small-ish,
but it certainly could be improved.

More importantly, this happens for each thread in user-only emulation.
This is much more significant because threads can be short-lived, and
there can be many hundreds of them, each one performing what amounts
to redundant initialization.

The "obvious" solution is to make better use of the cpu class object.
Construct data structures once to be shared with all instances.

The immediate problem encountered here is that of QOM properties,
which are used to control how each object is configured.

The first couple of patches here create a new QOM "class property",
which is sufficient to allow command-line parameters to find their
way to the correct bit of code to interpret them.  (Pardon the
roughness in these patches, RFC and all.)  The restriction I add 
here is that all class properties must be applied before the first
object is created, which gives for a definite point at which the
properties must have be applied and we can construct data structures
based on those values.

However, I wind up banging my head against the wall later, when it
comes to the first qmp_query_cpu_model_expansion properties.  This
wants to create an object, apply properties, and see what stuck.
Adding a query of the class properties is fine, but I can't set any
of them because of the object creation.  And if I tweak the location
of the class property set vs the object create, that only allows the
first such probe to succeed, because the second will still have had
an object created.

I can imagine a way out of this, e.g. by keeping a ref count of the
number of instantiated objects, and allowing class properties to change 
when that count is zero.  But it feels like I really should know what
QMP is attempting to do here, rather than work around it blindly.


r~


Richard Henderson (40):
  qdev: Don't always force the global property array non-null
  qom: Introduce class_late_init
  qom: Create class properties
  target/arm: Remove aarch64_cpu_finalizefn
  target/arm: Create arm_cpu_register_parent
  target/arm: Remove AArch64CPUClass
  target/arm: Create TYPE_ARM_V7M_CPU
  target/arm: Pass ARMCPUClass to ARMCPUInfo.class_init
  target/arm: Utilize arm-cpu instance_post_init hook
  target/arm: Copy dtb_compatible from ARMCPUClass
  target/arm: Copy features from ARMCPUClass
  target/arm: Copy isar and friends from ARMCPUClass
  hw/arm/bcm2836: Set mp-affinity property in realize
  target/arm: Rename arm_cpu_mp_affinity
  target/arm: Create arm_cpu_mp_affinity
  target/arm: Represent the entire MPIDR_EL1
  target/arm: Copy cp_regs from ARMCPUClass
  target/arm: Create cpreg definition functions with GHashTable arg
  target/arm: Move most cpu initialization to the class
  target/arm: Merge kvm64.c with kvm.c
  target/arm: Remove aarch64 check from aarch64_host_object_init
  target/arm: Hoist feature and dtb_compatible from KVM, HVF
  target/arm: Probe KVM host into ARMCPUClass
  target/arm/hvf: Probe host into ARMCPUClass
  target/arm/hvf: Use offsetof in hvf_arm_get_host_cpu_features
  target/arm: Rename 'cpu' to 'acc' in class init functions
  target/arm: Split out strongarm_class_init
  target/arm: Split out xscale*_class_init
  target/arm: Remove m-profile has_vfp and has_dsp properties
  target/arm: Move feature bit propagation to class init
  target/arm: Get and set class properties in the monitor
  target/arm: Move "midr" to class property
  target/arm: Move "cntfrq" to class property
  target/arm: Move "reset-hivecs" to class property
  target/arm: Move "has_el2" to class property
  target/arm: Move "has_el3" to class property
  target/arm: Move "cfgend" to class property
  target/arm: Move "vfp" and "neon" to class properties
  target/arm: Move "has-mpu" and "pmsav7-dregion" to class properties
  target/arm: Move "pmu" to class property

 hw/core/qdev-prop-internal.h |    2 +
 include/hw/arm/armsse.h      |    3 +-
 include/hw/arm/armv7m.h      |    2 -
 include/qom/object.h         |   67 ++
 include/qom/qom-qobject.h    |   28 +
 target/arm/cpregs.h          |   33 +-
 target/arm/cpu-qom.h         |  171 ++-
 target/arm/cpu.h             |   89 +-
 target/arm/hvf_arm.h         |    2 +-
 target/arm/internals.h       |    6 +-
 target/arm/kvm_arm.h         |  217 +---
 hw/arm/allwinner-h3.c        |   14 +-
 hw/arm/armsse.c              |   53 +-
 hw/arm/armv7m.c              |   12 -
 hw/arm/aspeed_ast2600.c      |    9 +-
 hw/arm/bcm2836.c             |    7 +-
 hw/arm/digic.c               |   11 +-
 hw/arm/exynos4210.c          |   18 +-
 hw/arm/integratorcp.c        |   12 +-
 hw/arm/musca.c               |   14 +-
 hw/arm/npcm7xx.c             |   16 +-
 hw/arm/realview.c            |   20 +-
 hw/arm/sbsa-ref.c            |    2 +-
 hw/arm/versatilepb.c         |   12 +-
 hw/arm/vexpress.c            |   19 +-
 hw/arm/virt-acpi-build.c     |    2 +-
 hw/arm/virt.c                |   47 +-
 hw/arm/xilinx_zynq.c         |   15 +-
 hw/arm/xlnx-versal-virt.c    |    3 +-
 hw/arm/xlnx-zynqmp.c         |   17 +-
 hw/core/cpu-common.c         |   61 +-
 hw/core/qdev-properties.c    |   79 +-
 hw/core/qdev.c               |    2 +
 hw/cpu/a15mpcore.c           |   14 +-
 hw/cpu/a9mpcore.c            |    6 +-
 hw/intc/armv7m_nvic.c        |    2 +-
 hw/misc/xlnx-versal-crl.c    |    4 +-
 qom/object.c                 |  249 ++++-
 qom/object_interfaces.c      |   13 +
 qom/qom-qmp-cmds.c           |   37 +
 target/arm/arm-powerctl.c    |    2 +-
 target/arm/cpu.c             | 1195 +++++++++++---------
 target/arm/cpu64.c           | 1014 +++++++++--------
 target/arm/cpu_tcg.c         | 1486 +++++++++++++------------
 target/arm/helper.c          |   96 +-
 target/arm/hvf/hvf.c         |   94 +-
 target/arm/kvm.c             | 2006 +++++++++++++++++++++++++++++++---
 target/arm/kvm64.c           | 1632 ---------------------------
 target/arm/monitor.c         |   21 +-
 target/arm/psci.c            |    2 +-
 target/arm/meson.build       |    2 +-
 51 files changed, 4765 insertions(+), 4175 deletions(-)
 delete mode 100644 target/arm/kvm64.c

-- 
2.34.1


