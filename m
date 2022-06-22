Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E676554C2C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 16:06:58 +0200 (CEST)
Received: from localhost ([::1]:58564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o410S-0008Eo-Tq
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 10:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o40xP-0007Lv-Je
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 10:03:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o40xH-0001hA-3o
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 10:03:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655906618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LIWjinE2AJh0qaz5Kku0jJs1fQUMaBcf4Q9GPcpSMDI=;
 b=agZA0NdQrC99CMe2/pcAxjHAckHNtBBB5FR033zUu1vbW+sEISH3tTKOIQk80elYJ9hTM3
 7O3SnKEnDuQCtd+K9dbAZQvLdBhldJ87xY1UAHFypa0x0IrcsOy6WamCoAM4BF6VQYubXp
 BgIdEjNo9Ec/aANl1xGzklMZR17X+L8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-WjjHLPqIPSuh1Q6j6DUjSA-1; Wed, 22 Jun 2022 10:03:33 -0400
X-MC-Unique: WjjHLPqIPSuh1Q6j6DUjSA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 316068117B0;
 Wed, 22 Jun 2022 14:03:33 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C4FE1121314;
 Wed, 22 Jun 2022 14:03:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] common-user: Only compile the common user code if have_user
 is set
Date: Wed, 22 Jun 2022 16:03:28 +0200
Message-Id: <20220622140328.383961-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

There is no need to waste cycles here if we only compile the system
binaries or tools. Additionally, this change is even a hard requirement
for building the tools on systems that do not have an entry in the
common-user/host/ folder (since common-user/meson.build is trying
to add such a path via the include_directories() command).

Reported-by: Michael Tokarev <mjt@tls.msk.ru>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 common-user/meson.build | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/common-user/meson.build b/common-user/meson.build
index 26212dda5c..ac9de5b9e3 100644
--- a/common-user/meson.build
+++ b/common-user/meson.build
@@ -1,3 +1,7 @@
+if not have_user
+   subdir_done()
+endif
+
 common_user_inc += include_directories('host/' / host_arch)
 
 user_ss.add(files(
-- 
2.31.1


