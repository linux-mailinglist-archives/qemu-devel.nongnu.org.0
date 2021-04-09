Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11181359576
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 08:27:49 +0200 (CEST)
Received: from localhost ([::1]:60026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUkcN-0006OO-Jk
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 02:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUkZ0-0004QI-8n; Fri, 09 Apr 2021 02:24:18 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:41493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUkYs-0001Oq-Rn; Fri, 09 Apr 2021 02:24:16 -0400
Received: by mail-ej1-x633.google.com with SMTP id g17so4075689ejp.8;
 Thu, 08 Apr 2021 23:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+QFZRjfiDBXxrw9xt50MWOZpl0I5gXE/SA7o167QDWg=;
 b=KuSpfrH94JzrHSUNpQx8QtXxszv230tbET93dTvso5XdxyyYyDCLZpwDdOA+fnmTow
 qnEuYIJRi6Llc3zkVn18tdWA44/eXFdHs/gtZIaZ/p4GmV7FUbtSDA0c71iZCpqMDnj8
 vg1SZ3DSmfEwBLHktCW95CMBQldQZ1gK6j2P6XlCG0IRY6dDrLyRNCMQmF6M40hWeApz
 VGfpvy/Vs71w7AdtRLzSbm+BzYUdriVkvVflOdQjiSbJyR6sLb3tFUYGMiHPttcNtmiG
 sNgTVsgj1aMRU0BsEx6rghWf1JoKiAZOF1cG2pOSE3ncFzVVSLkhnCb376AZovGj/DXo
 0vFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+QFZRjfiDBXxrw9xt50MWOZpl0I5gXE/SA7o167QDWg=;
 b=UOHFal/yUztkOdraeuPy1sb062wcuKPDmsvw6lDt4ZqjEbWltxcqyJZwIRLVveCJUc
 ohaCzFXV/Q7oh1sqKfuWFZtzR+lqx16vNaIPw4e1CNn40o2rUie/KJXEe64TWXCow2xG
 5BCdhGwLzt4fILxxAHiVXW5gVgaWRfmII2dbr8JEvXdJJBmnrdR/SxV8V4g+ntVq+E2G
 8w+fr7LaN158EKmN8RbeF3vDhIWojrjf4mAK03VAyhcdBifeXlrehu/GTeNcmrzDfuWm
 tHpYsm2KAprGZ9kx+NuxvWnM+qmAaLg9qq6I0gc61ekDa0bPlwZgGsCgdjWanGI7MfNK
 Y4zQ==
X-Gm-Message-State: AOAM531Jk5tVIdrDxVB4Eke2WCDQ6qQvtriNaoEOKvrGDJEb8wuJ4x0Y
 PAOvnpsf46ygdxKmOGRpvSkrZJB9CbgpgQ==
X-Google-Smtp-Source: ABdhPJzoLV+Oosakh2S6h+GLl7oCSkXiwvb3bJBI7O38WoHm3OyQT1CFj8S7kpuE6HA6ENaSFIQvyg==
X-Received: by 2002:a17:907:984a:: with SMTP id
 jj10mr14474275ejc.180.1617949448673; 
 Thu, 08 Apr 2021 23:24:08 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id y2sm721771ejf.30.2021.04.08.23.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 23:24:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-6.1 1/9] hw/core/clock: Increase clock propagation
 trace events verbosity
Date: Fri,  9 Apr 2021 08:23:53 +0200
Message-Id: <20210409062401.2350436-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210409062401.2350436-1-f4bug@amsat.org>
References: <20210409062401.2350436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the 'clock_propagate' trace event to clock_propagate_period()
to display the recursive propagation, and add 'propagate_children'
event to closely look at the clock propagation for each children
in the clock tree.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/clock.c      | 8 +++++++-
 hw/core/trace-events | 3 ++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/core/clock.c b/hw/core/clock.c
index fc5a99683f8..a42dc3c3d29 100644
--- a/hw/core/clock.c
+++ b/hw/core/clock.c
@@ -79,7 +79,14 @@ static void clock_propagate_period(Clock *clk, bool call_callbacks)
 {
     Clock *child;
 
+    trace_clock_propagate(CLOCK_PATH(clk),
+                          CLOCK_PERIOD_TO_HZ(clk->period),
+                          call_callbacks);
     QLIST_FOREACH(child, &clk->children, sibling) {
+        trace_clock_propagate_children(CLOCK_PATH(clk),
+                                       CLOCK_PERIOD_TO_HZ(clk->period),
+                                       CLOCK_PATH(child),
+                                       CLOCK_PERIOD_TO_HZ(child->period));
         if (child->period != clk->period) {
             if (call_callbacks) {
                 clock_call_callback(child, ClockPreUpdate);
@@ -99,7 +106,6 @@ static void clock_propagate_period(Clock *clk, bool call_callbacks)
 void clock_propagate(Clock *clk)
 {
     assert(clk->source == NULL);
-    trace_clock_propagate(CLOCK_PATH(clk));
     clock_propagate_period(clk, true);
 }
 
diff --git a/hw/core/trace-events b/hw/core/trace-events
index 360ddeb2c87..22df6789918 100644
--- a/hw/core/trace-events
+++ b/hw/core/trace-events
@@ -32,5 +32,6 @@ resettable_transitional_function(void *obj, const char *objtype) "obj=%p(%s)"
 clock_set_source(const char *clk, const char *src) "'%s', src='%s'"
 clock_disconnect(const char *clk) "'%s'"
 clock_set(const char *clk, uint64_t old, uint64_t new) "'%s', %"PRIu64"Hz->%"PRIu64"Hz"
-clock_propagate(const char *clk) "'%s'"
+clock_propagate(const char *src, uint64_t src_hz, int cb) "src='%s' val=%"PRIu64"Hz cb=%d"
+clock_propagate_children(const char *src, uint64_t src_hz, const char *clk, uint64_t clk_hz) "src='%s'@%"PRIu64"Hz -> clk='%s'@%"PRIu64"Hz"
 clock_update(const char *clk, const char *src, uint64_t hz, int cb) "'%s', src='%s', val=%"PRIu64"Hz cb=%d"
-- 
2.26.3


