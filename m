Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD4C44D5A4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 12:14:34 +0100 (CET)
Received: from localhost ([::1]:45650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml82L-00014c-94
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 06:14:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ml7uk-0004gE-II
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:06:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ml7ui-0001gb-Cd
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:06:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636628799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sMO0bIfK1Ppus8zjxWVQv19QM2hAIvZ3MBFsjSxouvY=;
 b=ED1gFx5O1DNXxLgdlP+CUSSzqbHW5L/BZawQAzYBlbEB3n/rYs2fNsKoyo8XGHTNdhRkqM
 cIlJywI2tmbDh6xVex2EJ0Y37Ydm/X9zCcisRe+OIq4a6wzwfcgeikCGgybzPkyT9pHNIO
 IcKDValoQO7nyPOiloYrBDWkB9aMTRI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-V0waNlmjN16bxSs6mgx6wA-1; Thu, 11 Nov 2021 06:06:36 -0500
X-MC-Unique: V0waNlmjN16bxSs6mgx6wA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7C041006AA0;
 Thu, 11 Nov 2021 11:06:35 +0000 (UTC)
Received: from avogadro.lan (unknown [10.39.194.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75E4D1048128;
 Thu, 11 Nov 2021 11:06:34 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] virtio-gpu: do not byteswap padding
Date: Thu, 11 Nov 2021 12:06:00 +0100
Message-Id: <20211111110604.207376-2-pbonzini@redhat.com>
In-Reply-To: <20211111110604.207376-1-pbonzini@redhat.com>
References: <20211111110604.207376-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: cohuck@redhat.com, mst@redhat.com, alex.bennee@linaro.org,
 mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In Linux 5.16, the padding of struct virtio_gpu_ctrl_hdr has become a
single-byte field followed by a uint8_t[3] array of padding bytes,
and virtio_gpu_ctrl_hdr_bswap does not compile anymore.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/hw/virtio/virtio-gpu-bswap.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/virtio/virtio-gpu-bswap.h b/include/hw/virtio/virtio-gpu-bswap.h
index e2bee8f595..5faac0d8d5 100644
--- a/include/hw/virtio/virtio-gpu-bswap.h
+++ b/include/hw/virtio/virtio-gpu-bswap.h
@@ -24,7 +24,6 @@ virtio_gpu_ctrl_hdr_bswap(struct virtio_gpu_ctrl_hdr *hdr)
     le32_to_cpus(&hdr->flags);
     le64_to_cpus(&hdr->fence_id);
     le32_to_cpus(&hdr->ctx_id);
-    le32_to_cpus(&hdr->padding);
 }
 
 static inline void
-- 
2.33.1



