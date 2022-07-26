Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D575808E4
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 03:06:25 +0200 (CEST)
Received: from localhost ([::1]:57416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG91j-0004or-Qx
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 21:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oG8yU-00039v-0j
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 21:03:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oG8yQ-0003y1-9x
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 21:03:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658797376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ejJmAr86DGbz9s7yRzkcrwTo+f0hkCdqLJ6XYxYOPzI=;
 b=OqCvhcx1XnVOvlQIZLSUT6O3DvmdaelxS/KwNCGq20vClYprFr4S+BfqYZ2E6rvGtvB0ZH
 ZJszW/mh4MFxfyCsRvYKKmBScg+7D1aPxjgWfGUQy6ova1ZInnzAKVEZ6dhbDGB5FztwOf
 A2HZjI5Wu2MMwTxza/QUbNTMA6L+16U=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-B9O-j50VN0auAVMQke8tsg-1; Mon, 25 Jul 2022 21:02:54 -0400
X-MC-Unique: B9O-j50VN0auAVMQke8tsg-1
Received: by mail-oi1-f198.google.com with SMTP id
 ay32-20020a056808302000b002f96abff093so5484618oib.23
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 18:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ejJmAr86DGbz9s7yRzkcrwTo+f0hkCdqLJ6XYxYOPzI=;
 b=6o2sl6nwEfuUenHQzIo/7qoNYNhszhJeS2Lg5W8Paj7N9g163rgqLzMtkaTH5FVgA8
 Imuzjcx3a+o8ItOElSb2IXhbhjDq+f6MXGVR7yYktNcLETuafvnjuu79lMNbnUwcikhg
 5NMOWDIJs6E8onrL3P2WzaemjSn3qeiJuz547qwSgdxVfcnc0P0DackY+IDK/FHGn0eh
 cS+fiq+A/mqactOf9rACAmPHDVY7YSZeILJ2tNCFfNmsRI9F0jL367BhTJb4DGORGnzi
 TrgIf+ZqgxlvYhPKuURFnyWH03Y+q7VH5n3F/0vHWvYF0cSLxKdtte7xJVlxXex6L6Ka
 SG2Q==
X-Gm-Message-State: AJIora+nN6kXr3R0FFlUjSBD1D7WHw/C2WIGSZjzVHRnr3f1OuoVkS6F
 beUaUsFohiaDfpvZC4faSYQprNgLLJtdtBEoTrvX2MBAzAjQjY1u1HklARx63xhsAjSkwC6Vwtp
 nb50FnFc6PA9SbmA=
X-Received: by 2002:a9d:73ce:0:b0:61c:8fe1:4deb with SMTP id
 m14-20020a9d73ce000000b0061c8fe14debmr5566481otk.220.1658797373925; 
 Mon, 25 Jul 2022 18:02:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sFBQbAKpDah/Wn4auzEAMDb2wrJ0gAanDJrm4BeGkJc7QlDtIMjnBby/3uUtZRei6xK7CAUQ==
X-Received: by 2002:a9d:73ce:0:b0:61c:8fe1:4deb with SMTP id
 m14-20020a9d73ce000000b0061c8fe14debmr5566469otk.220.1658797373703; 
 Mon, 25 Jul 2022 18:02:53 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f0:ec8c:e219:73f:cde6:2139])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a056808030400b0032ed2343100sm5480189oie.14.2022.07.25.18.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 18:02:53 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v1 1/1] migration: add remaining params->has_* = true in
 migration_instance_init()
Date: Mon, 25 Jul 2022 22:02:35 -0300
Message-Id: <20220726010235.342927-1-leobras@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some of params->has_* = true are missing in migration_instance_init, this
causes migrate_params_check() to skip some tests, allowing some
unsupported scenarios.

Fix this by adding all missing params->has_* = true in
migration_instance_init().

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 migration/migration.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index e03f698a3c..82fbe0cf55 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -4451,6 +4451,7 @@ static void migration_instance_init(Object *obj)
     /* Set has_* up only for parameter checks */
     params->has_compress_level = true;
     params->has_compress_threads = true;
+    params->has_compress_wait_thread = true;
     params->has_decompress_threads = true;
     params->has_throttle_trigger_threshold = true;
     params->has_cpu_throttle_initial = true;
@@ -4471,6 +4472,9 @@ static void migration_instance_init(Object *obj)
     params->has_announce_max = true;
     params->has_announce_rounds = true;
     params->has_announce_step = true;
+    params->has_tls_creds = true;
+    params->has_tls_hostname = true;
+    params->has_tls_authz = true;
 
     qemu_sem_init(&ms->postcopy_pause_sem, 0);
     qemu_sem_init(&ms->postcopy_pause_rp_sem, 0);
-- 
2.37.1


