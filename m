Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 458995B31B9
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 10:31:33 +0200 (CEST)
Received: from localhost ([::1]:41832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWZQC-0005GN-AU
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 04:31:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oWZ7N-0008DL-TD
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 04:12:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oWZ7J-0003Ph-6l
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 04:12:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662711120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dv8E089/Ce3sIyDZyw/7/MM/uy1FTYMuPvEb8JTQjDM=;
 b=ARTv0ijpj7KkYRgJAy3+ExqYbIR9hR1y46KY02ECogp/L9JkEwXdTdoTojX9ouNMFI1rf7
 s94ZnCUKbEi9esKxJyHnwRPq3EK0O1+cJWJ36nfMVu0rJgNDURm6DC+R+a+Pl8gekvQ1km
 J4ZJXS2N3TQwLsbowtwHe6J+Zzo6/TI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-1dsDE7UqPz6AH0JP1Uuj6w-1; Fri, 09 Sep 2022 04:11:56 -0400
X-MC-Unique: 1dsDE7UqPz6AH0JP1Uuj6w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 263E0101E167;
 Fri,  9 Sep 2022 08:11:56 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4D2A400EA8F;
 Fri,  9 Sep 2022 08:11:55 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [RFC PATCH v2 1/3] linux-headers/linux/kvm.h: introduce
 kvm_userspace_memory_region_list ioctl
Date: Fri,  9 Sep 2022 04:11:48 -0400
Message-Id: <20220909081150.709060-2-eesposit@redhat.com>
In-Reply-To: <20220909081150.709060-1-eesposit@redhat.com>
References: <20220909081150.709060-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Introduce new KVM_SET_USER_MEMORY_REGION_LIST ioctl and
kvm_userspace_memory_region_list that will be used to pass
multiple memory region updates at once to KVM.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 linux-headers/linux/kvm.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index f089349149..671cdfb8de 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -103,6 +103,24 @@ struct kvm_userspace_memory_region {
 	__u64 userspace_addr; /* start of the userspace allocated memory */
 };
 
+/* for KVM_SET_USER_MEMORY_REGION_LIST */
+struct kvm_userspace_memory_region_entry {
+	__u32 slot;
+	__u32 flags;
+	__u64 guest_phys_addr;
+	__u64 memory_size; /* bytes */
+	__u64 userspace_addr; /* start of the userspace allocated memory */
+	__u8 invalidate_slot;
+	__u8 padding[31];
+};
+
+/* for KVM_SET_USER_MEMORY_REGION_LIST */
+struct kvm_userspace_memory_region_list {
+	__u32 nent;
+	__u32 flags;
+	struct kvm_userspace_memory_region_entry entries[0];
+};
+
 /*
  * The bit 0 ~ bit 15 of kvm_memory_region::flags are visible for userspace,
  * other bits are reserved for kvm internal use which are defined in
@@ -1426,6 +1444,8 @@ struct kvm_vfio_spapr_tce {
 					struct kvm_userspace_memory_region)
 #define KVM_SET_TSS_ADDR          _IO(KVMIO,   0x47)
 #define KVM_SET_IDENTITY_MAP_ADDR _IOW(KVMIO,  0x48, __u64)
+#define KVM_SET_USER_MEMORY_REGION_LIST _IOW(KVMIO, 0x49, \
+					struct kvm_userspace_memory_region_list)
 
 /* enable ucontrol for s390 */
 struct kvm_s390_ucas_mapping {
-- 
2.31.1


