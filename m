Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDF33D9554
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 20:34:20 +0200 (CEST)
Received: from localhost ([::1]:35014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8oNn-0000HZ-Rk
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 14:34:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8oLg-0005sM-Is
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:32:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8oLc-00073H-8O
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:32:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627497123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cv//UpWaAePYoX9vAmEeSqOa6nYsBvCOheG0gcBITT0=;
 b=bVo/9MfWW/CfooNM8tNRP+Vp01evH0FkZmejkL7T67IYyg1u/7Y9Imus7StHY6QyhsJs/H
 Ch92gqcsngZ2+Uadw0RA38mLsTjM94OzORHQL3P/Uj5UcpYXHnlTwMxAesgpzK98mGUpHU
 qJXTWVal3SbfOY3GnwobmzbEfJjtygo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49--Suu1hjnMXeEd_taNQ7YGQ-1; Wed, 28 Jul 2021 14:32:02 -0400
X-MC-Unique: -Suu1hjnMXeEd_taNQ7YGQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 v16-20020a0562140510b029032511e85975so2424007qvw.23
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 11:32:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cv//UpWaAePYoX9vAmEeSqOa6nYsBvCOheG0gcBITT0=;
 b=ODGaO+7/DDKehS0xp0zevZyTH48xR879Y8hWqfkHEQzpzxgPALaunFqeQJipNzTWP2
 yOBPRNz0jZLQo4EalYK8gAxnjyZaLDc9XtsYjIQVa2OV5Wrntu22JvqYylq+eIS3vqzS
 hHZ6N9OquHUQQ2udzsQ2oUlHCCXgBXxIsi9sf7j5675xwoaeWO3XVtXMTXekCZ0ORnmE
 pLTxMnQnJ+lE5e0AlBvfYW7mtNXg5liwPe/+jEu8e8bUU53xJzg3LvGZip2r0+7U2qcg
 PXEnlgWF9UIveIVKEh7oGYi0fwba4jAYghsYU+prKW+BT7miS9LxQF+zXzAXjaxZFSq6
 OZDg==
X-Gm-Message-State: AOAM533Z5/IuL2b0bh0s+lZH3mmLPbvfAxkcKQdDImNvloa0kl+nt3xK
 MJGS6FSVK0fnHdFJ8ZErbfIPptyLXA3Tclg7OLuaomI951DGdt7JT4KxciFtY1rhblsVvKwBLtt
 nBGOzaaaE6x2LBdUoh5QVbAHbeiDX6VwE/2qCpyAtGzw98ny+bIzngIAB7HjmWqgq
X-Received: by 2002:a37:e15:: with SMTP id 21mr1082172qko.184.1627497120153;
 Wed, 28 Jul 2021 11:32:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFNq9xBhqGgHL2NL9jbxxACJukPayGvMwPXlAz4MAKETMuQPXBw428TOxc9IhjFOmyhkje0A==
X-Received: by 2002:a37:e15:: with SMTP id 21mr1082140qko.184.1627497119883;
 Wed, 28 Jul 2021 11:31:59 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id n5sm417528qkp.116.2021.07.28.11.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 11:31:59 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/8] memory: Introduce
 memory_region_transaction_depth_{inc|dec}()
Date: Wed, 28 Jul 2021 14:31:46 -0400
Message-Id: <20210728183151.195139-4-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728183151.195139-1-peterx@redhat.com>
References: <20210728183151.195139-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 peterx@redhat.com, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

memory_region_transaction_{begin|commit}() could be too big when finalizing a
memory region.  E.g., we should never attempt to update address space topology
during the finalize() of a memory region.  Provide helpers for further use.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 softmmu/memory.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index bfedaf9c4d..725d57ec17 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1079,10 +1079,20 @@ static void address_space_update_topology(AddressSpace *as)
     address_space_set_flatview(as);
 }
 
+static void memory_region_transaction_depth_inc(void)
+{
+    memory_region_transaction_depth++;
+}
+
+static void memory_region_transaction_depth_dec(void)
+{
+    memory_region_transaction_depth--;
+}
+
 void memory_region_transaction_begin(void)
 {
     qemu_flush_coalesced_mmio_buffer();
-    ++memory_region_transaction_depth;
+    memory_region_transaction_depth_inc();
 }
 
 void memory_region_transaction_commit(void)
@@ -1092,7 +1102,7 @@ void memory_region_transaction_commit(void)
     assert(memory_region_transaction_depth);
     assert(qemu_mutex_iothread_locked());
 
-    --memory_region_transaction_depth;
+    memory_region_transaction_depth_dec();
     if (!memory_region_transaction_depth) {
         if (memory_region_update_pending) {
             flatviews_reset();
-- 
2.31.1


