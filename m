Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8355532F975
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 11:49:45 +0100 (CET)
Received: from localhost ([::1]:59284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIUVE-00040U-39
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 05:49:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUUP-0003bO-HP
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:48:53 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUUN-0004Yj-Ve
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:48:53 -0500
Received: by mail-wr1-x42e.google.com with SMTP id d15so5205555wrv.5
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 02:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DoeEvWyNKUu+KM2rOfLrnCNzfh9K3Uxn7fLG02mCJk4=;
 b=Z6a8lWDAaiSPmu4+0wxKMa7g2q4gf7fUsBc3FRUenXebcujdBCnXQ2W5266Hikzypf
 hxZQJYHigOoxohTG13j4q0dO7uDvDYbvxz3Mn/j0xqLco7/U7JK6wrLTGZ7PjHoaronY
 dXyFZ4Ss/MKu6dl3woeI8ml1r458XgKW2gre+Yum+5nRzHUA4/2WWWZK5fO7dZW8AAh+
 ep9Hriq4spp6KPa9TDmNiA9MzlZHw9rzzGdLVTXk0E2s6CWLS0qTnwPP9DExipwEXfaM
 g1z1x0CEzXhi1eF9pAPhA7V7qCF+RHUPJmL6NwwpudRlVc1XVv0HHg6qUtQEb3sm+DN6
 Ntww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=DoeEvWyNKUu+KM2rOfLrnCNzfh9K3Uxn7fLG02mCJk4=;
 b=Bx92BkkMsFSR3f/mDtTHXBLGIUrgfku9VSK6uMjEsbHMFL2lRpQ/pGmpvlLqyBaJzh
 cU6B3mCxQY5hKt1AhNZKJZ2cINkq7K5B6aQMEfQPcjWIVYH/9cSUoefrF3P0d+jRk7Ui
 in+vxCkzhVAcmYf2Gb5mRSvHwPxs0gKLR5xd++CoKe0p/iof3eOZio2cc5Y/rJrWJFaJ
 1XcJUOOEyCf7EFEGMbQIny74x5Xv6NcOgjZKZBuoSsTew/Cfn/mMs7XSe2sCCuk1Fn3u
 D7hbtl2R8M6LRdRZ10Tl0hXE7aNa/57v9r4QOiALY7AnzL3po3g+I91tURpHciiX6/fj
 Xv+A==
X-Gm-Message-State: AOAM530RTIJ1iajHtBxk5kMUhQfwm6lyt7/fxld6l0Ht1dnsuHSdpJT1
 bXia+O9WfkZ6JyXumr3SQId4kGXUQSY=
X-Google-Smtp-Source: ABdhPJyZD02H+wmbPIEa9vDOQ+RVqx+682LZ0slAiJWpLqXr4GCpuyHK1lSYAEu5S3HjIEaDYOIVqQ==
X-Received: by 2002:adf:e68e:: with SMTP id r14mr13470501wrm.273.1615027728270; 
 Sat, 06 Mar 2021 02:48:48 -0800 (PST)
Received: from avogadro.redhat.com ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id b17sm8021446wrt.17.2021.03.06.02.48.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 02:48:47 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] scsi-generic: do not snoop the output of failed commands
Date: Sat,  6 Mar 2021 11:48:46 +0100
Message-Id: <20210306104846.109916-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If a READ CAPACITY command would fail, for example s->qdev.blocksize would be
set to zero and cause a division by zero on the next use.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-generic.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index cf7e11cf44..f9fd2ccfdd 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -288,7 +288,10 @@ static void scsi_read_complete(void * opaque, int ret)
         }
     }
 
-    if (len == 0) {
+    if (r->io_header.host_status != SCSI_HOST_OK ||
+        (r->io_header.driver_status & SG_ERR_DRIVER_TIMEOUT) ||
+        r->io_header.status != GOOD ||
+        len == 0) {
         scsi_command_complete_noio(r, 0);
         goto done;
     }
-- 
2.29.2


