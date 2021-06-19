Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FBD3ADB24
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 19:36:49 +0200 (CEST)
Received: from localhost ([::1]:34128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luetk-0006Ee-CA
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 13:36:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luejt-0003Um-30
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:37 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:44999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luejr-0003bS-8a
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:36 -0400
Received: by mail-pf1-x42a.google.com with SMTP id u18so4931102pfk.11
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 10:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nul6SfodGAZA6iOTrqG5uPKt97OG3sa3GBVpUMgyEwA=;
 b=QBqKAfWmtq15UTEQsdVlXNWKVu5I3YnyLWFhOSwx7r1lKqcja/2hGoRpcXvBNswWfE
 OVem8XWpkgcUKVg5mvzCwUZ/11YuKvnZXOJeqcAicKUtGefuccyP3E3Ddtf5yt1WlocG
 fAUQvbdmZKEwTpk/SrOE5ciLBeIPZl0dFuTirKYI1lgZ3mdxOi42glCtnOyYrmsAsXBz
 w/PqLATjjKak0Wfsggjlo8if0LuGo2n/v+z1/ePB1Zj0oU+V30eqfdrfEeKzukqPcfRt
 8roQvMW4zCDRQqPUoC/AZGKTXhT/wRoDid+stY1D7s883paRauNZnLqr7gWs81Z6WMPE
 J7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nul6SfodGAZA6iOTrqG5uPKt97OG3sa3GBVpUMgyEwA=;
 b=sdHJm/Et6aYg/zA6Y7DvhUNYZCiQcdjijSLIqh8imPZR4V9VVjWhXk5qBn5xUFrcGq
 gEpVJYKazB+/6yzIqc/JgRx+xkObmZWJidTY3cEMoFuBeU1eNGkH/2faCXkmwTG/9v1f
 jBG4P5fer4R0fzJvg0xpYQSaYcrFkHiglRkv9HsyB8bjhqsQbl77ESivxT+YiLoaGpCB
 F/C5+8wwOuLLbHA3ggwvpGomCcg7f5Vzipywp9Rs8hTUOMzwt49jz3MOXSM041BgBi3M
 6d6mSVtEts1bbv+0qmOD2JKmKaR2DllSQUY3NRwaLbRJ6eS9PYQ7MJMESz4GaWd7sY1W
 62Gg==
X-Gm-Message-State: AOAM531hGMrhWWgDsWcrvJ3eWorHbvCkAZsKxBHjSIe6kqe8BsvVlbq6
 M6gjEKmWV9N1030oEoQZdX5fQz2eTLce6g==
X-Google-Smtp-Source: ABdhPJy7NGiBCOnK7J4k0KGKaQAu4Jyu3nd7i+CttMOMgAbohyN1RHXjrGyUVhPcRYwiaxw6+Otojg==
X-Received: by 2002:a62:5444:0:b029:2e9:c69d:dc64 with SMTP id
 i65-20020a6254440000b02902e9c69ddc64mr11045534pfb.32.1624123594036; 
 Sat, 19 Jun 2021 10:26:34 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id co18sm2084241pjb.37.2021.06.19.10.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 10:26:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/15] hw/pci-host/q35: Improve blackhole_ops
Date: Sat, 19 Jun 2021 10:26:21 -0700
Message-Id: <20210619172626.875885-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619172626.875885-1-richard.henderson@linaro.org>
References: <20210619172626.875885-1-richard.henderson@linaro.org>
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
Cc: alex.bennee@linaro.org, pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is nothing about the blackhole that requires 4 byte
operations.  Decrease the min size to 1, increase the max
size to 8.  Drop duplicate endianness spec.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/pci-host/q35.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 2eb729dff5..133be67e4f 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -268,7 +268,7 @@ static const TypeInfo q35_host_info = {
 
 static uint64_t blackhole_read(void *ptr, hwaddr reg, unsigned size)
 {
-    return 0xffffffff;
+    return UINT64_MAX;
 }
 
 static void blackhole_write(void *opaque, hwaddr addr, uint64_t val,
@@ -282,10 +282,9 @@ static const MemoryRegionOps blackhole_ops = {
     .write = blackhole_write,
     .endianness = DEVICE_NATIVE_ENDIAN,
     .valid.min_access_size = 1,
-    .valid.max_access_size = 4,
-    .impl.min_access_size = 4,
-    .impl.max_access_size = 4,
-    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid.max_access_size = 8,
+    .impl.min_access_size = 1,
+    .impl.max_access_size = 8,
 };
 
 /* PCIe MMCFG */
-- 
2.25.1


