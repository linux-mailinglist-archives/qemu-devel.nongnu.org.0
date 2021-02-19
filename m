Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D0D31FB9C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:04:44 +0100 (CET)
Received: from localhost ([::1]:47166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7Kl-00060A-6I
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:04:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73P-0002Gc-N1
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:46:47 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD739-0003SI-Ki
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:46:47 -0500
Received: by mail-wr1-x433.google.com with SMTP id 7so8917368wrz.0
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=VlIXUUm5ExpVQJSv3wuqQbS06DQIaBTiir8iebjqnw0=;
 b=VcScL0gCuf9fLD21jw6ORKCliUJiHUmUmTIjoJ5/X3BayI9sf7zhETvGiM/BT3cup2
 WdijjovxoGOpypQkrKjO4sL6ANa+LVp68bNDqjfoegDVOWi+AkOXmx3Cc79YSvdJHwiQ
 FbSPX+UG9XJkvPC8hlewJOa3uPkiumE5/38dgr7oDhItPhkcAMu7EH+XrqG76ZbprBqu
 LAu/ylL6iMC2ouiCfsTrI1YLYIA9QNA3Is/l+/QYe7vUJ4kWQ7prWFuwTrM8m2gN8dPz
 Lacx0SU16kR30nEv1gGq2bKlobopkjsHMFN9X0y0Pu4UVGhx0igcn5i6IXt492GQy2OM
 9Mpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VlIXUUm5ExpVQJSv3wuqQbS06DQIaBTiir8iebjqnw0=;
 b=qWbZR9TrMEZjorNQaNPEOciBf0ZU/jhKrYWTluSas7Mymkaxznc5/6ZRZsc2O4NmDE
 7uLcBY7jKzMNe5Neir+WcSCsH/ltTq/i/z6o5LnhNpIIkgPIG2soUwa2xdp5QMY1BYkK
 BCtFlhvdw+Dxj01XwWqbp/8XiIHAhK/CC+6DfViFAycbh8+KRsV7immudl4mACpI9eez
 KsRTwdxBU9M43bImud/FC7LOPsjAtDtJW8ocV4XMfF97oQx5R2sk681DY66pu4ZyBnqb
 sULzE6cOMbg7ig+Ljq8AGnpDEZw7v0qKQbwcrCboFC7RTMJprUKsBKrU4mjdSUfUtL/3
 SN+A==
X-Gm-Message-State: AOAM532kNCeynP66tUUzol0snEXCKxDLR4oYiOlZb8oEYhaYEjY0jDVf
 +Sc6NQpKnvgtCH1D8h3kjO0gMIvidlc8FA==
X-Google-Smtp-Source: ABdhPJzyjiktcFmT3KFpBLBhqZwBLtp31W8vgWRK1lbopSHyXNU/EwNhrJxH45pz6Sru80VBlX+fDA==
X-Received: by 2002:adf:9c8a:: with SMTP id d10mr9729887wre.266.1613745990431; 
 Fri, 19 Feb 2021 06:46:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 13/44] hw/misc/iotkit-sysctl: Add SSE-300 cases which match
 SSE-200 behaviour
Date: Fri, 19 Feb 2021 14:45:46 +0000
Message-Id: <20210219144617.4782-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SSE-300's iokit-sysctl device is similar to the SSE-200, but
some registers have moved address or have different behaviours.
In this commit we add case statements for the registers where
the SSE-300 and SSE-200 have the same behaviour. Some registers
are the same on all SSE versions and so need no code change at all.
Putting both of these categories together covers:

0x0 SECDBGSTAT
0x4 SECDBGSET
0x8 SECDBGCLR
0xc SCSECCTRL
0x10 CLK_CFG0 -- this is like SSE-200 FCLK_DIV but with a
   different set of clocks being controlled; our implementation
   is a dummy reads-as-written anyway
0x14 CLK_CFG1 -- similar to SSE-200 SYSCLK_DIV; our implementation
   is a dummy
0x18 CLK_FORCE -- similar to SSE-200 but different bit allocations;
   we have a dummy implementation
0x100 RESET_SYNDROME -- bit allocation differs from SSE-200 but our
   implementation is a dummy
0x104 RESET_MASK -- bit allocation differs from SSE-200 but our
   implementation is a dummy
0x108 SWRESET
0x10c GRETREG
0x200 PDCM_PD_SYS_SENSE -- some bit allocations differ, but our
   implementation is a dummy

We also need to migrate the state of these registers which are shared
between the SSE-200 and SSE-300, so update the vmstate 'needed'
function to do this.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/iotkit-sysctl.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/misc/iotkit-sysctl.c b/hw/misc/iotkit-sysctl.c
index c67f5b320ab..7f8608c814c 100644
--- a/hw/misc/iotkit-sysctl.c
+++ b/hw/misc/iotkit-sysctl.c
@@ -105,6 +105,7 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
         case ARMSSE_IOTKIT:
             goto bad_offset;
         case ARMSSE_SSE200:
+        case ARMSSE_SSE300:
             r = s->scsecctrl;
             break;
         default:
@@ -116,6 +117,7 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
         case ARMSSE_IOTKIT:
             goto bad_offset;
         case ARMSSE_SSE200:
+        case ARMSSE_SSE300:
             r = s->fclk_div;
             break;
         default:
@@ -127,6 +129,7 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
         case ARMSSE_IOTKIT:
             goto bad_offset;
         case ARMSSE_SSE200:
+        case ARMSSE_SSE300:
             r = s->sysclk_div;
             break;
         default:
@@ -138,6 +141,7 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
         case ARMSSE_IOTKIT:
             goto bad_offset;
         case ARMSSE_SSE200:
+        case ARMSSE_SSE300:
             r = s->clock_force;
             break;
         default:
@@ -202,6 +206,7 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
         case ARMSSE_IOTKIT:
             goto bad_offset;
         case ARMSSE_SSE200:
+        case ARMSSE_SSE300:
             r = s->pdcm_pd_sys_sense;
             break;
         default:
@@ -348,6 +353,7 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
         case ARMSSE_IOTKIT:
             goto bad_offset;
         case ARMSSE_SSE200:
+        case ARMSSE_SSE300:
             qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl SCSECCTRL unimplemented\n");
             s->scsecctrl = value;
             break;
@@ -360,6 +366,7 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
         case ARMSSE_IOTKIT:
             goto bad_offset;
         case ARMSSE_SSE200:
+        case ARMSSE_SSE300:
             qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl FCLK_DIV unimplemented\n");
             s->fclk_div = value;
             break;
@@ -372,6 +379,7 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
         case ARMSSE_IOTKIT:
             goto bad_offset;
         case ARMSSE_SSE200:
+        case ARMSSE_SSE300:
             qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl SYSCLK_DIV unimplemented\n");
             s->sysclk_div = value;
             break;
@@ -384,6 +392,7 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
         case ARMSSE_IOTKIT:
             goto bad_offset;
         case ARMSSE_SSE200:
+        case ARMSSE_SSE300:
             qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl CLOCK_FORCE unimplemented\n");
             s->clock_force = value;
             break;
@@ -420,6 +429,7 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
         case ARMSSE_IOTKIT:
             goto bad_offset;
         case ARMSSE_SSE200:
+        case ARMSSE_SSE300:
             qemu_log_mask(LOG_UNIMP,
                           "IoTKit SysCtl PDCM_PD_SYS_SENSE unimplemented\n");
             s->pdcm_pd_sys_sense = value;
@@ -569,7 +579,7 @@ static bool sse200_needed(void *opaque)
 {
     IoTKitSysCtl *s = IOTKIT_SYSCTL(opaque);
 
-    return s->sse_version == ARMSSE_SSE200;
+    return s->sse_version != ARMSSE_IOTKIT;
 }
 
 static const VMStateDescription iotkit_sysctl_sse200_vmstate = {
-- 
2.20.1


