Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 305992DC57C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:42:25 +0100 (CET)
Received: from localhost ([::1]:57566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpaoi-0004KO-6s
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:42:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpadD-0000CS-NN
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:30:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpad6-000180-If
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:30:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608139822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2vYvGwMwqMStPDkJC7KcHOqt4Xr8Mi7gdMqIA3soAO0=;
 b=jF09z4Gl2lWsLSIKicLetU8gUHpgB24jjUtBwxOmwMkOFcpm8trlcxlcdgA80LHNmTCWgK
 iRBIwXKAR5etbPS53Z/5N1slRNxx1GtXy5qKK8zmEM2On6DhFF+z1WrSH7OlFAlS0SSmPG
 YDw3bTnZOZpVIcQxkZnqhuDSu+jXGt8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-XyEvfrZ9Muut-BbOi9FnPA-1; Wed, 16 Dec 2020 12:30:20 -0500
X-MC-Unique: XyEvfrZ9Muut-BbOi9FnPA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCCAB8144E5;
 Wed, 16 Dec 2020 17:30:18 +0000 (UTC)
Received: from thuth.com (ovpn-113-7.ams2.redhat.com [10.36.113.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBB3610016F4;
 Wed, 16 Dec 2020 17:30:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 11/12] tests/fp: Do not emit implicit-fallthrough warnings in
 the softfloat tests
Date: Wed, 16 Dec 2020 18:29:48 +0100
Message-Id: <20201216172949.57380-12-thuth@redhat.com>
In-Reply-To: <20201216172949.57380-1-thuth@redhat.com>
References: <20201216172949.57380-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The softfloat tests are external repositories, so we do not care
about implicit fallthrough warnings in this code.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Chen Qun <kuhn.chenqun@huawei.com>
Message-Id: <20201211152426.350966-12-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/fp/meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/fp/meson.build b/tests/fp/meson.build
index 3d4fb00f9d..8d739c4d59 100644
--- a/tests/fp/meson.build
+++ b/tests/fp/meson.build
@@ -27,6 +27,7 @@ tfdir = 'berkeley-testfloat-3/source'
 sfinc = include_directories(sfdir / 'include', sfspedir)
 
 tfcflags = [
+  '-Wno-implicit-fallthrough',
   '-Wno-strict-prototypes',
   '-Wno-unknown-pragmas',
   '-Wno-uninitialized',
@@ -209,6 +210,7 @@ libtestfloat = static_library(
 )
 
 sfcflags = [
+  '-Wno-implicit-fallthrough',
   '-Wno-missing-prototypes',
   '-Wno-redundant-decls',
   '-Wno-return-type',
-- 
2.27.0


