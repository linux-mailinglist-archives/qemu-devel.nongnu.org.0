Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C293480E9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:49:11 +0100 (CET)
Received: from localhost ([::1]:56492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8Z4-0005fT-M3
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:49:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lP8QQ-0007Oz-3p
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:40:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lP8QN-0006cA-DM
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:40:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616611210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PM6zkCFLhaS1Spp8GGIRs8/5IlGmsui4ppoii8KqbNo=;
 b=FyKAt8dlr1ZtcbaIq+4aSGC9yU87JOgnVj269TlBuByJAwWRCZscf6UAMHRxTPGWofj+Av
 gB9RnSMsBF9dLOPqbeR6p2Na/elDVsOc+aYrtX8Hvd/UB9InZSj+IR5n+0IK4QqjSMgeZc
 EBOsbzTnmafrlz0TpEx5ueYzvLh4pLA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-ABqf2dIKN2ml8Unophp9og-1; Wed, 24 Mar 2021 14:40:09 -0400
X-MC-Unique: ABqf2dIKN2ml8Unophp9og-1
Received: by mail-qk1-f199.google.com with SMTP id b78so2271257qkg.13
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:40:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PM6zkCFLhaS1Spp8GGIRs8/5IlGmsui4ppoii8KqbNo=;
 b=f8zfL/DeGEG9HNRFmspijlLYBavykVUks3JTiUXtrUJJmlrnkbqG+C3BufY0b2JRRL
 7sPD1gPFInlPc23eeCZyMjtou/Tbgb54Q4TJRGYjaDNlBQTRwJzDU9giatBp3EENihX0
 +4hD2kdRysImMfzKkpMkcAk1LRi386b3HoGlDTMDslPculkyhGizYrc70yvFdySTgDCm
 +GyUtSw5IXL9+LqX4bp4Xp/N+3QhI647hf5y/i+mqdXs8qPwmlQzHrhDMIOOBxwAEQnd
 2WjfH6VQVNboSCAYi5FoMEmU3EdH3+Ymzg5g5oxVjXyouMHY4Sw3COS4xDbwjl6gQC7k
 OdKA==
X-Gm-Message-State: AOAM530ZaTBH7elaKDWJm/MXS1X/iVcVc6h505CmLPZ36kNtk1bsi3oF
 b8ODH7WiOpzieKyGGkTC196wf/kT1/Htpz5vvi4D5Z5IJAAhdYqkWkimsoqyNiP6o0tH7qWPXub
 PUYOD1SiHQjFqON5CjkOL78TX41VSpzDed7gz405IOkFAJfzOPlUIPW7RzfX/Plms
X-Received: by 2002:a0c:e38f:: with SMTP id a15mr4757794qvl.18.1616611208364; 
 Wed, 24 Mar 2021 11:40:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtR7gy0uTt757G7Yq0xpkzvQUaxVPPHsZy4MEAOM8uH4NUMkC3EkptCZ4RfLBml69Yb8Mkaw==
X-Received: by 2002:a0c:e38f:: with SMTP id a15mr4757769qvl.18.1616611208146; 
 Wed, 24 Mar 2021 11:40:08 -0700 (PDT)
Received: from xz-x1.redhat.com
 (bras-base-toroon474qw-grc-82-174-91-135-175.dsl.bell.ca. [174.91.135.175])
 by smtp.gmail.com with ESMTPSA id t24sm2001083qto.23.2021.03.24.11.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 11:40:07 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 07/10] KVM: Cache kvm slot dirty bitmap size
Date: Wed, 24 Mar 2021 14:39:51 -0400
Message-Id: <20210324183954.345629-8-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210324183954.345629-1-peterx@redhat.com>
References: <20210324183954.345629-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
index e8795d04f85..4d7ec955b39 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -612,6 +612,7 @@ static void kvm_slot_init_dirty_bitmap(KVMSlot *mem)
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
2.26.2


