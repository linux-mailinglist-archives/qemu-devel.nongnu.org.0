Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6461443E90
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 09:50:07 +0100 (CET)
Received: from localhost ([::1]:33064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miByA-00074z-Ue
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 04:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miBuf-0008GN-GV
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:46:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miBuY-0003WC-NQ
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:46:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635929181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SEXspVMmfGtE+DiNvaMKmF2UapwNbWjKsW47Dll7cHM=;
 b=Bj61xHjmcdeBzHJtOnlLxo9L+Xd7oje0T47TGrjh9ogR5Wkgvpl2oPY7fc5s/mlEvv3jKt
 xZpQhbke0ATdAUVgWq5M7lH0cp1zKxW3OjNoHBGQAPwY3ET+92ed0B5t7cgZ1nHipaUJT5
 lmqdrFMZfItVVueU2vDgJhNE5O6tVuE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-EcZK14JsMdO_9qqu44LyMg-1; Wed, 03 Nov 2021 04:46:20 -0400
X-MC-Unique: EcZK14JsMdO_9qqu44LyMg-1
Received: by mail-wr1-f71.google.com with SMTP id
 k8-20020a5d5248000000b001763e7c9ce5so271862wrc.22
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 01:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SEXspVMmfGtE+DiNvaMKmF2UapwNbWjKsW47Dll7cHM=;
 b=ZK/JHNLyjmLfW5tbA2LO2rvEI0B0YP3eIbuwbLFhC0aGeBUhIOTNeWNrE1/d9SFeu2
 veHz/IGAgI3eTqVfbVNE71csD5Y3yX94eGyWY3V4KW4hNHEKKZDHjlEqeTfQoNOVU5yf
 EFSkwd2UvYtjxlnha9vHrJrAZSZ4NY7Zk72fNqCfJCEFUoVuk+G7Atf0CtgkudVzgWug
 sjqkojkNRYPxpxk71Nem53EXtgTnGNNCKk+l7tcsEKjEcFzGbPmRbrsFqY6VNrMABst8
 AQGpeHAD26Er4+JqUq/69TLlqMvlDtBpE70QbVHS3KimbYQZHwNXxOaNj2cIkRVoJk2e
 3HYQ==
X-Gm-Message-State: AOAM532EA2wHiaI16mmfDykqqzIHfG5RWVGafHaH+MsyDUk0ed8+StTb
 1fX8ffxM6uafGjpS0LSmmZ/cM08r4mKikIYMErGf0BflQXKInILOqekGGuB98vU7O6rZPlvgWxg
 jakTzd/m9dh4lxsEQHXhHo5xegh9XT4pRmboWWqKrDTw4ECcE7PoVBfieMwnWBEkHrtQ=
X-Received: by 2002:a5d:584c:: with SMTP id i12mr15312528wrf.95.1635929179416; 
 Wed, 03 Nov 2021 01:46:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSDMfRozQs83jQd6/fnc3G6crCnW7enJimwHWTs3QMH9oJ4TlgxRw5t/BvyUorRpFyMLMR+Q==
X-Received: by 2002:a5d:584c:: with SMTP id i12mr15312506wrf.95.1635929179182; 
 Wed, 03 Nov 2021 01:46:19 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id q4sm1319511wrs.56.2021.11.03.01.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 01:46:18 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/11] Changed the last-mode to none of first start COLO
Date: Wed,  3 Nov 2021 09:46:03 +0100
Message-Id: <20211103084605.20027-10-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103084605.20027-1-quintela@redhat.com>
References: <20211103084605.20027-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zhang Chen <chen.zhang@intel.com>, "Rao, Lei" <lei.rao@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

When we first stated the COLO, the last-mode is as follows:
{ "execute": "query-colo-status" }
{"return": {"last-mode": "primary", "mode": "primary", "reason": "none"}}

The last-mode is unreasonable. After the patch, will be changed to the
following:
{ "execute": "query-colo-status" }
{"return": {"last-mode": "none", "mode": "primary", "reason": "none"}}

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/colo.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/migration/colo.c b/migration/colo.c
index 71fc82a040..e3b1f136f4 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -205,7 +205,7 @@ void colo_do_failover(void)
         vm_stop_force_state(RUN_STATE_COLO);
     }
 
-    switch (get_colo_mode()) {
+    switch (last_colo_mode = get_colo_mode()) {
     case COLO_MODE_PRIMARY:
         primary_vm_do_failover();
         break;
@@ -530,8 +530,7 @@ static void colo_process_checkpoint(MigrationState *s)
     Error *local_err = NULL;
     int ret;
 
-    last_colo_mode = get_colo_mode();
-    if (last_colo_mode != COLO_MODE_PRIMARY) {
+    if (get_colo_mode() != COLO_MODE_PRIMARY) {
         error_report("COLO mode must be COLO_MODE_PRIMARY");
         return;
     }
@@ -830,8 +829,7 @@ void *colo_process_incoming_thread(void *opaque)
     migrate_set_state(&mis->state, MIGRATION_STATUS_ACTIVE,
                       MIGRATION_STATUS_COLO);
 
-    last_colo_mode = get_colo_mode();
-    if (last_colo_mode != COLO_MODE_SECONDARY) {
+    if (get_colo_mode() != COLO_MODE_SECONDARY) {
         error_report("COLO mode must be COLO_MODE_SECONDARY");
         return NULL;
     }
-- 
2.33.1


