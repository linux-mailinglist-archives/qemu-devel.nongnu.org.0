Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE18A2D7CC2
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:26:20 +0100 (CET)
Received: from localhost ([::1]:44174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmBP-0007SD-Ri
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:26:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knlv1-0004Cp-FR
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluT-0002Ea-Bj
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ew2CPMIIsEJ5A0oBZ8T0MCj0xI9qGY9SF/yYazVPLvE=;
 b=IFUON1KHQEdOqGF4YVbAxqu4nYLhkEjRhpdXWqKW3zqMr3kcrVMB8RKIHHoStzQbe/JIEb
 ipvFOZFhseEBzq3VEN1CgJYlnn55ufYHWKAOAdc/9WOM3UbANLejnT6QosuuugrOIBvgoa
 FmnOXL20kqhO7mlN3avVdVidoS7OMBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-k0n-sGk4NS2JQkMPhBOdKg-1; Fri, 11 Dec 2020 12:08:46 -0500
X-MC-Unique: k0n-sGk4NS2JQkMPhBOdKg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41474180E473;
 Fri, 11 Dec 2020 17:08:45 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 402F55D734;
 Fri, 11 Dec 2020 17:08:44 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 20/34] storage-daemon: Call bdrv_close_all() on exit
Date: Fri, 11 Dec 2020 18:07:58 +0100
Message-Id: <20201211170812.228643-21-kwolf@redhat.com>
In-Reply-To: <20201211170812.228643-1-kwolf@redhat.com>
References: <20201211170812.228643-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

Otherwise, exports and block devices are not properly shut down and
closed, unless the users explicitly issues blockdev-del and
block-export-del commands for each of them.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20201027190600.192171-17-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 storage-daemon/qemu-storage-daemon.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index 7c914b0dc1..e0c87edbdd 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -314,6 +314,9 @@ int main(int argc, char *argv[])
         main_loop_wait(false);
     }
 
+    bdrv_drain_all_begin();
+    bdrv_close_all();
+
     monitor_cleanup();
     qemu_chr_cleanup();
     user_creatable_cleanup();
-- 
2.29.2


