Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA9D6A65DB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:57:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCeF-0007sr-CC; Tue, 28 Feb 2023 21:56:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeD-0007sL-4Z
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:56:53 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeB-00030Y-9M
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:56:52 -0500
Received: by mail-pl1-x643.google.com with SMTP id a2so2119973plm.4
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2ZNjwQ74oZuAbv9mFdRQPggp4IPRP6oOFAai9whBHNU=;
 b=UmuKkrv7aVDcEto2ZPIE/HmNd2E2ieXKTlvDMwifJ0IViFwg5KsK4qqg98ZviYN898
 hwRgFkDws1NfHYC7fP+gUrQS5F16euGJh1L5U3ybv4ZTH57kdy1FxNX6esQacdoV0jpA
 karTt+uysOd4luo+WeSjB6S7n5XNxVyrQ2NOHFaY97P+wya698N8pyjhyMudrjwlSfb1
 uG1dX5eFgi6hq59SOkqdvpxoCFyCYVfbIDGmBBcUmYUvoLFm7F8IIpNJ04RmIbXUInbG
 foMT9wgornJHT+DqkMZ18NlK3YhQJyi4JUcQBS9CQYO/fvGXHe+EJAMRGAI7lT2m0Tgf
 MXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2ZNjwQ74oZuAbv9mFdRQPggp4IPRP6oOFAai9whBHNU=;
 b=EkplTN4Sg8MXe56os7upgqRzjt7VCT62X8Y7FVc5q0tKzJwYwDEogkgJBXrNebG95R
 hfghYIuhUzcSQPG7Bd0PVbo5e9t47pyjM4EISUrI2d5J2//SsL/SfVbxw95yjMml0Giy
 v6rVhsVm7yAiKQOFYXIzIsR0HJZGoJyB1AJNejx/xKXkoYOwgk4t7F2QeU9sezzsq2RU
 PGSbEjFy0MEFZvLJz09znTa1UklIsGHWX+zg/Ki4zWYr++aU4kueVJDIItdXjhj+7KJ6
 Lqb0PyoZVLUDMd5LDIwjVPSeX+HCBMRNBTLzbXZUV+Wo9NHbGCskS2MDmtvy9c8gt1e5
 nYUw==
X-Gm-Message-State: AO0yUKWHDwoCEgNgzEXbMIeh+TfgauKFWaeD6Z6KLQGzuhnfTw7WPFzr
 ahDnzOJjsx0EwiEjW6ZvXXbbJ2Rt2vN2nN5E2f05vA==
X-Google-Smtp-Source: AK7set+qRUx7Ur5m+DCPTWT+p8sDiGH33KT+orLgzbyf9wbMrhuebBK9cJTEps//eFH81sKZLstN8g==
X-Received: by 2002:a17:902:be08:b0:19d:47b:67c8 with SMTP id
 r8-20020a170902be0800b0019d047b67c8mr4106901pls.48.1677639409831; 
 Tue, 28 Feb 2023 18:56:49 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:56:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Alexander Bulekov <alxndr@bu.edu>, David Hildenbrand <david@redhat.com>
Subject: [PULL 02/62] softmmu: Use memmove in flatview_write_continue
Date: Tue, 28 Feb 2023 16:55:43 -1000
Message-Id: <20230301025643.1227244-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
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

From: Akihiko Odaki <akihiko.odaki@daynix.com>

We found a case where the source passed to flatview_write_continue() may
overlap with the destination when fuzzing igb, a new proposed network
device with sanitizers.

igb uses pci_dma_map() to get Tx packet, and pci_dma_write() to write Rx
buffer. While pci_dma_write() is usually used to write data from
memory not mapped to the guest, if igb is configured to perform
loopback, the data will be sourced from the guest memory. The source and
destination can overlap and the usage of memcpy() will be invalid in
such a case.

While we do not really have to deal with such an invalid request for
igb, detecting the overlap in igb code beforehand requires complex code,
and only covers this specific case. Instead, just replace memcpy() with
memmove() to tolerate overlaps. Using memmove() will slightly damage the
performance as it will need to check overlaps before using SIMD
instructions for copying, but the cost should be negligible, considering
the inherent complexity of flatview_write_continue().

The test cases generated by the fuzzer is available at:
https://patchew.org/QEMU/20230129053316.1071513-1-alxndr@bu.edu/

The fixed test case is:
fuzz/crash_47dfe62d9f911bf523ff48cd441b61c0013ed805

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Acked-by: Alexander Bulekov <alxndr@bu.edu>
Acked-by: David Hildenbrand <david@redhat.com>
Message-Id: <20230131030155.18932-1-akihiko.odaki@daynix.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 softmmu/physmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index df54b917a9..47143edb4f 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2637,7 +2637,7 @@ static MemTxResult flatview_write_continue(FlatView *fv, hwaddr addr,
         } else {
             /* RAM case */
             ram_ptr = qemu_ram_ptr_length(mr->ram_block, addr1, &l, false);
-            memcpy(ram_ptr, buf, l);
+            memmove(ram_ptr, buf, l);
             invalidate_and_set_dirty(mr, addr1, l);
         }
 
-- 
2.34.1


