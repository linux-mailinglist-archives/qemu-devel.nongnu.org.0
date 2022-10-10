Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1065C5FA380
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:41:58 +0200 (CEST)
Received: from localhost ([::1]:58772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxiv-0006s6-4R
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwd8-0003jv-Vm
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:31:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwcn-0007NO-Fr
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:31:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jYG4D+Osh2qvpF6MQt1stca/DHn+PvzorECJ71JvQWM=;
 b=Oy+/1iUdA8+SsxhdsBVflis/gX5Mx9C1zUWZ5dr1f7CWtf7GGanmJmQysrxKiGzMgyh5jS
 +k94HLJX8VtrdmdgJK4Ki2aPGTzWKVbpSIVz46uMUObBHLVbxm2tAOJVdix25RbezAO02W
 PvB3IQckmfKiDTOtw0ATsKnVfyPrN90=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-349-qvfJG8OrOpKhJODw-K60WQ-1; Mon, 10 Oct 2022 13:31:29 -0400
X-MC-Unique: qvfJG8OrOpKhJODw-K60WQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 m20-20020adfa3d4000000b0022e2fa93dd1so2943298wrb.2
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jYG4D+Osh2qvpF6MQt1stca/DHn+PvzorECJ71JvQWM=;
 b=gJTGkPdVnYBLEHXvegJZFk9AI51X2AHENygDbusaC2jr0S+K9HHnPBX/Q9Z84AcF9i
 a1pkkvNn5WKDbaWP9oeu685fa1Pfjw3xFluNShTHu0RMrHlLQmhPsrgiVC4HHg1CUpAZ
 DFKc4FN2CUAWrYwO0pBWDsG89zFEVyLRudG+r3+6qGXMwid2OVozXxbDycwIVAvl3/IU
 zmXZuZEbVMjfY6m4ZK8cN0VGUqmWopuZVxLfMHev0Y8Or4ZQWiUGDblnckmYySiXj6GY
 Roq6Aspq08vLIOFpK402MbY8THqg+4ApCrOeAIxEwxLrT/D2uLZ/5YF89phlgU3s/8Pk
 GCZQ==
X-Gm-Message-State: ACrzQf2/lHDXwpnCeV7Jf6ytz8sSdE5qAUEjXYdaASW0hdl4K1IyEM8p
 5/2LNGdyQ/1wahN5krHkIpx0K039D8NDE/IW/8on1JNzr/UMAH5+57X/e93MWu9l6VoQ4Imb59e
 /9YGUDFXAatvp3VNJ+X0f3AYW2atUoKO9hiL5C9jny0jlVRHdPqFopS/T4LZn
X-Received: by 2002:a05:6000:711:b0:22e:7b01:db9f with SMTP id
 bs17-20020a056000071100b0022e7b01db9fmr12847178wrb.38.1665423087884; 
 Mon, 10 Oct 2022 10:31:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4WXI6ZWkViW1XvrKl2414fvtQI0BYQ8zPv0RVdJX3DcCeoN5+o+c0IVrONCQc/2OSSc6mNJg==
X-Received: by 2002:a05:6000:711:b0:22e:7b01:db9f with SMTP id
 bs17-20020a056000071100b0022e7b01db9fmr12847165wrb.38.1665423087540; 
 Mon, 10 Oct 2022 10:31:27 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 k24-20020a05600c1c9800b003c6c182bef9sm951399wms.36.2022.10.10.10.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:31:27 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:31:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 37/55] pci: Sanity check mask argument to pci_set_*_by_mask()
Message-ID: <20221010172813.204597-38-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Coverity complains that in functions like pci_set_word_by_mask()
we might end up shifting by more than 31 bits. This is true,
but only if the caller passes in a zero mask. Help Coverity out
by asserting that the mask argument is valid.

Fixes: CID 1487168

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220818135421.2515257-3-peter.maydell@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/hw/pci/pci.h | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index c79144bc5e..97937cc922 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -688,7 +688,10 @@ static inline void
 pci_set_byte_by_mask(uint8_t *config, uint8_t mask, uint8_t reg)
 {
     uint8_t val = pci_get_byte(config);
-    uint8_t rval = reg << ctz32(mask);
+    uint8_t rval;
+
+    assert(mask);
+    rval = reg << ctz32(mask);
     pci_set_byte(config, (~mask & val) | (mask & rval));
 }
 
@@ -696,7 +699,10 @@ static inline void
 pci_set_word_by_mask(uint8_t *config, uint16_t mask, uint16_t reg)
 {
     uint16_t val = pci_get_word(config);
-    uint16_t rval = reg << ctz32(mask);
+    uint16_t rval;
+
+    assert(mask);
+    rval = reg << ctz32(mask);
     pci_set_word(config, (~mask & val) | (mask & rval));
 }
 
@@ -704,7 +710,10 @@ static inline void
 pci_set_long_by_mask(uint8_t *config, uint32_t mask, uint32_t reg)
 {
     uint32_t val = pci_get_long(config);
-    uint32_t rval = reg << ctz32(mask);
+    uint32_t rval;
+
+    assert(mask);
+    rval = reg << ctz32(mask);
     pci_set_long(config, (~mask & val) | (mask & rval));
 }
 
@@ -712,7 +721,10 @@ static inline void
 pci_set_quad_by_mask(uint8_t *config, uint64_t mask, uint64_t reg)
 {
     uint64_t val = pci_get_quad(config);
-    uint64_t rval = reg << ctz32(mask);
+    uint64_t rval;
+
+    assert(mask);
+    rval = reg << ctz32(mask);
     pci_set_quad(config, (~mask & val) | (mask & rval));
 }
 
-- 
MST


