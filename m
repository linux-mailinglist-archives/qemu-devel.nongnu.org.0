Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D3F42308E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 21:07:27 +0200 (CEST)
Received: from localhost ([::1]:37676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXpmg-0007Sz-O1
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 15:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mXpe1-0004O6-Bk
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 14:58:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mXpdx-0004lJ-4j
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 14:58:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633460304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WZHNlTuTnklt4Xwql7kVo/EoV/I/Z/JZGj7l0lQfqyg=;
 b=bttIkjEFVpM0FVBIqJTggQLAJ1huAGG8duMhBxPYZ/IK1Hcct7Y9CzBOB/MYLWCJlAGhTg
 jRrlgQRhApujJ8A3T8NsrnxIfQVdupPx1ia0847aly2W7Rp8EJu0xsPhGIvKAeXTmkF0Vk
 gy0X19nWpLyba3/tnP/lN0G29ibhOuw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-un53WkgdO96NsOyDSk7QJA-1; Tue, 05 Oct 2021 14:58:23 -0400
X-MC-Unique: un53WkgdO96NsOyDSk7QJA-1
Received: by mail-wr1-f69.google.com with SMTP id
 a10-20020a5d508a000000b00160723ce588so68922wrt.23
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 11:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WZHNlTuTnklt4Xwql7kVo/EoV/I/Z/JZGj7l0lQfqyg=;
 b=KOWkAoE8FH5VYRP6VT6dbAGW00M8KiT7337IIIMkJgue06WYgoyKJEMwQniuSvqrMw
 tp4FQMY70EWztT+gVpBKLdXNCmTYWUSNtZvwVeRKlKHyEAehsLhtsSek9o84jR57s23t
 LFwJs9ATU1HHglbLPNv2u9gIZpuVHHSz4HIu8ZUecwJ4P+4hpVEdaDdUIlGMj1M6b80R
 rGqctXizhUPW5NOx7JYkqQOEv5w8CU2D2CNNlifziycwN076/WXy4lJGQbkaYkCrmzn5
 UgrB1JXV1TAc1rcQ/F61plGq13DaBd35i5PirWHUeynE4PVO1pvt34YZjLixrXMLhG5i
 dOhA==
X-Gm-Message-State: AOAM531KVVwpaW2k+zFQsMWY4vlu23iN4Ag1XLjTYqBa/5wskcGk9/zw
 xDoL41C/nR945TC8nhVZHTU+QlIx+ry4dM2TVqUTonnzOlrbTEpib5wizxnj1apPTe09tRcFANl
 ZUgaD8oF3GdvpvwdkXGyPECBiZvzt4XVd1X6NKgQscBKZ1G5yv7d5xV034pOgk0e3
X-Received: by 2002:a1c:3b06:: with SMTP id i6mr5330300wma.172.1633460302070; 
 Tue, 05 Oct 2021 11:58:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyV8xwrb2B23Lu4C67s97BE/vo8DdZ5JC2Yvzb8kRL4v6ceSDU53m5SUnUzUxbiru8jpeaWw==
X-Received: by 2002:a1c:3b06:: with SMTP id i6mr5330274wma.172.1633460301883; 
 Tue, 05 Oct 2021 11:58:21 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id h17sm3382759wrx.55.2021.10.05.11.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 11:58:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/4] hw/scsi/scsi-generic: Use automatic AIO context lock
Date: Tue,  5 Oct 2021 20:58:06 +0200
Message-Id: <20211005185807.4134557-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211005185807.4134557-1-philmd@redhat.com>
References: <20211005185807.4134557-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the automatic AIO context acquire/release in
scsi_command_complete().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/scsi/scsi-generic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index 665baf900e4..08ef623c030 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -114,9 +114,9 @@ static void scsi_command_complete(void *opaque, int ret)
     assert(r->req.aiocb != NULL);
     r->req.aiocb = NULL;
 
-    aio_context_acquire(blk_get_aio_context(s->conf.blk));
-    scsi_command_complete_noio(r, ret);
-    aio_context_release(blk_get_aio_context(s->conf.blk));
+    WITH_AIO_CONTEXT_ACQUIRE_GUARD(blk_get_aio_context(s->conf.blk)) {
+        scsi_command_complete_noio(r, ret);
+    }
 }
 
 static int execute_command(BlockBackend *blk,
-- 
2.31.1


