Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06888493620
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 09:20:32 +0100 (CET)
Received: from localhost ([::1]:34928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA6Cl-0001u2-1I
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 03:20:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA62u-0007EF-1n
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:10:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA62r-0001HU-Qj
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:10:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642579816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hEYlCjTDFsa1y8qf+67Mx05+32zK1b6BW22u1QcMTyk=;
 b=hhYlatucgfAoI64w9ys3kYxLlLM9riihYiUDFsk8C9+rZ6A8FLdYVIrsnsoLcvmrCgCEDh
 iqbLQ4lmIkZir71K68sUQH9qPxdqPvUvpWAOF9SaDBypRaUhjbtr5+xoTvMworew5AbRiV
 UdihzzN5q8qpV6uiCqo08t96oyWiIDI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-BFwdMvdvODaSmfWEPCnqbg-1; Wed, 19 Jan 2022 03:10:15 -0500
X-MC-Unique: BFwdMvdvODaSmfWEPCnqbg-1
Received: by mail-wm1-f72.google.com with SMTP id
 20-20020a05600c22d400b00349067fe7b7so789275wmg.5
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 00:10:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hEYlCjTDFsa1y8qf+67Mx05+32zK1b6BW22u1QcMTyk=;
 b=WI2rVOwwDe/dogQkEhSp5ddvy+u4oTXct5vZXhAd778AAipIehEpdtBxznDH8a0Xjb
 dCxUdpAJ/fT0XE1SDi6vGpOlrIFc2Q1q4aVAwx2BVQq7Y1Ck8G7XgaNUjW2p0u1iAQ9Q
 n3BqY1P/pDx7T41Q+iochN+sCDrbjRUghCwRbvQ3ks0YwMgE2KsN5gWtcP1sMOG4XZdR
 AWcN3hr6eQgKwoihY6dVw439ILkr5vKwA/zibWFOhbvCufuVWX4p8LYzH91r9DI+OILS
 YiHS3tLZKGSCatPs/UAnKLy5goh26bA1pDu50NPJsb7hM0nA6fmxLmy+qfzbeTVSrdkg
 BlXA==
X-Gm-Message-State: AOAM533KDBpVctp8IXm41pg61ktb3iCrpIFKfp1AqwNjIgiVzXiB4bHI
 y/k7qNx39W2ZMx3qcPOQ4slQQh71W76E5nb0kzj+MPNDDjVm+RCwmYVEkRV3Qj8X6zHWbUYeQP1
 6pgE2vjuMO1pJ5+39eEH81FKfJdhQaQ4o9vLqQjkbwCfa5V6bTpYNzIGh6/IQq1bh
X-Received: by 2002:a05:6000:144f:: with SMTP id
 v15mr6623040wrx.514.1642579813685; 
 Wed, 19 Jan 2022 00:10:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyj/cj8r3cytrkCQE3KIdkiOXJMSkyls5Bad355NP6S3n63iEkbYFiuKHMYVJu8rvojOrm4Fg==
X-Received: by 2002:a05:6000:144f:: with SMTP id
 v15mr6623013wrx.514.1642579813368; 
 Wed, 19 Jan 2022 00:10:13 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.175])
 by smtp.gmail.com with ESMTPSA id a20sm4351606wmb.27.2022.01.19.00.10.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 19 Jan 2022 00:10:12 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 08/15] migration: Dump ramblock and offset too when
 non-same-page detected
Date: Wed, 19 Jan 2022 16:09:22 +0800
Message-Id: <20220119080929.39485-9-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220119080929.39485-1-peterx@redhat.com>
References: <20220119080929.39485-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In ram_load_postcopy() we'll try to detect non-same-page case and dump error.
This error is very helpful for debugging.  Adding ramblock & offset into the
error log too.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 930e722e39..3f823ffffc 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3705,8 +3705,12 @@ static int ram_load_postcopy(QEMUFile *f)
             } else if (tmp_page->host_addr !=
                        host_page_from_ram_block_offset(block, addr)) {
                 /* not the 1st TP within the HP */
-                error_report("Non-same host page %p/%p", tmp_page->host_addr,
-                             host_page_from_ram_block_offset(block, addr));
+                error_report("Non-same host page detected.  Target host page %p, "
+                             "received host page %p "
+                             "(rb %s offset 0x"RAM_ADDR_FMT" target_pages %d)",
+                             tmp_page->host_addr,
+                             host_page_from_ram_block_offset(block, addr),
+                             block->idstr, addr, tmp_page->target_pages);
                 ret = -EINVAL;
                 break;
             }
-- 
2.32.0


