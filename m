Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F27EF6A0B25
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 14:48:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVBvf-0001zI-Fu; Thu, 23 Feb 2023 08:46:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVBvc-0001wA-H6
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:46:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVBva-0001Li-PY
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:46:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677159990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q6gzbbJKdgCIJtOsmzsbLUuvNKtGjXdtE1nvXLNaRyo=;
 b=G19jU13GaVoh9s6q0p1r5SaV2UhtjcZmepz2UCp9V8a7p5YKvN4QJ/gb4C5Kj2sH2tw3dX
 4kjBPLxOgOEghdJvYx5hfz9guhKu38mOBlwG347nX+e3gOa1hmK+/Pni4ZrQGzuGzvEY/l
 jt6On03veL1FtgTpT6pCxwB81ZJiJXE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-POL1nejSO0y0Ut321tUhSA-1; Thu, 23 Feb 2023 08:46:28 -0500
X-MC-Unique: POL1nejSO0y0Ut321tUhSA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFCAF8828C0;
 Thu, 23 Feb 2023 13:46:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 902C2492C14;
 Thu, 23 Feb 2023 13:46:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 96DD121E6A22; Thu, 23 Feb 2023 14:46:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Juan Quintela <quintela@redhat.com>
Subject: [PULL 03/12] dump: Assert cpu_get_note_size() can't fail
Date: Thu, 23 Feb 2023 14:46:17 +0100
Message-Id: <20230223134626.2107382-4-armbru@redhat.com>
In-Reply-To: <20230223134626.2107382-1-armbru@redhat.com>
References: <20230223134626.2107382-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

The only way cpu_get_note_size() can return a negative value is
integer overflow in the non-stub versions, which is a programming
error.  The stub version is not actually reachable, because the
cpu_get_dump_info() stub will fail first.  Use assert().  This gets
rid of another use of QERR_UNSUPPORTED.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230207075115.1525-4-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 dump/dump.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index e6833e4cc0..1362810991 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -1865,10 +1865,7 @@ static void dump_init(DumpState *s, int fd, bool has_format,
 
     s->note_size = cpu_get_note_size(s->dump_info.d_class,
                                      s->dump_info.d_machine, nr_cpus);
-    if (s->note_size < 0) {
-        error_setg(errp, QERR_UNSUPPORTED);
-        goto cleanup;
-    }
+    assert(s->note_size >= 0);
 
     /*
      * The goal of this block is to (a) update the previously guessed
-- 
2.39.0


