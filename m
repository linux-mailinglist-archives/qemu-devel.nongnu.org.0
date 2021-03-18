Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5387D340CD1
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 19:22:11 +0100 (CET)
Received: from localhost ([::1]:40350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMxHe-0004RJ-3j
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 14:22:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMwlX-0006ft-LI
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:48:59 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMwlA-0008DC-C9
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:48:59 -0400
Received: by mail-wr1-x431.google.com with SMTP id x16so6466630wrn.4
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 10:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ltq0MmJYBR2ITlK/HcsP6Y5oPeWSWBMuW1aZG5jSIoA=;
 b=rnZDFnw/4MhKkXvghdGv5WdIyo5d43780wBmHxFbTR9S+s1tO08nze4nd0LTB91vTA
 8y1JZ1eUDLIlOJ0gaUUUMaOrX6evjA50268+VV6N4u+UIB+hihk3IzUwf2ksDEbWUdqD
 mdf97oR816pNiF8n/9rF//u7bpV2+FiaogOtkl0m4b3cPfla/vUfaCzCoYPbk/T4uv/2
 iU36Njmbymrccf+j6B8ibvI3kbIq28tpnCUweATV0oKN5M0wy2abX/7SsBDUDA/3y+7P
 UH+1+5MF+4FXd6LP/0FDOW6wreF7Qh8s436iIRiOY6iNkE40xwkuvtf3q+7aftY3Kov3
 4Czg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ltq0MmJYBR2ITlK/HcsP6Y5oPeWSWBMuW1aZG5jSIoA=;
 b=aH6PIeFynsmtR546hxGJDCjH8XzmB9DVDYiekXAlZ99lmiXY0vaPtZy08goKOe8yoi
 2PH+O/6n5i9eyIRAQ8yvXOY0zeqjbSIrdcQaRk2uWfzdZ5iJlMqS2YlLJeGzRS5jCcGN
 peJv5+aWrvQpvJ9JQdwsstFCIYr2zemjquyfJGA08w4ejVwc3+NlL5MhObkyI+iXdxuw
 tsDo9xquRYPAynqT4QvNZSJ0fzQs4/7C0QmbrHqhcs3Yh+VeXA6kjbAj/GXZoAiM/7wx
 UEIpoGJdDJcJ5ycTwQnK9Q5ExZIGxrsyA9wNUQBGObFV10kGEtz9/ClPvv/CpoLjpmjc
 WduA==
X-Gm-Message-State: AOAM533RFKZm2ed/7x9srgapvzTbkT3S/x7JQ1XUhucIXqQY2mdtc679
 riMsaGbFOcEONsLRwPykWbQ0eg==
X-Google-Smtp-Source: ABdhPJx1hzJI/YZnLPq5XKV2XRymXDJ0VFC0HmgNV4jzYgxCIj9DbkuFI0ap6RTERTcuyoRZvpsOiQ==
X-Received: by 2002:a5d:550b:: with SMTP id b11mr413920wrv.313.1616089708259; 
 Thu, 18 Mar 2021 10:48:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c26sm3845915wrb.87.2021.03.18.10.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 10:48:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0 v2 2/5] memory: Document flatview_for_each_range()
Date: Thu, 18 Mar 2021 17:48:20 +0000
Message-Id: <20210318174823.18066-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210318174823.18066-1-peter.maydell@linaro.org>
References: <20210318174823.18066-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a documentation comment describing flatview_for_each_range().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/memory.h | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 22c10b8496a..71a1841943e 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -776,11 +776,33 @@ static inline FlatView *address_space_to_flatview(AddressSpace *as)
     return qatomic_rcu_read(&as->current_map);
 }
 
+/**
+ * typedef flatview_cb: callback for flatview_for_each_range()
+ *
+ * @start: start address of the range within the FlatView
+ * @len: length of the range in bytes
+ * @mr: MemoryRegion covering this range
+ * @opaque: data pointer passed to flatview_for_each_range()
+ *
+ * Returns: true to stop the iteration, false to keep going.
+ */
 typedef bool (*flatview_cb)(Int128 start,
                             Int128 len,
-                            const MemoryRegion*, void*);
+                            const MemoryRegion *mr,
+                            void *opaque);
 
-void flatview_for_each_range(FlatView *fv, flatview_cb cb , void *opaque);
+/**
+ * flatview_for_each_range: Iterate through a FlatView
+ * @fv: the FlatView to iterate through
+ * @cb: function to call for each range
+ * @opaque: opaque data pointer to pass to @cb
+ *
+ * A FlatView is made up of a list of non-overlapping ranges, each of
+ * which is a slice of a MemoryRegion. This function iterates through
+ * each range in @fv, calling @cb. The callback function can terminate
+ * iteration early by returning 'true'.
+ */
+void flatview_for_each_range(FlatView *fv, flatview_cb cb, void *opaque);
 
 /**
  * struct MemoryRegionSection: describes a fragment of a #MemoryRegion
-- 
2.20.1


