Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 878954AA5C2
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 03:32:35 +0100 (CET)
Received: from localhost ([::1]:44838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGAsM-0005l9-Ke
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 21:32:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA7d-0004JA-JB
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:44:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA7b-0003SA-VX
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:44:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644025455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oz2e6MHHl60kdDpnLZXoNoUL3IzInDDXRSJJeB+BbMA=;
 b=NcaTVKnUccCEc0XQhuXIhJumKpk+o5MSb/0qV8LoacA+tMHwmBPUfDvxxHvuu4nZdYbG1/
 bwVYxD9ZWPTCXFNG3f2ISgEfrOL8TFC45s5WAlt7zp45OsSSmvNf0JStFpN9uHAcn/OCeI
 2BN9tOdSVchTxH325ZOd4R/CqyVAKIs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-286-TtYRAFTuPs6d-s81LBDo_g-1; Fri, 04 Feb 2022 20:44:14 -0500
X-MC-Unique: TtYRAFTuPs6d-s81LBDo_g-1
Received: by mail-wm1-f70.google.com with SMTP id
 i64-20020a1c3b43000000b00352cf8b74dcso1188105wma.0
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 17:44:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=oz2e6MHHl60kdDpnLZXoNoUL3IzInDDXRSJJeB+BbMA=;
 b=2gaBUMPwL4TgM6U6LwNIPcablIh5WcK4G0gST+UeUe1VPSpbRE7tN3pspHmj+n70o0
 CaLBWtbQZDofe2/C9TlV5K+4y6ep4i8Uq1g6amXOLsAuXepdzRof4X0Rh/NViD0q1IYz
 f0T3//mlWoh6f/GIsEaD+zSSRnrf4CNiW3CV8DTY7GSJQUn4I+yw7XTwHUv8rFeJoQBh
 gvQs7noKWvZbAEb+C08S89FssdZD9vcmukMXzjiTo5+J/hqPQtmXnT8D5MOA2WmQ6zZM
 TktZ7p6YbXzzRmpuyuG2HQahtKVqKMlajsODBxwnwXdXyco4W5VGUhecKjP9vhTIW1Ec
 BOVw==
X-Gm-Message-State: AOAM531qFEdPq0ENPn1Md4LYwbvNwhnxl4PhFJrSI742wl0/3P288u6h
 Ydn/OUmOsG6VB6ueXWbCC0X9xiDH0+NIAuGcPj7IDsB86c8J7XzpmbAc9RdtjMUADov88V0KdVp
 IHmjqnzkuh76VxkX6A1qCFgs2LRf9DVHtjUTUFQpBuODpm0c7n42af5dD6dGr
X-Received: by 2002:adf:c74f:: with SMTP id b15mr1266127wrh.307.1644025452999; 
 Fri, 04 Feb 2022 17:44:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7AXyrVLjxKjDbToNfUSPN50xp3G60gwEatdYDY66JYrte5k0UzGK2ldNa3tDf3HdnH7sxeA==
X-Received: by 2002:adf:c74f:: with SMTP id b15mr1266000wrh.307.1644025450326; 
 Fri, 04 Feb 2022 17:44:10 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id n11sm6445671wms.3.2022.02.04.17.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 17:44:09 -0800 (PST)
Date: Fri, 4 Feb 2022 20:44:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/32] util/oslib-posix: Fix missing unlock in the error path
 of os_mem_prealloc()
Message-ID: <20220205014149.1189026-33-mst@redhat.com>
References: <20220205014149.1189026-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220205014149.1189026-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Michal Privoznik <mprivozn@redhat.com>,
 Pankaj Gupta <pankaj.gupta@ionos.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

We're missing an unlock in case installing the signal handler failed.
Fortunately, we barely see this error in real life.

Fixes: a960d6642d39 ("util/oslib-posix: Support concurrent os_mem_prealloc() invocation")
Fixes: CID 1468941
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta@ionos.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Michal Privoznik <mprivozn@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20220111120830.119912-1-david@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 util/oslib-posix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 9efdc74bba..ac0dbc2adc 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -683,6 +683,7 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
 
         ret = sigaction(SIGBUS, &act, &sigbus_oldact);
         if (ret) {
+            qemu_mutex_unlock(&sigbus_mutex);
             error_setg_errno(errp, errno,
                 "os_mem_prealloc: failed to install signal handler");
             return;
-- 
MST


