Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C7D3AAFF9
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:41:34 +0200 (CEST)
Received: from localhost ([::1]:34072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltoWd-0004nK-MF
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNB-0002b8-Gc
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:41 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:45741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoN9-00061p-FO
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:41 -0400
Received: by mail-ej1-x631.google.com with SMTP id hv20so2770990ejc.12
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A7t2qX0fg1RYkfLkBI/P/I/raO7zJCJeZ8mm+rgtgLc=;
 b=hj63UgmF556qZq7IVFAaJpe3gmmfJk73lqsRkgMF47rCsgnw9z9XoJTzCRIvz27EXY
 65umkz3orqyqcDz+DKt1dzWOuH7I9rh/0QlsVuEMecoDafFxP7CqnZ0utDCzaDXsAdMZ
 K5oHp//g12iFh9YouWQ0ncqRiD9sIrvFcJHWFqWIGWmUOZiD7276xMjhe2PcvgnWXcji
 y4Hd7cmm4M96zwaJvi2hAAj1qGl5GPyahfm7kLtb0N92tXg7Y02uu4pRTwb7anhxVHFS
 /w2E+NS8HLtdGaipRkZgo592drcPA8IgGpkiV4nhKkGHeREfRVVxaHG+LigEVSt9klSv
 YqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=A7t2qX0fg1RYkfLkBI/P/I/raO7zJCJeZ8mm+rgtgLc=;
 b=S070mjaF/B2XLQbsAXbPhNCQ5Tvcxr4DhIuF9rV5ANCnH1l0yirVZJ/JqygwHg2Jjq
 oDX95iDD2LLwCqZOCIwaB8k94XbQoG3k4Y2ETGO7Cl6rVTqsw2mvSUSzrnG/UhctnRya
 MZcW7RT2jx6OSWM+P224u7wNPjOCafXwEZIm32Och5q29JmVG2Gfu9zqTaF46vgqA1p9
 BZEY7o6faOWMtxANpgoNglMgWD0JYqeJvFeeB8j2HYFwO+mcotmYYkLhnAuhh+zF4zGd
 3qFgZMDUWtw/aclIykpuv8awkzLoRFQJM2yYUjBeYOFQRGkoexIBmNkBTe48RlpXv8Ga
 vx0g==
X-Gm-Message-State: AOAM530poQQaEmTcKuzkZc6EYXaJFahsx/7bWSeNJSvoTgofN3qpxTYW
 hGvYzpse1e15Zbj5NaMpot8z3Q6u2PI=
X-Google-Smtp-Source: ABdhPJzp7l7Xv/YLUs2UaAa8kZjiNF1LeRLTRLSNB40ivk8DJIH3k4mWdH/CfWwGsaiWTcw6OZyaaA==
X-Received: by 2002:a17:906:318b:: with SMTP id
 11mr4137248ejy.395.1623922298039; 
 Thu, 17 Jun 2021 02:31:38 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:31:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/45] block/scsi: correctly emulate the VPD block limits page
Date: Thu, 17 Jun 2021 11:30:53 +0200
Message-Id: <20210617093134.900014-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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



