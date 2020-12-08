Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 778C12D3401
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:34:10 +0100 (CET)
Received: from localhost ([::1]:35472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjgX-0008LJ-GB
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:34:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmin1-0007Bc-MY
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:36:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmims-0005hH-AN
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:36:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Urg1ebOe/xpAwplm9XU6ObuQmhPirq/STMsGbdggf6A=;
 b=dJPLhWsEW+IaJKFov3anUxvT9vzbhpReETSKi2oE24Lv8rm1yr0PB4uo1iNWKDe9mTsyu+
 ctbEJ57YkVfkOyDKEQrLrZ3XA0mGKxPi0unY/eABgWMuJmeSBkhDUqjCWwnGfItj+ARR6q
 jgPvEq5x5t7hcHQhXSfxdT8RHchdZu0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-EK9idOhAOk-x8xXbR0YVNw-1; Tue, 08 Dec 2020 14:36:33 -0500
X-MC-Unique: EK9idOhAOk-x8xXbR0YVNw-1
Received: by mail-wr1-f69.google.com with SMTP id v5so6604874wrr.0
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:36:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Urg1ebOe/xpAwplm9XU6ObuQmhPirq/STMsGbdggf6A=;
 b=cp4xNvgJAOULm1xSBb7iU0v/sNKk6Xl8a6eexxe0P34wc/YAzlN0jUWZWyAdqW+vH7
 Yg992Wsa0DUBdj6OKSfmI39RM+UEU+aTk69luh/VNUTxsMBu+QZS2e4sWaPIFdf8Fq9W
 xVUbztvTpHtNPYhReE91BaG0yyEWEahUMwxTXVzVUTte/uN5S6MJYI+mle80bC6h4Wzw
 6zz2W0vFeb2bMQRk+oZjrMkYXlp6hIHQqTMYldgoiIeFEbnF4u8tIls8irHlyc1pJUnZ
 c3eXg2YOrAwwV5ZGNOas/aXygHk5C4jNhWUvZoLF8WaZzdQM4n+KaVmpcgtRTxRt00uo
 iLxg==
X-Gm-Message-State: AOAM532m0e7hSKOqvVJNfCdatvdmn5NoWynxNOXO8qDDCtaki2IOaEhk
 DEowpIAUi8JpyWuqLwUEVpQRIWaSzbb74Xzbp74hp2633E1kyUH35H8QcYiTUJfBYJOrcqj4BLX
 50tNCfGoj3k2ZCQokbEujWwZgGU1VAwaMPIqP5cN0cZxa8gmtUjeFtvyfwK+q
X-Received: by 2002:a1c:5f8a:: with SMTP id t132mr5164247wmb.121.1607456191774; 
 Tue, 08 Dec 2020 11:36:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+CUoRUEFJGlqSPqCIEWzZOzWXCIdgSsg3MaJA6tEkVsr0VZkfd7027hdjIqDLcW3fqclaPw==
X-Received: by 2002:a1c:5f8a:: with SMTP id t132mr5164231wmb.121.1607456191558; 
 Tue, 08 Dec 2020 11:36:31 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id h98sm23763837wrh.69.2020.12.08.11.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:36:30 -0800 (PST)
Date: Tue, 8 Dec 2020 14:36:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 46/66] libvhost-user: remove qemu/compiler.h usage
Message-ID: <20201208193307.646726-47-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20201125100640.366523-4-marcandre.lureau@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 contrib/libvhost-user/libvhost-user.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-user/libvhost-user.c
index 54aabd1878..fab7ca17ee 100644
--- a/contrib/libvhost-user/libvhost-user.c
+++ b/contrib/libvhost-user/libvhost-user.c
@@ -27,7 +27,6 @@
 #include <sys/eventfd.h>
 #include <sys/mman.h>
 #include <endian.h>
-#include "qemu/compiler.h"
 
 #if defined(__linux__)
 #include <sys/syscall.h>
@@ -60,6 +59,10 @@
 /* Round number up to multiple */
 #define ALIGN_UP(n, m) ALIGN_DOWN((n) + (m) - 1, (m))
 
+#ifndef unlikely
+#define unlikely(x)   __builtin_expect(!!(x), 0)
+#endif
+
 /* Align each region to cache line size in inflight buffer */
 #define INFLIGHT_ALIGNMENT 64
 
-- 
MST


