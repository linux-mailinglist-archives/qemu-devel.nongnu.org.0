Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B0020388B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 15:58:11 +0200 (CEST)
Received: from localhost ([::1]:37862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnMxe-0007Nj-3f
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 09:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jnMvn-0005NA-R5
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 09:56:15 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:22822
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jnMvm-0007ii-9k
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 09:56:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592834173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=4+/WITPq33oOuq4ULbgpiAQx/AA+X0qzxS870TvpddY=;
 b=YPzP9DxuRImIggSQOKYnti09OKSCYCgzi60ajGliv9VPZ1aGuKkXDzHEeuTKJp/X6+loiz
 Y4VLQHvO5HMVdk0NdAyx1PyM7xVMfaYX/unonfC+kkCvHk/ba4Z8qL7qeoEZAW4GBCJ41Z
 Rp1RNebmr2MVIdorB1OP/KXlObXGIyI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-hbTFzSpDNsm3E1dnbxv89Q-1; Mon, 22 Jun 2020 09:56:09 -0400
X-MC-Unique: hbTFzSpDNsm3E1dnbxv89Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74AFA801503
 for <qemu-devel@nongnu.org>; Mon, 22 Jun 2020 13:56:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5353F10013D7;
 Mon, 22 Jun 2020 13:56:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 399B41753C; Mon, 22 Jun 2020 15:56:01 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/7] build: fix device module builds
Date: Mon, 22 Jun 2020 15:55:56 +0200
Message-Id: <20200622135601.12433-3-kraxel@redhat.com>
In-Reply-To: <20200622135601.12433-1-kraxel@redhat.com>
References: <20200622135601.12433-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 02:57:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: dinechin@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

See comment.  Feels quite hackish.  Better ideas anyone?

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 Makefile.target | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Makefile.target b/Makefile.target
index 8ed1eba95b9c..c70325df5796 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -179,6 +179,13 @@ endif # CONFIG_SOFTMMU
 dummy := $(call unnest-vars,,obj-y)
 all-obj-y := $(obj-y)
 
+#
+# common-obj-m has some crap here, probably as side effect from
+# filling obj-y.  Clear it.  Fixes suspious dependency errors when
+# building devices as modules.
+#
+common-obj-m :=
+
 include $(SRC_PATH)/Makefile.objs
 dummy := $(call unnest-vars,.., \
                authz-obj-y \
-- 
2.18.4


