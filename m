Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 196AC482132
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 02:11:12 +0100 (CET)
Received: from localhost ([::1]:51414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n36Rq-0005AK-Qo
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 20:11:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36Ec-0003ck-Gd
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:57:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36Ea-0003qd-Vf
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:57:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640912248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WCc06vNMSzgUMxZ/cS32IBGYYWJrzwAKS5pIQs2nrf4=;
 b=ijlZNasvT6wipIQxHeopz0iGaIuu5hWgMEqLoEHc2L2m9JRwv+bH7YylbbYbyQn0kb2Wa6
 njTe2sMR84JO6oOk7VnqnhkCfCNXyqGoq5n6KTPynscziiW0XKfIskH+IpV243GmdgGb/Q
 E7DrpFIXYyhDgAMT/QAHbSsJtwDk42w=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-171-UFDLdjEHOYC1l1Y__UhYpA-1; Thu, 30 Dec 2021 19:57:27 -0500
X-MC-Unique: UFDLdjEHOYC1l1Y__UhYpA-1
Received: by mail-ed1-f69.google.com with SMTP id
 b8-20020a056402350800b003f8f42a883dso10809387edd.16
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 16:57:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WCc06vNMSzgUMxZ/cS32IBGYYWJrzwAKS5pIQs2nrf4=;
 b=Ar0yKy/rN9HWpHxUlhByH2c/2GDeiVqWLEgY1arcjW9Xm1ZkGJiUzMfA7ETAxgvJmH
 nu5ZIAzyUfagOW1jmv1ZsEKMZObXKq4OxKf/PnepdusWXgamEnAoy7Q4IpEVFo7KiWEP
 MAnm+ytSQX/jChoRnr3XswC3ECZGQAzE72vW8EVCzXp/3otdSmLJ+rE9VHCvaW+WHEzB
 NO6omV8NE4s/YLnjzqS76tWoEEZDpFZ7Ms5c3cJJwycePHAFsKSUxyQDzCJxzbPp9RNN
 gasqhMDLuJWwQMK5dDVFWXIPePm1QP/qbmke+LkXVLoRBNEQ3mpmTdCL+dP0sslex38S
 Pfbg==
X-Gm-Message-State: AOAM530ESy/PWeZPwT01tJI66wB7tmok+SnoVFHLaFMmaBLUrhWb/Ylz
 NZzwhKkJDJF47w2iI0TQlxuKWp+w2mJ4m+tMc+RsWXWaVwjTJrUVwpUvAttx1wMiZ+fMP7lqaGY
 0MXX+twh8U9SSbXIXuDl01OcTIUt6WHeHQeoxFgFTQudC+/d/jBPjH8mqo4j/zMa+
X-Received: by 2002:a17:906:71cc:: with SMTP id
 i12mr27877420ejk.457.1640912246037; 
 Thu, 30 Dec 2021 16:57:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCkxy/ojJhDjIpWuer4jNlpYMRS5RzzN9GtDur68JfVxG8gQtvR4aGpZXW+w3lCwcDBHoTbw==
X-Received: by 2002:a17:906:71cc:: with SMTP id
 i12mr27877406ejk.457.1640912245839; 
 Thu, 30 Dec 2021 16:57:25 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id gz11sm8006244ejc.223.2021.12.30.16.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 16:57:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/22] pci: Let st*_pci_dma() propagate MemTxResult
Date: Fri, 31 Dec 2021 01:55:45 +0100
Message-Id: <20211231005546.723396-22-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231005546.723396-1-philmd@redhat.com>
References: <20211231005546.723396-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

st*_dma() returns a MemTxResult type. Do not discard
it, return it to the caller.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211223115554.3155328-23-philmd@redhat.com>
---
 include/hw/pci/pci.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 7a46c1fa226..c90cecc85c0 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -859,12 +859,12 @@ static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
         ld##_l##_dma(pci_get_address_space(dev), addr, &val, attrs); \
         return val; \
     }                                                                   \
-    static inline void st##_s##_pci_dma(PCIDevice *dev, \
-                                        dma_addr_t addr, \
-                                        uint##_bits##_t val, \
-                                        MemTxAttrs attrs) \
+    static inline MemTxResult st##_s##_pci_dma(PCIDevice *dev, \
+                                               dma_addr_t addr, \
+                                               uint##_bits##_t val, \
+                                               MemTxAttrs attrs) \
     { \
-        st##_s##_dma(pci_get_address_space(dev), addr, val, attrs); \
+        return st##_s##_dma(pci_get_address_space(dev), addr, val, attrs); \
     }
 
 PCI_DMA_DEFINE_LDST(ub, b, 8);
-- 
2.33.1


