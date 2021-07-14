Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6CF3C85CD
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 16:14:48 +0200 (CEST)
Received: from localhost ([::1]:36744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3fex-0001vi-6u
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 10:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3fZy-0002Tw-38
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:09:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3fZw-0006fg-CE
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:09:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626271775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8dJ/tLYHi9UB3LRgaug2qiIHxgx4VPxVzHrYqnFVxV8=;
 b=CtlhXtOUOMn6jk5WFyI7YXhF2Bu8xwCitzLG1OFIrRZ2HHBpJ5vUCJLrVpHzshWtLemSq5
 SRTQfiPuDiIckhlAEzS9MFmdotxbyyF7HS1NKJ3GXwW7f0LaWwKCtZljxTJWAYEfZpLVsL
 VSgJasTa3XvG0fNyfHR445WKo2IRwCE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-43aUkieDMdG7aNRQnQbPPw-1; Wed, 14 Jul 2021 10:09:34 -0400
X-MC-Unique: 43aUkieDMdG7aNRQnQbPPw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F7AF100C620;
 Wed, 14 Jul 2021 14:09:33 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-160.ams2.redhat.com
 [10.36.114.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86CF319C87;
 Wed, 14 Jul 2021 14:09:30 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/26] crypto: fix gcrypt min version 1.8 regression
Date: Wed, 14 Jul 2021 15:08:37 +0100
Message-Id: <20210714140858.2247409-6-berrange@redhat.com>
In-Reply-To: <20210714140858.2247409-1-berrange@redhat.com>
References: <20210714140858.2247409-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
Cc: Eduardo Otubo <otubo@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The min gcrypt was bumped:

  commit b33a84632a3759c00320fd80923aa963c11207fc
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri May 14 13:04:08 2021 +0100

    crypto: bump min gcrypt to 1.8.0, dropping RHEL-7 support

but this was accidentally lost in conflict resolution for

  commit 5761251138cb69c310e9df7dfc82c4c6fd2444e4
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 11:15:26 2021 +0200

    configure, meson: convert crypto detection to meson

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index b0e2b9a8a0..e7de68d795 100644
--- a/meson.build
+++ b/meson.build
@@ -839,7 +839,7 @@ elif (not get_option('nettle').auto() or have_system) and not get_option('gcrypt
   endif
 endif
 if (not get_option('gcrypt').auto() or have_system) and not nettle.found()
-  gcrypt = dependency('libgcrypt', version: '>=1.5',
+  gcrypt = dependency('libgcrypt', version: '>=1.8',
                          method: 'config-tool',
                          required: get_option('gcrypt'),
                          kwargs: static_kwargs)
-- 
2.31.1


