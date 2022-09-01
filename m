Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 011845AA507
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 03:28:06 +0200 (CEST)
Received: from localhost ([::1]:34686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTvTT-0001hR-MT
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 21:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1oTt0y-0000X8-J9
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 18:50:24 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:44573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1oTt0w-0005CL-SM
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 18:50:24 -0400
Received: by mail-lf1-x134.google.com with SMTP id g7so777610lfe.11
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 15:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=F8wVZOpwAJXo143Rii6ZOZtMb09Fvu3VjBq5m97dwGs=;
 b=XrtB9HDCYMyJqI1glcgQkfSSEzGx1EpzQO5TENF6O7ud3DSkhpWv3czMA1oB+YkD3I
 s/ET5IK2cW+rmA8s4XuKYaV0RkQdz5TkxZD5A+t7SK6eyUksrM8Q4kS2p9yL59YcmNQv
 umsAPAXPlhdkfPtj5I45ehAeJT8HC9hfhRBE0E4O8WckTT3kHzmA2XrYs2qJvgxvZuPg
 3tlC0JOn9njKuWjXRX8NacRJbC5kIEG/zNkmkdSawzjx2C4qeRBOGI65CQCBCn7wW6N6
 57qQZ/y8cnVJU27z9EVSSIgpO3Nwgz1DB8HqSyVbult9WEGwOlE4sKQjrms7NcnOslbR
 B7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=F8wVZOpwAJXo143Rii6ZOZtMb09Fvu3VjBq5m97dwGs=;
 b=POWI8oZw+2kIaCXTyKNkRhDrdxZ1v/HZsNRW+YuC2rFkWhgNW9eXpyiAyt02098AYU
 TEh+JogMRXnKShKwHxAhtjeFi+5WKAGAfR1+cnJYWV1tlvXUvpJWbW2jw/BUpHdiISr1
 ki7/qIds3zroZEVyPxbvXfT9mt489nz5aotZPOzCiq/0/MOhd0BAfXRgAFMDBeT0U33E
 LecS2h6X9xnW+x5ygGGGJTKkR6ndkZrN/BVLYDWEAdSDUvbmXfL8kqdlWBflEPrW+5OE
 O1g5HI91IwTvokvZeZ0i2spns3Yh2tdXwB80Am1gVlRtOtACnTO60UNKGB/Xsj/ug/mU
 TK9w==
X-Gm-Message-State: ACgBeo0Qb9Y1kDSyYk3GJWw62q/InsdTZE8M3EbmsOygZFVD5Za9ncix
 mHgpVb+lCCoPk2DM9T0KDc9pywyN4kP8wwObhi0WuA==
X-Google-Smtp-Source: AA6agR5ANaLlr/UhJHJsLdmmbeIKX+cA/U2pVny/S0zbTF9jnVf1TlVJLKVr4RIw0ovxIxfsNsUVEGW8679CcTrWW/A=
X-Received: by 2002:a19:e342:0:b0:494:7859:ad7a with SMTP id
 c2-20020a19e342000000b004947859ad7amr4450443lfk.347.1662072621419; Thu, 01
 Sep 2022 15:50:21 -0700 (PDT)
MIME-Version: 1.0
From: Tyler Ng <tkng@rivosinc.com>
Date: Thu, 1 Sep 2022 15:50:11 -0700
Message-ID: <CAB88-qPZr7G8Lp0Q=851JSFyb5v7ub5Hi4DaD6mVQKZxFt5UOw@mail.gmail.com>
Subject: [PATCH 3/4] hw/timer: ibex_timer.c: Update register addresses
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com, 
 thuth@redhat.com, pbonzini@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=tkng@rivosinc.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 01 Sep 2022 21:22:28 -0400
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

Updates the register addresses to match the OpenTitan spec.

These changes were made in this commit:
https://github.com/lowRISC/opentitan/commit/a25e162b8f91bd0ca32258c83d1d480f93327204

Signed-off-by: Tyler Ng <tkng@rivosinc.com>
---
 hw/timer/ibex_timer.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
index 8c2ca364da..9ffd4821e8 100644
--- a/hw/timer/ibex_timer.c
+++ b/hw/timer/ibex_timer.c
@@ -38,19 +38,19 @@ REG32(ALERT_TEST, 0x00)
     FIELD(ALERT_TEST, FATAL_FAULT, 0, 1)
 REG32(CTRL, 0x04)
     FIELD(CTRL, ACTIVE, 0, 1)
-REG32(CFG0, 0x100)
-    FIELD(CFG0, PRESCALE, 0, 12)
-    FIELD(CFG0, STEP, 16, 8)
-REG32(LOWER0, 0x104)
-REG32(UPPER0, 0x108)
-REG32(COMPARE_LOWER0, 0x10C)
-REG32(COMPARE_UPPER0, 0x110)
-REG32(INTR_ENABLE, 0x114)
+REG32(INTR_ENABLE, 0x100)
     FIELD(INTR_ENABLE, IE_0, 0, 1)
-REG32(INTR_STATE, 0x118)
+REG32(INTR_STATE, 0x104)
     FIELD(INTR_STATE, IS_0, 0, 1)
-REG32(INTR_TEST, 0x11C)
+REG32(INTR_TEST, 0x108)
     FIELD(INTR_TEST, T_0, 0, 1)
+REG32(CFG0, 0x10C)
+    FIELD(CFG0, PRESCALE, 0, 12)
+    FIELD(CFG0, STEP, 16, 8)
+REG32(LOWER0, 0x110)
+REG32(UPPER0, 0x114)
+REG32(COMPARE_LOWER0, 0x118)
+REG32(COMPARE_UPPER0, 0x11C)

 static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
 {
--
2.30.2

