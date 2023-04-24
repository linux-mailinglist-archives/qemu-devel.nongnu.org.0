Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B32D6ED5E5
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 22:08:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr2Ot-0007ii-Jh; Mon, 24 Apr 2023 16:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2Op-0007cw-7r
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:02:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2On-0000wa-CR
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:02:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682366576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ybu6c13xqrBGEvV5edArV3Tyo0lwbd+W+IFGF/gprEM=;
 b=YjvSoGdcugPtKqUPB3z3nwzSwAVPY2DUTZ9pxzB+N1g+I8VlvQ9JCB9JDinTNfdxzrrQHH
 QhwUGMenPp2a8KXSj1/kf6bUtLdZX24BNj6HnPWW8iR5H+wDwJ0+vvMMuspMokF7rYQFk5
 A4gbAJIpj5sGdfgElfkEc07UVnOoCCQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-5lKJAV2aMV-k9dHJEJHHpQ-1; Mon, 24 Apr 2023 16:02:53 -0400
X-MC-Unique: 5lKJAV2aMV-k9dHJEJHHpQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B9DC857FB3;
 Mon, 24 Apr 2023 20:02:52 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6E7A1121318;
 Mon, 24 Apr 2023 20:02:51 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH v3 04/20] mkvenv: Add better error message for missing
 pyexpat module
Date: Mon, 24 Apr 2023 16:02:32 -0400
Message-Id: <20230424200248.1183394-5-jsnow@redhat.com>
In-Reply-To: <20230424200248.1183394-1-jsnow@redhat.com>
References: <20230424200248.1183394-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

NetBSD debundles pyexpat from python, but ensurepip needs pyexpat. Try
our best to offer a helpful error message instead of just failing
catastrophically.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/scripts/mkvenv.py | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/python/scripts/mkvenv.py b/python/scripts/mkvenv.py
index f355cb54fb..2172774403 100644
--- a/python/scripts/mkvenv.py
+++ b/python/scripts/mkvenv.py
@@ -126,7 +126,10 @@ def check_ensurepip(with_pip: bool) -> None:
 
     Raise a fatal exception with a helpful hint if it isn't available.
     """
-    if with_pip and not find_spec("ensurepip"):
+    if not with_pip:
+        return
+
+    if not find_spec("ensurepip"):
         msg = (
             "Python's ensurepip module is not found.\n"
             "It's normally part of the Python standard library, "
@@ -138,6 +141,19 @@ def check_ensurepip(with_pip: bool) -> None:
         )
         raise Ouch(msg)
 
+    # ensurepip uses pyexpat, which can also go missing on us:
+    if not find_spec("pyexpat"):
+        msg = (
+            "Python's pyexpat module is not found.\n"
+            "It's normally part of the Python standard library, "
+            "maybe your distribution packages it separately?\n"
+            "Either install pyexpat, or alleviate the need for it in the "
+            "first place by installing pip and setuptools for "
+            f"'{sys.executable}'.\n\n"
+            "(Hint: NetBSD's pkgsrc debundles this to e.g. 'py310-expat'.)"
+        )
+        raise Ouch(msg)
+
 
 def make_venv(  # pylint: disable=too-many-arguments
     env_dir: Union[str, Path],
-- 
2.39.2


