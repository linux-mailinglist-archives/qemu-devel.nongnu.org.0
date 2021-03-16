Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6596B33D8CA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 17:12:21 +0100 (CET)
Received: from localhost ([::1]:56664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMCIu-0001c5-6y
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 12:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMC7H-0000uN-A7; Tue, 16 Mar 2021 12:00:21 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:50909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMC79-0000IZ-IN; Tue, 16 Mar 2021 12:00:16 -0400
Received: by mail-wm1-x336.google.com with SMTP id g25so10372069wmh.0;
 Tue, 16 Mar 2021 09:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uioFA7kSJG6dSbTCJnInaEvZmY5RBbbDHDyMmMYCNBw=;
 b=P5UPFlTg9J2Mh6ZgtUx5nExmAl6QCH7w3m2a6QOIBle1dwG43gw7+YC1+sUc9rPYzK
 F6zslCs6G6bBRftFBRed+YdluJqN0dOV+3AUI2wOEh58yDEfloxtt18FZKNxSWN6PhSZ
 M6Jtyvq9tKYsDyR43ukxI2LeRegqQUzAkuOIBrdQgxj7R0ipNmfScVzyujW3AKJK9263
 j/5zMfTEK9kAeDWH0wbk6gZmU68znDSVXRiO1mBNDAyulbuaTHmd+6VllW5HYpYZ/TVn
 kDWJIdPoKyw5MrrEAfMynVDG1BUzkxIoOC2T6zRUY24nmgbRvoLFX8QL8t9NodCtx1hK
 /h0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uioFA7kSJG6dSbTCJnInaEvZmY5RBbbDHDyMmMYCNBw=;
 b=q9P67Rl29/Xnmmc5Enhp4WIzN0HICgIuVZ59jx7cDhKe+SSHHhwTJf+U+AmaETbulI
 9UnbFHo9fnSnIMR6lOE1qsAkojGFQszMVeM03L4sU2CgAX8GpDhEB/TcJcoFDbIdD+/p
 JTaSWLKCvUIJFcBByNAyZCU6i021uBy7g++nSEGhApuFRMIaQrRGqY9pwag2o4poJ/2y
 hl2evwUT3GRefGKbU9L+Aldq7x2jBzB8kiemT2+Id3RvM0Wl1SlLYWGlItF7rN+FeycB
 PTR9sxZaCRA0aN8ZEDT5BRYeCqwIrJjThZT3nLt2AnqGWfQtevlfQme56f8AXuWvHjDO
 VNIg==
X-Gm-Message-State: AOAM530I5ljaRYfoXD/uYL+ehZeGxv6iwPdQmCyqkEJVsk5FxObFO7xI
 rL/YfsDIwBBTUFwOoQlMyO9agB7Avzg=
X-Google-Smtp-Source: ABdhPJyehjFxt429d3wo7fS7eSFjbMjmHVGjSpL3X6uutyx62qaX1ERKTJVqutm2mUgHgrNkyWUAeQ==
X-Received: by 2002:a1c:7209:: with SMTP id n9mr321093wmc.132.1615910409683;
 Tue, 16 Mar 2021 09:00:09 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j14sm22674851wrw.69.2021.03.16.09.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 09:00:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] block/vdi: When writing new bmap entry fails,
 don't leak the buffer
Date: Tue, 16 Mar 2021 17:00:03 +0100
Message-Id: <20210316160007.135459-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210316160007.135459-1-pbonzini@redhat.com>
References: <20210316160007.135459-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: david.edmondson@oracle.com, kwolf@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Edmondson <david.edmondson@oracle.com>

If a new bitmap entry is allocated, requiring the entire block to be
written, avoiding leaking the buffer allocated for the block should
the write fail.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Message-Id: <20210309144015.557477-2-david.edmondson@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/vdi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/vdi.c b/block/vdi.c
index 5627e7d764..2a6dc26124 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -690,6 +690,7 @@ nonallocating_write:
 
     logout("finished data write\n");
     if (ret < 0) {
+        g_free(block);
         return ret;
     }
 
-- 
2.29.2



