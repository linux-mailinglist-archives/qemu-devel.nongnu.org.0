Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 354E769E0C5
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 13:49:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUS5D-0006IL-Ce; Tue, 21 Feb 2023 07:49:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS4k-0005QK-Iv
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:48:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS4i-0007xQ-Bs
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:48:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676983731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=00qk0KvUYcOoWfueLW6G26btNgeaeT8RbTKYC62Bk08=;
 b=eHdHz2W7QUbQLnw+fo1Znpyc6o6Tq3JVt2q/ih7VnP7kZaLQ3pYWbc3I6JbJaDEXljPnxP
 MZUcH25QzIDRJCxHVfdPzI7x2TX3fTttqY+hvVIPJqTxS1alSZdLjnfr/ib3VbCur+MGxr
 PSe8HaPdbmAht4tsrfwyQk4xFOTISSw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-mBHhjaUcNWSdRaLM0djFbw-1; Tue, 21 Feb 2023 07:48:50 -0500
X-MC-Unique: mBHhjaUcNWSdRaLM0djFbw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D1B32A5957E;
 Tue, 21 Feb 2023 12:48:49 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 514FC2026D38;
 Tue, 21 Feb 2023 12:48:48 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, armbru@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 10/16] RFC: build-sys: add slirp.wrap
Date: Tue, 21 Feb 2023 16:47:55 +0400
Message-Id: <20230221124802.4103554-11-marcandre.lureau@redhat.com>
In-Reply-To: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

This allows to build with --enable-slirp / -D slirp=enabled, even when
libslirp is not installed on the system. Meson will pull it from git in
that case.

RFC because this is very convenient, for a developper targetting
different environments, but might not be considered appropriate, as it
is "a kind of" git submodule (without git submodule integration issues
though, afaik, experience should tell).

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 .gitignore             | 2 ++
 subprojects/slirp.wrap | 6 ++++++
 2 files changed, 8 insertions(+)
 create mode 100644 subprojects/slirp.wrap

diff --git a/.gitignore b/.gitignore
index 61fa39967b..1ea59f4819 100644
--- a/.gitignore
+++ b/.gitignore
@@ -20,3 +20,5 @@ GTAGS
 *.swp
 *.patch
 *.gcov
+
+/subprojects/slirp
diff --git a/subprojects/slirp.wrap b/subprojects/slirp.wrap
new file mode 100644
index 0000000000..87cdd8dcd8
--- /dev/null
+++ b/subprojects/slirp.wrap
@@ -0,0 +1,6 @@
+[wrap-git]
+url = https://gitlab.freedesktop.org/slirp/libslirp
+revision = 15c52d69
+
+[provide]
+slirp = libslirp_dep
-- 
2.39.2


