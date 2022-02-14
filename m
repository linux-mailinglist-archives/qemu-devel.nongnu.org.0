Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CBF4B5A4D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 20:01:28 +0100 (CET)
Received: from localhost ([::1]:56234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJgbH-0007fz-5t
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 14:01:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgA3-0000MZ-9m
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 13:33:19 -0500
Received: from [2607:f8b0:4864:20::42f] (port=33467
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgA0-0002fi-KY
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 13:33:18 -0500
Received: by mail-pf1-x42f.google.com with SMTP id d17so2593556pfl.0
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 10:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YCTydAvkyRrCoOcBwj79cf3QGE1FFr/8PN/joDrL08g=;
 b=bsA9dQMuK6C2LftnXyOlfdayGd5OEGX71dhK1kkLFQjUgsbEQmXNR4Kxt89T2ktkVP
 PdT5KV4AHTJoL1LMsah/QdHb1IS89vVp0i2lKSE2P2aLMbe1ifcOv0vtBu6D0jWlv+kJ
 8Wv+fx9Lv/RuQ/ivY5qJrzk+LXU/90HGupqAvGeDlRxPhu7MADC7L4RW0Rc1BOWE4W2k
 zF0Nh7YoqWQqcgRifVZ0tfgiHiPHjAzWJ7NBZQBSOWQYDdLng9qN+LRRDEOZJgw/XPtY
 S2dZMyA1K9B2q0trPEz4ybEMoBRlA+2fY/+1Du/qwegt+6chTV45Rds9YRWy1SqM+UFD
 5X5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YCTydAvkyRrCoOcBwj79cf3QGE1FFr/8PN/joDrL08g=;
 b=QwnG6aGvYrFAw3+xOhSin+1Xk8Gzw9on6dFfjGIDftFd6oznOrmGo9SskxM5jjZxrw
 D5hZTddUa5kquJOasi8wi3SayE5mWFrlOdQkXQxmuI8SWwva5Yar3coKTxcmGhkGPpH7
 2HT5m/NCJz9msDqm0GXYRE8pvL1mP+6qbV20ULpBnICqdwRyj0TcXFRPHmM5cdjOQOZB
 TrQhPuRKargEefWgdJHEnhyN8++oq2wUm3PjjjKS215jf5oX/B2aXQdZBqI1G9vTx3JR
 JOkDD64SimSoxaGL31WNmtq6ceM0NpgzynI0Qijl74v0ip1bxU2fCClCcgLtEiqXI0dd
 4v4w==
X-Gm-Message-State: AOAM53289pKanLw71U3LUyFxbKWrmIMm0Jv2f0iVGfnx51lXb+F4qrCn
 71ElZVe0hW5/LM19yCkmk5uTt/RvOCc=
X-Google-Smtp-Source: ABdhPJy/NTmPWQnIec1gTWipejXQZTR4lwkNanzJp2C40diFqJp6k9MKB2rKwsQSiDm2i8YNCm703g==
X-Received: by 2002:a63:9307:: with SMTP id b7mr286328pge.616.1644863595208;
 Mon, 14 Feb 2022 10:33:15 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id my4sm3143308pjb.13.2022.02.14.10.33.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 10:33:14 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 10/14] target/hexagon: Add missing 'hw/core/cpu.h' include
Date: Mon, 14 Feb 2022 19:31:40 +0100
Message-Id: <20220214183144.27402-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214183144.27402-1-f4bug@amsat.org>
References: <20220214183144.27402-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42f.google.com
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

HexagonCPU field parent_class is of type CPUClass, which
is declared in "hw/core/cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/hexagon/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index 096aa2deb6..76cd1d5021 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -27,6 +27,7 @@ typedef struct CPUHexagonState CPUHexagonState;
 #include "hex_regs.h"
 #include "mmvec/mmvec.h"
 #include "qom/object.h"
+#include "hw/core/cpu.h"
 
 #define NUM_PREGS 4
 #define TOTAL_PER_THREAD_REGS 64
-- 
2.34.1


