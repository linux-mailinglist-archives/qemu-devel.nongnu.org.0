Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEC6693C5D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:32:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pROb3-0001YL-Ou; Sun, 12 Feb 2023 21:29:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROaz-0001XG-IG
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:29:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROay-00034A-57
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:29:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676255371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OVgMt+TdJwmeIvY3Hw47YNm8dYS4wVaPDdNlXTwlDwQ=;
 b=BfI+jxykmmJSctwsiOhTEA/lJzwGr/s4mQi2G5I1GWmp9ODjsZDR7NDzu7OqK7eF/sWe1+
 zTRqi3Tn8hy5VsaeoZsffjmWrBeQbcfJZt8wkS0d06oWD3Zh8e7tSlpNU8BDalym2wLRaT
 LsRYAkysS+SlFUJJupbcpXJcYnrEqww=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-434-_hMom6VdOlCnSFURYXzUJw-1; Sun, 12 Feb 2023 21:29:24 -0500
X-MC-Unique: _hMom6VdOlCnSFURYXzUJw-1
Received: by mail-wm1-f69.google.com with SMTP id
 d14-20020a05600c34ce00b003dd07ce79c8so6040637wmq.1
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:29:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OVgMt+TdJwmeIvY3Hw47YNm8dYS4wVaPDdNlXTwlDwQ=;
 b=0DwNG2Q/k6w+A4wrO/jwRVr7vaMy6YcOS8083RH+576SJiZ+YG0XqQk6+ns8DZM3t5
 iYfFEVPwZQyXO0w5QgboxYvEW2aXR2HJly13pEn2YdB1v2/G7KFZXxFtCsRHCvuRGxEa
 iUF78bAmnmhwPMVbQghj+2wcfo0rfFRE7nKFGqbc4PTf1zN4oXLfX7JOttYs8CtHLpUF
 aTBVziSmoz1Hf5Sj9oZvs+3lwoWXmiFn6m7/JTl8lEitrfP2zkcwllK7LY361kW5dTsd
 n+0VLaq4gtqz18cpZZYCqATebRbBpCRhZ+DcR/Tds3MxZJyoNvWxIcXPpc1R8PISqLls
 OWxQ==
X-Gm-Message-State: AO0yUKXy3EvJBMvFb8kzOCacC52yNjXjr8Hj3qd12TxtlfUSJte2R6FX
 OqXfzpejMdJbafBzG5blWBcuXVdtPiISaoZrvi64kpWC0PXW9FhfLc/nBu8oYaRVesOdcMngTDn
 cANMZaIetvzetjb7MSSaXZQRJjnNttDolKjheboEKM8Uh/UIscl5hsNOwSC7mmzjlt92niIqv
X-Received: by 2002:a5d:595f:0:b0:2c5:585d:74c5 with SMTP id
 e31-20020a5d595f000000b002c5585d74c5mr1617024wri.22.1676255363548; 
 Sun, 12 Feb 2023 18:29:23 -0800 (PST)
X-Google-Smtp-Source: AK7set+1AvjRljtPucQVqwFkeTx727Y5hrIJrWAWmfJIZuoPIp9WAfMkp3jkVQMcApV1qaza2muSpA==
X-Received: by 2002:a5d:595f:0:b0:2c5:585d:74c5 with SMTP id
 e31-20020a5d595f000000b002c5585d74c5mr1617009wri.22.1676255363296; 
 Sun, 12 Feb 2023 18:29:23 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 t9-20020adfeb89000000b002be0b1e556esm9231047wrn.59.2023.02.12.18.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:29:22 -0800 (PST)
From: Xxx Xx <quintela@redhat.com>
X-Google-Original-From: Xxx Xx <xxx.xx@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 06/22] migration: Simplify ram_find_and_save_block()
Date: Mon, 13 Feb 2023 03:28:55 +0100
Message-Id: <20230213022911.68490-7-xxx.xx@gmail.com>
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

We will need later that find_dirty_block() return errors, so
simplify the loop.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index b966e148c2..dd809fec1f 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2542,7 +2542,6 @@ static int ram_find_and_save_block(RAMState *rs)
 {
     PageSearchStatus *pss = &rs->pss[RAM_CHANNEL_PRECOPY];
     int pages = 0;
-    bool again, found;
 
     /* No dirty page as there is zero RAM */
     if (!ram_bytes_total()) {
@@ -2564,18 +2563,17 @@ static int ram_find_and_save_block(RAMState *rs)
     pss_init(pss, rs->last_seen_block, rs->last_page);
 
     do {
-        again = true;
-        found = get_queued_page(rs, pss);
-
-        if (!found) {
+        if (!get_queued_page(rs, pss)) {
             /* priority queue empty, so just search for something dirty */
-            found = find_dirty_block(rs, pss, &again);
+            bool again = true;
+            if (!find_dirty_block(rs, pss, &again)) {
+                if (!again) {
+                    break;
+                }
+            }
         }
-
-        if (found) {
-            pages = ram_save_host_page(rs, pss);
-        }
-    } while (!pages && again);
+        pages = ram_save_host_page(rs, pss);
+    } while (!pages);
 
     rs->last_seen_block = pss->block;
     rs->last_page = pss->page;
-- 
2.39.1


