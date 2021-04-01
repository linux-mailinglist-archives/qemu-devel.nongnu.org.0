Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2540351479
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 13:30:22 +0200 (CEST)
Received: from localhost ([::1]:50676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRvWn-0000Uu-WC
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 07:30:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lRvPG-0000mK-KX
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:22:38 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:40551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lRvPD-0006gz-UG
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:22:34 -0400
Received: by mail-ed1-x536.google.com with SMTP id b16so1526675eds.7
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 04:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d0WSF/QYN6qIBRa1lwbS2t9p1DzdIoxNbWQ0dDd75WM=;
 b=c/G1gf50lE68TRGecWBo8y9FRje0elNwcWyVKc3kQy/JmPtCLNSr2bbVr3ap9B+sAN
 oUQ0o8HOxEG4GaXf8dhT7t82iPI4COz/LoAnDzQ9i29Ab7VRnjqSXyeT0viWkneG92Bp
 jBazZ2+s367seixuEjj1otnMsA3g9SOnt11Dc1YaTQhsh8wjWEXvAGA16k6AGeI+J8Ou
 ++iLM9o1QjOL2tnYiamBNA6e88t298tRzEWGBRXXPUMosorvJG0LvWN7heJ65c++gV2g
 +lJ6ehbSzrzHRtbj6bnQnz/GpyQHLerpk/VwU1QKPEAuK8mreEIzDLzsGg29OZs8VXf6
 aBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=d0WSF/QYN6qIBRa1lwbS2t9p1DzdIoxNbWQ0dDd75WM=;
 b=IYWAplVIQY63fshBGnPFVJ0sgLCOiXAmsSABPIGsQ+CwA4oj7XhrR7xhmxJKcSwQZz
 pFkV6uXapfs0DTBsCoZGmD/EAr+By/ccuSg5ZJtesuf6KVzYws3DpUjxinBRGPse3tjM
 dGGeyHq5yJ9oO/X56pF+t+uoY7tsDqlwm3TOY1MAk8fomNsvFrTWemsANW1wCOzEy0k+
 GI+iIMOtWAuB3HuRG6G+G3LEAEh+vR7Xn9yI8y0XnCRtwj5Vky5uMCdPj7+YDJxBlvgJ
 7ZIIXICQg89yTJ+rQIjA8hXiEnEos6mGqspBMpeknE9mmulti5Pi63PZIzIiy/IN/luG
 sg5w==
X-Gm-Message-State: AOAM530OtYIybob7UpG7ai7Z7FsqTRU3yUjVd1lPLP59qEBUww64nXEv
 VSPd8CUu2JTt/mFag5yHZQ8TS87g1Tk=
X-Google-Smtp-Source: ABdhPJzY9iuO8yr8EE5fIGwlPWRn0wlVCp+/57dP4TKLBSdL86+ngaeqMKPGSWgN8sB+LxKyPps+Fg==
X-Received: by 2002:a05:6402:12cf:: with SMTP id
 k15mr8971863edx.192.1617276148892; 
 Thu, 01 Apr 2021 04:22:28 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d15sm3383516edx.62.2021.04.01.04.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 04:22:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/12] icount: get rid of static variable
Date: Thu,  1 Apr 2021 13:22:17 +0200
Message-Id: <20210401112223.55711-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210401112223.55711-1-pbonzini@redhat.com>
References: <20210401112223.55711-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

This patch moves static last_delta variable into timers_state
structure to allow correct vmstate operations with icount shift=auto enabled.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Message-Id: <161701335066.1180180.7104085247702343395.stgit@pasha-ThinkPad-X280>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/cpu-timers.c   | 5 +++--
 softmmu/icount.c       | 9 +++------
 softmmu/timers-state.h | 2 ++
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/softmmu/cpu-timers.c b/softmmu/cpu-timers.c
index cd38595245..34ddfa02f1 100644
--- a/softmmu/cpu-timers.c
+++ b/softmmu/cpu-timers.c
@@ -188,11 +188,12 @@ static const VMStateDescription icount_vmstate_adjust_timers = {
 
 static const VMStateDescription icount_vmstate_shift = {
     .name = "timer/icount/shift",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .needed = icount_shift_state_needed,
     .fields = (VMStateField[]) {
         VMSTATE_INT16(icount_time_shift, TimersState),
+        VMSTATE_INT64(last_delta, TimersState),
         VMSTATE_END_OF_LIST()
     }
 };
diff --git a/softmmu/icount.c b/softmmu/icount.c
index dbcd8c3594..21341a4ce4 100644
--- a/softmmu/icount.c
+++ b/softmmu/icount.c
@@ -176,9 +176,6 @@ static void icount_adjust(void)
     int64_t cur_icount;
     int64_t delta;
 
-    /* Protected by TimersState mutex.  */
-    static int64_t last_delta;
-
     /* If the VM is not running, then do nothing.  */
     if (!runstate_is_running()) {
         return;
@@ -193,20 +190,20 @@ static void icount_adjust(void)
     delta = cur_icount - cur_time;
     /* FIXME: This is a very crude algorithm, somewhat prone to oscillation.  */
     if (delta > 0
-        && last_delta + ICOUNT_WOBBLE < delta * 2
+        && timers_state.last_delta + ICOUNT_WOBBLE < delta * 2
         && timers_state.icount_time_shift > 0) {
         /* The guest is getting too far ahead.  Slow time down.  */
         qatomic_set(&timers_state.icount_time_shift,
                     timers_state.icount_time_shift - 1);
     }
     if (delta < 0
-        && last_delta - ICOUNT_WOBBLE > delta * 2
+        && timers_state.last_delta - ICOUNT_WOBBLE > delta * 2
         && timers_state.icount_time_shift < MAX_ICOUNT_SHIFT) {
         /* The guest is getting too far behind.  Speed time up.  */
         qatomic_set(&timers_state.icount_time_shift,
                     timers_state.icount_time_shift + 1);
     }
-    last_delta = delta;
+    timers_state.last_delta = delta;
     qatomic_set_i64(&timers_state.qemu_icount_bias,
                     cur_icount - (timers_state.qemu_icount
                                   << timers_state.icount_time_shift));
diff --git a/softmmu/timers-state.h b/softmmu/timers-state.h
index db4e60f18f..8c262ce139 100644
--- a/softmmu/timers-state.h
+++ b/softmmu/timers-state.h
@@ -43,6 +43,8 @@ typedef struct TimersState {
 
     /* Conversion factor from emulated instructions to virtual clock ticks.  */
     int16_t icount_time_shift;
+    /* Icount delta used for shift auto adjust. */
+    int64_t last_delta;
 
     /* Compensate for varying guest execution speed.  */
     int64_t qemu_icount_bias;
-- 
2.30.1



