Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C78565E6D
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 22:28:23 +0200 (CEST)
Received: from localhost ([::1]:35054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8SgA-0001QH-58
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 16:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o8Sbk-0005Nw-V1
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 16:23:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o8Sbj-0004WN-CX
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 16:23:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656966226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=euVkicUTpPdXceL+38qNTa68fBMg2NyX6ZJ2vMqZGx0=;
 b=Ep1tiEN31A3xCAUyt/ZmXDGHoviqaeOsxbCMa+uoLaNp4mm5ijW9vtgdBxqPJxuATLHB23
 qbBqu+f9Htd4JNiuLuZGJkAXjgaPhSpHYi3weMzdoRYvaqenrDTXjStKRYKRHb+H6WQlXz
 dgD+VWeO+Id19XUQ/IdJE8sztk7lw2I=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-VBIHVMLTN6Ol2yq7_sqrlA-1; Mon, 04 Jul 2022 16:23:45 -0400
X-MC-Unique: VBIHVMLTN6Ol2yq7_sqrlA-1
Received: by mail-qt1-f199.google.com with SMTP id
 n18-20020ac81e12000000b00318b16f53e0so7518288qtl.5
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 13:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=euVkicUTpPdXceL+38qNTa68fBMg2NyX6ZJ2vMqZGx0=;
 b=i3APtc64pCkgaA6fjBJ12WHks1QiCVk77gRQzKS/PRR/JxQgukcIqzpLkKP6XRexpy
 i34QW6zQGjfXDE1HvevuRlIw/ImS4ZdOyEHzvNPeszUXZvGtJRJeLFrdSzUX2/OTv8WF
 usYedF1GSi70Q2T+lMOTYv0M9KwupSTFFI/gxWkd6PvZoLmPrf1+xqAKGxhJjWR8U+O2
 wcvlWhLhGRVTqr6l05JEjsIKjukf/de4Dw2mBHQZZh1SYZUu13i5QAF+oa4Om02oQrCo
 I5LefF25aLJNb9t7/uX3R4n9HYEbrZKj0UDGpNvpDtYkBf/fX/ifxCfeEjQszEUIoDx9
 HjZQ==
X-Gm-Message-State: AJIora/pqNhHgGvmPpFbd8psD76Le/mYyViEvmfHXNT3cHr7iH33/EEm
 jtLfeaYyXbbVCNUHWytIhA5vDegwCCzP3ZDoQW0+6Hx60hxCFHyRm4/kH/Xf8C+4EMaK6k/5SP4
 6OiV5bZaqYPNN3ao=
X-Received: by 2002:ac8:4b42:0:b0:31b:efb7:7e9c with SMTP id
 e2-20020ac84b42000000b0031befb77e9cmr25147243qts.566.1656966225299; 
 Mon, 04 Jul 2022 13:23:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sA8p8Eiov8KiscSImT+xvwyvH52XO4s2WVAXTP4BevmPC+dZf89XO+HnKAgXfXhQTbIy7wRw==
X-Received: by 2002:ac8:4b42:0:b0:31b:efb7:7e9c with SMTP id
 e2-20020ac84b42000000b0031befb77e9cmr25147232qts.566.1656966225109; 
 Mon, 04 Jul 2022 13:23:45 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7ed:cb75:d392:178:9101:5763])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a05620a0b8b00b006b25570d1c2sm9180127qkh.12.2022.07.04.13.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 13:23:44 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] migration/multifd: Warn user when zerocopy not working
Date: Mon,  4 Jul 2022 17:23:15 -0300
Message-Id: <20220704202315.507145-4-leobras@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220704202315.507145-1-leobras@redhat.com>
References: <20220704202315.507145-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
increment dirty_sync_missed_zero_copy migration stat to let the user know
about it.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 migration/ram.h     | 2 ++
 migration/multifd.c | 2 ++
 migration/ram.c     | 5 +++++
 3 files changed, 9 insertions(+)

diff --git a/migration/ram.h b/migration/ram.h
index ded0a3a086..d3c7eb96f5 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -87,4 +87,6 @@ void ram_write_tracking_prepare(void);
 int ram_write_tracking_start(void);
 void ram_write_tracking_stop(void);
 
+void dirty_sync_missed_zero_copy(void);
+
 #endif
diff --git a/migration/multifd.c b/migration/multifd.c
index 684c014c86..3909b34967 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -624,6 +624,8 @@ int multifd_send_sync_main(QEMUFile *f)
             if (ret < 0) {
                 error_report_err(err);
                 return -1;
+            } else if (ret == 1) {
+                dirty_sync_missed_zero_copy();
             }
         }
     }
diff --git a/migration/ram.c b/migration/ram.c
index 01f9cc1d72..db948c4787 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -407,6 +407,11 @@ static void ram_transferred_add(uint64_t bytes)
     ram_counters.transferred += bytes;
 }
 
+void dirty_sync_missed_zero_copy(void)
+{
+    ram_counters.dirty_sync_missed_zero_copy++;
+}
+
 /* used by the search for pages to send */
 struct PageSearchStatus {
     /* Current block being searched */
-- 
2.36.1


