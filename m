Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2954B5A02
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 19:37:16 +0100 (CET)
Received: from localhost ([::1]:53184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJgDr-0002IF-Rr
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 13:37:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJg8y-0007lm-Cs
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 13:32:12 -0500
Received: from [2607:f8b0:4864:20::435] (port=44031
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJg8v-0002Zq-IU
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 13:32:12 -0500
Received: by mail-pf1-x435.google.com with SMTP id d187so30676290pfa.10
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 10:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b2fgRI3IoLww342OIA82wOdyRdznLW7Fl+mebf4aKXY=;
 b=TTaUfI9wu02PKwTLFEP478guQ49UOtNPjLi7AwIKqHlsZlUwTXvDBt6QCNXpGuiMTM
 aYU34wE5y3cVsix38qS4mgwmUNMmtsIcbaShEPjBD8tWq/81K/qdxNAuhdetSAqvp0OO
 hiYwkZnx7BEiX5tBXGl8G3tHbq/M2aH/0esCKGbnjneKItcVlaymE3rLY+/0ZVBC7ylu
 9OnQ+2BrvoJCXHS558ogHnhU6XudcwlD73j7Jz+b8H6rQNvJF4xvTecy1Fbp3wv7xB25
 GbFNmCbp5+zBIQWo32KrfOAGw/K9qu9i1CuwJ+i+cHXZY928hmFS+rTJoqrGICZx4N5s
 +GKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=b2fgRI3IoLww342OIA82wOdyRdznLW7Fl+mebf4aKXY=;
 b=s8R1NWIIb/nJl+BS/OcfQSQUBlN9cY2UINGhV77PZ+meNJ6r4wn85xpK99daZSxSaW
 tz4S1XJixHgbR9WuTZCVcbg3zzzjPX5zFPDojYupB0RazPoaQpl0KyutQLnVlSSAJOsW
 i0GxsO3jb2Yq8ZOCIQ6PK8Es1q8eHVbLoIFcQq8TeFRQsT4vZJZjsPDJbFOWn5YF5oWA
 yk8pxtsDHjR2QIYNmc9M69j6sqjcpjcd//+brnQms8KIaAkCtAYPDTHCjnEgdGdQFEnL
 e/MpGyumBU8udckHnkcWl/JkpxL5WMTNCrq0mwgPmxyd3h0H07YrtuP1Qp+sDgVt1ulP
 sSUQ==
X-Gm-Message-State: AOAM531ggK9jkaDaPM0LiMuUHyugjdIb9vdS25nt0k24FBGKcrBGQi9r
 lC0mbGbvad9OzGNjwhcB1kkXAkACrJA=
X-Google-Smtp-Source: ABdhPJywVTR29SWH/IB4rfBJhMTAFl6PXUKLhzxk9np7hhPBgKRmhkJ3PxtKqhGBn7dC0IT6hqha5g==
X-Received: by 2002:a63:6ece:: with SMTP id j197mr285286pgc.420.1644863527957; 
 Mon, 14 Feb 2022 10:32:07 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id l12sm14591295pjq.57.2022.02.14.10.32.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 10:32:07 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 02/14] hw/m68k/mcf: Add missing 'exec/hwaddr.h' header
Date: Mon, 14 Feb 2022 19:31:32 +0100
Message-Id: <20220214183144.27402-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214183144.27402-1-f4bug@amsat.org>
References: <20220214183144.27402-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

hwaddr type is defined in "exec/hwaddr.h".

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/m68k/mcf.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/m68k/mcf.h b/include/hw/m68k/mcf.h
index decf17ce42..8cbd587bbf 100644
--- a/include/hw/m68k/mcf.h
+++ b/include/hw/m68k/mcf.h
@@ -2,6 +2,7 @@
 #define HW_MCF_H
 /* Motorola ColdFire device prototypes.  */
 
+#include "exec/hwaddr.h"
 #include "target/m68k/cpu-qom.h"
 
 /* mcf_uart.c */
-- 
2.34.1


