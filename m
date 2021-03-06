Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C221732F9A0
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 12:07:38 +0100 (CET)
Received: from localhost ([::1]:52514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIUmX-0007vM-Qo
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 06:07:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZw-0005z9-Bl
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:37 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZu-0008BC-WA
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:36 -0500
Received: by mail-wr1-x434.google.com with SMTP id 7so5241125wrz.0
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 02:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DoeEvWyNKUu+KM2rOfLrnCNzfh9K3Uxn7fLG02mCJk4=;
 b=bUtrSfLGnbzFr17Wb+mt64401Lz39ESo0jjX704A+33bqcxQsf5intpqpIIfkOMiRY
 6hQXrOIbajj1sqtvmWUxTuRJQTtsFiENlCcoO+99i6j/k3xxkUqeTTs3grbhP0uQEQX+
 nciheCtbFspwM5IG/RuAu7kZUDuG0LLAF8qsJirJOveeMYhvGlCsTTw1U+HXruu9w1RE
 Wxg8NmG4u4oMCWV+4kmezN4QFug5FR2l3NAgt60wXNdTyoCZd7Vr2wY2lgL3WptMdMlV
 J/xd6ijr7DgAqABb8jpL44dmGTiu0qkTFWvpLntVvuyBWsE5vBDqUz1my/3YN2tzzuk/
 hjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DoeEvWyNKUu+KM2rOfLrnCNzfh9K3Uxn7fLG02mCJk4=;
 b=f+ooxpUCG8EVn3HoVMAOJg2GN86tlrmAcV7JljdnQpdWnXkXeuOjRmVrP5mFOAFlTS
 PQmS+Zpc9Ubuim6H8aejtQ9dVZ59z2id6ZnwJ1AVrVLHbx1Xq+zFtEfyNAtAsS+Expm3
 9cY2LowWZ6nxlrxDzjBAd7zTxNpKKQrnegv/Sh8wtoJ0GjHd/5wafEJ367Y6ErtEnDFU
 ghLpT3kiIgIodNDW9t1I1padfOgEqlvWjxwaWaXcyoEWCQ9SOUKraYmZwzO/Q65DtABc
 8eiWkoVr2G4vPU6qcOdbmwuXF2glPP0mjcmHHYJ6HoN7lCCY2y1wQJA9pJo7eVw9QJuT
 llYg==
X-Gm-Message-State: AOAM531xtPFhyS0Zhnb106B6t2kgQ/AzdDBdXfEpUzQtVAuETdg1JOFx
 1s54KkI8YN8ODiDAhU3clvOk7bdcA34=
X-Google-Smtp-Source: ABdhPJwq2JgZChlonvesTMmCLiNRYMYxTCYf0JrKspvGTlbz2dOpOMv/sePvR8qJ+Bv6Kwesu0LQYg==
X-Received: by 2002:a5d:6b8a:: with SMTP id n10mr13755684wrx.150.1615028073867; 
 Sat, 06 Mar 2021 02:54:33 -0800 (PST)
Received: from avogadro.redhat.com ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id i26sm9326472wmb.18.2021.03.06.02.54.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 02:54:33 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/23] scsi-generic: do not snoop the output of failed commands
Date: Sat,  6 Mar 2021 11:54:11 +0100
Message-Id: <20210306105419.110503-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210306105419.110503-1-pbonzini@redhat.com>
References: <20210306105419.110503-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
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



