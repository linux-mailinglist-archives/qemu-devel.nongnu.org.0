Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F502EF63D
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 18:08:37 +0100 (CET)
Received: from localhost ([::1]:50898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxvFc-0003JX-Ua
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 12:08:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kxuyX-00083q-1r
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:50:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kxuyV-0005Qv-C2
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:50:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610124654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lmY2JhNZLUnqHP6NOYqPtDSEUE0yShWpehx9qX7laNk=;
 b=do3V4h2nn3ddqiuppOyN6zmcjcBxKnI2WbgVuG2MLU60Fk1iYKWTvOe6qHAPl1l4/8FJAD
 k0G2cMKS2ze0KsCTwQUHOSnXEuIfB7OXncwv3DAZDoOP68xbrF6sS+Gyf+Cg6/q5oXJlSH
 pzJYKDjTintBagxybUWU3LEs2uycO4g=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-EgtPSOZTOLOmUz9Si841bQ-1; Fri, 08 Jan 2021 11:50:53 -0500
X-MC-Unique: EgtPSOZTOLOmUz9Si841bQ-1
Received: by mail-qk1-f199.google.com with SMTP id y187so9714556qke.20
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 08:50:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lmY2JhNZLUnqHP6NOYqPtDSEUE0yShWpehx9qX7laNk=;
 b=ISt7+DkRWyW5s3u2Kwk9LezEfcx9t3TxFOwzZ+vle3YGHe1wOjPdHOttKGTuEH075F
 6jvvmE2CZADj/hG1krdt3B33CUaM5jKVsvfT0CnPStlMshMPLpBthMD5YFtXhcGAGMM9
 gqxeLWBz6pThfuAdNm2qW2C0SlXefiH3Wn8ykAPB3UWL3Rf4Lb9A0s+lVfBLFSscQ1Bb
 rGrPpSPcO2PcXQQmGIw2yK06iCTqds102rCGn4Drp7RE7+TOwXYVvtr8YAPctWzObPdF
 2vMkY0d9RGGAbbjJmma5jCc7nDG+Ze5CAqijkkHUu2WBAGiZrknz2ZORrrs2y/BBer0u
 7Qxg==
X-Gm-Message-State: AOAM532LfJ2xLS1L9L5tDKm4BCK2mlumznvmhzUQZcLocKnkU49JTUhr
 aAeTG+LUnqj7rPcRJmuNV+B5LRG0Ldc8fYUBqpt/vcLuJ/WYku4WDRW9SSbNm94c6Wi7AJ1PrZN
 eEqsV8m32dgnhZxH87XuyMptCyrHUkKeqUdCfWd88kxbzKk2oKTHch5RWMx+kAXAS
X-Received: by 2002:a37:6144:: with SMTP id v65mr4998901qkb.222.1610124652515; 
 Fri, 08 Jan 2021 08:50:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxAl+Q+j0NU+cIXebbQfJKtY/PvwTUZUVjif2aD5K5P35sw1WC+iLDUnoBOoBS3IU4X6dG6WQ==
X-Received: by 2002:a37:6144:: with SMTP id v65mr4998880qkb.222.1610124652218; 
 Fri, 08 Jan 2021 08:50:52 -0800 (PST)
Received: from xz-x1.redhat.com ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id n5sm4954064qkh.126.2021.01.08.08.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 08:50:51 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/13] KVM: Fixup kvm_log_clear_one_slot() ioctl return
 check
Date: Fri,  8 Jan 2021 11:50:41 -0500
Message-Id: <20210108165050.406906-1-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210108164601.406146-1-peterx@redhat.com>
References: <20210108164601.406146-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

kvm_vm_ioctl() handles the errno trick already for ioctl() on
returning -1 for errors.  Fix this.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 accel/kvm/kvm-all.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 389eaace72..9f779b56ae 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -771,14 +771,13 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
     d.num_pages = bmap_npages;
     d.slot = mem->slot | (as_id << 16);
 
-    if (kvm_vm_ioctl(s, KVM_CLEAR_DIRTY_LOG, &d) == -1) {
-        ret = -errno;
+    ret = kvm_vm_ioctl(s, KVM_CLEAR_DIRTY_LOG, &d);
+    if (ret) {
         error_report("%s: KVM_CLEAR_DIRTY_LOG failed, slot=%d, "
                      "start=0x%"PRIx64", size=0x%"PRIx32", errno=%d",
                      __func__, d.slot, (uint64_t)d.first_page,
                      (uint32_t)d.num_pages, ret);
     } else {
-        ret = 0;
         trace_kvm_clear_dirty_log(d.slot, d.first_page, d.num_pages);
     }
 
-- 
2.26.2


