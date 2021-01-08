Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B222EF641
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 18:10:53 +0100 (CET)
Received: from localhost ([::1]:57654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxvHo-00069D-2R
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 12:10:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kxuyf-0008Ki-75
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:51:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kxuyd-0005Zb-0y
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:51:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610124662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tdRYwi1n/ySy5+jKgo9vf500HBDzPxH/huLrT21cayg=;
 b=ELDn7awrvCd28ICAtejNtLjaqwPhkpKnsoKpz5h8+Z0ReI1mJ036zoSRv2C8Y4uohIdHjg
 9Evq/FNbW/NOpBEOiXIZ5GWXHRigRcaB1Yi7b4Po3L070rRHJTRJGooV/DDjgRLtqykWKk
 ASUfW1K6Ju3vyA6LmohjhJW9vpWQPI0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-JlSdfmCEOZ6VLlLH8pkO2Q-1; Fri, 08 Jan 2021 11:50:59 -0500
X-MC-Unique: JlSdfmCEOZ6VLlLH8pkO2Q-1
Received: by mail-qv1-f69.google.com with SMTP id l3so8641242qvr.10
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 08:50:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tdRYwi1n/ySy5+jKgo9vf500HBDzPxH/huLrT21cayg=;
 b=AHC9zy1pdpBPMoZX/8SQyJ1eDfCBWlzw32VrbAQROZtXH3eoSglnjPfdENu+OgAeYj
 bC5LKahUP8JHS71ux2vNwIsrS2pf1S7m6Aq5V5ORJk7y4ouCynonpNHE+br/QahrTiDd
 fx4voaN5ohmYYuUYauNuIPFPT3iokswK88605HQVprVR3+MmqoIQ9VSqTUxJTc5gG2Kj
 cABtXfJny46OD3UT4ltFWl6Jv5dLWa6U0pBHZxspW4Qc2+qG7+UHqrKSEfT4FdQW1Zyt
 ywQw5LS+sRzPlXtdV++dnsGjQ4vh+tujAzzPuBIMJ/TYf49yDORJqC/vFaQqiVJpk9JF
 Y5yA==
X-Gm-Message-State: AOAM533simOlaYi+SsG7k8Kif1yqw9B4Qu+hFyXanui4m86Aopa0fFXb
 foxIpiq9H3AlW2flUdY5Jdy6tsdHBmT3m/3pUvNt2LNjdr07N3O0o6SmT3+9c7hg2w5JYMyaK3z
 VcqgfKI6E3yG9ZXsx9LXZAfR/+6AWQJv0tQSPlz7aFUCXXb1IxEeXC61h9x97LRpz
X-Received: by 2002:ae9:f70a:: with SMTP id s10mr4560245qkg.416.1610124659058; 
 Fri, 08 Jan 2021 08:50:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJys45ZYOwGtpILCQ8dlmTnUyeC/uyQtTs4DFBam1i1MYMR5+WZFOZZbtAqZoDjagxa6XIq6Gw==
X-Received: by 2002:ae9:f70a:: with SMTP id s10mr4560207qkg.416.1610124658623; 
 Fri, 08 Jan 2021 08:50:58 -0800 (PST)
Received: from xz-x1.redhat.com ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id n5sm4954064qkh.126.2021.01.08.08.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 08:50:57 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/13] KVM: Simplify dirty log sync in kvm_set_phys_mem
Date: Fri,  8 Jan 2021 11:50:46 -0500
Message-Id: <20210108165050.406906-6-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210108165050.406906-1-peterx@redhat.com>
References: <20210108164601.406146-1-peterx@redhat.com>
 <20210108165050.406906-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.247,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hyman <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

kvm_physical_sync_dirty_bitmap() on the whole section is inaccurate, because
the section can be a superset of the memslot that we're working on.  The result
is that if the section covers multiple kvm memslots, we could be doing the
synchronization for multiple times for each kvmslot in the section.

With the two helpers that we just introduced, it's very easy to do it right now
by calling the helpers.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 accel/kvm/kvm-all.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index c7c7627c82..9cb06ec4d1 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1171,7 +1171,8 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
                 goto out;
             }
             if (mem->flags & KVM_MEM_LOG_DIRTY_PAGES) {
-                kvm_physical_sync_dirty_bitmap(kml, section);
+                kvm_slot_get_dirty_log(kvm_state, mem);
+                kvm_slot_sync_dirty_pages(mem);
             }
 
             /* unregister the slot */
-- 
2.26.2


