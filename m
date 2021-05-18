Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5FF387FE9
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 20:49:26 +0200 (CEST)
Received: from localhost ([::1]:60424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj4mT-00052n-LN
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 14:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4c2-0003BN-Jd
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:38:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4bu-0000CK-39
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:38:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621363106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S06OJbLcsLoisVvd+3p+23m8ISoQC7YgJjRfb76l+Q8=;
 b=DdLO+UJ0g7o62ltjBXmtWRywwYm8QgxgE4g1GLB6QZ9KmNTyJFKGy+uIDtrjVQKy7ZK1JZ
 pxdYM9/KOz0geFaPnuZdr7BNU+l4YC0X9XdSgfWP6r8s6u4dXRHY9cKGZslNAsaH2jQB7t
 sCIsMGHEpUTzdE7P/PhgbzxIbGHdC3U=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-Kd4zlickPbmucapSl0ormw-1; Tue, 18 May 2021 14:38:24 -0400
X-MC-Unique: Kd4zlickPbmucapSl0ormw-1
Received: by mail-ed1-f70.google.com with SMTP id
 q18-20020a50cc920000b029038cf491864cso6243763edi.14
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 11:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S06OJbLcsLoisVvd+3p+23m8ISoQC7YgJjRfb76l+Q8=;
 b=bCyhO+BsToynBmuVKtFzOkGBmRBVj0heFX6diFlTmF14AdtgOmCiplNYQ+GkNa/LuN
 GcILtTHmwLQFP3/QANiS92qpzoMLUgM1oF31AXiqvmtnbQKAvCtNFSz/uRxPLm1DlHpN
 g6K0xFxWThZps6gAL6+mQIu9xvrwR1+yCtXiXV0MoZAPUIm91olHXcT9jq8teg18oWR5
 pS1fO/l9fnOfca/eU/bHyN6Oqi3W0nPCtUSWxzGDAey3VzpUwDNWFgNu7+qGkhHVrE7X
 xwcWlrqc5Ov2aNworJZVFnYDOgvReemj9X+UO7AdrLqH2DRH5/WcSPD8JTyAPSCZCvv0
 rwLw==
X-Gm-Message-State: AOAM532IbvkXYQy1N5tOJkpZTidJh7jrHnWY/AzlFwoDNyTSLrYmvzp+
 qLODmQDiCIvpejT52RdQ0liPgtlA1ABVyLAanN5cYhR4v3Mx6tzEAhyNixc1onqEYI/Aijdg7L7
 Ebru+RuDoeY2O+te18GvjXi18iUJZ5yqQa5R8GpKhlKEbC80w+gsNxImN02EtdY7f
X-Received: by 2002:a17:906:724b:: with SMTP id
 n11mr7499158ejk.338.1621363103398; 
 Tue, 18 May 2021 11:38:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzVhtxMbvRR9ETzBrmBATamfZ/kYWJ0iALABjMejXqFJjBnht3bmvkstNaQOW4XLUET6fLIQ==
X-Received: by 2002:a17:906:724b:: with SMTP id
 n11mr7499136ejk.338.1621363103197; 
 Tue, 18 May 2021 11:38:23 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id t20sm10717899ejc.61.2021.05.18.11.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:38:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 17/25] hw/virtio: Use correct type sizes
Date: Tue, 18 May 2021 20:36:47 +0200
Message-Id: <20210518183655.1711377-18-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210518183655.1711377-1-philmd@redhat.com>
References: <20210518183655.1711377-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bibo Mao <maobibo@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use uint16_t for unsigned 16-bit data and uint32_t for unsigned 32-bit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/virtio/virtio-access.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/virtio/virtio-access.h b/include/hw/virtio/virtio-access.h
index 6818a23a2d3..ae8c9feffc5 100644
--- a/include/hw/virtio/virtio-access.h
+++ b/include/hw/virtio/virtio-access.h
@@ -120,7 +120,7 @@ static inline void virtio_stq_p(VirtIODevice *vdev, void *ptr, uint64_t v)
     }
 }
 
-static inline int virtio_lduw_p(VirtIODevice *vdev, const void *ptr)
+static inline uint16_t virtio_lduw_p(VirtIODevice *vdev, const void *ptr)
 {
     if (virtio_access_is_big_endian(vdev)) {
         return lduw_be_p(ptr);
@@ -129,7 +129,7 @@ static inline int virtio_lduw_p(VirtIODevice *vdev, const void *ptr)
     }
 }
 
-static inline int virtio_ldl_p(VirtIODevice *vdev, const void *ptr)
+static inline uint32_t virtio_ldl_p(VirtIODevice *vdev, const void *ptr)
 {
     if (virtio_access_is_big_endian(vdev)) {
         return ldl_be_p(ptr);
-- 
2.26.3


