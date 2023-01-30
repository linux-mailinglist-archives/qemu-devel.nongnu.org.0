Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 163D7680F7D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:54:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUZq-0004JX-7t; Mon, 30 Jan 2023 08:52:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUZn-00041k-Cj
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:52:03 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUZl-0004gz-CR
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:52:02 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 e10-20020a17090a630a00b0022bedd66e6dso15496980pjj.1
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 05:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Er/zdeuCCTL+uidOeNSpw0biaqVrGoWBY8952jT8ZB0=;
 b=mVpSkkq3iaGe+iU3g2+0BAtX7/F1GhsSBp7jr+FsCsNBHtWTOidQX5xW8q5otyDvXX
 4xYY4xTEIUa/sjgG3SC0fLrCR6Z7kZbgqdHu56YqJuk8wZxzbLmilYr/NEn+ttoSPD3i
 obUaJqK9NYFER2QkeeasMxelQ2/g0WjIMIiPt3yb3aae4D1GaNaw6o326fED6TXvKBJh
 6njYqgN6li/6T9iV06toYft2KF2zvVpQiWUqfdEahQ5RRvC2JezVua4RyJgevkVzDLfc
 TKSo2OSztyqY8aaVVvO3bBro6/HVL7Z/mGrLD1fxPa26CvYPolAP1Oa1r0f3pOWrZI+v
 hkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Er/zdeuCCTL+uidOeNSpw0biaqVrGoWBY8952jT8ZB0=;
 b=b5mUj6zwmRPgKqp4FddP458IIlC3Sonq4mlNw+eh95Hv+NXvSs6iAuzhWLdGXQfDM7
 HrvlJmVo0EBvcIrQRa975diJ32qP5UvVoyQqD2a3eDj9nfD5FRtec4yVEIH6oH3cf7DQ
 PoYh1ab6SvqSt+bRmof52BD1Uzb1mRyW+ZcLjoxvV23AK8WwbJQ6HKboQrLdEqFWAAYN
 Zg/jjb+sWpgtsjPA8HiFUOONT4sF8zjPDG3fWOplDHBtw5qXKkWck92IMrQZhtChHWYV
 h9QHZ5It1l5H2F1uSQFNyPEPu6ClzA81Wh9ZDKYSqmhrdl9hDabstJEo68YJ2PAMc9SW
 LVnw==
X-Gm-Message-State: AO0yUKVQU0Kib1XvRnll0flDGUYf2IaB1GZDvgacDSjrG2XYjSYKmfnQ
 oETiOZMSeVRDygj8Lf9iBgSR2oic3RB1X8sP
X-Google-Smtp-Source: AK7set+ueILlGPsOD6onBLqZjw0An+l/t6dgErkaf5IeGeMPyE3GSoQ80UtEYezyN7QWFvIM+svK0A==
X-Received: by 2002:a05:6a20:8427:b0:bd:c0c:1e74 with SMTP id
 c39-20020a056a20842700b000bd0c0c1e74mr5247279pzd.5.1675086719726; 
 Mon, 30 Jan 2023 05:51:59 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 h26-20020aa796da000000b0058e1e6a81e8sm7448099pfq.38.2023.01.30.05.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 05:51:59 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] softmmu: Use memmove in flatview_write_continue
Date: Mon, 30 Jan 2023 22:51:52 +0900
Message-Id: <20230130135152.76882-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1032;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
memmove() to torelate overlaps. Using memmove() will slightly damage the
performance as it will need to check overlaps before using SIMD
instructions for copying, but the cost should be negiligble, considering
the inherent complexity of flatview_write_continue().

The test cases generated by the fuzzer is available at:
https://patchew.org/QEMU/20230129053316.1071513-1-alxndr@bu.edu/

The fixed test case is:
fuzz/crash_47dfe62d9f911bf523ff48cd441b61c0013ed805

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 softmmu/physmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index cb998cdf23..3cd27b1c9d 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2828,7 +2828,7 @@ static MemTxResult flatview_write_continue(FlatView *fv, hwaddr addr,
         } else {
             /* RAM case */
             ram_ptr = qemu_ram_ptr_length(mr->ram_block, addr1, &l, false);
-            memcpy(ram_ptr, buf, l);
+            memmove(ram_ptr, buf, l);
             invalidate_and_set_dirty(mr, addr1, l);
         }
 
-- 
2.39.1


