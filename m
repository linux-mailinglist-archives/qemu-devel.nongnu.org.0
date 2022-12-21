Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 168626531C0
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:29:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7yno-0006dA-TC; Wed, 21 Dec 2022 08:06:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ynk-0006VU-C5
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7yni-0004WD-KY
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fq+MaMl8UIdzClVL/bhQhOAmu5xMI5TDczhZ45T3QNU=;
 b=hiUUoNqjLqk26R8W/CIVxQmC83i5YpP6Z/4XnksHvvTqL7h9fc/uB8GkPDOoTubmRtk0Ls
 9IPxxYN+tCV7l7N5EkoryOIoKghHrSeg9SXSIPzSBJcwKgLZ8TnMmHfHSuDUEioZurwt/2
 lP/CSvJpRjWdfObBBs2ks7A8NA/CmfU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-381-0dH0Jnf9MACxTG4WJjqrKQ-1; Wed, 21 Dec 2022 08:06:24 -0500
X-MC-Unique: 0dH0Jnf9MACxTG4WJjqrKQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 a7-20020adfbc47000000b002421f817287so2865792wrh.4
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:06:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fq+MaMl8UIdzClVL/bhQhOAmu5xMI5TDczhZ45T3QNU=;
 b=rwIEYT9J50a2P2Lx2YiEXzKqFirICVknDKZg+hjVgD4bXMdt3u2rOKrSFioc3gK5MR
 OCis1u8ry+hYJl3+vyJR0ICtqi7OuJ6DMeb6rYRnIt448bfsSeOnbi9V/Ku8DhjeGU7q
 S4QsROa/bDs1yDRBSNxAoJnY3dYebc/W7lEjxf4ZUEdd4VLdKlHacBSpEns/GXkfTdI6
 27rtW3YnPBnqzcqsdySN6iVYhwEjBf9kfFhQc3o7HZBpRt1XbnpCIrxJTXLBD4xNCeij
 jSy/JrXC4pt1iymcwiRAL886rN5I5nAkFTi2WCrbgF96IQUg+KTr06xkUckNT/GCJnR6
 eT0A==
X-Gm-Message-State: AFqh2kqVQ8sVOu29L1Bd/CW9djz0Uu4IGqZBUuvGxDIVM2KR9K/73e+e
 vXRMmjOinP7qEhd7AD8dr60LGMcOtXIWz2G9bXf8vH6tZWwUMRcnFhRHZDy+I7XbXqSgCgsxoNu
 BGynS526d21J63Sb1jcer0ti3NtbWD+XGKIP+AzPcc7vBeAFFz+u7khIJPQTI
X-Received: by 2002:a05:600c:4fc6:b0:3d3:4a47:52e9 with SMTP id
 o6-20020a05600c4fc600b003d34a4752e9mr1650380wmq.15.1671627982722; 
 Wed, 21 Dec 2022 05:06:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtjTPRlJp/9Ojh7kDKHByR6crLjl1PGZBYvQEiKIhYPyybdq2G78UOLmFALkV8eN5ytiVqd9g==
X-Received: by 2002:a05:600c:4fc6:b0:3d3:4a47:52e9 with SMTP id
 o6-20020a05600c4fc600b003d34a4752e9mr1650363wmq.15.1671627982433; 
 Wed, 21 Dec 2022 05:06:22 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 y10-20020a05600c364a00b003c6c3fb3cf6sm2221634wmq.18.2022.12.21.05.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:06:21 -0800 (PST)
Date: Wed, 21 Dec 2022 08:06:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 34/41] hw/virtio: Add missing "hw/core/cpu.h" include
Message-ID: <20221221130339.1234592-35-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

virtio.c uses target_words_bigendian() which is declared in
"hw/core/cpu.h". Add the missing header to avoid when refactoring:

  hw/virtio/virtio.c:2451:9: error: implicit declaration of function 'target_words_bigendian' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
    if (target_words_bigendian()) {
        ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221213111707.34921-2-philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 2118efbe72..15197002ef 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -25,6 +25,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "qom/object_interfaces.h"
+#include "hw/core/cpu.h"
 #include "hw/virtio/virtio.h"
 #include "migration/qemu-file-types.h"
 #include "qemu/atomic.h"
-- 
MST


