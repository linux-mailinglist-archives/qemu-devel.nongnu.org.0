Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3A24A8D10
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 21:14:31 +0100 (CET)
Received: from localhost ([::1]:54700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFiUw-00045T-1S
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 15:14:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhee-00033Y-VG
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:20:31 -0500
Received: from [2607:f8b0:4864:20::1036] (port=43622
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFheb-0002am-MY
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:20:28 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 v15-20020a17090a4ecf00b001b82db48754so3964687pjl.2
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AxlvwR4cZ7Av4E1LS2zUiBGxdy4OasZvxMlUKIvuHwA=;
 b=dHqtvO29cGT4zaRKOv+P0rJIcKsGc++t3nkaCyR9f71eAJk9cBtite6fB4eVoBI/1k
 4/uxMzUdz99H50B9LnxzDeDhd+CZKfbJCUh9jY037Ry42uPsttcpRAor5ZLlol1jirfN
 /k0oiL9tNLKwrMbPRUso2l0h5hNzVD/vG+tkfg6p9+XI0JYOzO1rfqj5MFtZmiI2ueVY
 O5sweKavom0yubpIKumsSjs+4b6N9Nwnufl/2GNzvNIg+0CfWp7lKL9OFQl0qbtcmGSa
 8twZuoB0R6Q4BIi5Yx0QIX6eAIKNXH5I2kFOwSVni8JjTO2FPNkvmNUlxnNeH9z52Pqz
 FStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AxlvwR4cZ7Av4E1LS2zUiBGxdy4OasZvxMlUKIvuHwA=;
 b=gbqWjOwXXO3JIAXABpQFWlXo8IO4dYPxq1o+rVw9ziflETtWXh8uKUiPRnXNg5V9bS
 6vW1bNc7GJTtuO+p3wLQNnBuBVOWqMMN6QgKCxFJOvbS4+LdnXh/cYlnJIYo7WaXG1Qo
 ODuaim0hwt+XfxndEZcHIz1iFVTOt1fn7s7p24uzbWXNnaT35uC6Ct4/KieK6YYLDdVt
 Q4rJ0HNLxELyQu0I+irW8vRiNpuWm0Pn/HlppFNcsZgHTANgS8ZcOL9upDek+fxXCfEl
 tcYQFqLF10QSSPu1Rrfs2kH0dgcoJBm7dW9cqHsJvSELLP8cVxMkaX9Olqiq4qEpxxmC
 t5fg==
X-Gm-Message-State: AOAM532eHMt9VD3dy991KovoaZT8xBVXYuB7M5NWAqEv67W6fNPVn4AR
 qI77P54fFZwHqx4TqGHFmZC9L8R/ZVk=
X-Google-Smtp-Source: ABdhPJx0OOdrZb96r1BWHi1AUvNXwEU55iEt/joEyvHwzl6EKZH7lvzANDjj67cSTdK3da03cZ79Lg==
X-Received: by 2002:a17:902:c702:: with SMTP id
 p2mr36519916plp.140.1643916019601; 
 Thu, 03 Feb 2022 11:20:19 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id rj1sm10987257pjb.49.2022.02.03.11.20.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:20:19 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 15/21] softmmu/cpu-timers: Remove unused 'exec/exec-all.h'
 header
Date: Thu,  3 Feb 2022 20:18:08 +0100
Message-Id: <20220203191814.45023-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203191814.45023-1-f4bug@amsat.org>
References: <20220203191814.45023-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/cpu-timers.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/softmmu/cpu-timers.c b/softmmu/cpu-timers.c
index 34ddfa02f1..204d946a17 100644
--- a/softmmu/cpu-timers.c
+++ b/softmmu/cpu-timers.c
@@ -28,7 +28,6 @@
 #include "migration/vmstate.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
-#include "exec/exec-all.h"
 #include "sysemu/cpus.h"
 #include "qemu/main-loop.h"
 #include "qemu/option.h"
-- 
2.34.1


