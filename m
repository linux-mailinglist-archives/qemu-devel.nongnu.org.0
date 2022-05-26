Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E980053475C
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 02:13:00 +0200 (CEST)
Received: from localhost ([::1]:40502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu17b-0006bH-Up
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 20:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nu14N-0003o1-Jr
 for qemu-devel@nongnu.org; Wed, 25 May 2022 20:09:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nu14K-0002ix-IJ
 for qemu-devel@nongnu.org; Wed, 25 May 2022 20:09:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653523771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kDuOKtE6+qQIoSPWbC1zPXw42HvD7oDf0nRn4pZehNE=;
 b=edt7ZMrp0kF7YV2WLbbOHo/fUPuG1UtnBiXW79QE//X1gB2vvYkQP0Ej++5Ba9XeYiYX6o
 rpSgE0DrVPRRH55WlSmpc/q932lapo8RwKlL6ZiHJXI5rJZ4Jdh9BDqQgMF9akNW8eFXWq
 nNI3p4/BsNeMM2UKxBX8vHMiFdntr1M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-XkdzROHVP6S8VrXbd5Veog-1; Wed, 25 May 2022 20:09:30 -0400
X-MC-Unique: XkdzROHVP6S8VrXbd5Veog-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 432CD3C10140;
 Thu, 26 May 2022 00:09:30 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 583352166B26;
 Thu, 26 May 2022 00:09:28 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH 1/9] python: update for mypy 0.950
Date: Wed, 25 May 2022 20:09:13 -0400
Message-Id: <20220526000921.1581503-2-jsnow@redhat.com>
In-Reply-To: <20220526000921.1581503-1-jsnow@redhat.com>
References: <20220526000921.1581503-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

typeshed (included in mypy) recently updated to improve the typing for
WriteTransport objects. I was working around this, but now there's a
version where I shouldn't work around it.

Unfortunately this creates some minor ugliness if I want to support both
pre- and post-0.950 versions. For now, for my sanity, just disable the
unused-ignores warning.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 python/qemu/qmp/util.py | 4 +++-
 python/setup.cfg        | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/python/qemu/qmp/util.py b/python/qemu/qmp/util.py
index eaa5fc7d5f9..ca6225e9cda 100644
--- a/python/qemu/qmp/util.py
+++ b/python/qemu/qmp/util.py
@@ -40,7 +40,9 @@ async def flush(writer: asyncio.StreamWriter) -> None:
     drain. The flow control limits are restored after the call is
     completed.
     """
-    transport = cast(asyncio.WriteTransport, writer.transport)
+    transport = cast(  # type: ignore[redundant-cast]
+        asyncio.WriteTransport, writer.transport
+    )
 
     # https://github.com/python/typeshed/issues/5779
     low, high = transport.get_write_buffer_limits()  # type: ignore
diff --git a/python/setup.cfg b/python/setup.cfg
index e877ea56475..c2c61c75190 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -79,6 +79,7 @@ strict = True
 python_version = 3.6
 warn_unused_configs = True
 namespace_packages = True
+warn_unused_ignores = False
 
 [mypy-qemu.utils.qom_fuse]
 # fusepy has no type stubs:
-- 
2.34.1


