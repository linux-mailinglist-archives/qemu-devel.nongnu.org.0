Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7383C5D22
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:21:31 +0200 (CEST)
Received: from localhost ([::1]:59028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vsI-0000nE-Gm
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2vb4-0001dd-7P
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:03:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2vb2-00064b-JA
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:03:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626095020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uTE/eywtLgbhjyVi/AnhtdOXluTrf5xevKaYcXV2E88=;
 b=SiZZ2fVq0Z4Wxw3eK+1FMmm35+jK8r6U5PaUBh37LLcpmBuf5rdXP11b8GVbbG1qaCmDU3
 uxKzV+tcuKtsryF+W49d1JfmU/sZt5NifK7KwGToUo9qv6Si90cHoyUYJ8ZoCCwkJxVIdN
 jHSR77kzpojfZjV7+Qd3BKFnXMLwUMc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-E6gy4hsSP22ery9EF9HM0A-1; Mon, 12 Jul 2021 09:03:38 -0400
X-MC-Unique: E6gy4hsSP22ery9EF9HM0A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E11EE9F93A;
 Mon, 12 Jul 2021 13:03:37 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-105.ams2.redhat.com
 [10.36.114.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC9985C1D1;
 Mon, 12 Jul 2021 13:03:30 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/22] crypto: fix gcrypt min version 1.8 regression
Date: Mon, 12 Jul 2021 14:02:06 +0100
Message-Id: <20210712130223.1825930-6-berrange@redhat.com>
In-Reply-To: <20210712130223.1825930-1-berrange@redhat.com>
References: <20210712130223.1825930-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, Eric Blake <eblake@redhat.com>
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
index dd7f9ed6a8..10370a6961 100644
--- a/meson.build
+++ b/meson.build
@@ -843,7 +843,7 @@ elif (not get_option('nettle').auto() or have_system) and not get_option('gcrypt
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


