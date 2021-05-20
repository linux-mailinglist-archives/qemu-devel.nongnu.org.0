Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 450AA38AADF
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 13:19:39 +0200 (CEST)
Received: from localhost ([::1]:57514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljgiI-0006sl-81
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 07:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljgZ4-0000dk-KY
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:10:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljgZ2-0004hU-VJ
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:10:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621509004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S06OJbLcsLoisVvd+3p+23m8ISoQC7YgJjRfb76l+Q8=;
 b=Ty+eaoUNAdtvtdruFndStzIMAlTQOxlw3pGCI9LWShTDeqE1fAWR2JByeVCI0RycV8Zh3P
 op/lWqGQd3h+1dEs2bItNltywW0475VrtYI5xxHk/oROyPmjKHqeYcD1WreKzhevi0LlUy
 YC1qbDhoe8fO8A8KpaIFlD0RnoB5Qnw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-FvA5gzS3OQqrY9TCVJ1aVA-1; Thu, 20 May 2021 07:10:03 -0400
X-MC-Unique: FvA5gzS3OQqrY9TCVJ1aVA-1
Received: by mail-wm1-f71.google.com with SMTP id
 w7-20020a1cdf070000b02901698cfc1c04so2109239wmg.6
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 04:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S06OJbLcsLoisVvd+3p+23m8ISoQC7YgJjRfb76l+Q8=;
 b=EzxQ/hJRfU0+pzNgCXXCVNoESztzy5fn3kqVGA7PvHAsl3QRsbjmqw4ySk/c/2yc8m
 Rvy8Wo4udQm5sv0kSAWmFwmJFOFWZC+kuCbfgq6XwUVGrWAPkgHpnPHDwIHuW+Yxrtqw
 17iM8VJlxifeB1FEDvBlwQVXKCw0v7u9VuZMlYHVKmnn0ctdJD7uIT6N3ONSXElX/fF1
 aChGVExZ2jagdTUW6ja2j29Cq1gIx0pzoNZ3J88LTn8jEcgYcRiWPVm9SYJkrrfx2Mj/
 2GaTVM/87S/tqsBHdGF5vEu/EXjbwISVfj9pgJ8rtn9W1pBZiMjVYDDDHFPQfMOUwwBb
 jlOg==
X-Gm-Message-State: AOAM5309q7oxNJbl3eq4poKKv761ddQocwZYYm6lLxij4xkfq5TOZNO1
 pfgtyyNtMPEleKi6bguiTq0xb8OYbM8L+OJnRPRD4cd4mJW5wOZXMN8r9mfj5Nd7Kzg9E7+LKpU
 CE4ih8R5gPlw1TnBWNrGQ9sA8V3pyKYT2iloYbkXFmlpb9WMluAXJGMzcoioFgpwU
X-Received: by 2002:a05:6000:1286:: with SMTP id
 f6mr3585457wrx.226.1621509001855; 
 Thu, 20 May 2021 04:10:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBTw1FpHwB4pwErnBQjO1DZafXorcKIJrnaoUYt/FQiRqv9609/jjGwfr6axovpAJfHyEdgQ==
X-Received: by 2002:a05:6000:1286:: with SMTP id
 f6mr3585439wrx.226.1621509001703; 
 Thu, 20 May 2021 04:10:01 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id r7sm2094567wmq.18.2021.05.20.04.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 04:10:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 09/12] hw/virtio: Use correct type sizes
Date: Thu, 20 May 2021 13:09:16 +0200
Message-Id: <20210520110919.2483190-10-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210520110919.2483190-1-philmd@redhat.com>
References: <20210520110919.2483190-1-philmd@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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


