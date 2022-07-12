Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E835722AF
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 20:33:13 +0200 (CEST)
Received: from localhost ([::1]:38534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBKh6-00088s-AP
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 14:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHg-0003Nj-1X
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:06:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHb-0006bb-Su
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:06:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657649208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pGGA/gglYwh+MYxEM1c/so3N0h7N3wyjvd4UFZfrWIE=;
 b=C0TIkjAm+uc6H0FiRlXTIczBTKnTZaL3mFu/m/O/LnidDxTA3B1RIGNP7NXBf+Mgq+xuUI
 tyVRXYSRLuafIJTAtMg5WrMT7RY4tUHMHflv/J0w561bIes9dwshwzi7IwZuaw4rZaR1wg
 AO3SNyxLw09cBEvaqaBWWPKpqGx4rig=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-66-D7kwnujiMtqN0c21xggF_w-1; Tue, 12 Jul 2022 14:06:39 -0400
X-MC-Unique: D7kwnujiMtqN0c21xggF_w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0EB1A8041BE;
 Tue, 12 Jul 2022 18:06:39 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE792400EAA4;
 Tue, 12 Jul 2022 18:06:38 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 11/35] tests/qemu-iotests: hotfix for 307, 223 output
Date: Tue, 12 Jul 2022 20:05:53 +0200
Message-Id: <20220712180617.1362407-12-hreitz@redhat.com>
In-Reply-To: <20220712180617.1362407-1-hreitz@redhat.com>
References: <20220712180617.1362407-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: John Snow <jsnow@redhat.com>

Fixes: 58a6fdcc
Signed-off-by: John Snow <jsnow@redhat.com>
Tested-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220616142659.3184115-2-jsnow@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/223.out | 4 ++--
 tests/qemu-iotests/307.out | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/223.out b/tests/qemu-iotests/223.out
index 0647941531..26fb347c5d 100644
--- a/tests/qemu-iotests/223.out
+++ b/tests/qemu-iotests/223.out
@@ -93,7 +93,7 @@ exports available: 3
  export: 'n2'
   description: some text
   size:  4194304
-  flags: 0xced ( flush fua trim zeroes df cache fast-zero )
+  flags: 0xded ( flush fua trim zeroes df multi cache fast-zero )
   min block: 1
   opt block: 4096
   max block: 33554432
@@ -212,7 +212,7 @@ exports available: 3
  export: 'n2'
   description: some text
   size:  4194304
-  flags: 0xced ( flush fua trim zeroes df cache fast-zero )
+  flags: 0xded ( flush fua trim zeroes df multi cache fast-zero )
   min block: 1
   opt block: 4096
   max block: 33554432
diff --git a/tests/qemu-iotests/307.out b/tests/qemu-iotests/307.out
index ec8d2be0e0..390f05d1b7 100644
--- a/tests/qemu-iotests/307.out
+++ b/tests/qemu-iotests/307.out
@@ -83,7 +83,7 @@ exports available: 2
  export: 'export1'
   description: This is the writable second export
   size:  67108864
-  flags: 0xced ( flush fua trim zeroes df cache fast-zero )
+  flags: 0xded ( flush fua trim zeroes df multi cache fast-zero )
   min block: XXX
   opt block: XXX
   max block: XXX
@@ -109,7 +109,7 @@ exports available: 1
  export: 'export1'
   description: This is the writable second export
   size:  67108864
-  flags: 0xced ( flush fua trim zeroes df cache fast-zero )
+  flags: 0xded ( flush fua trim zeroes df multi cache fast-zero )
   min block: XXX
   opt block: XXX
   max block: XXX
-- 
2.35.3


