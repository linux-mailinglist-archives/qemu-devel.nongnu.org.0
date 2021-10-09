Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D16427DA1
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 23:25:09 +0200 (CEST)
Received: from localhost ([::1]:52468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZJq8-0000yF-9a
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 17:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJez-000517-8w
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:13:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJex-0000LU-P7
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:13:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633814015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cXp4ws8fpsKdYMnaXXfujeAQnXIZ55NnulDoRO09ta4=;
 b=fB3Xq4Y3KnGudgaqIELf8ufr7g9rOAX8q6l2clwyN+6eEZ4vRl86gI38oi/ezWAxvthVeP
 ET6UTYL53ia6PUVgND4ED4UpPl37AiZDiqvpC9RtsiRfvB0P0UKXgIxc1xn/Bm4vhqz0I1
 bF3waA7R7y+mNck+WGLi7+q85zmNLxw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-Zofsrn8cMButWMXxykXSSQ-1; Sat, 09 Oct 2021 17:13:33 -0400
X-MC-Unique: Zofsrn8cMButWMXxykXSSQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5C00801A93
 for <qemu-devel@nongnu.org>; Sat,  9 Oct 2021 21:13:32 +0000 (UTC)
Received: from localhost (unknown [10.39.208.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7DC819D9B;
 Sat,  9 Oct 2021 21:13:26 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/37] scripts: teach modinfo to skip non-C sources
Date: Sun, 10 Oct 2021 01:08:21 +0400
Message-Id: <20211009210838.2219430-21-marcandre.lureau@redhat.com>
In-Reply-To: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 scripts/modinfo-collect.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/modinfo-collect.py b/scripts/modinfo-collect.py
index 4acb188c3e..61b90688c6 100755
--- a/scripts/modinfo-collect.py
+++ b/scripts/modinfo-collect.py
@@ -51,6 +51,9 @@ def main(args):
     with open('compile_commands.json') as f:
         compile_commands = json.load(f)
     for src in args:
+        if not src.endswith('.c'):
+            print("MODINFO_DEBUG skip %s" % src)
+            continue
         print("MODINFO_DEBUG src %s" % src)
         command = find_command(src, target, compile_commands)
         cmdline = process_command(src, command)
-- 
2.33.0.721.g106298f7f9


