Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BAC678C76
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 01:02:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK6kM-00007l-2N; Mon, 23 Jan 2023 19:01:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kJ-0008Mn-FE
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:01:03 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kH-0001sw-SQ
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:01:03 -0500
Received: by mail-pg1-x52c.google.com with SMTP id 78so10240357pgb.8
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 16:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hj6fBvSPjNRviyD+eR3MkAKCd+tfeKUJy3fWTvfYgwY=;
 b=BGdh8dm0A9s++gnulw9hROu3U99ekSdAjcUzLmC8vhV3gqwUJkezUB1K8pOe4pEQ+M
 NxzMWv6yx0tMmYiOT+KkzWTlGIzj2XHCcdY91h/19m0LICv0kbI1oDUz5Qmd2WXvHmtw
 g1shKs/klfNr6hRgAio6tSoB+RBojHRj7OIVVq+ZYutXD4MD2wYqnBQ8m0ExfNLPC3UV
 vq7+fR4GEyUDYI7zD9M/SUndgE3W8yRERedkMSvBHteoIVW78ege5efpe4xdxtV11Xeb
 Ef/UNSeEIcXw8mi2QQZ5pX87Dyhxc/rjAG9XIXGlBWesVo8UQctFLmweHmDzUsqsg/Hf
 qvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hj6fBvSPjNRviyD+eR3MkAKCd+tfeKUJy3fWTvfYgwY=;
 b=ROdNU07HwglqbuWx6M8HzlBF7G/XD+b6l1Sr0mw4hthxSSHwFxgTp/NqhKPKrSmRS1
 5R6eMh5inx413rpTLQdqouR9idunVYn8pcdALt3OLuqnJXRNajCa6nKi1r8xm011jaOt
 N/YRNXDr9uqVQJHYevTkPDxUYPRbwz79VugTveQtRbhqY/fhCKja2y8oLIWrbqHkbwRN
 CXTrMkR53LXe7RuFwMReY9bQTIajAaz1arWVeG6fgJC4yH43X3eKZPAeDn5QxnsQKm9a
 //MnZJhVGW+O6yDbLNuG6YD0emKNl5erMrVIjciXWoah2l8EmADoXKm2SdwHpTSdUFJP
 JXhg==
X-Gm-Message-State: AFqh2kpV5WP5Q1vlL9tPvKGwGQpVninVeNGO9Ek2zx6gBebNz06gGoJM
 NLeqUqfdyuH4hvr5eyQ0PGcQBS27OeQjUX+V
X-Google-Smtp-Source: AMrXdXtbfR00rbgO8nEVC8fDvBjRdpdBwgKEPIpIfhj/Fu105eEJasrp7H3bxwfvaZyOhw3D5VC6vg==
X-Received: by 2002:a62:4e07:0:b0:588:89bc:7f75 with SMTP id
 c7-20020a624e07000000b0058889bc7f75mr26183980pfb.1.1674518460536; 
 Mon, 23 Jan 2023 16:01:00 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a056a00189500b0058bc37f3d13sm174104pfh.43.2023.01.23.16.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 16:01:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, yier.jin@huawei.com, jonathan.cameron@huawei.com,
 leonardo.garcia@linaro.org
Subject: [PATCH 08/22] include/exec/memattrs: Add two bits of space to
 MemTxAttrs
Date: Mon, 23 Jan 2023 14:00:13 -1000
Message-Id: <20230124000027.3565716-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124000027.3565716-1-richard.henderson@linaro.org>
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We will need 2 bits to represent ARMSecurityState.

Do not attempt to replace or widen secure, even though it
logically overlaps the new field -- there are uses within
e.g. hw/block/pflash_cfi01.c, which don't know anything
specific about ARM.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memattrs.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 9fb98bc1ef..d04170aa27 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -29,10 +29,17 @@ typedef struct MemTxAttrs {
      * "didn't specify" if necessary.
      */
     unsigned int unspecified:1;
-    /* ARM/AMBA: TrustZone Secure access
+    /*
+     * ARM/AMBA: TrustZone Secure access
      * x86: System Management Mode access
      */
     unsigned int secure:1;
+    /*
+     * ARM: ArmSecuritySpace.  This partially overlaps secure, but it is
+     * easier to have both fields to assist code that does not understand
+     * ARMv9 RME, or no specific knowledge of ARM at all (e.g. pflash).
+     */
+    unsigned int space:2;
     /* Memory access is usermode (unprivileged) */
     unsigned int user:1;
     /*
-- 
2.34.1


