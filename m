Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 583AA5FA35A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:27:44 +0200 (CEST)
Received: from localhost ([::1]:51944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxV6-0006ff-OB
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwd7-0003fE-0o
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:31:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwcg-0007Jp-FE
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:31:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9qGZK5jOcaN2rqu7K9/IEN4BfTBmzsuWuby5Dy3BdJ8=;
 b=X5FSGc7Avb11wFITVh9ruelHA9APR0yXnMLRQZrM2F424guMPpBAkjLotiRzsJWeoH/3VR
 HY6dACD5r/T4JHs4DGGOg96DLPmXbKQAolIjdadxaEYw1QQ8nFSSdLPsv0JfOI2tZ21ZCp
 eT5kArXbYYfPNhUIyGirM+bhi3VlWfo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-6-RdqmnPJLPNqgZPDpkCT17Q-1; Mon, 10 Oct 2022 13:31:24 -0400
X-MC-Unique: RdqmnPJLPNqgZPDpkCT17Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 j8-20020adfa548000000b0022e2bf8f48fso2980849wrb.23
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9qGZK5jOcaN2rqu7K9/IEN4BfTBmzsuWuby5Dy3BdJ8=;
 b=BhX8yGH8W8vShUYYveho9J6ZkLmuNVu81nxjb5omeehSxDM+QFitDsCKqxaJfzZEpL
 7uSUlSol9iCBG8DpiNvyKsZjD6ApOCiII7exwG6ROBuNw2ZYO/6E4OPXnsywnbNK4rCO
 rgWoXxoDPODUUfCp0lqJbyEn+B1Pt8UU9aLB5zGc2HKOE35oAP4eteF3rVyuz6v5w7bi
 R1PoV/lNy5OS/BLipT8rMbKMkN66t/KJLWajG36bgcXqa65zA8WVFalNRTisWPW8seEl
 rs/Ps9tNBLezNF/+E/36g6MVrpm0Ufz3kNUW0jDQCqHybWo9Y0oY59BZKavxCkxOPffl
 zh2w==
X-Gm-Message-State: ACrzQf1GlUNbhvnndlqdd7zdIV1LHnacwQrPoPBKW8BWtxov4GDZxiNi
 RGwDV0Bv5DNVDzoN2328/BtOIBX+7qCXh5ALb1ZQtciKi6h5n7XuU5XIFU18MoA2vbWiYYpLx7H
 8L+Qny+t9rbgYUQO1vnunuxUrY0SLB7J0tiS0pqpd+uIzuiR7rqpcGBYXN8N/
X-Received: by 2002:a05:6000:170a:b0:22e:bd9c:2630 with SMTP id
 n10-20020a056000170a00b0022ebd9c2630mr11236374wrc.655.1665423083345; 
 Mon, 10 Oct 2022 10:31:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5P2tm8bX0GffdRfciSvunEJ8UPB4Aw8wgQaPXEGf+IP2rS+HdvGirJMWymQ1gdImvwGFu5mg==
X-Received: by 2002:a05:6000:170a:b0:22e:bd9c:2630 with SMTP id
 n10-20020a056000170a00b0022ebd9c2630mr11236352wrc.655.1665423083101; 
 Mon, 10 Oct 2022 10:31:23 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c4f9300b003b4cba4ef71sm17313837wmq.41.2022.10.10.10.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:31:22 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:31:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 36/55] pci: Remove unused pci_get_*_by_mask() functions
Message-ID: <20221010172813.204597-37-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

The helper functions pci_get_{byte,word,long,quad}_by_mask()
were added in 2012 in commit c9f50cea70a1596. In the decade
since we have never added a single use of them.

The helpers clearly aren't that helpful, so drop them
rather than carrying around dead code.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220818135421.2515257-2-peter.maydell@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/hw/pci/pci.h | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index b54b6ef88f..c79144bc5e 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -692,13 +692,6 @@ pci_set_byte_by_mask(uint8_t *config, uint8_t mask, uint8_t reg)
     pci_set_byte(config, (~mask & val) | (mask & rval));
 }
 
-static inline uint8_t
-pci_get_byte_by_mask(uint8_t *config, uint8_t mask)
-{
-    uint8_t val = pci_get_byte(config);
-    return (val & mask) >> ctz32(mask);
-}
-
 static inline void
 pci_set_word_by_mask(uint8_t *config, uint16_t mask, uint16_t reg)
 {
@@ -707,13 +700,6 @@ pci_set_word_by_mask(uint8_t *config, uint16_t mask, uint16_t reg)
     pci_set_word(config, (~mask & val) | (mask & rval));
 }
 
-static inline uint16_t
-pci_get_word_by_mask(uint8_t *config, uint16_t mask)
-{
-    uint16_t val = pci_get_word(config);
-    return (val & mask) >> ctz32(mask);
-}
-
 static inline void
 pci_set_long_by_mask(uint8_t *config, uint32_t mask, uint32_t reg)
 {
@@ -722,13 +708,6 @@ pci_set_long_by_mask(uint8_t *config, uint32_t mask, uint32_t reg)
     pci_set_long(config, (~mask & val) | (mask & rval));
 }
 
-static inline uint32_t
-pci_get_long_by_mask(uint8_t *config, uint32_t mask)
-{
-    uint32_t val = pci_get_long(config);
-    return (val & mask) >> ctz32(mask);
-}
-
 static inline void
 pci_set_quad_by_mask(uint8_t *config, uint64_t mask, uint64_t reg)
 {
@@ -737,13 +716,6 @@ pci_set_quad_by_mask(uint8_t *config, uint64_t mask, uint64_t reg)
     pci_set_quad(config, (~mask & val) | (mask & rval));
 }
 
-static inline uint64_t
-pci_get_quad_by_mask(uint8_t *config, uint64_t mask)
-{
-    uint64_t val = pci_get_quad(config);
-    return (val & mask) >> ctz32(mask);
-}
-
 PCIDevice *pci_new_multifunction(int devfn, bool multifunction,
                                     const char *name);
 PCIDevice *pci_new(int devfn, const char *name);
-- 
MST


