Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0899857B753
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 15:22:08 +0200 (CEST)
Received: from localhost ([::1]:50118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE9eR-0002oQ-4I
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 09:22:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ake@igel.co.jp>) id 1oE7eO-0002GG-9b
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 07:13:56 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:37820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ake@igel.co.jp>) id 1oE7eL-0007ji-H7
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 07:13:55 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 s18-20020a17090aa11200b001f1e9e2438cso1729838pjp.2
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 04:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WB7AjBFpxbPyIt68k2WOGFm/ddCuQ7C7mlAeuukxxgE=;
 b=1zEszvBv4N43Apc7fo9vf3ArMnrvEOyHvQqZ/c9/wiRezJFWQl8YcWPCWaqKbjXBCv
 gywiuHui36mY6aNnIx1A7Dh+tqcghsKQQgrqKH+cRyEx+/F7dCDnEPRvjA3eJ7Qwce6M
 3DSglhWQEMByilQvOVaOHo/3N5aeKoxFhwwkYspRzTWhcNv5OYL604E7msdfhPJl7jTE
 KQf8x/Cz0aMADHYcr8sFsv6fa5g/jyp09sGex9jT7iuk8p0hWNVkTgQJbyF/GmREqdVP
 IcRGSNRrzVP6PAMOL9WzORfiKhCm0N+nl04+UnYhsXvki7zlxoKngkPtxMTkdaZiRkwY
 Yx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WB7AjBFpxbPyIt68k2WOGFm/ddCuQ7C7mlAeuukxxgE=;
 b=sWsv0KQUNAFR8np3Z8Z3lqxAwUfVPE+3gfdzc372ZV3mKyU2GGLBjkClimm+qiSzYx
 hxcpQ1t8/mIqCAtwJK8rDrD3eE62zRfysttW/M9Gpf0qXD7wCyLSawg5YQ0/Kb/X2gjv
 QkDFBfiJ0ycqLJHDL3rx69TnFJe+hS7vZhiZpKvpRgvR3YEdMeI8EUR1oV+Ea+JkqOBj
 KSUU+Mi67sovxjCmlTlAch2BnDnvxmXwae506OUGdPwlmsMADA5duRFsH8grxU65vrCt
 3vDLrqwO2r7Z0bTwlk7OzyAkg4P7Hj7sVO9qg9+RzQjJJa6gIr2Nn5NwHus4Rhx2aoT5
 I3tw==
X-Gm-Message-State: AJIora/nolkbpXMXdOopJl++Df/YdN/rKcJqYxbUrwUa73Rk9skvWaa7
 E14bI0sqwzqMfsotFyd+kgYrWBEDoCBgK/T9
X-Google-Smtp-Source: AGRyM1tRAoEk4dyBuqJ42n6gXvqFc2Bgbm9PSQWgrcCXvjyalOs4CzmXAO4MWTi2kNqWz1JaQZm0/w==
X-Received: by 2002:a17:90b:1b48:b0:1ef:a90d:eae1 with SMTP id
 nv8-20020a17090b1b4800b001efa90deae1mr4828436pjb.68.1658315631281; 
 Wed, 20 Jul 2022 04:13:51 -0700 (PDT)
Received: from ake-x260.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 a16-20020a170902ecd000b0016c20d40ee7sm13757800plh.174.2022.07.20.04.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 04:13:50 -0700 (PDT)
From: Ake Koomsin <ake@igel.co.jp>
To: qemu-devel@nongnu.org
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Ake Koomsin <ake@igel.co.jp>
Subject: [PATCH] e1000e: Fix possible interrupt loss when using MSI
Date: Wed, 20 Jul 2022 20:13:03 +0900
Message-Id: <20220720111303.10628-1-ake@igel.co.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=ake@igel.co.jp; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 20 Jul 2022 09:17:32 -0400
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

Commit "e1000e: Prevent MSI/MSI-X storms" introduced msi_causes_pending
to prevent interrupt storms problem. It was tested with MSI-X.

In case of MSI, the guest can rely solely on interrupts to clear ICR.
Upon clearing all pending interrupts, msi_causes_pending gets cleared.
However, when e1000e_itr_should_postpone() in e1000e_send_msi() returns
true, MSI never gets fired by e1000e_intrmgr_on_throttling_timer()
because msi_causes_pending is still set. This results in interrupt loss.

To prevent this, we need to clear msi_causes_pending when MSI is going
to get fired by the throttling timer. The guest can then receive
interrupts eventually.

Signed-off-by: Ake Koomsin <ake@igel.co.jp>
---
 hw/net/e1000e_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 2c51089a82..208e3e0d79 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -159,6 +159,8 @@ e1000e_intrmgr_on_throttling_timer(void *opaque)
 
     if (msi_enabled(timer->core->owner)) {
         trace_e1000e_irq_msi_notify_postponed();
+        /* Clear msi_causes_pending to fire MSI eventually */
+        timer->core->msi_causes_pending = 0;
         e1000e_set_interrupt_cause(timer->core, 0);
     } else {
         trace_e1000e_irq_legacy_notify_postponed();
-- 
2.25.1


