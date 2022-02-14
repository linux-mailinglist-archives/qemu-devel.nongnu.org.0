Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A50984B5A14
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 19:42:05 +0100 (CET)
Received: from localhost ([::1]:56110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJgIW-0004Oo-En
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 13:42:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJg96-0007t6-FY
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 13:32:20 -0500
Received: from [2607:f8b0:4864:20::102f] (port=45863
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJg93-0002ah-L5
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 13:32:19 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 q11-20020a17090a304b00b001b94d25eaecso12159747pjl.4
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 10:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0ctiKF0Jyyq27/q5gHsjXea8lL0vP843emSfi1B3548=;
 b=TfJI8JOxVZGw+Cjg8GbI36yZhMV2CI4g7UpKplsWJU01a8JKPoDtusGrFCB04zm+21
 Wsaw6v0Fkl8AQNKh2EuCAsNqNheeCNsMdCdWuUBknQ7u2MTe8sTZfxcuwc2riR1oxM+9
 8JYrwvm68Unl2QvrpN0f/zDqpKEsDxiblMZ4aGxyfBa/qhQM07wUzBUdAAzqKl7YniHl
 goNxvyUXM8t5fiOloPCCGmZ3jMHvGkWGFFC6oDD5syKHLAnpob7DNm4e0j1RalnPjF4j
 SysU59ArqMAp4WvkSj+eq2/ygKBRcB2aHcsATIWSPQ/s/v1aO6Ws0ogQLqhNlw7aFu/V
 l8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0ctiKF0Jyyq27/q5gHsjXea8lL0vP843emSfi1B3548=;
 b=TJdNmHIEK0hYZeQVKleQN/Yc1Ih4T4PrI41JJ/Ic16LSjFNBw3N1nTbRl1r8qo5wGl
 uwdLxi7WYJzqnw+OtdCacXcP2U6zoSiQ90SuLIOZfKtBhPehy52Wlu7rG35HVblvtKy0
 wUnkvmn5SOZwamelPpsZ1MTFl9k7/4/9RW0LlUJ+Tncx7li/sHaaKwcAOyXxhOx+vYIn
 yE2KbDWasSR4px5rH4QjkNS6DfzvfBZtXacP/mKqcssIcDdbFVB+8CT1rsWdZW6e0Kr/
 wTqRgI5EEuDD2+gg1heqNcUK9/UilPa3cNxPhRPYeehTveVhzdB4vntfJXQnSQqvSR/H
 n2Ew==
X-Gm-Message-State: AOAM533VAho5ngOxlqHuUU80GSSPf1S/+6bhQl4RPm9djlVyJWIC87e4
 cdq+ZsZl4X024/BWRi8TH6yMxIYX7xw=
X-Google-Smtp-Source: ABdhPJyhza6wbVX19NKutzSHIvVYEgUDe4d4owy/MYVTO6H/fGyUkS91Hrz2vwIORaCgwz2Exno7gQ==
X-Received: by 2002:a17:902:d2d2:: with SMTP id n18mr81343plc.88.1644863536266; 
 Mon, 14 Feb 2022 10:32:16 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id c17sm39512938pfv.68.2022.02.14.10.32.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 10:32:15 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 03/14] hw/tricore: Remove unused and incorrect header
Date: Mon, 14 Feb 2022 19:31:33 +0100
Message-Id: <20220214183144.27402-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214183144.27402-1-f4bug@amsat.org>
References: <20220214183144.27402-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102f.google.com
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

TriCore boards certainly don't need the ARM loader API :)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/tricore/triboard.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/tricore/triboard.h b/include/hw/tricore/triboard.h
index f3844be447..094c8bd563 100644
--- a/include/hw/tricore/triboard.h
+++ b/include/hw/tricore/triboard.h
@@ -21,7 +21,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
-#include "hw/arm/boot.h"
 #include "sysemu/sysemu.h"
 #include "exec/address-spaces.h"
 #include "qom/object.h"
-- 
2.34.1


