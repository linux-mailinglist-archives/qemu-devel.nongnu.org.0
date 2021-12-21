Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D00D47BB44
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 08:45:37 +0100 (CET)
Received: from localhost ([::1]:60940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzZq4-0004x1-8x
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 02:45:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZBg-0006ct-6a
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:03:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZBe-00028W-Ho
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:03:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640070230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wxI7enpms8x1wEW2qLMdd/TI1oYT7Wx6t357beToVE8=;
 b=dZH7ao4NAUK6hb5AP2fIuamdWEAaw9K+WxHo4RbEyrQaD1Pnsmv9/QOfztvHkCUgP++ZhX
 hE5LhZeveeBa3q/0RngdjNzF0UIRpkRjqVnUtqh8k2cV2aWHlBJF6iA39mtH04ppJalzwa
 +2RU2bVWh6W8uHDCibVmfde78d0CfLo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-lP7B5GiIMn2ZTmARwwWjIA-1; Tue, 21 Dec 2021 02:03:49 -0500
X-MC-Unique: lP7B5GiIMn2ZTmARwwWjIA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30D4A1853028;
 Tue, 21 Dec 2021 07:03:47 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB8D27EA39;
 Tue, 21 Dec 2021 07:03:20 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 19/36] scripts: teach modinfo to skip non-C sources
Date: Tue, 21 Dec 2021 10:58:38 +0400
Message-Id: <20211221065855.142578-20-marcandre.lureau@redhat.com>
In-Reply-To: <20211221065855.142578-1-marcandre.lureau@redhat.com>
References: <20211221065855.142578-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 scripts/modinfo-collect.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/modinfo-collect.py b/scripts/modinfo-collect.py
index 4acb188c3e89..61b90688c6dc 100755
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
2.34.1.8.g35151cf07204


