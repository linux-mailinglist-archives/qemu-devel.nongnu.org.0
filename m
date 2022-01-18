Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32BD492594
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 13:19:56 +0100 (CET)
Received: from localhost ([::1]:49416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9nSu-0007Cy-2n
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 07:19:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nEN-0006CR-EU; Tue, 18 Jan 2022 07:05:05 -0500
Received: from [2a00:1450:4864:20::330] (port=34497
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nED-0005sp-0y; Tue, 18 Jan 2022 07:04:51 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so2046259wmb.1; 
 Tue, 18 Jan 2022 04:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xqRINyUHKRPM2UFVgERzZu4xOCjYsVl6rEoXt0ggBys=;
 b=fzXVnAMh6yrb/0oN6kN5dwc5bPmUMEDcgH6qZmPDNnW+A0jL3NSWCGsQnXzJIssAdE
 nD6r6TGngrcVXEz0ttKpTjTJyQRZ8ddqngUDRkjCLSaeHtESDGjME+dyLbdg1Oq/QJ40
 hFwuFURjo35G7IlnMTUoV1xNgndvJHwSq2j07jAJpVoFQGxisXyFRG/SlaPD6Ni2qD98
 oCwyP/Sz9YC7JMkPcIu+izboleiSpHmKrnco8Dy7o52oZNz5KIjha8UFkaEytcZ8kq8W
 qCEZgD9H77CfYoZlpLuFX9wRwQzWeGlk6BxH0WvjZGGcRk6I7ZsegcB1ddCaMgnQkzkQ
 s+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xqRINyUHKRPM2UFVgERzZu4xOCjYsVl6rEoXt0ggBys=;
 b=4sOfllCWz0MgjDC7YSTinoCLrORe2hyU7xugXbeVFC+b6aNudhJ0bZt8ctkvIdU33x
 xsdzLbgax1KP/3r1hp8Z14JOfbfZpaI/p8o0UVxJTfUyUlRq679/tg9Cu6KZrJLQe34O
 nFJywmuC+tC91/PgNpkRovC/JR0h6JGrrEbx6yt3KD0dV8CUCLKmkfFEdZ/5guQgEvn4
 5WgxfYyGToVNUQ8H2AC6nkMsKukOVkcY5pRi5ua1zkyXSfFFvy0WoS0BOxe3VBSpPD7Q
 W9GyElORnspSxEQ0ACtO1ZYNkykTZjRUZpmemIwYdg8eeP7NiN5BfIvOBQ2Ctq9/OJ7m
 dUKQ==
X-Gm-Message-State: AOAM530qW6qFA4lVpVrDQzdyXz946PhlcQ2khomAoVhQyfl6tuevbvRO
 OcMFVWekN7w+ybKSyd7kCS/b/DLg9Lo=
X-Google-Smtp-Source: ABdhPJyxEXgXqfOZgXli85mVw7lSzxT+3Ui7KQ5DXcVJ6UK55eiVMepPLdc72bCIXgKy852Ssf+JRQ==
X-Received: by 2002:adf:e2cc:: with SMTP id d12mr23489929wrj.107.1642507404393; 
 Tue, 18 Jan 2022 04:03:24 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 z7sm19180054wrm.117.2022.01.18.04.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 04:03:24 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 11/19] hw/pci: Document pci_dma_map()
Date: Tue, 18 Jan 2022 13:02:21 +0100
Message-Id: <20220118120229.196337-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118120229.196337-1-f4bug@amsat.org>
References: <20220118120229.196337-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220111184309.28637-5-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/pci/pci.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 483d5c7c727..023abc0f791 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -881,6 +881,18 @@ PCI_DMA_DEFINE_LDST(q_be, q_be, 64);
 
 #undef PCI_DMA_DEFINE_LDST
 
+/**
+ * pci_dma_map: Map device PCI address space range into host virtual address
+ * @dev: #PCIDevice to be accessed
+ * @addr: address within that device's address space
+ * @plen: pointer to length of buffer; updated on return to indicate
+ *        if only a subset of the requested range has been mapped
+ * @dir: indicates the transfer direction
+ *
+ * Return: A host pointer, or %NULL if the resources needed to
+ *         perform the mapping are exhausted (in that case *@plen
+ *         is set to zero).
+ */
 static inline void *pci_dma_map(PCIDevice *dev, dma_addr_t addr,
                                 dma_addr_t *plen, DMADirection dir)
 {
-- 
2.34.1


