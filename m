Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6265F49534A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 18:32:39 +0100 (CET)
Received: from localhost ([::1]:57780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAbIb-0003Ps-G4
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 12:32:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgy-0004bY-Pi
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:28 -0500
Received: from [2a00:1450:4864:20::32c] (port=42952
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgw-0003Sb-VE
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:28 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 f202-20020a1c1fd3000000b0034dd403f4fbso10087194wmf.1
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=kLVawJbigFH+B5TCPH615H2cQHplZbBSOAUoIGl13ig=;
 b=JLJgovyUwGnVmfEP9ECOQCyZW2HfRdDrKSRim2uV39vMH7S2KecrVP4mBUcpO1T9F+
 De+AgajkukANLnP/76etLUEXbQENjFjvQ0MWuHcQD0Mctma9Bf7YK2sSquc731NsOQRz
 QMJtmr03vJ7nEgbd7ukvDheiz+7gFkQ4rBDt2hOQ+Q/twQkhYlcxbQ1mWewaPd5sEgK/
 /UoIt+JN8hBVFJ/VqX+2oKj1dVDGX/5Z6erhBco9I2duTLCIOCQUDtS8zB22j+qVYy6Y
 I4Ut3hxOE4QQWkjFKVETd0rgHSJ42JDZu+WBA09t8th9RrT/xTzHPnurPRmAC6OzINox
 L+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kLVawJbigFH+B5TCPH615H2cQHplZbBSOAUoIGl13ig=;
 b=gq5QDHmn6QwAx3sCyk6L+JgmZo+hDjE85oLTih5wqhDdr0p36iTa3IqmrmqxvOyJnk
 P2/shRNA0JW/exVVMxk8P1Qm+c/qyNqr2c6I7xt8ZadqiiGxko8QDvFuldlYj/yDhwgZ
 Zrsns7+hmeuW7p/cVdWS587AR05y2UuNTvdwQnK/5WAKEMIC1tELgDmiNEe29GDj+oK+
 pur1TefP+3bXpBnpTM0gWPdHqjz4mwdWMXNz4KFa62kjeemyxNFkilfo7Nsxc+gHUQrn
 AH4izDf8SF5VJaokUv9XL7LqFuioQm664c+E5E3KGFqLyXO+UXqhd2i4KflQEJvZsXJR
 IfzA==
X-Gm-Message-State: AOAM532bQr71rt6O0RELsTr08YYFS2sZ/KXjx5ar1/3BJd4UeaeZ+2fd
 KBwp4591ZjVAkWa/ZofWh5ELIIm4RYywWA==
X-Google-Smtp-Source: ABdhPJw0pZKQGRNnc5VVBRQLJXYWZnB6lIxIe4zEI2JrB0fqi01b1yq3F9/gagQmYVwdjGHxNvBwtQ==
X-Received: by 2002:a5d:598c:: with SMTP id n12mr20055337wri.386.1642682245756; 
 Thu, 20 Jan 2022 04:37:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.37.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:37:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 38/38] hw/intc/arm_gicv3: Check for !MEMTX_OK instead of
 MEMTX_ERROR
Date: Thu, 20 Jan 2022 12:36:30 +0000
Message-Id: <20220120123630.267975-39-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Quoting Peter Maydell:

 "These MEMTX_* aren't from the memory transaction
  API functions; they're just being used by gicd_readl() and
  friends as a way to indicate a success/failure so that the
  actual MemoryRegionOps read/write fns like gicv3_dist_read()
  can log a guest error."

We are going to introduce more MemTxResult bits, so it is
safer to check for !MEMTX_OK rather than MEMTX_ERROR.

Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_redist.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index c8ff3eca085..99b11ca5eee 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -462,7 +462,7 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr offset, uint64_t *data,
         break;
     }
 
-    if (r == MEMTX_ERROR) {
+    if (r != MEMTX_OK) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest read at offset " TARGET_FMT_plx
                       " size %u\n", __func__, offset, size);
@@ -521,7 +521,7 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
         break;
     }
 
-    if (r == MEMTX_ERROR) {
+    if (r != MEMTX_OK) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest write at offset " TARGET_FMT_plx
                       " size %u\n", __func__, offset, size);
-- 
2.25.1


