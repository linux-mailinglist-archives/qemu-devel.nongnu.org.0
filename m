Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 332E64B80C5
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 07:37:09 +0100 (CET)
Received: from localhost ([::1]:42188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKDw4-0004T1-8k
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 01:37:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDoO-00049M-O9
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDoL-0006F3-8Z
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644992944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6zOELQqI2MPt8MdKn+c1VGRueIHRXa9jNGDaxs4L/0o=;
 b=JrlzQ0qra9qcTLtKozCuxnn5W4CRuI1PpYb2hGEz21YgNnUSpSQFpm4Vyval50yG375prl
 dJ6syXFLDXK2GpJZeLHw2L6Y3+CP5l4yWn/4wtbLIT5B/xvMdDoyasRmmtWB3ELviYSPYs
 7PzUDBUXowJyXVQ06TzLQZ3nXkuioi8=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-uQPKOwJNOae_kNsfEUP35A-1; Wed, 16 Feb 2022 01:29:03 -0500
X-MC-Unique: uQPKOwJNOae_kNsfEUP35A-1
Received: by mail-pf1-f198.google.com with SMTP id
 c192-20020a621cc9000000b004e0ff94313dso915197pfc.17
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:29:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6zOELQqI2MPt8MdKn+c1VGRueIHRXa9jNGDaxs4L/0o=;
 b=dP88xFJ0MhbBop9VeuVYvPqMQF1BltXjU7djcyAf12QU1n30rAzak034Ql6mxNMBSr
 TCGowHoAA7i6zlUuF1ThsAtScvjGvLX1MQAfD4iMbnROgp+EcJRNuGui5QY4nzkNBLgc
 HoCgXMWlpyUPg8+U+6rPa6F/Dsx22sjZeHkENWSpd7SWho5s2qfCFrvVUyfhLoPUSLnz
 1LFmIdgOb68NpaUbkcpYSCqIg2pf42agT9+bTV8k3ivMkRiOMUcBWeaOlNySTnft3h0Y
 qJBK4CrQIe3oZQcTRr/x8bIlQi8fpLBy+Q/L/9FURgiJw6zNn0b3ztekwW037EZ11gVc
 TXkQ==
X-Gm-Message-State: AOAM530Ss7sgZFALw7y8lvOQDZWsRZtjaYtT1PCWbPMynLMMuAWfhvjl
 0laSI+zhMVL0NK79p/ggHiTwT8GT9mpVFEpQ9wZn/8z1p1W1PvIvXv2BiewvvYySPTFazjTD9Yb
 mXLRHq1y6wQxXmCm4BtD4+n3YobefQoqFdgBtoDdyKvG/yAb3k4fR1VQBTKrjAt52
X-Received: by 2002:a05:6a00:1301:b0:4e1:3dd:16d0 with SMTP id
 j1-20020a056a00130100b004e103dd16d0mr1230422pfu.21.1644992941870; 
 Tue, 15 Feb 2022 22:29:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwHSeyIhDLvVIC6Uf3kzs6ZpqU16lbJEdUElGFBttLDS9DHhHWG81+G2TIwr1Y3iMz8/d8oA==
X-Received: by 2002:a05:6a00:1301:b0:4e1:3dd:16d0 with SMTP id
 j1-20020a056a00130100b004e103dd16d0mr1230397pfu.21.1644992941492; 
 Tue, 15 Feb 2022 22:29:01 -0800 (PST)
Received: from localhost.localdomain ([64.64.123.81])
 by smtp.gmail.com with ESMTPSA id 17sm42104657pfl.175.2022.02.15.22.28.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 22:29:01 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/20] migration: Dump ramblock and offset too when
 non-same-page detected
Date: Wed, 16 Feb 2022 14:27:54 +0800
Message-Id: <20220216062809.57179-6-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220216062809.57179-1-peterx@redhat.com>
References: <20220216062809.57179-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In ram_load_postcopy() we'll try to detect non-same-page case and dump error.
This error is very helpful for debugging.  Adding ramblock & offset into the
error log too.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 36b0a53afe..87bcb704d4 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3706,8 +3706,12 @@ static int ram_load_postcopy(QEMUFile *f)
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


