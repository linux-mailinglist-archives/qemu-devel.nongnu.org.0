Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E14F2AC0AD
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 17:21:42 +0100 (CET)
Received: from localhost ([::1]:45646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kc9vJ-0000sh-83
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 11:21:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kc9tO-0007sT-H5
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 11:19:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kc9tM-0006rr-Jj
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 11:19:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604938779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LTleca8HXDtGook+HgY4NIixQPnyZsTwDp8NcaXFhoU=;
 b=ZVYc8tyQ9ZPVMoMhkMfFBOx8z7uuifm6at/B+GGetgxR29TDDIVCLSFYIfYmGky6dHXnll
 w1keMnKAlg++8h7S89emiLqa8opwyJdoQGn2vermFonove2oLOgR258ggT61DupkwT1cx8
 EDpubgFQee1SpdMwIlqLyJOBf2q+eTI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-GbBSRZMyOVu_xmk9F4VFHQ-1; Mon, 09 Nov 2020 11:19:37 -0500
X-MC-Unique: GbBSRZMyOVu_xmk9F4VFHQ-1
Received: by mail-wm1-f72.google.com with SMTP id h2so2163137wmm.0
 for <qemu-devel@nongnu.org>; Mon, 09 Nov 2020 08:19:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LTleca8HXDtGook+HgY4NIixQPnyZsTwDp8NcaXFhoU=;
 b=dCbzh3/90TuzbEkJ6g8nLDN8SRistu9yfgvGuKi/nmZV5kRonqYKTzxlnKUqrqXTbC
 7uAqWSY/UAXxQDV+Wlw+0gc5W5qOtwtlVHN0fh4JLygy3+QZwY3S9kxuNtDGQAubAFfq
 W42y5oBGBhTZ6ITVbJKTTGxcNTWXAJDl4pUfbFVTgOxjPkcUTD/mi5GrMoMjOrBpKQYC
 aNo/ESSaP1y+8WEBdGKI4PiBImvgKLj+FUd72kKjLROr/q+/sDdOGuXRK1DxbZ4g5JqL
 yT/FsiDnCqJO8bNuGv4vxJJqd6XywJ8xTiZrpRKlM0kUZ/+eyWk4BKIJLIG8NTbk39FQ
 lWPQ==
X-Gm-Message-State: AOAM531jKTyawopbhJcfU8bSJ3gQzTEsLde8YYoKyYTZc7cgDAifUdKx
 6Q4+LYBE7bJMuCJjgGaKeh6Rp/wJBiyoDH4T20JZ+M14JqOR+iHMdgmKKeDQb0UOp0mEd0Nl3yB
 JbkHa6g/g2rUx6j0=
X-Received: by 2002:a05:6000:1046:: with SMTP id
 c6mr18574037wrx.315.1604938776415; 
 Mon, 09 Nov 2020 08:19:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxC0RfUjSiUwOFMkEIoq18ckY8/vZsg5u4rBfsycBpY/2pEiIpAiVqkuQ/5DHTIe6hMMOwaoQ==
X-Received: by 2002:a05:6000:1046:: with SMTP id
 c6mr18574032wrx.315.1604938776290; 
 Mon, 09 Nov 2020 08:19:36 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id 89sm15020060wrp.58.2020.11.09.08.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 08:19:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [NOTFORMERGE PATCH 2/2] hw/pci: Test line with 391 chars
Date: Mon,  9 Nov 2020 17:19:23 +0100
Message-Id: <20201109161923.2632747-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201109161923.2632747-1-philmd@redhat.com>
References: <20201109161923.2632747-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 01:25:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Applying using unrestricted checkpatch:

  WARNING: line over 100 characters
  #25: FILE: include/hw/pci/pcie_regs.h:141:

This change is not easy to review with 'git-log -p'.

  $ echo ${COLUMNS}x${LINES}
  210x52

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/pci/pcie_regs.h | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/include/hw/pci/pcie_regs.h b/include/hw/pci/pcie_regs.h
index 1db86b0ec4d..a2f02511986 100644
--- a/include/hw/pci/pcie_regs.h
+++ b/include/hw/pci/pcie_regs.h
@@ -138,22 +138,7 @@ typedef enum PCIExpLinkWidth {
                                          PCI_ERR_ROOT_NONFATAL_RCV |    \
                                          PCI_ERR_ROOT_FATAL_RCV)
 
-#define PCI_ERR_UNC_SUPPORTED           (PCI_ERR_UNC_DLP |              \
-                                         PCI_ERR_UNC_SDN |              \
-                                         PCI_ERR_UNC_POISON_TLP |       \
-                                         PCI_ERR_UNC_FCP |              \
-                                         PCI_ERR_UNC_COMP_TIME |        \
-                                         PCI_ERR_UNC_COMP_ABORT |       \
-                                         PCI_ERR_UNC_UNX_COMP |         \
-                                         PCI_ERR_UNC_RX_OVER |          \
-                                         PCI_ERR_UNC_MALF_TLP |         \
-                                         PCI_ERR_UNC_ECRC |             \
-                                         PCI_ERR_UNC_UNSUP |            \
-                                         PCI_ERR_UNC_ACSV |             \
-                                         PCI_ERR_UNC_INTN |             \
-                                         PCI_ERR_UNC_MCBTLP |           \
-                                         PCI_ERR_UNC_ATOP_EBLOCKED |    \
-                                         PCI_ERR_UNC_TLP_PRF_BLOCKED)
+#define PCI_ERR_UNC_SUPPORTED           (PCI_ERR_UNC_DLP | PCI_ERR_UNC_SDN | PCI_ERR_UNC_POISON_TLP | PCI_ERR_UNC_FCP | PCI_ERR_UNC_COMP_TIME | PCI_ERR_UNC_COMP_ABORT | PCI_ERR_UNC_UNX_COMP | PCI_ERR_UNC_RX_OVER | PCI_ERR_UNC_MALF_TLP | PCI_ERR_UNC_ECRC | PCI_ERR_UNC_UNSUP | PCI_ERR_UNC_ACSV | PCI_ERR_UNC_INTN | PCI_ERR_UNC_MCBTLP | PCI_ERR_UNC_ATOP_EBLOCKED | PCI_ERR_UNC_TLP_PRF_BLOCKED)
 
 #define PCI_ERR_UNC_SEVERITY_DEFAULT    (PCI_ERR_UNC_DLP |              \
                                          PCI_ERR_UNC_SDN |              \
-- 
2.26.2


