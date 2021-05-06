Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C81037587E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 18:33:55 +0200 (CEST)
Received: from localhost ([::1]:40208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1legwk-0005g6-5P
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 12:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1legW5-0004Xf-9s
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:06:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1legVz-0003eS-Nj
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:06:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620317175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3hEMDIt72dK79rkwjKZwzBlNWlqk9Cujj6vHcXwHvIY=;
 b=fdFG8E8cOJQUyxY/lh3iKl9rI2PbtiyU3ToFyV9sNTZ+XXZTVQxYfoyB/5RJKOq0KfKUUj
 H/C1wedU9thZxGZdUpwjy6gDhxYqf0v6MB2VNYwE40ogZrgrUNy7P57sWT8/7P0O2KNIV0
 GPvb5mF7NZt0ZAUg4fzJscY9x+MIbnI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-MnXuZ3lDOqWJqiGoLrebYA-1; Thu, 06 May 2021 12:06:13 -0400
X-MC-Unique: MnXuZ3lDOqWJqiGoLrebYA-1
Received: by mail-qk1-f200.google.com with SMTP id
 e4-20020a37b5040000b02902df9a0070efso3783726qkf.18
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 09:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3hEMDIt72dK79rkwjKZwzBlNWlqk9Cujj6vHcXwHvIY=;
 b=ljpMv8GR4bGy1LyIXDWX4zTSMb5wcS1wFZM8hu7QlzXy7Wb/Z8FWT+g8Mer2plaH+d
 CLxzoE7iXpON96xskJ7to1E9126C5Oh2L6RN1BYgfBYZ/us2lkwVE2vI28AC9bMeqBPL
 Hk0cqUfwzzj69tcvgyh8xTCtnQDp7hLoRag1GH/ghp+XqgFBSH5AA3GwgNUpcTzVxONr
 jQeeE/gzGLh0KJnhbbUShNLuCBpppcj/bs4R74YUM6t3Z9wZ/VxUHuZVLAeL4Wn/m4V+
 4JBr1CQRT8jwKMhDlVBE0J9NW5p4t25Bo+DDLFv2bNWmiv7boQ0hQ/oFZn5TBuHmE6sJ
 WarA==
X-Gm-Message-State: AOAM531d+T2MIVzzaZ2zsaAOug+QJBAnJFkZszzj2NHUojuUcq8WbX3M
 jZVBzgAvppLSwwaXYtHcH8HHcnYTwRG9UJXIsJ26tXRYEvMb1TNg+VanwpufGPAzoSazE11H5Hj
 Xus5uRugCc7imvESbbQtpmZB++O+nGEYizQmSfoZECCj5ceNd47VrlUS09/Krt694
X-Received: by 2002:a05:620a:cca:: with SMTP id
 b10mr4734802qkj.136.1620317171540; 
 Thu, 06 May 2021 09:06:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxh+pWGMI9EBgVfGYEA/xDFXXiDokXkmQ5vyNU0pyVmtKfkF6JEhkQZN3plI4F7aLL1RwmOlQ==
X-Received: by 2002:a05:620a:cca:: with SMTP id
 b10mr4734369qkj.136.1620317166825; 
 Thu, 06 May 2021 09:06:06 -0700 (PDT)
Received: from t490s.redhat.com
 (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca. [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id y84sm2194131qkb.134.2021.05.06.09.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 09:06:05 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 07/10] KVM: Cache kvm slot dirty bitmap size
Date: Thu,  6 May 2021 12:05:46 -0400
Message-Id: <20210506160549.130416-8-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210506160549.130416-1-peterx@redhat.com>
References: <20210506160549.130416-1-peterx@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>,
 Hyman <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cache it too because we'll reference it more frequently in the future.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 accel/kvm/kvm-all.c      | 1 +
 include/sysemu/kvm_int.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 4b786240a04..4af61734e37 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -610,6 +610,7 @@ static void kvm_slot_init_dirty_bitmap(KVMSlot *mem)
     hwaddr bitmap_size = ALIGN(mem->memory_size / qemu_real_host_page_size,
                                         /*HOST_LONG_BITS*/ 64) / 8;
     mem->dirty_bmap = g_malloc0(bitmap_size);
+    mem->dirty_bmap_size = bitmap_size;
 }
 
 /*
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index ab09a150e19..c788452cd96 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -23,6 +23,7 @@ typedef struct KVMSlot
     int old_flags;
     /* Dirty bitmap cache for the slot */
     unsigned long *dirty_bmap;
+    unsigned long dirty_bmap_size;
     /* Cache of the address space ID */
     int as_id;
     /* Cache of the offset in ram address space */
-- 
2.31.1


