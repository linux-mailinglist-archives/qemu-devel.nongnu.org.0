Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68108315ACF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 01:16:31 +0100 (CET)
Received: from localhost ([::1]:45256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9dBG-0007YU-FO
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 19:16:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cyG-0003oz-Ps
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:03:06 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:42794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cxr-000813-W6
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:03:03 -0500
Received: by mail-pf1-x42c.google.com with SMTP id w18so93233pfu.9
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 16:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yQsfFLSfc25MKTB1YP7F63Xt2EDDu36nhF4pLSCWcTU=;
 b=eb1GZDGGF/w7Izv48VcOEFlvE0MaV9goImCpsbMLVjQb4JiJN0k/RsSorpt511aGaD
 K70smucXeLQvWBe3Wi9YgJLPNW+4NmTgsfkL7ur05LASfx1XtVdPDlHAmFsKvyiBbKaX
 74yrji9Zb321dHEDCfctBTkbF9ZJlFwAFKVxRRnFDwPpuMUgGHvRxvZnRw2euoWV1mjB
 ojIHm/ZzOrW5gurk9QtXsvE+vsTkF4VwfFGLoh42ks5TzZwnXur7kEt6NozEaqPe+jGk
 dCxDTlkLwqo8RSB0mzntoExszrjNHwMFP2yw2d6aWzPwj0ULze0CvM8+uNt7uvOEoRPv
 HcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yQsfFLSfc25MKTB1YP7F63Xt2EDDu36nhF4pLSCWcTU=;
 b=uUIavWyF8t6e+GOA2Lj9rS3QKhC60y0lj+KjDS1TXbOsGvDmqxRq6NLR1my21+/H35
 BXGVuwXWpdPYK/VGYEKBm7Sr+HNIY+WOs5uDkmlA+Rs1ad0q273FKTDOam2GzUw5L8Pm
 tfpLluDnUAZRht/ICrjUJN8ZZ36K3/JrSeRrPMta0lGC2XN33MaduoGIOR/7yunyw0D5
 ATPWvr3PgkbuKYL6fZ0JW1si9l1PsKQcoQfvcEn/fcGVDH4BkTz+QiD7hJm/glRM/bQ7
 daYfSWuQqj+l685KSA0p7g4oYgfClYNZiZm21lG3A2YCvmAPloBwRmVNzFFqJh6NyUDP
 K/CA==
X-Gm-Message-State: AOAM533pzMg11vuuyDopBh+CDtBedWb4jRBIa3cmRci7N1wpWsWLfpqu
 fdeW1FClephaW8ecWWFnSFuwIqTez6ujoQ==
X-Google-Smtp-Source: ABdhPJytWnAMZIa/twMVLAl4GCxa4HdkMvVjB/8w/JqqTJSa40K8vjK3gpdfGC5xqEB9AvwiNRR5BQ==
X-Received: by 2002:a63:5459:: with SMTP id e25mr409483pgm.403.1612915358808; 
 Tue, 09 Feb 2021 16:02:38 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id me3sm164189pjb.32.2021.02.09.16.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 16:02:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 11/31] exec: Introduce cpu_untagged_addr
Date: Tue,  9 Feb 2021 16:02:03 -0800
Message-Id: <20210210000223.884088-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210000223.884088-1-richard.henderson@linaro.org>
References: <20210210000223.884088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide an identity fallback for target that do not
use tagged addresses.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index e62f4fba00..d9dc1de414 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -69,6 +69,13 @@ typedef uint64_t abi_ptr;
 #define TARGET_ABI_FMT_ptr "%"PRIx64
 #endif
 
+#ifndef TARGET_TAGGED_ADDRESSES
+static inline abi_ptr cpu_untagged_addr(CPUState *cs, abi_ptr x)
+{
+    return x;
+}
+#endif
+
 /* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
 #define g2h(x) ((void *)((uintptr_t)(abi_ptr)(x) + guest_base))
 
-- 
2.25.1


