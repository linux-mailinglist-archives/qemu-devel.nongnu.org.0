Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E32368D2F0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 10:36:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPKOS-0006aU-DX; Tue, 07 Feb 2023 04:36:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pPKOI-0006WM-4J
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 04:35:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pPKOF-0005dy-3M
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 04:35:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675762550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E5UVWOxSZMg5kD3KxQTJGcRjAmy3Sk4uhw9dH1WofUk=;
 b=KjdCtarAhx1rzpqK2bjY0eGZuivl/mrtQqZAI6XYoV/atMuaFPb72BbE3GkB8FPnOyM+oS
 skIr/PXrAsXocxWgPzuXzEe260qiyOn+0e7fR0j3ekPfWSg7HbKKMGpqXRb0237WAE4ToL
 YILiXmodBA8ffK9KWyOfq4BpIlTN1YM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-oGHDmBjUP7m1bbjAY45_CQ-1; Tue, 07 Feb 2023 04:35:48 -0500
X-MC-Unique: oGHDmBjUP7m1bbjAY45_CQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 286E83C0F668
 for <qemu-devel@nongnu.org>; Tue,  7 Feb 2023 09:35:48 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E8B2492B21;
 Tue,  7 Feb 2023 09:35:47 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] char: do not double-close fd when failing to add client
Date: Tue,  7 Feb 2023 13:35:44 +0400
Message-Id: <20230207093544.1067685-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The caller is already closing the fd on failure.

Fixes: c3054a6e6a ("char: Factor out qmp_add_client() parts and move to chardev/")
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 chardev/char.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/chardev/char.c b/chardev/char.c
index 11eab7764c..e69390601f 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -1175,12 +1175,10 @@ bool qmp_add_client_char(int fd, bool has_skipauth, bool skipauth,
 
     if (!s) {
         error_setg(errp, "protocol '%s' is invalid", protocol);
-        close(fd);
         return false;
     }
     if (qemu_chr_add_client(s, fd) < 0) {
         error_setg(errp, "failed to add client");
-        close(fd);
         return false;
     }
     return true;
-- 
2.39.1


