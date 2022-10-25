Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0491F60D1CB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:46:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMyS-0005if-Cd; Tue, 25 Oct 2022 12:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyI-0005Oe-AQ
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:13 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyA-0001Od-HD
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:10 -0400
Received: by mail-wm1-x32a.google.com with SMTP id l32so8489501wms.2
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2ZLMGmvdBh5UWAIoQyzMmECFb98GcnB/juq4BvMu3x4=;
 b=OE8gAHnuWmScYcgLtsW5t1HAlN0BuIM+rd1R5fnSZgsivUL8TbgPhzUc+y91JWG0Lz
 NFSn1hvEARGX57Jrawq/VBh4G4qILWL4eKOcquKeLRv2yU0rX7bD5gsqYl2MoVUs9Pli
 +TPa5vJSL+v9PJH4rFvxCf48ECKop0hUh2dpOUSvQPIN+Y4zcr+W7lf0oE4OivBRJ6uo
 GF1hsbN4ffGBV9kKibWzXJChpk0SgbYXDE2T3dInNw+QDL30EvmnMnsMQ0iFAROjg7In
 QCovxmim006iaNtHvY3A0XGh/aQ+fb6+iLUF1uh88u+uiUM5et6LGx3S0oAxqt6zbSfo
 IQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2ZLMGmvdBh5UWAIoQyzMmECFb98GcnB/juq4BvMu3x4=;
 b=7yqMgBcTy3qgGflbwrAGqXYJKvKilEBNQbKRomu/lzLFMKu1hjVdvBuMm5c6H785Fr
 LGzmzdTGm143Du9vSLOt6n0yXZrZB4hAbGWcmorpBfrAnPWRcnOsM6VdBYnsK8mKjmIw
 rpYJ4pZm4ojjcnI+L8Yau/wzMPLUei9wsHbO7NzIUqf+x+pQFvtS7SiwJ7gPxEyfJT3r
 wIMvAYRafJUTjH/DZQcdde7eBFu4cTro0Nwp1QBNksmNnC8L1rGOiKQIB9bJNZIMWx96
 3QObXYRQ2T2VvMyKwP2L1KRPxc7za/iMmKAvlvJplfraH/64V0Dq8hg2ZoAUckRqz+Eh
 PjpQ==
X-Gm-Message-State: ACrzQf02qUxbkccEgn+TcvBvqVY5lbdYKdRFH4j/KtkICrFAovgOUBKY
 SdBazPA+1iUVAQQ7lyp2WzzWtWnF/SNsEQ==
X-Google-Smtp-Source: AMsMyM4zgke6ALTnK3bP6TTubD5Aqx6ECEuRxYcjeBlnEjJFWPVsctaKi5w9ZSHiQo0VB0r1GJtw3A==
X-Received: by 2002:a05:600c:230d:b0:3c4:2975:321a with SMTP id
 13-20020a05600c230d00b003c42975321amr47466204wmo.155.1666715999460; 
 Tue, 25 Oct 2022 09:39:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c220c00b003cd9c26a0basm2971084wml.40.2022.10.25.09.39.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:39:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/30] hw/core/resettable: fix reset level counting
Date: Tue, 25 Oct 2022 17:39:26 +0100
Message-Id: <20221025163952.4131046-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025163952.4131046-1-peter.maydell@linaro.org>
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Damien Hedde <damien.hedde@greensocs.com>

The code for handling the reset level count in the Resettable code
has two issues:

The reset count is only decremented for the 1->0 case.  This means
that if there's ever a nested reset that takes the count to 2 then it
will never again be decremented.  Eventually the count will exceed
the '50' limit in resettable_phase_enter() and QEMU will trip over
the assertion failure.  The repro case in issue 1266 is an example of
this that happens now the SCSI subsystem uses three-phase reset.

Secondly, the count is decremented only after the exit phase handler
is called.  Moving the reset count decrement from "just after" to
"just before" calling the exit phase handler allows
resettable_is_in_reset() to return false during the handler
execution.

This simplifies reset handling in resettable devices.  Typically, a
function that updates the device state will just need to read the
current reset state and not anymore treat the "in a reset-exit
transition" as a special case.

Note that the semantics change to the *_is_in_reset() functions
will have no effect on the current codebase, because only two
devices (hw/char/cadence_uart.c and hw/misc/zynq_sclr.c) currently
call those functions, and in neither case do they do it from the
device's exit phase methed.

Fixes: 4a5fc890 ("scsi: Use device_cold_reset() and bus_cold_reset()")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1266
Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reported-by: Michael Peter <michael.peter@hensoldt-cyber.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20221020142749.3357951-1-peter.maydell@linaro.org
Buglink: https://bugs.launchpad.net/qemu/+bug/1905297
Reported-by: Michael Peter <michael.peter@hensoldt-cyber.com>
[PMM: adjust the docs paragraph changed to get the name of the
 'enter' phase right and to clarify exactly when the count is
 adjusted; rewrite the commit message]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/devel/reset.rst | 8 +++++---
 hw/core/resettable.c | 3 +--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/docs/devel/reset.rst b/docs/devel/reset.rst
index abea1102dc4..7cc6a6b3140 100644
--- a/docs/devel/reset.rst
+++ b/docs/devel/reset.rst
@@ -210,9 +210,11 @@ Polling the reset state
 Resettable interface provides the ``resettable_is_in_reset()`` function.
 This function returns true if the object parameter is currently under reset.
 
-An object is under reset from the beginning of the *init* phase to the end of
-the *exit* phase. During all three phases, the function will return that the
-object is in reset.
+An object is under reset from the beginning of the *enter* phase (before
+either its children or its own enter method is called) to the *exit*
+phase. During *enter* and *hold* phase only, the function will return that the
+object is in reset. The state is changed after the *exit* is propagated to
+its children and just before calling the object's own *exit* method.
 
 This function may be used if the object behavior has to be adapted
 while in reset state. For example if a device has an irq input,
diff --git a/hw/core/resettable.c b/hw/core/resettable.c
index 96a99ce39ea..c3df75c6ba8 100644
--- a/hw/core/resettable.c
+++ b/hw/core/resettable.c
@@ -201,12 +201,11 @@ static void resettable_phase_exit(Object *obj, void *opaque, ResetType type)
     resettable_child_foreach(rc, obj, resettable_phase_exit, NULL, type);
 
     assert(s->count > 0);
-    if (s->count == 1) {
+    if (--s->count == 0) {
         trace_resettable_phase_exit_exec(obj, obj_typename, !!rc->phases.exit);
         if (rc->phases.exit && !resettable_get_tr_func(rc, obj)) {
             rc->phases.exit(obj);
         }
-        s->count = 0;
     }
     s->exit_phase_in_progress = false;
     trace_resettable_phase_exit_end(obj, obj_typename, s->count);
-- 
2.25.1


