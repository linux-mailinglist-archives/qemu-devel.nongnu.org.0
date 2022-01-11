Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A02B48B68A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 20:13:27 +0100 (CET)
Received: from localhost ([::1]:39028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7MaD-00051Q-NP
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 14:13:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7M7K-0003vB-Kw; Tue, 11 Jan 2022 13:43:35 -0500
Received: from [2a00:1450:4864:20::42c] (port=42931
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7M7J-0005x2-4T; Tue, 11 Jan 2022 13:43:34 -0500
Received: by mail-wr1-x42c.google.com with SMTP id k30so17130596wrd.9;
 Tue, 11 Jan 2022 10:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vXKALJ9Nu0jmF9J3PAVqCeW9IO5VC/1PKk5EvcGi5w4=;
 b=S1NDalDoSqmALxJhCjDz19+gNkjEysmPv3ly2IAYh4RDFnwwqZyxownJDxs3Wytp4/
 /9e2ShOSr1lG0vq6tXcvKBDUnWtYxILycyptExmYYzhyfa9ET97YP9Iuh0FCxZAiWwH0
 nsoBlfG/B2QjfDmirg1+4m9BqmyNr52sljNn/2juGCT3hD/u0yyQDW/AJWCdk17KOk8V
 eKpgReIwTE3KXNAcvYOHVlvMX1HC32SO5hokN3X1cYMXRFLOIbcq+T8VbkZoXHkeID71
 YX62Lcmv29q+Rbvz8ZXeQeiLfW3sNvWMPkQIu+ej6kCLcXVsX0QFfCzKZk0VlO7xGd3l
 G0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vXKALJ9Nu0jmF9J3PAVqCeW9IO5VC/1PKk5EvcGi5w4=;
 b=jFYzsidag8w89oqL7hM9VCbeObBUp6Cg9lWYWDshe2cK+0JeIAZD/SnoTBOrNx+lCX
 sKhNS/Omghvbcn131UQyyNz0FoaAhAH4dfmik3MNFU9/gMeqWvsdMeUR+Kt3gSYs4m8e
 nrujRQIkmCfZ6wfyLQgNkcs8Q34G1By/fshDaCQaETBqU0J3ErArQzWD2Cr25LJloBbf
 982e5xwmBf/swZo68rAApZtVnQvI4yi3G04FAqhGXnNwFTa5bfTNB+dosmKj9GrFnF0U
 Ggc8gY8VaZyOPaWQgSV+NWt9VWNancGU2nBGCum+s0aO4SOdqbsnEQcQWeaDGPjT0cgD
 l4Jw==
X-Gm-Message-State: AOAM532ilPjhi4PLyL7Y8NDMFr5SsxUJo9Skz0Mc/t+AKU/oTlfq6xmb
 nOy7/TJjpfUga5HObnXw56AA52gue8Aqfw==
X-Google-Smtp-Source: ABdhPJxAYbvc6pNab+X/7N2NFyoS5b5GylEV2i2et+R6FDB6Y0C/NLPzpde46csFF93+oVC9r4cw1A==
X-Received: by 2002:a05:6000:1ac6:: with SMTP id
 i6mr4991329wry.373.1641926611183; 
 Tue, 11 Jan 2022 10:43:31 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id d11sm10648594wri.101.2022.01.11.10.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 10:43:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/10] hw/pci: Document pci_dma_map()
Date: Tue, 11 Jan 2022 19:43:03 +0100
Message-Id: <20220111184309.28637-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220111184309.28637-1-f4bug@amsat.org>
References: <20220111184309.28637-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


