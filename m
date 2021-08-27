Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B253F9B95
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 17:20:07 +0200 (CEST)
Received: from localhost ([::1]:46094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJdeI-0003sU-2F
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 11:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mJdbm-0001HP-Gz
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 11:17:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mJdbj-0001wk-W1
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 11:17:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630077446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=L8XgRF1kt+KDBalRdVP8rge/CVuXZFXS+KX+MTrZpn4=;
 b=F+YSKwZHemD2qRj+SIRTV+mrKvSmRaPwSwQ/sv46FCfftANOewy3NvxSyekqi0ukfPyeER
 Tn0Hw2/sMJl0OtrY7X9Mz1S5j7veSWNqLOEsyg5FHJo4kKW3/hxmAj2yd/pZXwWd797r5j
 vtM1e4XAvlYujXY5IjwtwAUTyQO+qXE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-urzFy_e1O7avOBhk9Vh8oQ-1; Fri, 27 Aug 2021 11:17:25 -0400
X-MC-Unique: urzFy_e1O7avOBhk9Vh8oQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C97F1018F64;
 Fri, 27 Aug 2021 15:17:24 +0000 (UTC)
Received: from thuth.com (unknown [10.40.192.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3EFF03CC7;
 Fri, 27 Aug 2021 15:17:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	qemu-devel@nongnu.org
Subject: [PATCH 4/3] gitlab-ci: Don't try to use the system libfdt in the
 debian job
Date: Fri, 27 Aug 2021 17:17:18 +0200
Message-Id: <20210827151718.178988-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

libfdt in Debian is too old to be usable for QEMU. So far we were
silently falling back to the internal dtc submodule, but since
this is wrong, let's remove the --enable-fdt=system switch here now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Sorry, I just noticed this after sending out the first three patches already

 .gitlab-ci.d/buildtest.yml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 903ee65f32..f0eb5f6286 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -74,7 +74,6 @@ build-system-debian:
     job: amd64-debian-container
   variables:
     IMAGE: debian-amd64
-    CONFIGURE_ARGS: --enable-fdt=system
     TARGETS: arm-softmmu avr-softmmu i386-softmmu mipsel-softmmu
       riscv64-softmmu sh4eb-softmmu sparc-softmmu xtensaeb-softmmu
     MAKE_CHECK_ARGS: check-build
-- 
2.27.0


