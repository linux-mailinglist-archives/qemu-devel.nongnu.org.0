Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5B668BCAC
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:18:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0S9-0000ul-Jl; Mon, 06 Feb 2023 07:18:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0Rl-0000kP-6G
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:18:09 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0Ri-0005uM-Kg
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:18:08 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso10642350wms.0
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 04:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q9OtXnoXEv7c1NMHlxcIT3UzncY58Hccqx/D2ForunA=;
 b=uOVsfaedb4hOEkSvumSwCn2EN8zCNxNBRQv7BdlyJ5MnGgUjd31BrPJT2U+W5KlAWJ
 9qNbT/gYyI6dUUM/r+j/hBe7T6bAaq37/FSl6sIJaqNTY+5h+TQswJWNEu9f8VEWVdaP
 PjktMwjdNoRaYIikhzNcM+0s3YUm/DRODwkZxs7qkgamQeFOoraS1z4omdqf33xki+E6
 bDuw7DLWk04NMaIpz8AUnOMzYWy8wkJZ3vqCFJ4b2wyqDvVCObL46WhG8XVpHHClCu/w
 a629JvjICU0Q1CtKTLUrVmArq8xsHHV2G+qlhOP1hjzIQjgsQsXWHbqHev3DsGPqhgJG
 IGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q9OtXnoXEv7c1NMHlxcIT3UzncY58Hccqx/D2ForunA=;
 b=Lp9nddEWf3ihBXCjki5Futf4wt+nA8pP0RZauLduVtE2lvAoDLHb2ROBj20QWGsqNv
 TxsCMoRUznBBjCVdh3Xlaq90nnfs+61+eI8D/mxUi5KnmawtJRIQkKKEoOVDo9ETAaFo
 Wfkole+ayZRdWgVHdAlLXnOOKUjgosIxA+yO3rQwfeIaE/yVp9Rr4gQW4+kKqo0nQbLO
 hPTstPGIw/erni4/4Zbrt4vaBLuDMl1LFmTApseBEtP1jB5v1MJJdYuHU9pR/tzTZzzH
 OJ9/TP9tYHvzuv/DjsmreBxR26usIziSVNf1/5g9L12vlfnOaag2rFRxlDFUI0oVt7Mn
 4LHg==
X-Gm-Message-State: AO0yUKWCvYpSPg884nIRY8r7cHH74FABKYeO4tKB4HsGwJMsHN8nROZg
 Tuts5GMt/lro0FduDi/psvQSumKmV5aBxtrn
X-Google-Smtp-Source: AK7set/xigteG9r8F65E78U7VpQUqaNtHRPBg9LBJUs2JIu5q3pI11Fs6o6FreaNCzfvXi2admu6GA==
X-Received: by 2002:a05:600c:a0e:b0:3d3:4f56:62e1 with SMTP id
 z14-20020a05600c0a0e00b003d34f5662e1mr18778135wmp.27.1675685884759; 
 Mon, 06 Feb 2023 04:18:04 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a05600c2ac800b003ddc781b1d4sm10381648wme.33.2023.02.06.04.18.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 04:18:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 8/9] hw/intc/armv7m_nvic: Allow calling neg_prio_requested on
 unrealized NVIC
Date: Mon,  6 Feb 2023 13:17:13 +0100
Message-Id: <20230206121714.85084-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206121714.85084-1-philmd@linaro.org>
References: <20230206121714.85084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

armv7m_nvic_neg_prio_requested() is called via arm_cpu_reset_hold()
during CPU realize() time, when the NVIC isn't yet realized:

(lldb) bt
  * frame #0:  0x10059ed5c armv7m_nvic_neg_prio_requested(opaque=0x1180087b0, secure=true) at armv7m_nvic.c:404:9
    frame #1:  0x100383018 arm_v7m_mmu_idx_for_secstate [inlined] arm_v7m_mmu_idx_for_secstate_and_priv(...) at m_helper.c:2882:19
    frame #2:  0x10038300c arm_v7m_mmu_idx_for_secstate(..., secstate=true) at m_helper.c:2893:12
    frame #3:  0x10036e9bc arm_mmu_idx_el(...) at helper.c:11799:16 [artificial]
    frame #4:  0x100366cd4 arm_rebuild_hflags [inlined] rebuild_hflags_internal(env=0x118411f30) at helper.c:12129:25
    frame #5:  0x100366c18 arm_rebuild_hflags(env=0x118411f30) at helper.c:12142:19
    frame #6:  0x10035f1c4 arm_cpu_reset_hold(...) at cpu.c:541:5 [artificial]
    frame #7:  0x10066b354 resettable_phase_hold(obj=0x118410000, opaque=0x000000000, ...) at resettable.c:0
    frame #8:  0x10066ac40 resettable_assert_reset(obj=0x118410000, ...) at resettable.c:60:5
    frame #9:  0x10066ab1c resettable_reset(obj=0x118410000, type=RESET_TYPE_COLD) at resettable.c:45:5
    frame #10: 0x100669568 device_cold_reset(...) at qdev.c:255:5 [artificial]
    frame #11: 0x10000ca28 cpu_reset(cpu=0x118410000) at cpu-common.c:114:5
    frame #12: 0x10035ec74 arm_cpu_realizefn(dev=0x118410000, errp=0x16fdfb910) at cpu.c:2145:5
    frame #13: 0x10066a3e0 device_set_realized(...) at qdev.c:519:13
    frame #14: 0x100671b98 property_set_bool(obj=0x118410000, ...) at object.c:2285:5
    frame #15: 0x10066fdf4 object_property_set(obj=0x118410000, name="realized", ...) at object.c:1420:5
    frame #16: 0x100673da8 object_property_set_qobject(...) at qom-qobject.c:28:10
    frame #17: 0x10067026c object_property_set_bool(...) at object.c:1489:15
    frame #18: 0x100669600 qdev_realize(...) at qdev.c:292:12 [artificial]
    frame #19: 0x1003101bc armv7m_realize(dev=0x118008480, ...) at armv7m.c:344:10
    frame #20: 0x10066a3e0 device_set_realized(...) at qdev.c:519:13
    frame #21: 0x100671b98 property_set_bool(obj=0x118008480, ...) at object.c:2285:5
    frame #22: 0x10066fdf4 object_property_set(obj=0x118008480, name="realized", ...) at object.c:1420:5
    frame #23: 0x100673da8 object_property_set_qobject(...) at qom-qobject.c:28:10
    frame #24: 0x10067026c object_property_set_bool(...) at object.c:1489:15
    frame #25: 0x100669600 qdev_realize(...) at qdev.c:292:12 [artificial]
    frame #26: 0x100092da8 sysbus_realize(...) at sysbus.c:256:12 [artificial]
    frame #27: 0x100350e1c armsse_realize(dev=0x118008150, ...) at armsse.c:1043:14
    frame #28: 0x10066a3e0 device_set_realized(...) at qdev.c:519:13
    frame #29: 0x100671b98 property_set_bool(obj=0x118008150, ...) at object.c:2285:5
    frame #30: 0x10066fdf4 object_property_set(obj=0x118008150, name="realized", ...) at object.c:1420:5
    frame #31: 0x100673da8 object_property_set_qobject(...) at qom-qobject.c:28:10
    frame #32: 0x10067026c object_property_set_bool(...) at object.c:1489:15
    frame #33: 0x100669600 qdev_realize(...) at qdev.c:292:12 [artificial]
    frame #34: 0x100092da8 sysbus_realize(...) at sysbus.c:256:12 [artificial]
    frame #35: 0x100349354 mps2tz_common_init(machine=0x118008000) at mps2-tz.c:834:5
    frame #36: 0x10008e6b8 machine_run_board_init(machine=0x118008000, ...) at machine.c:1405:5
(lldb) frame select 12
frame #12: 0x10035ec74 arm_cpu_realizefn(dev=0x118410000, errp=0x16fdfb910) at cpu.c:2145:5
   2142	    }
   2143
   2144	    qemu_init_vcpu(cs);
-> 2145	    cpu_reset(cs);
   2146
   2147	    acc->parent_realize(dev, errp);
   2148	}

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/armv7m_nvic.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index e54553283f..d9c7e414bc 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -399,6 +399,11 @@ bool armv7m_nvic_neg_prio_requested(NVICState *s, bool secure)
      * mean we don't allow FAULTMASK_NS to actually make the execution
      * priority negative). Compare pseudocode IsReqExcPriNeg().
      */
+
+    if (!DEVICE(s)->realized) { /* XXX Why are we called while not realized? */
+        return false;
+    }
+
     if (s->cpu->env.v7m.faultmask[secure]) {
         return true;
     }
-- 
2.38.1


