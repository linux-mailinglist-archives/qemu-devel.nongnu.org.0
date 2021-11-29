Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 064E14621B7
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 21:09:00 +0100 (CET)
Received: from localhost ([::1]:42770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrmxP-0006L7-52
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 15:08:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrmtx-0003O9-Re
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 15:05:26 -0500
Received: from [2a00:1450:4864:20::32d] (port=55070
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrmtq-0008CV-BE
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 15:05:25 -0500
Received: by mail-wm1-x32d.google.com with SMTP id i12so15638565wmq.4
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 12:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T9k9KN5zJmRQNsTgBr/a7NChGJkpUEj//jlPxI0w1T4=;
 b=mNjpmR00l08Zl6qD7dwj47CypqFDuNy+c7yF4DFJi1qsvRTJbHBZJNg19AHDIIh7wT
 cZ8e3akLKnVyhiikU/a51/idKtcv0Nuim2vcE0KGUtLYbu+zgOF6bNF1wCPFnNcAeh9k
 vwD7bJtwVnY2SI//XNYcQ8B7F6QW5v0PvRxVqmlwDLbCehvtyUkUuiEhJSa1LDiK48Pn
 Ea2vkkT7CBFDgvk+acz/APUjiYf4cbK9RHkhDfZ7FUa3iuuaDeQZHBuQKSA2VJ94ZsIg
 9MUJxmYNup7HnLLzOLSKxz2uEFQTO+Bj8NYBF/tEG2rGdFTFW+Ki3iB1LupchjoOm/SJ
 ePDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T9k9KN5zJmRQNsTgBr/a7NChGJkpUEj//jlPxI0w1T4=;
 b=YjJnaWY6pkDgyi0muF8x9Wfga5imf0xwdu3iHdMITaVT4zpUXQTMq/VJAzrkb8uTQF
 KGbz0FWuLvYuPPH/1nIBPlCH5QGOKhm1wwzVi8ezw+dTrWcQzsassZq79d6AtN/aGFiI
 mA9f5gvuMduAD1ybWUUUtDweqqSC59xqRYc4D4aogngHwzQbw1mYQxI0jfev0M4KwHbk
 7ihZFggnOnc/p6G/SCp3nNiZM7Ae6MUmWS+fhznVASqzqtCGlqLaLwWSTBI39F0A9KZf
 1j5JeJ8ZjEF4YYKno9pFrf7BNTxOsphhu3oGQ7bnEn+GamGIdCwTFUU/MLuldLIAPw9k
 anew==
X-Gm-Message-State: AOAM530Mxk+VKQa0tw0/JTm5QSOSQCuUPPzKXcw2QLdod025nES9/QCM
 M/kzmBeN7x1pZgAwPQso/4LmGw==
X-Google-Smtp-Source: ABdhPJyldDTXdSXKDhb2GpXmViJI421nQLzXQeGan2YYxLTQXkJC1S4hyagtJaFsgJf+eB+D3Isvlw==
X-Received: by 2002:a05:600c:4108:: with SMTP id
 j8mr162764wmi.139.1638216314008; 
 Mon, 29 Nov 2021 12:05:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id v15sm14678863wro.35.2021.11.29.12.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 12:05:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.0 1/4] include/hw/i386: Don't include qemu-common.h in
 .h files
Date: Mon, 29 Nov 2021 20:05:07 +0000
Message-Id: <20211129200510.1233037-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129200510.1233037-1-peter.maydell@linaro.org>
References: <20211129200510.1233037-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Sergio Lopez <slp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The qemu-common.h header is not supposed to be included from any
other header files, only from .c files (as documented in a comment at
the start of it).

include/hw/i386/x86.h and include/hw/i386/microvm.h break this rule.
In fact, the include is not required at all, so we can just drop it
from both files.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/i386/microvm.h | 1 -
 include/hw/i386/x86.h     | 1 -
 2 files changed, 2 deletions(-)

diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
index 4d9c732d4b2..efcbd926fd4 100644
--- a/include/hw/i386/microvm.h
+++ b/include/hw/i386/microvm.h
@@ -18,7 +18,6 @@
 #ifndef HW_I386_MICROVM_H
 #define HW_I386_MICROVM_H
 
-#include "qemu-common.h"
 #include "exec/hwaddr.h"
 #include "qemu/notify.h"
 
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index bb1cfb88966..a145a303703 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -17,7 +17,6 @@
 #ifndef HW_I386_X86_H
 #define HW_I386_X86_H
 
-#include "qemu-common.h"
 #include "exec/hwaddr.h"
 #include "qemu/notify.h"
 
-- 
2.25.1


