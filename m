Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9F34823D4
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 12:51:56 +0100 (CET)
Received: from localhost ([::1]:32782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3GRv-0004op-J7
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 06:51:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3GPW-0002eA-CW
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 06:49:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3GPU-0000JF-Qk
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 06:49:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640951363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wE876U4co5d7p9CIe8hQXrALAIoZI1O45edviYMOfa0=;
 b=anw+/YjFY0lFKqoil5uZFhlmvAzHtaa+ZMjfklu3cWiZp1Fkd3qzGkDOY4jXEyyzQPCpvN
 KVXnuKHt1LFnvMxW3eHnOe6q64MB/bZdwFxKryZGof8EG9Ojy2PUNFS7sWxXboiIFtaXyQ
 lBTxa5z6pc36heGnhlZKgRJPAq7U/48=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-2mn_A6UNM5SIfpUdsj3lMQ-1; Fri, 31 Dec 2021 06:49:22 -0500
X-MC-Unique: 2mn_A6UNM5SIfpUdsj3lMQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 q21-20020adfab15000000b001a24b36e47eso7438641wrc.2
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 03:49:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wE876U4co5d7p9CIe8hQXrALAIoZI1O45edviYMOfa0=;
 b=VDYER4X0q7xYUBJe3gqp/ML+e+ZLMcwOGKTjQN005si1cD4yFrLKp+0lVeQOA8RWJG
 NJJ/zkL+fxomtQ9bWjamayySfKRklFWxoN5VxVbOV3OzgJxTvu2M/CbA37PCssnyrrp7
 /7z4Pj0KOaPRHjoc2a+tMECaZzaOAKeA5oYOpQc+mDvGotNQJgDvY4NEoVNhvjiFfYwz
 zRN85CO75bhKcRq7h3Z8HAAfx18x8/i0+BqH4WCGrqk3trvhAbYBtSmtsb8xQiLt7uRi
 Jfy2Ei5WoqUUkpy2yvSxNVQUleOV/v+NSWVpN51hNT5c6KGcJKodtDKnxW/eE+MntO7L
 KyTA==
X-Gm-Message-State: AOAM530BKqfJ8D21vXSognNCya9NDwWiv2JZZ9OMv2PtU1RyA79t730k
 GXBsaLEFTNNW93QA6inuPQgNnjdMbJG23KuWEiwI0KkmxJFf02rF6GU8ODN4SIXIYBoJXwIcA5V
 idz15+B9kBnyEk5ftxys0KgZ6epr53SS/9K1EggH2bwmT1jfac1H437Pcwol545T+
X-Received: by 2002:a5d:59a7:: with SMTP id p7mr28725175wrr.258.1640951361314; 
 Fri, 31 Dec 2021 03:49:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVhucnXHOV0IsRs6rCE30ye6CzRZ+G0PvrOs/WcOL/mG4e5/HH8kMeMAmq+JlOxXCqJwdyDA==
X-Received: by 2002:a5d:59a7:: with SMTP id p7mr28725150wrr.258.1640951361047; 
 Fri, 31 Dec 2021 03:49:21 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id b19sm31281895wmb.38.2021.12.31.03.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 03:49:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/8] hw/dma: Remove CONFIG_USER_ONLY check
Date: Fri, 31 Dec 2021 12:48:57 +0100
Message-Id: <20211231114901.976937-5-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231114901.976937-1-philmd@redhat.com>
References: <20211231114901.976937-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DMA API should not be included in user-mode emulation.
If so, build should fail. Remove the CONFIG_USER_ONLY check.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/dma.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index b3faef41b2f..0db2478a506 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -31,8 +31,6 @@ struct QEMUSGList {
     AddressSpace *as;
 };
 
-#ifndef CONFIG_USER_ONLY
-
 /*
  * When an IOMMU is present, bus addresses become distinct from
  * CPU/memory physical addresses and may be a different size.  Because
@@ -288,7 +286,6 @@ void qemu_sglist_init(QEMUSGList *qsg, DeviceState *dev, int alloc_hint,
                       AddressSpace *as);
 void qemu_sglist_add(QEMUSGList *qsg, dma_addr_t base, dma_addr_t len);
 void qemu_sglist_destroy(QEMUSGList *qsg);
-#endif
 
 typedef BlockAIOCB *DMAIOFunc(int64_t offset, QEMUIOVector *iov,
                               BlockCompletionFunc *cb, void *cb_opaque,
-- 
2.33.1


