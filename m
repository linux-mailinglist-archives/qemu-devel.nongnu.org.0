Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E583462FAF
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 10:31:55 +0100 (CET)
Received: from localhost ([::1]:58136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrzUQ-00070b-Ft
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 04:31:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mrzRr-0005wC-9b
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 04:29:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mrzRn-0000ZD-MX
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 04:29:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638264545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=T45udelRN4jCAli++S7zTdNbPiRELTZxwaBaJ5AQgdw=;
 b=TykRbXePY3HHBQTONK8T6jC+/ljU0G9R2Ip73I/QrhdZU/oNy9WggAorXZS3l0xs4RoSNB
 BqGA8kcgqIt/sQZBkfC6u7ooRGiTai4/XZq1NhDE36AcSJ5GHvsxXK4wzGSkRLgZRh7Z5V
 lgEVwUSkoNgQW2VRWmHSkvGmnUmXDFE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-Y6AppQs-OkWb-B3_FrxKYQ-1; Tue, 30 Nov 2021 04:29:02 -0500
X-MC-Unique: Y6AppQs-OkWb-B3_FrxKYQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE559100D681;
 Tue, 30 Nov 2021 09:29:00 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98F301972D;
 Tue, 30 Nov 2021 09:28:39 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/3] virtio-mem: Support VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
Date: Tue, 30 Nov 2021 10:28:35 +0100
Message-Id: <20211130092838.24224-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Gavin Shan <gshan@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Hui Zhu <teawater@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Support VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE in QEMU, which indicates to
a guest that we don't support reading unplugged memory. We indicate
the feature based on a new "unplugged-inaccessible" property available
for x86 targets only (the only ones with legacy guests). Guests that don't
support VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE will fail initialization if
indicated/required by the hypervisor.

For example, Linux guests starting with v5.16 will support
VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE.

For future targets that don't have legacy guests (especially arm64), we'll
always indicate VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE.

More details can be found in the description of patch #2.

"
For existing compat machines, the property will default to "off", to
not change the behavior but eventually warn about a problematic setup.
Short-term, we'll set the property default to "auto" for new QEMU machines.
Mid-term, we'll set the property default to "on" for new QEMU machines.
Long-term, we'll deprecate the parameter and disallow legacy guests
completely.
"

TODO: Once 6.2 was release, adjust patch #3. Replace patch #1 by a proper
      Linux header sync.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Gavin Shan <gshan@redhat.com>
Cc: Hui Zhu <teawater@gmail.com>
Cc: Sebastien Boeuf <sebastien.boeuf@intel.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>

David Hildenbrand (3):
  linux-headers: sync VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
  virtio-mem: Support VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
  virtio-mem: Set "unplugged-inaccessible=auto" for the 6.2 machine on
    x86

 hw/i386/pc.c                                |  1 +
 hw/virtio/virtio-mem.c                      | 63 +++++++++++++++++++++
 include/hw/virtio/virtio-mem.h              |  8 +++
 include/standard-headers/linux/virtio_mem.h |  9 ++-
 4 files changed, 78 insertions(+), 3 deletions(-)

-- 
2.31.1


