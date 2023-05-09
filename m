Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1356FC133
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 10:06:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwIGj-0008TH-Mp; Tue, 09 May 2023 04:00:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwIGh-0008SI-8p
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:00:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwIGf-0008T2-PH
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:00:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683619217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nPuT2yTDTLWx3ScTHW3rWF8cAhNPMd41BI4poVvx9E8=;
 b=Yi9PazZ2fsOHkxLh2iojQRRNim9MtRrY0LRXdTkRe44eH0fztvUxxVLt+M9ZoXuNj79IgD
 FcV3SwtTMKUnxnkNXIobZXAXY7GqN2iQojnoLz+P0NFQUpRikBwb4AlcHe46OzMG/+gyPI
 J1krYxodcRH2FiJt/LnbSilnaOpZ+BY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-7sSlnGoJMzCpx5_3G-eHDA-1; Tue, 09 May 2023 04:00:13 -0400
X-MC-Unique: 7sSlnGoJMzCpx5_3G-eHDA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 772D980C8CE;
 Tue,  9 May 2023 08:00:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 541512166B2A;
 Tue,  9 May 2023 08:00:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 269EA21E66E6; Tue,  9 May 2023 10:00:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	Juan Quintela <quintela@redhat.com>
Subject: [PULL 04/17] meson: Fix to make QAPI generator output depend on
 main.py
Date: Tue,  9 May 2023 09:59:58 +0200
Message-Id: <20230509080011.3231661-5-armbru@redhat.com>
In-Reply-To: <20230509080011.3231661-1-armbru@redhat.com>
References: <20230509080011.3231661-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

@qapi_gen_depends is missing scripts/qapi/main.py.  Fix that, and drop
a duplicate scripts/qapi/common.py.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230428105429.1687850-5-armbru@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 229eb585f7..a43f9d0012 100644
--- a/meson.build
+++ b/meson.build
@@ -2838,12 +2838,12 @@ qapi_gen_depends = [ meson.current_source_dir() / 'scripts/qapi/__init__.py',
                      meson.current_source_dir() / 'scripts/qapi/expr.py',
                      meson.current_source_dir() / 'scripts/qapi/gen.py',
                      meson.current_source_dir() / 'scripts/qapi/introspect.py',
+                     meson.current_source_dir() / 'scripts/qapi/main.py',
                      meson.current_source_dir() / 'scripts/qapi/parser.py',
                      meson.current_source_dir() / 'scripts/qapi/schema.py',
                      meson.current_source_dir() / 'scripts/qapi/source.py',
                      meson.current_source_dir() / 'scripts/qapi/types.py',
                      meson.current_source_dir() / 'scripts/qapi/visit.py',
-                     meson.current_source_dir() / 'scripts/qapi/common.py',
                      meson.current_source_dir() / 'scripts/qapi-gen.py'
 ]
 
-- 
2.39.2


