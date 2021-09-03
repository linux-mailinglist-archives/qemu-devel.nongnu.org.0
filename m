Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EEA40048D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 20:09:28 +0200 (CEST)
Received: from localhost ([::1]:57080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDd1-00018U-5I
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 14:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDGx-0000XA-SH
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:46:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDGv-0001fK-76
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:46:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630691196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0QJ+ZJ2wYbkbh5C53mqGRb04DGQVHna3HImowkBrJ1s=;
 b=ZyM7rnV5ICHIFh5Chkn066jmLPNp5OPd3kknbPdyePncsyMl/uOhOOCUOHox7BVHU92Wdw
 Ckj/YtGdeLFMz4awL5wk1tGYxvyOT758ZzmQNpSyjy98QWXFos5oAKK61bCOLAh1sZ1NgF
 UlQLqB0nuMc2DD3end/4LpTuR5b7UXM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-eAVjL8R7OeSRNzC0oAjqTg-1; Fri, 03 Sep 2021 13:46:35 -0400
X-MC-Unique: eAVjL8R7OeSRNzC0oAjqTg-1
Received: by mail-wm1-f69.google.com with SMTP id
 f17-20020a05600c155100b002f05f30ff03so58434wmg.3
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0QJ+ZJ2wYbkbh5C53mqGRb04DGQVHna3HImowkBrJ1s=;
 b=dp7sH8shC1Oje2AfEP4p+JW33SOT3c8MEi//m/vloFSgL0I9+4kB/V+yfr2uNE5B/r
 iWLyW/1gkK4YV505VpidjsAJn2mvtFMGGj7rzvU2cIvPcFsf24m0mBuyc6nzmoL79rf2
 ElYWjrnm2KXnQO+rTVENUyLKOnjfuE/jCnwu4C1UXgE94QsTlOvKYhslZjYfKENzYbeN
 iX8OJT/XtpDzV+nxA3VGX9xJj1SMyc6npizHiyAbt31mqDGdJIXrzsFWevUeWsYcbcMc
 T93xcEtdjCpifWjShHx9eye1+KGTKOwDmWf4crxUfO7YgbHbwSOXOWjO57+CUZ/k9mRS
 najg==
X-Gm-Message-State: AOAM531XEvyCA9Rbk6qCJfwc0sBmYvqG5qazQi4nKxwZyVzenoqw8oJs
 qEqRFULqkkELwWDyyKJvJ2M7pRMpUXGsZ7y9T0+VqiZ2ToFxrRE8M7aC+03Tbj2qGdocGi/dv31
 MHmHVqdcNTqkzqpD9KyA5LQeOaAl0caAA6A/nmXTBE1E0k8Uk9nLjD/SAn3ooXtBu
X-Received: by 2002:a7b:c94f:: with SMTP id i15mr52321wml.58.1630691194116;
 Fri, 03 Sep 2021 10:46:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZqQsq6HBKHy9x9qio8mxnBjpJsxTBszffdMNEh489cGyvNi3naDUVQvDvDlHI1owNaY9ECw==
X-Received: by 2002:a7b:c94f:: with SMTP id i15mr52292wml.58.1630691193942;
 Fri, 03 Sep 2021 10:46:33 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id l10sm5820044wrg.50.2021.09.03.10.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:46:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/28] hw/scsi/mptsas: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:44:57 +0200
Message-Id: <20210903174510.751630-16-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903174510.751630-1-philmd@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/scsi/mptsas.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index db3219e7d20..f53ea358161 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -449,7 +449,8 @@ static void mptsas_process_scsi_task_mgmt(MPTSASState *s, MPIMsgSCSITaskMgmt *re
             } else {
                 MPTSASCancelNotifier *notifier;
 
-                reply_async = g_memdup(&reply, sizeof(MPIMsgSCSITaskMgmtReply));
+                reply_async = g_memdup2(&reply,
+                                        sizeof(MPIMsgSCSITaskMgmtReply));
                 reply_async->IOCLogInfo = INT_MAX;
 
                 count = 1;
@@ -476,7 +477,7 @@ static void mptsas_process_scsi_task_mgmt(MPTSASState *s, MPIMsgSCSITaskMgmt *re
             goto out;
         }
 
-        reply_async = g_memdup(&reply, sizeof(MPIMsgSCSITaskMgmtReply));
+        reply_async = g_memdup2(&reply, sizeof(MPIMsgSCSITaskMgmtReply));
         reply_async->IOCLogInfo = INT_MAX;
 
         count = 0;
-- 
2.31.1


