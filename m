Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FCC6E1C0B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 07:56:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnCP0-0007MY-Ab; Fri, 14 Apr 2023 01:55:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pnCOw-0007MA-1v
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 01:55:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pnCOk-0000J4-6o
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 01:55:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681451697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eQ2erG1MU1ZY39NyEs1hlfOGYD0KejDWROaGFqr2jJs=;
 b=WkYX3s4cHDCnGeoJD9babQ6oA6TQ8uICOPQ8YN9LCqpwvT4lrQp6lx3hJLPiw/2MGjoKZs
 2YkJTBjtntHJ4Wb6Clh+H/1U1u21/ImBwyth5MThi0/iBLOrXGppHiJpF6XKzIcNoGUURc
 W943eTvUtBv8VZd3J+fkiD0ftpsmGf8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-8KBWm51zM4S2x8F5grVx4w-1; Fri, 14 Apr 2023 01:54:52 -0400
X-MC-Unique: 8KBWm51zM4S2x8F5grVx4w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 458C685A588;
 Fri, 14 Apr 2023 05:54:52 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B712FC1602A;
 Fri, 14 Apr 2023 05:54:51 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>, Kyle Evans <kevans@freebsd.org>,
 Beraldo Leal <bleal@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH v2 03/10] mkvenv: Add better error message for missing
 pyexapt module
Date: Fri, 14 Apr 2023 01:54:42 -0400
Message-Id: <20230414055449.4028284-4-jsnow@redhat.com>
In-Reply-To: <20230414055449.4028284-1-jsnow@redhat.com>
References: <20230414055449.4028284-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

NetBSD debundles pyexpat from python, but ensurepip needs pyexpat. Try
our best to offer a helpful error message instead of just failing
catastrophically.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/scripts/mkvenv.py | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/python/scripts/mkvenv.py b/python/scripts/mkvenv.py
index 6df95382f3..a3284e9ef1 100644
--- a/python/scripts/mkvenv.py
+++ b/python/scripts/mkvenv.py
@@ -98,7 +98,10 @@ def check_ensurepip(with_pip: bool) -> None:
 
     Raise a fatal exception with a helpful hint if it isn't available.
     """
-    if with_pip and not find_spec("ensurepip"):
+    if not with_pip:
+        return
+
+    if not find_spec("ensurepip"):
         msg = ("Python's ensurepip module is not found.\n"
 
                "It's normally part of the Python standard library, "
@@ -111,6 +114,20 @@ def check_ensurepip(with_pip: bool) -> None:
                "(Hint: Debian puts ensurepip in its python3-venv package.)")
         raise Ouch(msg)
 
+    # ensurepip uses pyexpat, which can also go missing on us:
+    if not find_spec("pyexpat"):
+        msg = ("Python's pyexpat module is not found.\n"
+
+               "It's normally part of the Python standard library, "
+               "maybe your distribution packages it separately?\n"
+
+               "Either install pyexpat, or alleviate the need for it in the "
+               "first place by installing pip and setuptools for "
+               f"'{sys.executable}'.\n\n"
+
+               "(Hint: NetBSD's pkgsrc debundles this to e.g. 'py310-expat'.)")
+        raise Ouch(msg)
+
 
 def make_venv(  # pylint: disable=too-many-arguments
         venv_path: Union[str, Path],
-- 
2.39.2


