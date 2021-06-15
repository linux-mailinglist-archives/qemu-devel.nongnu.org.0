Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B33A3A8137
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 15:45:02 +0200 (CEST)
Received: from localhost ([::1]:48048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9NF-0005pZ-8N
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 09:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9HV-0005a9-Ve
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:06 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:41617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9HS-0002ej-HJ
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:04 -0400
Received: by mail-ed1-x531.google.com with SMTP id g18so49204376edq.8
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A7t2qX0fg1RYkfLkBI/P/I/raO7zJCJeZ8mm+rgtgLc=;
 b=mjYTPHNzZvpUzEftkcPlsqlVnpbU6r0LsnjdCvUoj58V4zCEY1Okq/jesDXnEOB1qB
 +nifTe68//m9R+lLDqHYUSyosSNOUm6E2r4Znydch4Tv26RSyXY3SO0kfq9ZQELHrMq9
 RhTQIlecDvDw7kAzWWTM2MvQVeZy/+SiUu75JCtfJkXoK2lmbicd5xo6kSwd63508FQ+
 7ID/qqSVfh6MZGRxdkkxm0Vx1bS519SMEdiYPYjD8VGSZBvlawdxn48zNV3KOM/S7hTE
 IlrsVdoY60x69o4mi5n1BYnfmErxPwW6FYX6I+gtpCqyP5pSRdFkprByAZbtcEp6ml94
 wUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=A7t2qX0fg1RYkfLkBI/P/I/raO7zJCJeZ8mm+rgtgLc=;
 b=BoyvJDfARqlXT3BWX5CFjTol6u1zgzzJkGchzcfuJy5q99CczVJ/2xea8UzpYxOYEB
 oyAKEgLy9KD1Myi34TvfkNFZQmyPIKILIe2DQfMJWnD3cHxeUzn3rNy+pY0/E3g5yK5+
 yBCbl+0Pmt7RZpz9t9N1UzNDvCeKxtxql3jeEZHnsJanQpa7Ov8Y5GWU3KGJ1g1o+WjR
 khiJEcbcpyLt7MMD5h6JwG7ir/9TWh8FnapXHDOOcz2Dxx2gsFc4v7YDLwtbWiEuM996
 Eq9wwHSANb5OFa73RuR3Ley45UgCbpS4rS8fvXmZA0vD9HQvCD6UvfPZviR++iH96zVI
 jnyA==
X-Gm-Message-State: AOAM533aHEyxqNklO83QeYgW6EEH2ELYetyP4H1XqQmkX1T0FtSDDscc
 paQ5F8Fb0VxNaEGpeWFFhNpzkK9yYj0=
X-Google-Smtp-Source: ABdhPJyMQqspfv5a8wg4akg2vaLyxGZ0ptgiI1WgGg38O4gx/BrHtEETpCQBQJaldAcygJMnSFSgPA==
X-Received: by 2002:a05:6402:1ac9:: with SMTP id
 ba9mr23850945edb.250.1623764340490; 
 Tue, 15 Jun 2021 06:39:00 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm11843769edt.33.2021.06.15.06.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 06:39:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/33] block/scsi: correctly emulate the VPD block limits page
Date: Tue, 15 Jun 2021 15:38:26 +0200
Message-Id: <20210615133855.775687-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615133855.775687-1-pbonzini@redhat.com>
References: <20210615133855.775687-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
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
Cc: Max Reitz <mreitz@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxim Levitsky <mlevitsk@redhat.com>

When the device doesn't support the VPD block limits page, we emulate it even
for SCSI passthrough.

As a part of the emulation we need to add it to the 'Supported VPD Pages'

The code that does this adds it to the page, but it doesn't increase the length
of the data to be copied to the guest, thus the guest never sees the VPD block
limits page as supported.

Bump the transfer size by 1 in this case.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20201217165612.942849-6-mlevitsk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-generic.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index 98c30c5d5c..40e039864f 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -147,7 +147,7 @@ static int execute_command(BlockBackend *blk,
     return 0;
 }
 
-static void scsi_handle_inquiry_reply(SCSIGenericReq *r, SCSIDevice *s)
+static int scsi_handle_inquiry_reply(SCSIGenericReq *r, SCSIDevice *s, int len)
 {
     uint8_t page, page_idx;
 
@@ -213,8 +213,13 @@ static void scsi_handle_inquiry_reply(SCSIGenericReq *r, SCSIDevice *s)
                 r->buf[page_idx] = 0xb0;
             }
             stw_be_p(r->buf + 2, lduw_be_p(r->buf + 2) + 1);
+
+            if (len < r->buflen) {
+                len++;
+            }
         }
     }
+    return len;
 }
 
 static int scsi_generic_emulate_block_limits(SCSIGenericReq *r, SCSIDevice *s)
@@ -332,7 +337,7 @@ static void scsi_read_complete(void * opaque, int ret)
         }
     }
     if (r->req.cmd.buf[0] == INQUIRY) {
-        scsi_handle_inquiry_reply(r, s);
+        len = scsi_handle_inquiry_reply(r, s, len);
     }
 
 req_complete:
-- 
2.31.1



