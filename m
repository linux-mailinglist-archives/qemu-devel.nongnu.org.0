Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED78544A820
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 09:05:14 +0100 (CET)
Received: from localhost ([::1]:40616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkM82-0001UK-48
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 03:05:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mkM5s-0007pA-EU
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 03:03:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mkM5q-0002BH-Hd
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 03:03:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636444978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OUKFfAX6yAgWVQ2yA8gX+VIYcGaVp+VqS/JRh00nJhQ=;
 b=Ks0W9QShyvommCh+kv133m9aB4QT18xu/L4TSlXG3P14sMao0/AERDELoa6453zQP/2RhL
 gXIyQGZeYD4e2DyCwsYgZvtCDHHEiq8TWv0D93JY9TxW4GQzrt48K9i81tYD7wUl+5QJEZ
 FyBuG3UgrhPYsgzlV2SB/61buM8aQW0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-MC2XV34gPoyLbJXalfJpWw-1; Tue, 09 Nov 2021 03:02:57 -0500
X-MC-Unique: MC2XV34gPoyLbJXalfJpWw-1
Received: by mail-wr1-f69.google.com with SMTP id
 v17-20020adfedd1000000b0017c5e737b02so4602850wro.18
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:02:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OUKFfAX6yAgWVQ2yA8gX+VIYcGaVp+VqS/JRh00nJhQ=;
 b=Y5hMJh6kHEzBzhO0ZQ7UZxgHdSX5cm1iuo6SpDp+N5JzbTLpxSY65xUnbRiiliZ1TS
 M/X4YxsEJbZxvf2or/blmh9xh3qas745G8GdtZOPefbL3m8xi6NDBDhvqYF60qAAQfbU
 JoNN8vg6b6h54xGIl3ThnflhJ8iuukzMxOTcR/lACTrYvJ7dEfP/bzt4RbDmNgIWnkwL
 d2dAulXZkFY4jVlxJI8d4OtC7cvk6uogVw80FbF+844dqK0lHgIp7NRSxcD0yQpUAnH3
 bNb3LiAq5EXCopa3cDgI82aNUvWYZ0lAEGk9X6ZcenGqQb2DFRWnjumQIBHheZQkEVG5
 /WMw==
X-Gm-Message-State: AOAM5302eqZUGJn/P0BuhK+9KYxWs8PY67V5fRnvPtEq1AzXGuXtdGuJ
 rTlI54q0C8NhtOFfUoCSGX7yiymgLA61pWw6pl9AjGE0HmxP32tgZk8ktcjlxB9d3KqD/+v1Pmw
 +6AbM2vCUhsxTqJxspD961tu/Mef1b1FYVnmZjdYDGSft8KYv8Y6S9lOGKg6AG6xBO/Q=
X-Received: by 2002:a5d:65c7:: with SMTP id e7mr6835850wrw.319.1636444974626; 
 Tue, 09 Nov 2021 00:02:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyiFg1owrd0knkd4H0LvtvH0SwbCWhmzK7ckAop6WYRDctG0TzxTnTCZOO9kKj/oygAdorJ4Q==
X-Received: by 2002:a5d:65c7:: with SMTP id e7mr6835816wrw.319.1636444974439; 
 Tue, 09 Nov 2021 00:02:54 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id l5sm1736899wms.16.2021.11.09.00.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 00:02:54 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] Reset the auto-converge counter at every checkpoint.
Date: Tue,  9 Nov 2021 09:02:47 +0100
Message-Id: <20211109080247.62559-4-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109080247.62559-1-quintela@redhat.com>
References: <20211109080247.62559-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, "Rao, Lei" <lei.rao@intel.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

if we don't reset the auto-converge counter,
it will continue to run with COLO running,
and eventually the system will hang due to the
CPU throttle reaching DEFAULT_MIGRATE_MAX_CPU_THROTTLE.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
Tested-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.h  | 1 +
 migration/colo.c | 4 ++++
 migration/ram.c  | 9 +++++++++
 3 files changed, 14 insertions(+)

diff --git a/migration/ram.h b/migration/ram.h
index dda1988f3d..c515396a9a 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -50,6 +50,7 @@ bool ramblock_is_ignored(RAMBlock *block);
 int xbzrle_cache_resize(uint64_t new_size, Error **errp);
 uint64_t ram_bytes_remaining(void);
 uint64_t ram_bytes_total(void);
+void mig_throttle_counter_reset(void);
 
 uint64_t ram_pagesize_summary(void);
 int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len);
diff --git a/migration/colo.c b/migration/colo.c
index e3b1f136f4..2415325262 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -459,6 +459,10 @@ static int colo_do_checkpoint_transaction(MigrationState *s,
     if (ret < 0) {
         goto out;
     }
+
+    if (migrate_auto_converge()) {
+        mig_throttle_counter_reset();
+    }
     /*
      * Only save VM's live state, which not including device state.
      * TODO: We may need a timeout mechanism to prevent COLO process
diff --git a/migration/ram.c b/migration/ram.c
index f48cf4b0a5..863035d235 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -641,6 +641,15 @@ static void mig_throttle_guest_down(uint64_t bytes_dirty_period,
     }
 }
 
+void mig_throttle_counter_reset(void)
+{
+    RAMState *rs = ram_state;
+
+    rs->time_last_bitmap_sync = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
+    rs->num_dirty_pages_period = 0;
+    rs->bytes_xfer_prev = ram_counters.transferred;
+}
+
 /**
  * xbzrle_cache_zero_page: insert a zero page in the XBZRLE cache
  *
-- 
2.33.1


