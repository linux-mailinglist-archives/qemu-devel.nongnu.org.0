Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CB64E3E00
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 13:01:59 +0100 (CET)
Received: from localhost ([::1]:42822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWdD4-0002LR-SX
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 08:01:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWd8G-00029O-Cf
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:57:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWd8E-0006O2-Uf
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:57:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647950217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DehzDUUUL9UTJbER0x1YYX5E/OAx+EakAaCUQuOxVg8=;
 b=Yx1jEWdFDAZnxbMB06RgpKsvSRX0tLboaPhKC/ffr0XpUE2CV9/fZD+70tAyhxAX3ejbrD
 wsvkMEIhQ0ejaiIycET3eHGCwoxnZ0gVUUDgrpI+mvvBhhDQx4eFQWmYClTQXS+BUFYMVo
 mdthG43XOh+2vrk2JPrASTH8non5c8s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-eUgd5reWNXKD1GiX-rSZxg-1; Tue, 22 Mar 2022 07:56:54 -0400
X-MC-Unique: eUgd5reWNXKD1GiX-rSZxg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 103343C16181;
 Tue, 22 Mar 2022 11:56:54 +0000 (UTC)
Received: from localhost (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C29431121314;
 Tue, 22 Mar 2022 11:56:53 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 03/25] tests/qemu-iotests: Use GNU sed in two more spots where
 it is necessary
Date: Tue, 22 Mar 2022 12:56:25 +0100
Message-Id: <20220322115647.726044-4-hreitz@redhat.com>
In-Reply-To: <20220322115647.726044-1-hreitz@redhat.com>
References: <20220322115647.726044-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

These two spots have been missed in commit 9086c7639822 ("Rework the
checks and spots using GNU sed") - they need GNU sed, too, since they
are using the "+" address form.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220309101626.637836-1-thuth@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/common.filter | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common.filter
index 9790411bf0..cc9f1a5891 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -106,13 +106,13 @@ _filter_hmp()
 # replace block job offset
 _filter_block_job_offset()
 {
-    sed -e 's/, "offset": [0-9]\+,/, "offset": OFFSET,/'
+    gsed -e 's/, "offset": [0-9]\+,/, "offset": OFFSET,/'
 }
 
 # replace block job len
 _filter_block_job_len()
 {
-    sed -e 's/, "len": [0-9]\+,/, "len": LEN,/g'
+    gsed -e 's/, "len": [0-9]\+,/, "len": LEN,/g'
 }
 
 # replace actual image size (depends on the host filesystem)
-- 
2.35.1


