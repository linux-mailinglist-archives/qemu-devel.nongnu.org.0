Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 615CB346188
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:34:26 +0100 (CET)
Received: from localhost ([::1]:52854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOi6x-0006fC-7Q
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOhzs-0006XU-Tf
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:27:06 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:44791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOhzp-0007Ax-IX
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:27:04 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 j4-20020a05600c4104b029010c62bc1e20so10953610wmi.3
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 07:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=OseTDtXoEYYYH2dfnvEztM2TnARc4pO+j/Uy4TyW2QY=;
 b=x0N2s6Z3vtrDfbDfxO82R3zVtafxfjAV+OfjOpFykQICVJqtU9StDM1loUj3HRsElz
 Lat4xPRTeGvCaasDUu+Hspjb96+wqLRiWRBqjKxy4R0yaVJV7UOYRfKzDYSRWP1ZspJ8
 +pAgY0QQaiVLvhKei1XdrEWwzrlyk2kQ1lhMrbma11JGnsv71MpjRUIQJPPwjQQ5WuW/
 B0QWwJ6uf1cQEwobbKnDL+/N9hw9mZoNHeTPqILMkQ7nak8Tw0FTmHYGlEsmqdWhUp1B
 5KfIbjMPieOULxSJM1L7BXWP0UWHsYMMaHDi8/OkEzRNc7KhQGoryDSb/kaFZSiVrs7W
 GIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OseTDtXoEYYYH2dfnvEztM2TnARc4pO+j/Uy4TyW2QY=;
 b=gc7DTbStkkUPXs5oglpzozsNOuLStAA7oD1a9MfcXEb8ePK3wqySzyEGZ0b8f70B0n
 X+p9NAyfyi/sWPKJe0MnnX68iE0thn5nfhf8iCPsJ2H3eQnPirwdy0q5lIywmlqYzWQ2
 hBC/XfSvSdKsqM6+qoaN9QkOet9oohPd13KbvpQuLdhft2h/YFwVmRstw+Qff+6v6oSj
 6+CCR8DfRx9/6nhRZarmk5tm481yEweCFJ5DhRLkUmkhZ7sl0tIce/FHxzNbPXXKvn5w
 NA3iVm4+jJBvv0W2uL5AaTg+uGR5DK257FZJ6MKe1wZkYlzbtbWNvu7ZTwOLpr/GImo9
 dlcQ==
X-Gm-Message-State: AOAM532X77p4UT4z2X8LCZveLafRqHkH0A/K0cJIucFXGvd7vAW4AiL1
 jaT7Yv+9YBtZdkiSopJy7rSSO8jeGGiXgM/3
X-Google-Smtp-Source: ABdhPJxAfkDCyCec7033ttlroL0YjSE9OcPG8ypLR0WpkMCP1v35wZNHDZk6hj4dGVxE33rE5PmonQ==
X-Received: by 2002:a7b:cc84:: with SMTP id p4mr3703721wma.10.1616509617893;
 Tue, 23 Mar 2021 07:26:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a131sm2861292wmc.48.2021.03.23.07.26.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 07:26:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/7] memory: Document flatview_for_each_range()
Date: Tue, 23 Mar 2021 14:26:49 +0000
Message-Id: <20210323142653.3538-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210323142653.3538-1-peter.maydell@linaro.org>
References: <20210323142653.3538-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a documentation comment describing flatview_for_each_range().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210318174823.18066-3-peter.maydell@linaro.org
---
 include/exec/memory.h | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 500bfc0abd2..88c2451c066 100644
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


