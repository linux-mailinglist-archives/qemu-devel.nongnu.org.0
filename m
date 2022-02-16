Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2027E4B80BA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 07:33:20 +0100 (CET)
Received: from localhost ([::1]:33132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKDsM-0006YB-Rd
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 01:33:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDnt-0003ts-Cu
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:28:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDnp-0006Bs-UU
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:28:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644992917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mnyPMZa4z+deUcT+LDnCHdFNt3ymR9XevyYLDisMNNM=;
 b=LZX6Ps0GvbZpGenoBsekhYd0Gwv94eOy773RkvDqbd5jp7TRpPv5sP+PsmrC+dORM+d1uL
 qN3nehFgidpH/s5Um2ecz1FJYrdsO8FriivRa7pub5yK9Oo/wufxY/6IZx3N52P/jWHP7c
 gu4iDq5zRfO7RIe9T4iqf7EDoFmSH5o=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-0TSpdulrP6KH_Kh5W2wYIQ-1; Wed, 16 Feb 2022 01:28:35 -0500
X-MC-Unique: 0TSpdulrP6KH_Kh5W2wYIQ-1
Received: by mail-pl1-f197.google.com with SMTP id
 y3-20020a1709029b8300b0014c8bcb70a1so695486plp.3
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:28:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mnyPMZa4z+deUcT+LDnCHdFNt3ymR9XevyYLDisMNNM=;
 b=7nSZptA3wQdoPz1ZCn8/7F8rXFKD5ALsEm/45PU+qXpAXWU7g2BEkEmMLa9iEq2uw6
 Lm5Bue8ANfXanV4LxJPZooWCR3Y+6QewROp3AY2H83CiG4d3MQAyTDghr6r6wpqch4NP
 gUhzoN1snU4VEM17YweH4twSge/zZCJ2ELGnCZ4KlMnz3JtNS4Bh+gLxQTPibOBJcxKU
 EgbnaB38aUSsk4O8ZqXAUP26AWwtI+qWYdR/qGDf3vttmcOH4QPVQlDSFWOPhcdJKA5e
 CRS0AQj09gIAnl9vscAGhAeq2w19/0o8oAi2sE31uISJAxZJUbl37UaYVS+wIX5W2xsN
 8ghA==
X-Gm-Message-State: AOAM531A1kfOJIFHH+cZT1bKjrDw6NLgWl9wCLQAmKcTlHRHhTafL8+a
 RfwgRjB2GijcvGooKUFLWaYWmxnVPK5P8gPKIWcvfMRwB2BiHou/rlYEs1DVPgOFWd7KlVMgLfs
 cWdAN96wXWWqhLyA10Jk/0WDCh/zlmLr6UOI1A32qTg/ZVupO0H5b+NOAw3paNlaK
X-Received: by 2002:a17:902:e88d:b0:14f:446b:264b with SMTP id
 w13-20020a170902e88d00b0014f446b264bmr1438675plg.166.1644992914665; 
 Tue, 15 Feb 2022 22:28:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyB/ELyyp+00bUdVZaqbtySRmLkLL4bt5IyanNl+ZiOnG4/ezk/qVqCOaEAzJsOD/pvEBRw8A==
X-Received: by 2002:a17:902:e88d:b0:14f:446b:264b with SMTP id
 w13-20020a170902e88d00b0014f446b264bmr1438653plg.166.1644992914301; 
 Tue, 15 Feb 2022 22:28:34 -0800 (PST)
Received: from localhost.localdomain ([64.64.123.81])
 by smtp.gmail.com with ESMTPSA id 17sm42104657pfl.175.2022.02.15.22.28.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 22:28:34 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/20] migration: Dump sub-cmd name in loadvm_process_command
 tp
Date: Wed, 16 Feb 2022 14:27:50 +0800
Message-Id: <20220216062809.57179-2-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220216062809.57179-1-peterx@redhat.com>
References: <20220216062809.57179-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It'll be easier to read the name rather than index of sub-cmd when debugging.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/savevm.c     | 3 ++-
 migration/trace-events | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 1599b02fbc..7bb65e1d61 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2273,12 +2273,13 @@ static int loadvm_process_command(QEMUFile *f)
         return qemu_file_get_error(f);
     }
 
-    trace_loadvm_process_command(cmd, len);
     if (cmd >= MIG_CMD_MAX || cmd == MIG_CMD_INVALID) {
         error_report("MIG_CMD 0x%x unknown (len 0x%x)", cmd, len);
         return -EINVAL;
     }
 
+    trace_loadvm_process_command(mig_cmd_args[cmd].name, len);
+
     if (mig_cmd_args[cmd].len != -1 && mig_cmd_args[cmd].len != len) {
         error_report("%s received with bad length - expecting %zu, got %d",
                      mig_cmd_args[cmd].name,
diff --git a/migration/trace-events b/migration/trace-events
index 48aa7b10ee..123cfe79d7 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -22,7 +22,7 @@ loadvm_postcopy_handle_resume(void) ""
 loadvm_postcopy_ram_handle_discard(void) ""
 loadvm_postcopy_ram_handle_discard_end(void) ""
 loadvm_postcopy_ram_handle_discard_header(const char *ramid, uint16_t len) "%s: %ud"
-loadvm_process_command(uint16_t com, uint16_t len) "com=0x%x len=%d"
+loadvm_process_command(const char *s, uint16_t len) "com=%s len=%d"
 loadvm_process_command_ping(uint32_t val) "0x%x"
 postcopy_ram_listen_thread_exit(void) ""
 postcopy_ram_listen_thread_start(void) ""
-- 
2.32.0


