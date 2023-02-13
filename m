Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 337DE694037
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 09:59:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRUew-0000PT-Sc; Mon, 13 Feb 2023 03:58:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRUev-0000PD-Ks
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 03:58:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRUet-0002t1-AB
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 03:58:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676278678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c995lDB1JAKlZY84gYHtgOp10ZlGZIqADTn8Uc7TQdI=;
 b=g7L5FdK6Ux1L7xLmYbhRl2h5Nv7gWVR5RrahOer9wJnJxrFbpw8nIBCN/tBda7QpyJLefF
 KrAOxGRS3yzwQkd7vzOnzxwVjZUGyi/oQ1WyKcTnaw0HJWbRQzcSzZ2zWEw3GDxlDY9ewW
 aD4ydTjuRmNqWdEBQA27jEGEcqmOFVE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-628-DSEpGbguMz25IDYndMqnxw-1; Mon, 13 Feb 2023 03:57:57 -0500
X-MC-Unique: DSEpGbguMz25IDYndMqnxw-1
Received: by mail-wm1-f70.google.com with SMTP id
 l21-20020a05600c4f1500b003e00be23a70so8827842wmq.2
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 00:57:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c995lDB1JAKlZY84gYHtgOp10ZlGZIqADTn8Uc7TQdI=;
 b=0A/dA1tY+hCdm6KqDR0rUfZ66uR3naF2rlc8FUP4d6+gcRGp6cnWDs1Zb1m1XzI8P4
 EJ2Fk/e6gpUJ5P0Vzu0I1IpIX0dLbQHZJpdDbd9m7/4sxp9VJ2/YLyply2IQy/VG7tsA
 rMMqWPi3iYFQ3977GSO0glo1/VRNN7WnLjb5AiUJStNwbg+NZoB40ntdy2eE9FJghofT
 KZc6W3dxfa1tUC9gN7mWk5DAK23W91MR4VChYnkG9n/LV0FAJJBvoxXjFhrYLKO4SNtn
 ETEwEpmyi+2MHPnz4glXhRDEO2PLa+AFZJSDBtnUZiXo/kWoPTl2uzJut2Nx7vAFyKGT
 BPtQ==
X-Gm-Message-State: AO0yUKV7cvK2ruahYa+GliEro+W+9QVTht/nPKpWoWVD7pTP2mrZgl8T
 EIFV3bbDUQdrSNCnquAJGM1alGFyqivk7wc8RexEMjFhwYT2dbhGBYweQ3N11xKaQvjJOqGjIJS
 TzsoQG68e6cW0XhmUAQK9VeuyL56Cubq4EZFAZT7PdeTkCKs3QHt1vLr+eK8zCOcqQo/JHAPn0r
 0=
X-Received: by 2002:a5d:6307:0:b0:2c3:e993:9d81 with SMTP id
 i7-20020a5d6307000000b002c3e9939d81mr22212415wru.66.1676278676262; 
 Mon, 13 Feb 2023 00:57:56 -0800 (PST)
X-Google-Smtp-Source: AK7set9O7kPZqgAjQxvmfF4kuav+80/yMDNmH9kiSSJVRyYPQGUuSs3YzIyUcJBBFySePFIzeBjo7Q==
X-Received: by 2002:a5d:6307:0:b0:2c3:e993:9d81 with SMTP id
 i7-20020a5d6307000000b002c3e9939d81mr22212397wru.66.1676278676071; 
 Mon, 13 Feb 2023 00:57:56 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 d1-20020adffd81000000b002bfe08c566fsm9840914wrr.106.2023.02.13.00.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 00:57:55 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v5 5/8] ram: Document migration ram flags
Date: Mon, 13 Feb 2023 09:57:43 +0100
Message-Id: <20230213085746.75586-6-quintela@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213085746.75586-1-quintela@redhat.com>
References: <20230213085746.75586-1-quintela@redhat.com>
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


