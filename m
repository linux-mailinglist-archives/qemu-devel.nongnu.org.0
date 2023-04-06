Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 939156D93B4
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 12:09:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkMXr-0006Qz-Vc; Thu, 06 Apr 2023 06:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pkMXp-0006Jn-7L
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:08:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pkMXn-000730-Py
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:08:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680775717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=m/RoZJi40Lp8gYTMdfqkmMDVB/8YmAs3esq5d2bXeeY=;
 b=YvXIiIqMWt4pBjlKOwGmx1vWfr+S7kOfzwCKtrITvjBWo9rhRzuGyGwrzoKNqThMyHiX4Z
 fIRwSI4GJIDsX84WeodFDJlUxg4cJqEHBG+MDeiNf3oZlMlCriqnChhuYml6UgcNO1lnEB
 +wuzqRECt9mkXepCcQiljSvWEfn1jvA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-UxvXPTS1MwGPwnIeaBF7hQ-1; Thu, 06 Apr 2023 06:08:34 -0400
X-MC-Unique: UxvXPTS1MwGPwnIeaBF7hQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 18-20020a17090600d200b0093c44a07ad1so10436eji.2
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 03:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680775712; x=1683367712;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m/RoZJi40Lp8gYTMdfqkmMDVB/8YmAs3esq5d2bXeeY=;
 b=XhZOr1Tl5GkTlPT7XMG61f06qDti6tyiYH21xH+3BkhjYxus92h1WRckGQRZ/bz22z
 9PAVk6UUNY/+KRByNicstgWDajkisUOgNvxKNPajaLJ8Rb3Ca10FjXFVupz5i5OeOV4E
 AHDnJJiKbXpfnyzlcCPPOlL6qM8mpeRbLvsftDzImpcB+ehlf8iAJp0tqzYOI+2wQurV
 NPiwbbf39x1gfcqd8S+8HebIvk2AyDbUES4nlg3+ytRsj44MA88mMoGDPe9ikVA1aW4n
 hgen61cyqK0KvOAfmsKT/yP6fY6LDO8jEMpHbKVDUzE9RJI5x8JnWhebQLMJNxC9oViz
 bjiw==
X-Gm-Message-State: AAQBX9dLMo74Pcf1lePGCFELS8aKkd8uI3liNOxvsuKiiAQ9mFF3nta/
 8Xo5twPeeILRapzLKznvBojdjqClzXwH9dOXzvSFG8cizA8yixvmocDKzOoTpqOickkG75/oWjk
 u1V8Vc5/h0si7/iaFEf1qTLjyJ08mR0bCPufLu9/6TbzLxnXT8scH1E271m2prjZtqXSmd7QRkH
 w=
X-Received: by 2002:a17:906:3b86:b0:8de:e66a:ece9 with SMTP id
 u6-20020a1709063b8600b008dee66aece9mr6217095ejf.24.1680775712558; 
 Thu, 06 Apr 2023 03:08:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350YGiCAlKEUHT6RbpXbd97YUL1ARiGVBUHQkMEQxUj2ybw8Fp04isSasxYA7Mmd9Gyi9znry6g==
X-Received: by 2002:a17:906:3b86:b0:8de:e66a:ece9 with SMTP id
 u6-20020a1709063b8600b008dee66aece9mr6217075ejf.24.1680775712199; 
 Thu, 06 Apr 2023 03:08:32 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 xa16-20020a170907b9d000b00948aae5e3d3sm594716ejc.184.2023.04.06.03.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 03:08:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com
Subject: [PATCH for-8.1] block/nfs: do not use qatomic_mb_set
Date: Thu,  6 Apr 2023 12:08:30 +0200
Message-Id: <20230406100830.240914-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/nfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/nfs.c b/block/nfs.c
index 351dc6ec8d14..0ee63f44deb0 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -727,8 +727,8 @@ nfs_get_allocated_file_size_cb(int ret, struct nfs_context *nfs, void *data,
         error_report("NFS Error: %s", nfs_get_error(nfs));
     }
 
-    /* Set task->complete before reading bs->wakeup.  */
-    qatomic_mb_set(&task->complete, 1);
+    /* Memory barrier already included in bdrv_wakeup(), via aio_wait_kick().  */
+    qatomic_set(&task->complete, 1);
     bdrv_wakeup(task->bs);
 }
 
-- 
2.39.2


