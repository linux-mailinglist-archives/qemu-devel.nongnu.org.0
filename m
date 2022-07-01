Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E09856376E
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 18:10:41 +0200 (CEST)
Received: from localhost ([::1]:36176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7JE8-0005sR-0b
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 12:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o7J3z-0005uT-7e
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 12:00:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o7J3t-0002AC-QU
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 12:00:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656691204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XkWRw75NKCQHEMUccRCcGQ/SbZMMVw1Ka+VVWT4dy4o=;
 b=Km+v/KD6hwgdwtjfmoNoPSG3SOIn4w9dY+1MA7LrV6rgFSiaIGdtX564ysfMzImj64M/tn
 jsMe8GaXIS6jOGLIx1DwLmAlbyU5ZdzhL9RqGiJo1TFU+19M4QV4mO4kYSwAkVQR/pjdou
 hl6FhpWCi7cQubDNjK6PBKzxc6EKvGo=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-vGLb4WKlOpSGxMejM0t0vg-1; Fri, 01 Jul 2022 12:00:03 -0400
X-MC-Unique: vGLb4WKlOpSGxMejM0t0vg-1
Received: by mail-oi1-f198.google.com with SMTP id
 w82-20020acadf55000000b003358f467974so1558961oig.7
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 09:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XkWRw75NKCQHEMUccRCcGQ/SbZMMVw1Ka+VVWT4dy4o=;
 b=xdAmljf0v4eRidN3anJ6O8Dx9vHWl1QPKsZ3InciHE4ZhldbunsUNp2tgFIoA4Pe/W
 GViHZBC67bXKCNKE5QkOVEA4tgTuYy/PbNfhSOZ98Jf40SmLJ46jsDlYF4obtCgY9G9i
 wb0GNWzTDVQrMuYr/LrXMyK37q6tiR3SRf7hJ27LmfmAyjGd44NVE9hbuR070DATk8qa
 z8GtdnRGfTxvT7VAGqCinsXei6ECC5JzWNCW8QNwiEzjafN575Jh1W9Q+qt1rjKh5Dbp
 Ggp5860I7F1oE/lTkOkHR7usD4EwcBZty9BKhXYA9EEZ0WO5VwG8rj82a4kerAXMNtrv
 xLIg==
X-Gm-Message-State: AJIora8J10Df3xDloFIiQiU+IzVwx4L5Y5yct1/giyu+AHR725vHtxAy
 prbQc15JMC0Lziu1XURGj/M0ebs7jG98Nz2f2kGElfi7tOF9bkwIPrvIJLazo6k6zmLH1Mj5biP
 03K8oemwTq0HoWtQ=
X-Received: by 2002:a05:6870:9711:b0:101:ae38:6c85 with SMTP id
 n17-20020a056870971100b00101ae386c85mr9982928oaq.50.1656691202636; 
 Fri, 01 Jul 2022 09:00:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uVPoEGCKjcPsZAEwzCV5BxxnlYHeirN7Vz5ckTJIeLdtP/ocj6QEVkICIk02cm8D5KFEoZ0g==
X-Received: by 2002:a05:6870:9711:b0:101:ae38:6c85 with SMTP id
 n17-20020a056870971100b00101ae386c85mr9982912oaq.50.1656691202453; 
 Fri, 01 Jul 2022 09:00:02 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f1:da6a:610c:873d:4fe2:e6ce])
 by smtp.gmail.com with ESMTPSA id
 n39-20020a056870972700b000f333ac991fsm14884274oaq.27.2022.07.01.08.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 09:00:01 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] migration/multifd: Warn user when zerocopy not working
Date: Fri,  1 Jul 2022 12:59:36 -0300
Message-Id: <20220701155935.482503-4-leobras@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220701155935.482503-1-leobras@redhat.com>
References: <20220701155935.482503-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Some errors, like the lack of Scatter-Gather support by the network
interface(NETIF_F_SG) may cause sendmsg(...,MSG_ZEROCOPY) to fail on using
zero-copy, which causes it to fall back to the default copying mechanism.

After each full dirty-bitmap scan there should be a zero-copy flush
happening, which checks for errors each of the previous calls to
sendmsg(...,MSG_ZEROCOPY). If all of them failed to use zero-copy, then
increment zero_copy_copied migration stat to let the user know about it.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 migration/ram.h     | 2 ++
 migration/multifd.c | 2 ++
 migration/ram.c     | 5 +++++
 3 files changed, 9 insertions(+)

diff --git a/migration/ram.h b/migration/ram.h
index ded0a3a086..f6753f1354 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -87,4 +87,6 @@ void ram_write_tracking_prepare(void);
 int ram_write_tracking_start(void);
 void ram_write_tracking_stop(void);
 
+void zero_copy_copied(void);
+
 #endif
diff --git a/migration/multifd.c b/migration/multifd.c
index 684c014c86..ff19bd4881 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -624,6 +624,8 @@ int multifd_send_sync_main(QEMUFile *f)
             if (ret < 0) {
                 error_report_err(err);
                 return -1;
+            } else if (ret == 1) {
+                zero_copy_copied();
             }
         }
     }
diff --git a/migration/ram.c b/migration/ram.c
index 01f9cc1d72..0b71993951 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -407,6 +407,11 @@ static void ram_transferred_add(uint64_t bytes)
     ram_counters.transferred += bytes;
 }
 
+void zero_copy_copied(void)
+{
+    ram_counters.zero_copy_copied++;
+}
+
 /* used by the search for pages to send */
 struct PageSearchStatus {
     /* Current block being searched */
-- 
2.36.1


