Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4CA4715BF
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 20:35:18 +0100 (CET)
Received: from localhost ([::1]:39388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw89N-0000oJ-Bt
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 14:35:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mr-00052J-7L
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:12:02 -0500
Received: from [2a00:1450:4864:20::42f] (port=43557
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mo-0006IH-HZ
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:12:00 -0500
Received: by mail-wr1-x42f.google.com with SMTP id v11so20314700wrw.10
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 11:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rqSYDsT24wAOvcWNZvFNMbKq/OKjOlcWYuyMyuVIt6I=;
 b=ixwKe8kbXxlNnHCxYXC/0ra7c71Tr0zEhLjZrIqGsZ3S8B/7sjtQ+jV9QfZGkGFA3D
 4AAQU5ZZLE21Hr8NHhHT7e52vfkEYdVs5u+jmqi4Gq7o3Quh6Z8E3rGBBw6ppWbaKDL5
 lww7ZvAIr+EvMUnbG96yt0G2HQREbT9jAqYdm9jMiJXSFCSRDlCog28GTr4WSv2g0Ot8
 YLUItzd19lbmJGO1stHvKqILv9/wThzgbEEQt2wknnM5jfX+in0GUUGVb6k2WHlv1Bu1
 89F8Ql30fIJuQrrdDGEpavH05Dg7OX2KwCetFynBhjTvc4+YlVUPNsLb0nYcuGXYC5nv
 +EaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rqSYDsT24wAOvcWNZvFNMbKq/OKjOlcWYuyMyuVIt6I=;
 b=oYS0bz9CzEtPwIKS5z3s2wxhR6SDW90s5Rs4yfl8fzvMZsQTsWpwC8AxG0FTVUzY4y
 nBhMp3RZv2HayeD2Lr+PMHbeniq8YwN4O+NcgZeT49qBbcd+tnXwNboQpGgVAwsSAivX
 WZpOsLM5Chkec4AYAskvhXH7oE6PKT6Chmz2e7DAfm4a2oVSIeAmLyUJYZ11VvhuEQvL
 R0z4NAZKbVAFg6AvqaGxkNSR4dqxx3qxhSvs/MyAGh/GAGMbszH9dgQkyS8W6Z3dKNlA
 QpCuLMKGN1wQsycG2RQHAZhOUcMwqsnh6nXguPntbUb5DqOwEQeZ+dpB1lB9TQ7fi5b0
 de/Q==
X-Gm-Message-State: AOAM531J27QSuxsXL7yxKr0yoQ1TXE5pnqnPg41MLAsNGG0FCWFdF04Y
 ufmxLmH8hiIG2lEv//rTCzSdeg==
X-Google-Smtp-Source: ABdhPJzNTUUdQwPAcnW2X3hyW8WnJFypcILF2K5gMie28TQ2wkYfW27gn5uuNYB/mrfaL5+UvId1Sw==
X-Received: by 2002:adf:facd:: with SMTP id a13mr1953911wrs.513.1639249916511; 
 Sat, 11 Dec 2021 11:11:56 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 11:11:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 25/26] hw/intc/arm_gicv3_its: Fix return codes in
 process_mapd()
Date: Sat, 11 Dec 2021 19:11:34 +0000
Message-Id: <20211211191135.1764649-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix process_mapd() to consistently return CMD_STALL for memory
errors and CMD_CONTINUE for parameter errors, as we claim in the
comments that we do.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 7615e9aa279..3bcc4c3db85 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -595,7 +595,6 @@ static ItsCmdResult process_mapd(GICv3ITSState *s, uint64_t value,
     uint64_t itt_addr;
     bool valid;
     MemTxResult res = MEMTX_OK;
-    ItsCmdResult result = CMD_STALL;
 
     devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
 
@@ -604,7 +603,7 @@ static ItsCmdResult process_mapd(GICv3ITSState *s, uint64_t value,
                                  MEMTXATTRS_UNSPECIFIED, &res);
 
     if (res != MEMTX_OK) {
-        return result;
+        return CMD_STALL;
     }
 
     size = (value & SIZE_MASK);
@@ -614,7 +613,7 @@ static ItsCmdResult process_mapd(GICv3ITSState *s, uint64_t value,
                                  MEMTXATTRS_UNSPECIFIED, &res);
 
     if (res != MEMTX_OK) {
-        return result;
+        return CMD_STALL;
     }
 
     itt_addr = (value & ITTADDR_MASK) >> ITTADDR_SHIFT;
@@ -631,11 +630,10 @@ static ItsCmdResult process_mapd(GICv3ITSState *s, uint64_t value,
          * we ignore this command and move onto the next
          * command in the queue
          */
-    } else {
-        result = update_dte(s, devid, valid, size, itt_addr) ? CMD_CONTINUE : CMD_STALL;
+        return CMD_CONTINUE;
     }
 
-    return result;
+    return update_dte(s, devid, valid, size, itt_addr) ? CMD_CONTINUE : CMD_STALL;
 }
 
 /*
-- 
2.25.1


