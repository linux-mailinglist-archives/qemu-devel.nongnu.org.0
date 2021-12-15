Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93913476361
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 21:33:59 +0100 (CET)
Received: from localhost ([::1]:48426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxayM-0001Ku-O8
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 15:33:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxaq3-0003sA-2n
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:25:24 -0500
Received: from [2a00:1450:4864:20::436] (port=39581
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxaq1-0004DZ-Jm
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:25:22 -0500
Received: by mail-wr1-x436.google.com with SMTP id a18so40252400wrn.6
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 12:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uf4qVKV+VM4gp+Wsi9C+4sdsjN8UZQNXDD9C5n6WNw4=;
 b=FyNL1KzHSUS7b6bkrcqluLpmcxj7DFLDb2B16rsrsNFbieERPNYpRQ905tmFhqihct
 XMYtMfYWVJEWA7j2Dm33TYJ8OjF3gULqjK9X0yi1K+2EnEYbuTblSEDWyGhvCYfqXcGM
 8KZxT+greWHWQUdNKKs05tlWwhbDC0bciQRfECxaKwVgNVgsTr/6d/ZGpl8k57InYF32
 UGtav0n9WFsnFZENi00HukBFr3cah/Q/U00P6Jh3meSf9GySxTB2N8DRvgWdFHLv5Nfo
 4Cg4yEqla8VjO/59Iei6CTqUi0J54FdZb1QIy4Hvg0fe9YGCq2OTT/SJWHhbdXrtwTIE
 xyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uf4qVKV+VM4gp+Wsi9C+4sdsjN8UZQNXDD9C5n6WNw4=;
 b=IjNE8bVp/+bLaztJ8Jaw72FNc6UJQFsfNmPnnVn5DLDTpGROkNuvKitHjG5XXkwwEN
 Bv3Z5aTQNhBwNCieRZ19/7OiaRHZFETOttn8CWHVbVbQl5h/AEh8YRG/co1tgsu0RgDP
 cST9r2HWM5JWF/ca/AWfCNnr4luceXKiuSR8tHAiPqaBr2fMubas8dEpULlvPlN8BJ7e
 roRmeGohSIffxg/q/iF5POnA1dX4Arp8uT/JYkbwRMfUrqh2wnUZ3bYWUhzZ4e14QhLl
 mwALb5q7PLXHSx7YIXIo+jXJtKV5KKGhYq1iDOl1gke2tbGxVwyOjvuFbtR9nBug8nto
 Gx3A==
X-Gm-Message-State: AOAM531Vmqeh4ksTBersJbSY3OsddbSW5s8vrQDRYIu53zAp7eVH33wO
 xegCN7PfpnewWEYO9RoJWlRG8YKchwA=
X-Google-Smtp-Source: ABdhPJx32zcVoqPwM5uxxIIw5Q81jJIGtL0OGRCpTBnDmnO4cwT/Be5b/zOYPWTQSP+9njHndImNIA==
X-Received: by 2002:a05:6000:18a8:: with SMTP id
 b8mr5778339wri.682.1639599920243; 
 Wed, 15 Dec 2021 12:25:20 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id y11sm3794708wry.70.2021.12.15.12.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 12:25:19 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/13] virtio-gpu: do not byteswap padding
Date: Wed, 15 Dec 2021 21:25:07 +0100
Message-Id: <20211215202515.91586-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215202515.91586-1-pbonzini@redhat.com>
References: <20211215202515.91586-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In Linux 5.16, the padding of struct virtio_gpu_ctrl_hdr has become a
single-byte field followed by a uint8_t[3] array of padding bytes,
and virtio_gpu_ctrl_hdr_bswap does not compile anymore.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211111110604.207376-2-pbonzini@redhat.com>
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



