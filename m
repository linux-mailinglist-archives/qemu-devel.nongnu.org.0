Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05548339661
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:26:28 +0100 (CET)
Received: from localhost ([::1]:37112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmUU-0008E0-Su
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:26:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlaj-0004DW-1X
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:28:49 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:43863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlaV-0002DI-Vk
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:28:48 -0500
Received: by mail-ed1-x52c.google.com with SMTP id e7so9045817edu.10
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 09:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Boqd6rm1XLHC3hQw2GCvlbMa6t0NNTObqUIRDgqZrqA=;
 b=RSMR/6TkmfpReaT+2BBEz+JVrGhE96if+cscvhYoHYmKONVj/zl4trqMYhrkNaTLs9
 yeMgMB6JG46j2k9ZSBEG9Bhd5FQtQ3XZ1UqkzFA4rEJFgPpwDZhdTH8oS00EkouT1qkd
 hk3cop37Wi87dIlsJaDfdoCqzTGxi2E5MqZPvod8JYEdTNSZRVTSSy3G8wWrfsGAFVvC
 dZAlBGtl/ka7fwiGiFSobpQxCQOqTrNBMjsN5Qx10kSQqZITZKROXNIzN8GDF7/xZeqK
 +U2rfbTPi70cW0WNX2Zgp1Dz+Wk213tP5YxTV/2uUwbUg2UYJlpSki5+LFMo17IcqKbj
 6CeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Boqd6rm1XLHC3hQw2GCvlbMa6t0NNTObqUIRDgqZrqA=;
 b=rQvdPbhC1PxB49beMInlihJyQU2RZTxb8Pj598aYrA5L/gBSH1Hfn8jEANmmwFWu2Q
 7uEIWl8OleDx+a6yqZclkhaejH0Lqvr7Ps6hBK70zE+RNRrIW6kCDDuJHvDUal9e1F34
 MRxyoXqjSy6beYKLYiQNY+geNhRhT3Jk0y5c2OBOjs98wl+97FsO5ghVkk3POq3IC4hn
 Hc1zKjOOoiyhkda/7dNzN+VQutQ/SPOiTcv94MyjUdAR/dP2lITMCt2qcYcr3uAIvPkG
 nezehgjfoYsMM3bLiAmDj5T2Dk+PG/AM1VdO5T56jbDFiLxzpEbHu+UWbmVSXAhQT1MT
 WlPA==
X-Gm-Message-State: AOAM533o5+k2gdWzbGUUY2rji9U7zRcrGHihoUxdeNZdDXCe8TcGb7r8
 aKMbynM3ECc9lNgGabqmtAfv1A==
X-Google-Smtp-Source: ABdhPJzUOJUjtjHyp9pF/cpIlsMDUltABIefD9fWdb6k6xDb7M8tVN8zE/OhZyqDWMEt7MGbW1mAOg==
X-Received: by 2002:aa7:d686:: with SMTP id d6mr15832640edr.146.1615570114705; 
 Fri, 12 Mar 2021 09:28:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h15sm3182719edb.74.2021.03.12.09.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 09:28:28 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CCD0D1FF9B;
 Fri, 12 Mar 2021 17:28:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 12/14] plugins: expand kernel-doc for memory query and
 instrumentation
Date: Fri, 12 Mar 2021 17:28:19 +0000
Message-Id: <20210312172821.31647-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312172821.31647-1-alex.bennee@linaro.org>
References: <20210312172821.31647-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/qemu-plugin.h | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index d4adce730a..aed868d42a 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -392,24 +392,45 @@ uint64_t qemu_plugin_insn_vaddr(const struct qemu_plugin_insn *insn);
  */
 void *qemu_plugin_insn_haddr(const struct qemu_plugin_insn *insn);
 
-/*
- * Memory Instrumentation
- *
- * The anonymous qemu_plugin_meminfo_t and qemu_plugin_hwaddr types
- * can be used in queries to QEMU to get more information about a
- * given memory access.
+/**
+ * typedef qemu_plugin_meminfo_t - opaque memory transaction handle
  */
 typedef uint32_t qemu_plugin_meminfo_t;
+/** struct qemu_plugin_hwaddr - opaque hw address handle */
 struct qemu_plugin_hwaddr;
 
-/* meminfo queries */
+/**
+ * qemu_plugin_mem_size_shift() - get size of access
+ * @info: opaque memory transaction handle
+ *
+ * Returns: size of access in ^2 (0=byte, 1=16bit, 2=32bit etc...)
+ */
 unsigned int qemu_plugin_mem_size_shift(qemu_plugin_meminfo_t info);
+/**
+ * qemu_plugin_mem_is_sign_extended() - was the access sign extended
+ * @info: opaque memory transaction handle
+ *
+ * Returns: true if it was, otherwise false
+ */
 bool qemu_plugin_mem_is_sign_extended(qemu_plugin_meminfo_t info);
+/**
+ * qemu_plugin_mem_is_big_endian() - was the access big endian
+ * @info: opaque memory transaction handle
+ *
+ * Returns: true if it was, otherwise false
+ */
 bool qemu_plugin_mem_is_big_endian(qemu_plugin_meminfo_t info);
+/**
+ * qemu_plugin_mem_is_store() - was the access a store
+ * @info: opaque memory transaction handle
+ *
+ * Returns: true if it was, otherwise false
+ */
 bool qemu_plugin_mem_is_store(qemu_plugin_meminfo_t info);
 
 /**
  * qemu_plugin_get_hwaddr() - return handle for memory operation
+ * @info: opaque memory info structure
  * @vaddr: the virtual address of the memory operation
  *
  * For system emulation returns a qemu_plugin_hwaddr handle to query
-- 
2.20.1


