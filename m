Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 827F26535C5
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:02:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83Q0-0000XG-8n; Wed, 21 Dec 2022 13:02:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83Pp-0000Nc-A4
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83Pm-0004Gh-RX
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671645722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=edX+jDZNKjaZ+u+Si+4u+QIEgjdLUDEnkFgau27MKqA=;
 b=dgikEB4Qc1SnwuBRkDtwJAmCcQbi/0UucE8jDvYKfI6LzmxOXDNdi9RM1F/+g4wb3TAH/W
 EcClVZaI8rx9y+BGcNCQUJedtlGtzv6NyFHQ6EFto/IzeXH7woRes5xXWy8F6i1FQQGQVw
 who8399KCzUBP2Ks23sVpw/kNEibfQY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-83-tgnDRyIUPK291K5-r7wN1A-1; Wed, 21 Dec 2022 13:02:00 -0500
X-MC-Unique: tgnDRyIUPK291K5-r7wN1A-1
Received: by mail-ej1-f72.google.com with SMTP id
 sg39-20020a170907a42700b007c19b10a747so11116787ejc.11
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:02:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=edX+jDZNKjaZ+u+Si+4u+QIEgjdLUDEnkFgau27MKqA=;
 b=6slk99kVPyHoiVabdD9nduA+dhoXn5/ovLdfpMa5omwuwkUWtcuaUvgFP6TpBzFRDS
 Akmpz/lDFVPWUyZ6RyevxtiahP1IlM34sTeqAEWkKAcpXfBkxVM11aUfwtmK5T9J3CQH
 wdKSZoTjCltV0xnDY+vNDKLtpAkiWdZX/ckNmwinycWoz2Fdu7ASiF9rp7JKVxAoPtEk
 99P6xu2tPW/MzNpjj9qagxqyEXbEQXcD8ZpdhtJ83sho9NMtjz00vFOxEXgQAE5oIUog
 8kBlBSk2Evz/daxp0ijSuJ+4KNNBLRCoHym6VdqdAA/MDErkVkcKsJX8qsdco6dZIOWq
 D69A==
X-Gm-Message-State: AFqh2kq8xdQ5A3kkAIOk5QwovR0nKicW7a/WhmySYAB6m3cFk7md1qVZ
 ukZWF6CgG8DflzFPsHpe+GoaGqmdl7cWUGir+mddV5B+UYQcQempvrzrin/QYEz9gsKUD0uqJzg
 G+40DrYV3XaQMi91XzIk4IUpuhMzkqh8u+lBvn3qxFN3cvSrQFGZqy4N/YTGUPjh+bMI=
X-Received: by 2002:a17:907:a707:b0:7c1:75e9:1180 with SMTP id
 vw7-20020a170907a70700b007c175e91180mr2288647ejc.22.1671645718923; 
 Wed, 21 Dec 2022 10:01:58 -0800 (PST)
X-Google-Smtp-Source: AMrXdXueiORvrpcZJS2BdJY40SW+BwE/4Vd5fAGIs22eo2LEGQV6Bi5QS2Y4/+sGKN+ZBAga+8nBJQ==
X-Received: by 2002:a17:907:a707:b0:7c1:75e9:1180 with SMTP id
 vw7-20020a170907a70700b007c175e91180mr2288614ejc.22.1671645718672; 
 Wed, 21 Dec 2022 10:01:58 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a17090618a200b008318e6d09easm3337678ejf.103.2022.12.21.10.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:01:58 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PULL 05/24] ide: Add 8-bit data mode
Date: Wed, 21 Dec 2022 19:01:22 +0100
Message-Id: <20221221180141.839616-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221180141.839616-1-pbonzini@redhat.com>
References: <20221221180141.839616-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

From: Lubomir Rintel <lkundrak@v3.sk>

CompactFlash uses features 0x01 and 0x81 to enable/disable 8-bit data
path. Implement them.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Message-Id: <20221130120238.706717-1-lkundrak@v3.sk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/ide/core.c             | 43 ++++++++++++++++++++++++++++++---------
 include/hw/ide/internal.h |  1 +
 2 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index 39afdc0006b9..5d1039378f1d 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -1648,6 +1648,13 @@ static bool cmd_set_features(IDEState *s, uint8_t cmd)
 
     /* XXX: valid for CDROM ? */
     switch (s->feature) {
+    case 0x01: /* 8-bit I/O enable (CompactFlash) */
+    case 0x81: /* 8-bit I/O disable (CompactFlash) */
+        if (s->drive_kind != IDE_CFATA) {
+            goto abort_cmd;
+        }
+        s->io8 = !(s->feature & 0x80);
+        return true;
     case 0x02: /* write cache enable */
         blk_set_enable_write_cache(s->blk, true);
         identify_data = (uint16_t *)s->identify_data;
@@ -2374,12 +2381,20 @@ void ide_data_writew(void *opaque, uint32_t addr, uint32_t val)
     }
 
     p = s->data_ptr;
-    if (p + 2 > s->data_end) {
-        return;
-    }
+    if (s->io8) {
+        if (p + 1 > s->data_end) {
+            return;
+        }
 
-    *(uint16_t *)p = le16_to_cpu(val);
-    p += 2;
+        *p++ = val;
+    } else {
+        if (p + 2 > s->data_end) {
+            return;
+        }
+
+        *(uint16_t *)p = le16_to_cpu(val);
+        p += 2;
+    }
     s->data_ptr = p;
     if (p >= s->data_end) {
         s->status &= ~DRQ_STAT;
@@ -2401,12 +2416,20 @@ uint32_t ide_data_readw(void *opaque, uint32_t addr)
     }
 
     p = s->data_ptr;
-    if (p + 2 > s->data_end) {
-        return 0;
-    }
+    if (s->io8) {
+        if (p + 1 > s->data_end) {
+            return 0;
+        }
 
-    ret = cpu_to_le16(*(uint16_t *)p);
-    p += 2;
+        ret = *p++;
+    } else {
+        if (p + 2 > s->data_end) {
+            return 0;
+        }
+
+        ret = cpu_to_le16(*(uint16_t *)p);
+        p += 2;
+    }
     s->data_ptr = p;
     if (p >= s->data_end) {
         s->status &= ~DRQ_STAT;
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index b17f36df957d..fc0aa81a88b9 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -402,6 +402,7 @@ struct IDEState {
     uint8_t select;
     uint8_t status;
 
+    bool io8;
     bool reset_reverts;
 
     /* set for lba48 access */
-- 
2.38.1


