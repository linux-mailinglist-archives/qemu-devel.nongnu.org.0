Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 735F832754C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:41:48 +0100 (CET)
Received: from localhost ([::1]:43568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVh5-0008Fr-DR
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:41:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPr-0005d1-7k
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:59 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:42515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPg-0007ko-6x
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:58 -0500
Received: by mail-pf1-x42a.google.com with SMTP id w18so10270080pfu.9
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b7j9ch8PyL7hMB8yDFIrEz2hIViL6J2USSPBmhNlSXg=;
 b=XZKBH8AKwbjJOjaFxM4SDPh9/MCElHqUa2/NTqpZEySoAFoDv9PzxjDD1rZuI18viB
 8N4UkAjWGXgR2gJPvYdUG0/ZnKACEvJXfa3aii0FAyMJSD5cmWRBW0UgwODZeR8qvsF+
 KOzGMlPzmrMMUOz2q2gMgiNIXheDkvHyZ11aXVZtxKULtWAfuhIU/PaAeqAUG1DtY+EV
 NitwgPTjhL4KLqveEeiVg9pey9AC9yxQ9FRVYsaA6NFmpYF6eA2XEHjm7CyPZ9XKHjm7
 tQKYBo80dczJ4wqIcyCi/43MiCq6DNlbCY2gchAUpHfSxeJfAOF3UXAG5k7br9xmt3z+
 LEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b7j9ch8PyL7hMB8yDFIrEz2hIViL6J2USSPBmhNlSXg=;
 b=n5hZn0jexNfPZLFtsfB2K+Ii3dNZX/fWHdtSVmdxdGboDOvroOA0ELkJcJZXgIWMmb
 918BmjEiWP/0NxhTgvsJ4vUvCzYHOL4scjN9xcfQ4HzKP7pR4guNJXkKu0O1CXNjCoUN
 /ke4MPVs1QJ2rAtP97J6zepq4rd20LBdYPZUHg+Jb49khehCVp9W4pSDlsJNJJzt76jL
 cDH9xMvHvyYJSGiTUAQ/oDcy+Q3Oi+ZzpPj/GpG30NyjKXDjZpOFHYw+rWxjw34MvEB2
 SIUvKARLDTFnqn7pjx535wLHHFyZyU8kt726aYsNCUdG3JIf1zr3QR1tMVIOSQpOT+1t
 fW6A==
X-Gm-Message-State: AOAM533+YRepJ2uZUip6M+LmwUDGbk9VZzG1Wy5o1H6jEhcjZRr9lzzh
 k0MShNBlJiEuxNBrJrjpbZE2sb7fc/3ODg==
X-Google-Smtp-Source: ABdhPJx6XDlvdS/TU6YGpUy3XGggVhV6cKbYSHRkYkyGPp3sDHbT20QHfLlu9xJDiSfOQBPQuWAuBQ==
X-Received: by 2002:a62:bd05:0:b029:1ab:6d2:5edf with SMTP id
 a5-20020a62bd050000b02901ab06d25edfmr12208904pff.32.1614554626271; 
 Sun, 28 Feb 2021 15:23:46 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/50] target/i386: Reduce DisasContext jmp_opt,
 repz_opt to bool
Date: Sun, 28 Feb 2021 15:22:57 -0800
Message-Id: <20210228232321.322053-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 92669bc142..6877873bee 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -101,8 +101,8 @@ typedef struct DisasContext {
     uint8_t vex_v;  /* vex vvvv register, without 1's complement.  */
     CCOp cc_op;  /* current CC operation */
     bool cc_op_dirty;
-    int jmp_opt; /* use direct block chaining for direct jumps */
-    int repz_opt; /* optimize jumps within repz instructions */
+    bool jmp_opt; /* use direct block chaining for direct jumps */
+    bool repz_opt; /* optimize jumps within repz instructions */
     int mem_index; /* select memory access functions */
     uint32_t flags; /* all execution flags */
     uint8_t popl_esp_hack; /* for correct popl with esp base handling */
-- 
2.25.1


