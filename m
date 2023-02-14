Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BF9696268
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 12:26:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRtNp-00079V-3l; Tue, 14 Feb 2023 06:22:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRtNm-00078G-Mj
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:21:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRtNl-0002Gp-7A
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:21:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676373716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B6R3gJ+7tlegNHCoQJCZdq25bjnuxOxBpHh+0Vtg3nY=;
 b=dpM2i3tu1EHhhy3tyRCWzL5dzoi8FkzrtsvTu9UkMvs7I5oanBk9Ngm7QIbJmxgYM+td10
 ZQ08xlNdvuJfT63s/TvST8YslFD7NvRq1YQKWz/p8xAeSrZscK4JeLT+BvOqV8l/uj88f7
 1CBbyeAffvtexm6p/4U9bTcdDPLRzBI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-Tq5oacXyNAGeRluV4N7mgg-1; Tue, 14 Feb 2023 06:21:55 -0500
X-MC-Unique: Tq5oacXyNAGeRluV4N7mgg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAEF629DD982;
 Tue, 14 Feb 2023 11:21:54 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8CDB40CE2A7;
 Tue, 14 Feb 2023 11:21:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: [PULL 03/22] meson: Disable libdw for static builds by default
Date: Tue, 14 Feb 2023 12:21:29 +0100
Message-Id: <20230214112148.646077-4-thuth@redhat.com>
In-Reply-To: <20230214112148.646077-1-thuth@redhat.com>
References: <20230214112148.646077-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Static QEMU build fails on Debian Bullseye:

    /usr/bin/ld: /usr/lib/x86_64-linux-gnu/libdw.a(debuginfod-client.o): in function `__libdwfl_debuginfod_init':
    (.text.startup+0x17): undefined reference to `dlopen'

The reason is that pkg-config does not suggest -ldl for libdw, and
adding --extra-ldflags="-ldl" resolves the issue. However, static
linking with libdw is an unclear topic:

* Linux perf does it.
* Debian's libdw-dev description says:

      Only link to the static version for special cases and when you
      don't need anything from the ebl backends.

* As the error message above indicates, -ldl is also needed for
  debuginfod support.

The functionality provided by libdw is needed for analyzing performance
of JITed code, which is mostly useful to developers and researchers.
Therefore, in order to avoid unpleasant surprises for people who don't
need this, simply disable libdw for static builds by default. It can
still be enabled explicitly if needed.

Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20230210005208.438142-2-iii@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 50eb670511..0026bba0ce 100644
--- a/meson.build
+++ b/meson.build
@@ -1650,7 +1650,8 @@ endif
 
 # libdw
 libdw = not_found
-if not get_option('libdw').auto() or have_system or have_user
+if not get_option('libdw').auto() or \
+        (not enable_static and (have_system or have_user))
     libdw = dependency('libdw',
                        method: 'pkg-config',
                        kwargs: static_kwargs,
-- 
2.31.1


