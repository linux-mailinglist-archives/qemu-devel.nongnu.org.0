Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C144925BF
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 13:33:13 +0100 (CET)
Received: from localhost ([::1]:43688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9nfk-0006dL-VG
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 07:33:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nEJ-0006C1-6l; Tue, 18 Jan 2022 07:05:00 -0500
Received: from [2a00:1450:4864:20::32e] (port=40821
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nEB-0005qx-KX; Tue, 18 Jan 2022 07:04:45 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so5172556wmo.5; 
 Tue, 18 Jan 2022 04:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/8g3YUq2P+trQ4peexKIRwmbDVpKrAdGictXnf4Pf5U=;
 b=m2Yjx5uceyZlVbgSqrLCnL9aP6tUNY2FiOGcVKdoEVVTHIoqX3NYHsI6hreYn6WStt
 pKfKFcLXQgVLfeJMBkYGo+UNQSwQfQPJF4MASyJTq4FLR3PBQQusO9u8VyzvTA0kdMAl
 laf9lTN3DJ+npOgh5/S5Qk5pUhAOwxUHpCXNs65axqrdN5++p9NDzoQ1NkKBoYcp7V1S
 8MYPfvHnm4kVmhrokvfaJ8kJfkYR8ddq18NDi0mTBHr9CDcZ8882wVkietVlMpsO2y9x
 8OZu0ndr+XQoiu80x3VGCKXIfFz3l/PTq6EbCEXaM35PxTQ8z+CNxPf1mg7fCeiQcqMY
 Uh4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/8g3YUq2P+trQ4peexKIRwmbDVpKrAdGictXnf4Pf5U=;
 b=3yGDWxOHSfRgy9O8CVy2mGsrczHcr2QDky///ojMc/wr4+ZfOkMkuOjTzRDtdFo2NQ
 63JSrg3HAP9NJbzxhrvizGpvmLqHSBW032dLgTflxyeD1uMtyzD++GWlryB0JHAKF487
 VFPyC3UL4jITvtnE7Xsc58wS1RL88jUMPB3jeXVVoJY0fGpyWIz9hVXwuPUzLT32ExHN
 9Vnl8McYy6CTC4EUSaZ7oEh2cc7EitQ2aPWWv8JOMh8YY2gxRDIaYQOxOgygGF7ARPGb
 TS4hYfcsWVgMp3DJOqaaTjUqNbW+zis1s4v6z6PcvggH9PwyAGOr6tUkBv9oMkktlPHG
 4ncA==
X-Gm-Message-State: AOAM5311bmKcjH9FCnnsD2soY32fbuHWVKGVZlWpgYjWwLIbMetj9KYG
 lv7YsIh1PVJbQnhp0C2ZkqWGg/2ns24=
X-Google-Smtp-Source: ABdhPJxg/LwDRFD8x70gd6rBIXb7xzQ4+iCaEO9weAoZPlFd1K1jPWwuAPUroA3abhzPlv+Wxtz35Q==
X-Received: by 2002:a05:600c:4e90:: with SMTP id
 f16mr21586674wmq.147.1642507379993; 
 Tue, 18 Jan 2022 04:02:59 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 y2sm2196033wmj.13.2022.01.18.04.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 04:02:59 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 06/19] memory: Update description of memory_region_is_mapped()
Date: Tue, 18 Jan 2022 13:02:16 +0100
Message-Id: <20220118120229.196337-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118120229.196337-1-f4bug@amsat.org>
References: <20220118120229.196337-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: David Hildenbrand <david@redhat.com>

Let's update the documentation, making it clearer what the semantics
of memory_region_is_mapped() actually are.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20211102164317.45658-4-david@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/memory.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index fea1a493b9c..63be794a067 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2297,7 +2297,8 @@ bool memory_region_present(MemoryRegion *container, hwaddr addr);
 
 /**
  * memory_region_is_mapped: returns true if #MemoryRegion is mapped
- * into any address space.
+ * into another memory region, which does not necessarily imply that it is
+ * mapped into an address space.
  *
  * @mr: a #MemoryRegion which should be checked if it's mapped
  */
-- 
2.34.1


