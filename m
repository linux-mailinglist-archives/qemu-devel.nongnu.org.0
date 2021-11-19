Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BABAE45751B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 18:14:47 +0100 (CET)
Received: from localhost ([::1]:33052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo7TK-0000G0-Ix
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 12:14:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mo7EQ-0005N4-Pe
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:59:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mo7EM-00037m-TV
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:59:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637341156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WDFI2IGTeowEVQIDHeq4RUL8gp6P5smXiMWEVlti1I4=;
 b=G3XgAhgaNr1m9Sb8JDwuwpixnNgamlvs9ZN1js4/7T0NLXAbyJLTK2TEkjX1LooZxljDNM
 kGbDgBIi5VYyS0dzGMhLU9ywekTiImLP8WJTRZyjNTSRGua9jZQ3br5N8qOGEljL10xi93
 iTQOgIn6ORizUA4dBtoDlGABcy8EzhE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-yAsVlbB2Mc2PFecGHR6jHw-1; Fri, 19 Nov 2021 11:59:15 -0500
X-MC-Unique: yAsVlbB2Mc2PFecGHR6jHw-1
Received: by mail-wr1-f72.google.com with SMTP id
 v17-20020adfedd1000000b0017c5e737b02so1891195wro.18
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:59:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WDFI2IGTeowEVQIDHeq4RUL8gp6P5smXiMWEVlti1I4=;
 b=NzAMpZ6crK+bli14//CwsFOtE2yM9Sxp4+E94tmLD/4kbglGVQl7/YOZjqRjuxjF0M
 S5e8vK7yfZ3IgSbTpT2xhY/pW9ymLDf+PgDZffxBXnecNeWez0180jjvnXhVMna5oLa0
 IltepBCtM8pgAopigdx5yJYbxD4DpeSZHUqgdtkBkoBh1ZsiPLrJNm+pURZcu+gwjygB
 pvYQa37D3C0CcCC38f1kDtA5aEUlgm2DKXFmePCuE6ntkzbDol4ukwIXOlI86ZQfQRm0
 r+Max35BWKrCuyUxAGLFSXOxU6xqjTvB6mYSdLCTTNvT6ZS8OG/dZlB4B7tclJ2UqbaX
 7qtQ==
X-Gm-Message-State: AOAM531HzLW2zVL6ruOge/O8TPml3ftSicSs8V4sLHNJE3yQolWo/x/z
 y7PLCKP4XXzB1rOdTlWGIB9+9MEpDxv20eYVodXsNOVEve62rjftML9d+5UdhhyiUkUtkmBpVaf
 DLDNrAbZtRD9tmlb1fxld1EG8QbQUNxWUQ2vG++7jdPUzxC52sGtJRoPCKkHf3yOw428=
X-Received: by 2002:adf:ded0:: with SMTP id i16mr9275138wrn.335.1637341154023; 
 Fri, 19 Nov 2021 08:59:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyN18RdVVe0YMYYqiTqb2XW+femKkO6mJNgM7Ej4+O2RdGuxAoyzVkd1KHE7B5HqsiKbL2tsw==
X-Received: by 2002:adf:ded0:: with SMTP id i16mr9275105wrn.335.1637341153857; 
 Fri, 19 Nov 2021 08:59:13 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id g5sm477883wri.45.2021.11.19.08.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:59:13 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/11] multifd: Make zlib use iov's
Date: Fri, 19 Nov 2021 17:58:59 +0100
Message-Id: <20211119165903.18813-8-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119165903.18813-1-quintela@redhat.com>
References: <20211119165903.18813-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd-zlib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index 40d4cbd0b8..2c385e57bc 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -144,6 +144,9 @@ static int zlib_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
         }
         out_size += available - zs->avail_out;
     }
+    p->iov[p->iovs_used].iov_base = z->zbuff;
+    p->iov[p->iovs_used].iov_len = out_size;
+    p->iovs_used++;
     p->next_packet_size = out_size;
     p->flags |= MULTIFD_FLAG_ZLIB;
 
@@ -163,10 +166,7 @@ static int zlib_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
  */
 static int zlib_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
 {
-    struct zlib_data *z = p->data;
-
-    return qio_channel_write_all(p->c, (void *)z->zbuff, p->next_packet_size,
-                                 errp);
+    return qio_channel_writev_all(p->c, p->iov, p->iovs_used, errp);
 }
 
 /**
-- 
2.33.1


