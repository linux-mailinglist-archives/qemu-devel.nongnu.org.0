Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1B63C6D8C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 11:33:33 +0200 (CEST)
Received: from localhost ([::1]:34216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3EnE-0004tA-NK
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 05:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m3Elu-000288-EU
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 05:32:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m3Elt-0001pD-1d
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 05:32:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626168728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7gU7JvQMNAPyRLUMeCXKXca13jffBqCyiDPn8OaDu+c=;
 b=Wr2tXPsUz4/DL0khBdQdDfmF9C+HhyJiibN6i2Ks6qJuS7nsC5pM6I2vtjabPNVJ3AePZi
 9wUU04gvuaiDidfuMkmg6j2MfmSHn6nKn/Wdldjb8lqF3nEjA4e2nZ8/KIvGm0EE1qVIQg
 A9BD7keoPR3wd4w45fKchhT3zinrrI8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-6yP7UhgzM3uWclY9vA6W4w-1; Tue, 13 Jul 2021 05:32:07 -0400
X-MC-Unique: 6yP7UhgzM3uWclY9vA6W4w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 509D91934105
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 09:32:06 +0000 (UTC)
Received: from thuth.com (ovpn-112-56.ams2.redhat.com [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77AE45D9CA;
 Tue, 13 Jul 2021 09:32:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 3/4] configure: Fix the default setting of the "xen" feature
Date: Tue, 13 Jul 2021 11:31:54 +0200
Message-Id: <20210713093155.677589-4-thuth@redhat.com>
In-Reply-To: <20210713093155.677589-1-thuth@redhat.com>
References: <20210713093155.677589-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "xen" variable should either contain "enabled", "disabled" or
nothing (for auto detection). But when the user currently runs the
configure script with --without-default-features, it gets set to
"no" instead. This does not work as expected, the feature will still
be enabled if the Xen headers are present. Thus set the variable
to "disabled" instead if default_feature switch has been set.

Reported-by: Cole Robinson <crobinso@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 1974c46f6e..6c7336b763 100755
--- a/configure
+++ b/configure
@@ -311,7 +311,7 @@ vnc_sasl="auto"
 vnc_jpeg="auto"
 vnc_png="auto"
 xkbcommon="auto"
-xen="$default_feature"
+xen=${default_feature:+disabled}
 xen_ctrl_version="$default_feature"
 xen_pci_passthrough="auto"
 linux_aio="$default_feature"
-- 
2.27.0


