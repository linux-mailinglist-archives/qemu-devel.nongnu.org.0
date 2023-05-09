Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3336FCC42
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 19:04:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwQjb-0003JI-HW; Tue, 09 May 2023 13:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwQjK-0003HH-Np
 for qemu-devel@nongnu.org; Tue, 09 May 2023 13:02:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwQjJ-0005Ke-1z
 for qemu-devel@nongnu.org; Tue, 09 May 2023 13:02:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683651741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=w+T1PU/VS1lCXYmNNNmLuDgqDBP6wzfwHm7Fj0oBCtU=;
 b=jSUrLNJPW/Ap3LtfZu7DZNbiPZuCEvx4IpKbzWa6ZEuHzIiE19URBnLlOOZ/XaZ/fI094D
 Hzh6qFDF1DYwvdrGIL5fEL4yNEVQ5tLMd8mAEWIxGQcvXe2lZfo1F2OF1fOUmmbxTOgkzl
 y31eFJwok9S87fzHuAXbqamfKTUuZd4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-psrC6psfMpqd4wazNsaYDw-1; Tue, 09 May 2023 13:02:20 -0400
X-MC-Unique: psrC6psfMpqd4wazNsaYDw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A751E3C0F675
 for <qemu-devel@nongnu.org>; Tue,  9 May 2023 17:02:19 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E030640C6E68;
 Tue,  9 May 2023 17:02:18 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH] migration: Fix duplicated included in meson.build
Date: Tue,  9 May 2023 19:02:17 +0200
Message-Id: <20230509170217.83246-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is the commint with the merge error (not in the submited patch).

commit 52623f23b0d114837a0d6278180b3e3ae8947117
Author: Lukas Straub <lukasstraub2@web.de>
Date:   Thu Apr 20 11:48:35 2023 +0200

    ram-compress.c: Make target independent

    Make ram-compress.c target independent.

Fixes: 52623f23b0d114837a0d6278180b3e3ae8947117
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/meson.build | 1 -
 1 file changed, 1 deletion(-)

diff --git a/migration/meson.build b/migration/meson.build
index b81ccaec13..6b5c5a02f5 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -23,7 +23,6 @@ softmmu_ss.add(files(
   'migration.c',
   'multifd.c',
   'multifd-zlib.c',
-  'multifd-zlib.c',
   'ram-compress.c',
   'options.c',
   'postcopy-ram.c',
-- 
2.40.0


