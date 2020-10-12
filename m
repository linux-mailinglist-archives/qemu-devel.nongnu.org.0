Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D2828BCA0
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 17:43:48 +0200 (CEST)
Received: from localhost ([::1]:57210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRzzH-0001YF-V3
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 11:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqJ-0006wZ-2L
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 11:34:31 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:52594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqH-0007J4-69
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 11:34:30 -0400
Received: by mail-wm1-x341.google.com with SMTP id e23so10493969wme.2
 for <qemu-devel@nongnu.org>; Mon, 12 Oct 2020 08:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=diP0Ikbvho+I6Mms1spyyg4KYwxa5PP0ZncvtRg8lU8=;
 b=ahSRz5ju663r7c/IevNx+Vo1+Rj1xz9lxAHCEQqdj6vS+9oUCjO0+VWqOi2gfmLq31
 0vVCMfCPQPFoOs2eZWNibDWbaD8+15HpHZybNnQWfUFxuDW9dC9rj3mEE7lt3L/1dH0p
 3tGXNqmgPt+MtAqD36gCTiT0zP27/Hh4MXC566NEnHd+HQRDbz6/IS8Qdo8+go4K0uiP
 Qz3GE+ZmSOlqDRApcO1CzqH+334ByFqPXcKxpNSmdbPe5aePEZ/bqLCO0C5Cf9l7yH8P
 EAP6TKGnM7xIzOIrwhvqvj42oANVGzWG8KIc3N1Zh+9zCGxgouBbJHsgTNF9iKZARPoz
 5meg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=diP0Ikbvho+I6Mms1spyyg4KYwxa5PP0ZncvtRg8lU8=;
 b=oEU26Vp3mz2OaMc9tMWm9LS0EZVahE9K89tWn/AAamz1zqdz43TkARsiJBla4UUqFr
 UErhybgVleGukuUIzbdf4rXmgxVbB9+a2VsJ2vwba6EBcx2GqycxsxIvmzrJ2AP/+yGO
 QZX+8Xo8lWX6ETRZUtZ55+eg2Q5nHzM254V1UYZ9RJ6PFwx1nrBC2Z6+o0ruYpP1MYSy
 9C3HYkIN2x6AbaKFPsLZ8DQOGDZqu0X90R+DJfhtSw0bz24wml9EndOz4tnwVbBTY3Jr
 /03HUA9tzRUqL5lmLFvvuL2Qx6US9mNMwtqpciBdukBZbtR8Qpx+cnb9nCGWmeT+I0AB
 R9Lg==
X-Gm-Message-State: AOAM532OIYSteE3gE2L+XgpXJZl5zUQiHC5NCh+8+IYBVU5N6tYOgjCD
 tWocGP80dwCjIMVaaFgm5bY+tQ==
X-Google-Smtp-Source: ABdhPJyxJQk7si5/hMsyBrCWqCZreiimy7HDcWPnO2oU33hj9oJv4oYZAOENYG+qpMDLAhgjlDY02A==
X-Received: by 2002:a7b:ce85:: with SMTP id q5mr11224686wmj.35.1602516867847; 
 Mon, 12 Oct 2020 08:34:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y10sm19675284wrq.73.2020.10.12.08.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:34:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/input/virtio-input-hid.c: Don't undef CONFIG_CURSES
Date: Mon, 12 Oct 2020 16:33:38 +0100
Message-Id: <20201012153408.9747-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153408.9747-1-peter.maydell@linaro.org>
References: <20201012153408.9747-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

virtio-input-hid.c undefines CONFIG_CURSES before including
ui/console.h. However since commits e2f82e924d057935 and b0766612d16da18
that header does not have behaviour dependent on CONFIG_CURSES.
Remove the now-unneeded undef.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
NB: tested with 'make check' only.

 hw/input/virtio-input-hid.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/input/virtio-input-hid.c b/hw/input/virtio-input-hid.c
index 09cf2609854..a7a244a95db 100644
--- a/hw/input/virtio-input-hid.c
+++ b/hw/input/virtio-input-hid.c
@@ -12,7 +12,6 @@
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio-input.h"
 
-#undef CONFIG_CURSES
 #include "ui/console.h"
 
 #include "standard-headers/linux/input.h"
-- 
2.20.1


