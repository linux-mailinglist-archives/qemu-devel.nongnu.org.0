Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A02FC54DF4D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 12:43:15 +0200 (CEST)
Received: from localhost ([::1]:45866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1my2-0000ZN-Mw
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 06:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mcG-00070c-PU
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:20:44 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:37535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mc9-0000Vr-FP
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:20:44 -0400
Received: by mail-lf1-x12e.google.com with SMTP id h23so1506698lfe.4
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 03:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DSeTt1QB5HDWqFVTnSya2l9lA2ROxRGP0qePz5aGaP4=;
 b=BbrqfBiGN88yRjR0NV4OjTLWq/ojJnYni/Rn0/fzXNYH6GN+o7xdjMM0+/N++BBRWF
 UgdzNNn+2rk5XZybDVW6g76J9OP6Z2TIFm8EKDGjpBi+pWn1/cjOtDOtjWsX7uju1Prz
 yCYqItrw/mUNnYoXwpuNko30i+OSv0MDIgjVDnCl0tsadhrD8OHrNwPyHui+qqN7H2di
 jfiWGdXQGV+3+ejHvWHEVVRbOwWG6c7CS6b1qjRYuz4RSbeBFANqDV21Dwo/pGWso1Ca
 QyHQQiTTCOtfwsgYuwT2kUl8OIbFO2jQdtCiVMpaG0oP0v/W1WyfYd0jfiy0Fw3ZusBg
 TCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DSeTt1QB5HDWqFVTnSya2l9lA2ROxRGP0qePz5aGaP4=;
 b=a3fOpTsiwiFxhF4h2CtjNiWgKOrk2HTaxViIkG+HCm8aYQv+Tczx5KSvPf7yA8s3WO
 MLnq4OZ8XjpCOUAUX4/jZlau4BshS15JWoqsNZlKzN+BCClPVj+ut8/2kWSAtgz1vGE1
 p4Epwjo1M9kdwQmLv11OhVInxJDJof3ACstdyiYXx4EOfuGrWwbkV6LbUfyNsZnfcraA
 lSEnsTUWxU18rWQCF5UbQEu7gmv4j8pLSXhHg7KjyQNmOeRlvdwvvu35bAt7Dmk0/0r9
 dzMr3QH9bJHisy7wgEcE+IX8Cc1A4M7EGbRATq6wxJi9jxCEvgfH/bIg6rBnt99Dtaoc
 l82w==
X-Gm-Message-State: AJIora/TUZpigVVtAXnOjqGsvoKWa8ulVDtSRBKMHDKEZbcmpJcdEOgG
 ZoIYhoS0dqhhWuXXT+TBnlTBosLl1LafvkKy
X-Google-Smtp-Source: AGRyM1ufEayzAqavnZV5yiBncDcybBp+Ajrn28S9pi8nSBrt0zB6L20yNfHeVnPyjifD1nAz3aJb3w==
X-Received: by 2002:a05:6512:2814:b0:47d:cbbe:33f8 with SMTP id
 cf20-20020a056512281400b0047dcbbe33f8mr2261640lfb.601.1655374835778; 
 Thu, 16 Jun 2022 03:20:35 -0700 (PDT)
Received: from localhost.localdomain ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a05651232b100b0047255d21166sm179014lfe.149.2022.06.16.03.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 03:20:35 -0700 (PDT)
From: nikita.lapshin@openvz.org
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, quintela@redhat.com,
 dgilbert@redhat.com, nikita.lapshin@openvz.org
Subject: [PATCH 5/8] migration: Add block part of migration stream
Date: Thu, 16 Jun 2022 13:20:03 +0300
Message-Id: <20220616102006.218693-8-nikita.lapshin@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616102006.218693-1-nikita.lapshin@openvz.org>
References: <20220616102006.218693-1-nikita.lapshin@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nikita Lapshin <nikita.lapshin@openvz.org>

This patch enables and disable block in migration stream.

Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
---
 migration/migration.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index ad789915ce..d81f3c6891 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1338,7 +1338,8 @@ static bool check_stream_parts(strList *stream_list)
 {
     for (; stream_list; stream_list = stream_list->next) {
         if (!strcmp(stream_list->value, "vmstate") ||
-            !strcmp(stream_list->value, "dirty-bitmaps")) {
+            !strcmp(stream_list->value, "dirty-bitmaps") ||
+            !strcmp(stream_list->value, "block")) {
             continue;
         }
 
@@ -2621,7 +2622,8 @@ bool migrate_use_block(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_BLOCK];
+    return s->enabled_capabilities[MIGRATION_CAPABILITY_BLOCK] ||
+           migrate_find_stream_content("block");
 }
 
 bool migrate_use_return_path(void)
-- 
2.31.1


