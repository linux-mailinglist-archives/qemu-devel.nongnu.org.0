Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 524DC3F8F40
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 21:53:39 +0200 (CEST)
Received: from localhost ([::1]:55006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJLRS-0000Wy-Aj
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 15:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJLOf-0005VY-Ct
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 15:50:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJLOd-00039K-OR
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 15:50:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630007443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5UH5gTXKqeTJNaOUfTO6KDAq9dp4eTnytqWl3CBLEdg=;
 b=eAzV5sUxnnHxNIxQjP979kX0VUfYqp9N0u1wngSOfYBU4NRRF0u9M6WFDXOyiapbI50vUo
 ccm/BBaGu0zEwQ7pqOi2Ee3OScbkHXW5WLIo4LyLXNQ8g37CSz4exkWv/GFkaOelUlHPjd
 Zy+r+iE0I5hkrZrDZKIxmZ8I/vyOOf0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-gmi5yzPmPdu-qN0h7CYuyA-1; Thu, 26 Aug 2021 15:50:39 -0400
X-MC-Unique: gmi5yzPmPdu-qN0h7CYuyA-1
Received: by mail-wm1-f72.google.com with SMTP id
 m22-20020a7bca56000000b002e7508f3faeso1280539wml.2
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 12:50:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5UH5gTXKqeTJNaOUfTO6KDAq9dp4eTnytqWl3CBLEdg=;
 b=Tp5N+ax3f29SxlGDKRWwOy1zhs6svpuiLsnuQebUOU6A/E+/rhLAUXlvzJ0PTT6zeo
 6r3iu/y+55r9eEGfQ06ijfbOCsm4KMhLKdqUsixwagLM/WSbjQ2VAUFaZr/cQcSucp/L
 I6Yqj7PM8t+xKYDZIfE0Fs+GD3hWpPXJvP585HEjRVR/Df+5ssrjukeQGc+91qmAvFyC
 b3+SBjGLozGf7LKR8MFb/TOuakkG5xPLrwIxwpgrZ8xw/ox4zmHWalbWwSeViqsYkzXJ
 r/gmHxrK1QNIaWY5g3ukMU4gI5LBpKCWzU2vCz7rKgjDYF4nrxu1t3kjCyCw33CqY6Z0
 l+bQ==
X-Gm-Message-State: AOAM531p61E+g+QbR4AmEqyfDQu7AWj4JDJHG3nVLsXm2Nc9PXf1y8++
 X523D7G5OEmxz+68724N4vVzaeuWlcB+aZgq+OZuFTWFAkB+v95RJH7BeAieh/VXKa6lSUaNb1k
 xTVnSknxWc8XRxWuCWl7qS/Xl1xlRBZRbQ3p9coHdfRuf/ewsh/9A43ZzqyXvbpJ5
X-Received: by 2002:a1c:a78a:: with SMTP id q132mr5286218wme.91.1630007438315; 
 Thu, 26 Aug 2021 12:50:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzonunia3BcQMWDDq13LsVtb9ObTCUsM75OJ/BHlnjwD0+Af0ay6Lz2YeQ4v6ltjDugUGcXzA==
X-Received: by 2002:a1c:a78a:: with SMTP id q132mr5286198wme.91.1630007438147; 
 Thu, 26 Aug 2021 12:50:38 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 f17sm4740029wrt.63.2021.08.26.12.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 12:50:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/11] block/nvme: Have nvme_create_queue_pair() report
 errors consistently
Date: Thu, 26 Aug 2021 21:50:08 +0200
Message-Id: <20210826195014.2180369-6-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210826195014.2180369-1-philmd@redhat.com>
References: <20210826195014.2180369-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Auger Eric <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

nvme_create_queue_pair() does not return a boolean value (indicating
eventual error) but a pointer, and is inconsistent in how it fills the
error handler. To fulfill callers expectations, always set an error
message on failure.

Reported-by: Auger Eric <eric.auger@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/nvme.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/block/nvme.c b/block/nvme.c
index e8dbbc23177..0786c501e46 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -220,6 +220,7 @@ static NVMeQueuePair *nvme_create_queue_pair(BDRVNVMeState *s,
 
     q = g_try_new0(NVMeQueuePair, 1);
     if (!q) {
+        error_setg(errp, "Cannot allocate queue pair");
         return NULL;
     }
     trace_nvme_create_queue_pair(idx, q, size, aio_context,
@@ -228,6 +229,7 @@ static NVMeQueuePair *nvme_create_queue_pair(BDRVNVMeState *s,
                           qemu_real_host_page_size);
     q->prp_list_pages = qemu_try_memalign(qemu_real_host_page_size, bytes);
     if (!q->prp_list_pages) {
+        error_setg(errp, "Cannot allocate PRP page list");
         goto fail;
     }
     memset(q->prp_list_pages, 0, bytes);
@@ -239,6 +241,7 @@ static NVMeQueuePair *nvme_create_queue_pair(BDRVNVMeState *s,
     r = qemu_vfio_dma_map(s->vfio, q->prp_list_pages, bytes,
                           false, &prp_list_iova);
     if (r) {
+        error_setg_errno(errp, -r, "Cannot map buffer for DMA");
         goto fail;
     }
     q->free_req_head = -1;
-- 
2.31.1


