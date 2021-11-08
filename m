Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3EF447D11
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 10:48:24 +0100 (CET)
Received: from localhost ([::1]:55450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk1GJ-0006Y8-KU
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 04:48:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk1F8-0005q0-0h
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:47:10 -0500
Received: from [2a00:1450:4864:20::52b] (port=35621
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk1F6-0002sE-GG
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:47:09 -0500
Received: by mail-ed1-x52b.google.com with SMTP id g14so59414367edz.2
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 01:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1tv/6fUMhVshxYNkh09VwOktqKcuLm9baW3xi3XBfjk=;
 b=E8TK/i+j+ypJL1nXyTc/CmWK9GMS2bvOBQM43NoDAwLRK3Wj7n070AqRKUCPsvrcWE
 VmltkSW3E81FVJpyqcLhFIkt1uJoRl/4AeIX1T39o5BMdVGuVa7XfGshxuIas8yVs6KK
 4/TNQTohvzphMN5pZeDqwC+NBHwtc/ISXRAvSeh0yjipgig15x3QDYZRUpGTxzhv3+wk
 qzbIl3SKOzlfIB+Qs6XEUKgn0nIO8XzuYjt3iYuAKvVTQJkzl0Hl7O/DgXyBAB1Rl73I
 rroYZ+X/WnCUhQx29B10IGCb43/mIFzJow9daQQzu+XoBc/xzCFwgkcpKYgzuIZ3+i6d
 7xEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=1tv/6fUMhVshxYNkh09VwOktqKcuLm9baW3xi3XBfjk=;
 b=sZAHRxjNNR2Hc2EYHMgRgYPWX2lZ6k2XuhGnEgdu3XQdfmVBeMWl5oNF2wJB0Vp1gq
 pyPRFu9aN1XOYsrX8eOdIzRTmIaJPdYx9MObU26auvitEsHAJHEPHZ9zsNB/WQuojt01
 ikf+BV4k+h63AQ2V/PFh/kMnbwgSiJ4c+dgH1w9/mj+i/xOdcPTtAqoNP1sxHjKuyLKL
 4HHU/ErDgDRjHxIg/zxhPnJZKGYsrRLC2xwM5gwJltgKdj0Ct9HkooZIDJdcxG6sjOf1
 ImDr5y0s/Bwe4Uni+KVP5Cp2IGwDdcxtbJwmanAMXGiGBVXisW0Of+W2vSzhiGbrkGwI
 pl/Q==
X-Gm-Message-State: AOAM530ZyKigMwRl5EMeyZ6rGZ3j/PL5d9xFio5OVE+x1BqOObL+W4Ml
 rAyY0bO2GGKQZfIse+khuctdtX3xDMY=
X-Google-Smtp-Source: ABdhPJy2urtyVVADtHLHbWVnicq3Iwydmn0t1Ew308oU0ASo9t1bYFa9UgYqziK6FQG7A3AkdCGb0Q==
X-Received: by 2002:a17:907:d8f:: with SMTP id
 go15mr61935171ejc.495.1636364827092; 
 Mon, 08 Nov 2021 01:47:07 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g26sm8685223edt.13.2021.11.08.01.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 01:47:06 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vhost-user-scsi: fix Kconfig dependencies
Date: Mon,  8 Nov 2021 10:47:05 +0100
Message-Id: <20211108094705.554350-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: felipe@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VIRTIO_PCI is a hard dependency for CONFIG_VHOST_USER_SCSI; if virtio-pci
is not included, linking fails due to missing virtio_pci_types_register.
Adjust the Kconfig dependencies.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/Kconfig b/hw/scsi/Kconfig
index 77d397c949..f972680ffc 100644
--- a/hw/scsi/Kconfig
+++ b/hw/scsi/Kconfig
@@ -50,6 +50,6 @@ config VIRTIO_SCSI
 
 config VHOST_USER_SCSI
     bool
+    default y
     # Only PCI devices are provided for now
-    default y if VIRTIO_PCI
-    depends on VIRTIO && VHOST_USER && LINUX
+    depends on VIRTIO_PCI && VHOST_USER && LINUX
-- 
2.33.1


