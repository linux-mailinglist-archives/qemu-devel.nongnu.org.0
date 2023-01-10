Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 994376645F2
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 17:24:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFH6d-0003aj-08; Tue, 10 Jan 2023 11:04:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH6G-0003M0-5N
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH6E-00056d-OM
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673366621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NMrUd07MfUZG/5ocZjzOkUszpCqrIAmJ6EfxLJBAlz4=;
 b=QrtwnbnkbcxHNbHFqJdLd0k3zKI4Z5Gi7Dk7nARIiAGsfCfdxrtNdWEM7QbiV1OpX+CuyS
 LR+MNnxAkHqBBYpch4GSOQSC+Ecw2QKlp83xqhOPyPxNHNziKqpgIBPnx5WqCCd7YZjE8l
 LLFlGNCHF92vnKTCJPLAT28t3oPC9fA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-vFD55wRfPhWDjxn7Z4EeNQ-1; Tue, 10 Jan 2023 11:03:40 -0500
X-MC-Unique: vFD55wRfPhWDjxn7Z4EeNQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 i2-20020adfaac2000000b002bc40f98167so1365418wrc.2
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:03:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NMrUd07MfUZG/5ocZjzOkUszpCqrIAmJ6EfxLJBAlz4=;
 b=0nfTom7eKixEaR/5S3kLsq+miPrY2WLmoCADy+ISivzvnCzmWYKZLBB+Hp1/cxUbe1
 0lqQ/w7sTYeYa6XpE1fKP4nOeZk0C+lSWq1R7zrvA2CmLpafyVuo5Icj6jA40VT/LXwb
 FqONb8NPfvHYgEpfo95VI81EfL/x0Oo7eSe0jEkqHGykJiWKh2Nc7jzWmvXlrcISyHVR
 y45bvVK5fqX5yM28OQv0ZA0+HHI0tOqQukOT0g43wES7OyjVZQ+9IopzA9I1jxnlBmiZ
 UWufeYY+ksB/l7OFRUtTiJLOHJsXPqR3cHkBYZs6kJpvXj3aZXIeKOqkiAOhcbh8c0Ud
 lwCA==
X-Gm-Message-State: AFqh2koCUBP7HjJlIogQZMfPZZ7zYsG9ueJNGiDCsuMluRr7b0CtnK/I
 3GpNaAuPKCl6/fNROZjhCA5j/yUYfImP0pYByTCvuSutZGWcZk8zE54r5OiuJefVmFhD4+Tt+wL
 I6vNToeHpl9iSGRZcYS4GNyhtSPut8jXHz4iu47G1sm+tXNOmZCMOWN/vAFqr+ZuLlJw=
X-Received: by 2002:a05:600c:4e51:b0:3d1:e1f4:21d1 with SMTP id
 e17-20020a05600c4e5100b003d1e1f421d1mr60813663wmq.26.1673366618686; 
 Tue, 10 Jan 2023 08:03:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtEyzCX7eOfWadQd/kOREPPyHPPqy8TPnqbpZV6RZB+u1oZ39IR1ZWPTRJBXtIr5SXGgUD6sw==
X-Received: by 2002:a05:600c:4e51:b0:3d1:e1f4:21d1 with SMTP id
 e17-20020a05600c4e5100b003d1e1f421d1mr60813633wmq.26.1673366618395; 
 Tue, 10 Jan 2023 08:03:38 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 j30-20020a05600c1c1e00b003d9f14e9085sm7539910wms.17.2023.01.10.08.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:03:37 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Holtmann <marcel@holtmann.org>, Xie Yongji <xieyongji@bytedance.com>
Subject: [PULL 23/29] libvduse: Switch to unsigned int for inuse field in
 struct VduseVirtq
Date: Tue, 10 Jan 2023 17:02:27 +0100
Message-Id: <20230110160233.339771-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110160233.339771-1-pbonzini@redhat.com>
References: <20230110160233.339771-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Marcel Holtmann <marcel@holtmann.org>

It seems there is no need to keep the inuse field signed and end up with
compiler warnings for sign-compare.

  CC       libvduse.o
libvduse.c: In function ‘vduse_queue_pop’:
libvduse.c:789:19: error: comparison of integer expressions of different signedness: ‘int’ and ‘unsigned int’ [-Werror=sign-compare]
  789 |     if (vq->inuse >= vq->vring.num) {
      |                   ^~

Instead of casting the comparison to unsigned int, just make the inuse
field unsigned int in the fist place.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Reviewed-by: Xie Yongji <xieyongji@bytedance.com>
Message-Id: <9fe3fd8b042e048bd04d506ca6e43d738b5c45b7.1671741278.git.marcel@holtmann.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 subprojects/libvduse/libvduse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvduse.c
index c871bd331a6b..338ad5e352e7 100644
--- a/subprojects/libvduse/libvduse.c
+++ b/subprojects/libvduse/libvduse.c
@@ -101,7 +101,7 @@ struct VduseVirtq {
     uint16_t signalled_used;
     bool signalled_used_valid;
     int index;
-    int inuse;
+    unsigned int inuse;
     bool ready;
     int fd;
     VduseDev *dev;
-- 
2.38.1


