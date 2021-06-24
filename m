Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3883B2CA5
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 12:43:18 +0200 (CEST)
Received: from localhost ([::1]:59864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwMpJ-0007NO-Mq
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 06:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwMlG-00067z-MG
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:39:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwMlB-0006Rs-Mv
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:39:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624531140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7qDK3g/dAQaSBJ6DbhLLYk83hf7h5AjLXuHNdEpcXhQ=;
 b=a9hYlMvJSTqXnH765uT1kqIfpJ1CtOKzWeiQCJy2urcwjdN/2X/BdpVOQZSRYWHygXfiiD
 BUHpgd26P00Htbsh3D0u4g/BrnLDIyBOCOdm/GLrv4GfSoJylWQxy19opmvcryuvhMmkwN
 zgSwMy9SfHnENV9aAqFzTB7st7VWqsY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-fBTzL6NqOxuxcKh2i1LbZg-1; Thu, 24 Jun 2021 06:38:58 -0400
X-MC-Unique: fBTzL6NqOxuxcKh2i1LbZg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C90A9106B7D8;
 Thu, 24 Jun 2021 10:38:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EFAC5D6A1;
 Thu, 24 Jun 2021 10:38:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 17EE118007AD; Thu, 24 Jun 2021 12:38:37 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/34] modules: check if all dependencies can be satisfied
Date: Thu, 24 Jun 2021 12:38:06 +0200
Message-Id: <20210624103836.2382472-5-kraxel@redhat.com>
In-Reply-To: <20210624103836.2382472-1-kraxel@redhat.com>
References: <20210624103836.2382472-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Jose R. Ziviani" <jziviani@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Lieven <pl@kamp.de>,
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x@nongnu.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Jose R. Ziviani" <jziviani@suse.de>

Verifies if all dependencies are correctly listed in the modinfo.c too
and stop the builds if they're not.

Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 scripts/modinfo-generate.py | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/scripts/modinfo-generate.py b/scripts/modinfo-generate.py
index a6d98a6bc4cc..f559eed0077a 100755
--- a/scripts/modinfo-generate.py
+++ b/scripts/modinfo-generate.py
@@ -59,6 +59,7 @@ def generate(name, lines):
     print_array("deps", deps)
     print_array("opts", opts)
     print("},{");
+    return deps
 
 def print_pre():
     print("/* generated by scripts/modinfo-generate.py */")
@@ -71,14 +72,26 @@ def print_post():
     print("}};")
 
 def main(args):
+    deps = {}
     print_pre()
     for modinfo in args:
         with open(modinfo) as f:
             lines = f.readlines()
         print("    /* %s */" % modinfo)
         (basename, ext) = os.path.splitext(modinfo)
-        generate(basename, lines)
+        deps[basename] = generate(basename, lines)
     print_post()
 
+    flattened_deps = {flat.strip('" ') for dep in deps.values() for flat in dep}
+    error = False
+    for dep in flattened_deps:
+        if dep not in deps.keys():
+            print("Dependency {} cannot be satisfied".format(dep),
+                  file=sys.stderr)
+            error = True
+
+    if error:
+        exit(1)
+
 if __name__ == "__main__":
     main(sys.argv[1:])
-- 
2.31.1


