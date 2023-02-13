Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD93693C4B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:31:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRObN-0001h1-Sr; Sun, 12 Feb 2023 21:29:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRObM-0001gl-9w
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:29:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRObK-00039X-MJ
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:29:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676255394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wri2CO6/ED+3PLHQRO4xHrfVHwULI1GD8MLKUb731II=;
 b=gb3Xb+V4rMZNP0euKTOvDvRgH9saCDL6wlk4QMRPoA3nBcPMBBrOrIds0PdZO9sHMvaWbN
 2GesPM3sYW/zz9QP+c3TuMiZU3GO0Yr3QPkf4iO8x1ZNK9vEyZBFA0e2wYQGdXTRagKAgF
 4g2VxXxxX7CiWLgPM7uAitwalxv0IZ8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-QAn_8IVhOwaVIOatNUUDUQ-1; Sun, 12 Feb 2023 21:29:52 -0500
X-MC-Unique: QAn_8IVhOwaVIOatNUUDUQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 n7-20020a05600c3b8700b003dc55dcb298so6033407wms.8
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:29:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wri2CO6/ED+3PLHQRO4xHrfVHwULI1GD8MLKUb731II=;
 b=J3HVAh5g5zFL5Oi6wIyQcBbZnv+ZjCaFGz6Dgzg4JbhSzYgu5goO+MzB/OEt+u8TwE
 qaWKX2IRxwomnhCRnaUMkXA3P18FRhEZ/3iY+RPLa6PJq4ihhfhq4YiasJHi/lveFy4s
 63Lcy3+ocQaSZ50RdfLmxZlhWPl6XpKJ5RtJiL9Ok8adYLmHR9FFzZDsThpuadEdb4gJ
 IlNBnPZ5HVFTRDqfODbNI5VkV8ibgZyqsq6Kn8iqiVWN0YGec342butqcz/xEq5PdBdq
 9kyvzsrL9LE/cP5xE1jdZPmBq4M8Qor+GbNkoZ5jLtq944JzepI6VhNMNG9DCBRRbcZ6
 fBMw==
X-Gm-Message-State: AO0yUKVF4qygx5oemL58KMadUFe0i27bzb/rKpJhCNlWL+oziKTNLbNZ
 aGImVqEz8n8mZ2/CNW3JNDZk/6qXJsn9rRiHIjPQPVBXwHVMZgT+hI9A/wBhqhls51TsUNfSeL6
 uAHRjGVl1JH1bVDJ1GhWdiABYUdW/s5KOJIUpKtZTqoxosTZtxMJQkv864Gg8Jy3DxRShszKN
X-Received: by 2002:a5d:6845:0:b0:2c3:e0a0:94f with SMTP id
 o5-20020a5d6845000000b002c3e0a0094fmr18388367wrw.37.1676255391045; 
 Sun, 12 Feb 2023 18:29:51 -0800 (PST)
X-Google-Smtp-Source: AK7set9w/r02MOuyNF6ZqzSL2cS4DS8i6O5G9fomfHgKEJeNVNkj+CcjrykNGeyX93lI34+24dt6Yg==
X-Received: by 2002:a5d:6845:0:b0:2c3:e0a0:94f with SMTP id
 o5-20020a5d6845000000b002c3e0a0094fmr18388350wrw.37.1676255390787; 
 Sun, 12 Feb 2023 18:29:50 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 t9-20020adfeb89000000b002be0b1e556esm9231583wrn.59.2023.02.12.18.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:29:50 -0800 (PST)
From: Xxx Xx <quintela@redhat.com>
X-Google-Original-From: Xxx Xx <xxx.xx@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PULL 22/22] ram: Document migration ram flags
Date: Mon, 13 Feb 2023 03:29:11 +0100
Message-Id: <20230213022911.68490-23-xxx.xx@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213022911.68490-1-xxx.xx@gmail.com>
References: <20230213022911.68490-1-xxx.xx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

From: Juan Quintela <quintela@redhat.com>

0x80 is RAM_SAVE_FLAG_HOOK, it is in qemu-file now.
Bigger usable flag is 0x200, noticing that.
We can reuse RAM_SAVe_FLAG_FULL.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 18ac68b181..521912385d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -67,21 +67,25 @@
 /***********************************************************/
 /* ram save/restore */
 
-/* RAM_SAVE_FLAG_ZERO used to be named RAM_SAVE_FLAG_COMPRESS, it
- * worked for pages that where filled with the same char.  We switched
+/*
+ * RAM_SAVE_FLAG_ZERO used to be named RAM_SAVE_FLAG_COMPRESS, it
+ * worked for pages that were filled with the same char.  We switched
  * it to only search for the zero value.  And to avoid confusion with
- * RAM_SSAVE_FLAG_COMPRESS_PAGE just rename it.
+ * RAM_SAVE_FLAG_COMPRESS_PAGE just rename it.
  */
-
-#define RAM_SAVE_FLAG_FULL     0x01 /* Obsolete, not used anymore */
+/*
+ * RAM_SAVE_FLAG_FULL was obsoleted in 2009, it can be reused now
+ */
+#define RAM_SAVE_FLAG_FULL     0x01
 #define RAM_SAVE_FLAG_ZERO     0x02
 #define RAM_SAVE_FLAG_MEM_SIZE 0x04
 #define RAM_SAVE_FLAG_PAGE     0x08
 #define RAM_SAVE_FLAG_EOS      0x10
 #define RAM_SAVE_FLAG_CONTINUE 0x20
 #define RAM_SAVE_FLAG_XBZRLE   0x40
-/* 0x80 is reserved in migration.h start with 0x100 next */
+/* 0x80 is reserved in qemu-file.h for RAM_SAVE_FLAG_HOOK */
 #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
+/* We can't use any flag that is bigger than 0x200 */
 
 int (*xbzrle_encode_buffer_func)(uint8_t *, uint8_t *, int,
      uint8_t *, int) = xbzrle_encode_buffer;
-- 
2.39.1


