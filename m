Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7128233432
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 16:20:59 +0200 (CEST)
Received: from localhost ([::1]:52586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k19QY-0006qv-OJ
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 10:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k19JZ-00029W-Hn
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 10:13:45 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27693
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k19JU-0004Ln-B9
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 10:13:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596118419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=x5tXcDBrYgUhz/WsAmxTDLW8jPpX0PCK+2AWepR6TEE=;
 b=Yq+gNCPmeecW1AbsqwHWhXsUQMGvQ9UIl+6DksF03/YzpexhdtQdTpdBfTe4KsM3GbMFev
 NVjfk2YW99UmqGkj9MpK4RlJymh0NbTRkQlFCGN7K5YnF7gT+QYXFmnwWGeWxnEKrwm+5n
 JV8pPCUSG5NA3jtCYGCjmndZz0Ur5ew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-qJVHEeeWN6aGMsPdhO6Cgg-1; Thu, 30 Jul 2020 10:13:37 -0400
X-MC-Unique: qJVHEeeWN6aGMsPdhO6Cgg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9E4D107BEF7;
 Thu, 30 Jul 2020 14:13:36 +0000 (UTC)
Received: from thuth.com (ovpn-112-85.ams2.redhat.com [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0C3C8A19D;
 Thu, 30 Jul 2020 14:13:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 1/4] tests/docker: Add python3-venv and netcat to the
 debian-amd64 container
Date: Thu, 30 Jul 2020 16:13:23 +0200
Message-Id: <20200730141326.8260-2-thuth@redhat.com>
In-Reply-To: <20200730141326.8260-1-thuth@redhat.com>
References: <20200730141326.8260-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/30 03:51:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without python3-venv, I get the following message when trying to
run the acceptance tests within the debian container:

 The virtual environment was not created successfully because ensurepip is not
 available.  On Debian/Ubuntu systems, you need to install the python3-venv
 package using the following command.
    apt-get install python3-venv
 You may need to use sudo with that command.  After installing the python3-venv
 package, recreate your virtual environment.

Let's do it as the message suggests.

And while we're at it, also add netcat here since it is required for
some of the acceptance tests.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/docker/dockerfiles/debian-amd64.docker | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index 8fdfd6a6b0..d2500dcff1 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -20,7 +20,9 @@ RUN apt update && \
         librdmacm-dev \
         libsasl2-dev \
         libsnappy-dev \
-        libvte-dev
+        libvte-dev \
+        netcat-openbsd \
+        python3-venv
 
 # virgl
 RUN apt update && \
-- 
2.18.1


