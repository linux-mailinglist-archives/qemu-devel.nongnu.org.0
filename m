Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 403BF373E46
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 17:16:55 +0200 (CEST)
Received: from localhost ([::1]:58852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leJGg-0004EI-BZ
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 11:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1leJER-0002nJ-98
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:14:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1leJDS-0006DN-UT
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:14:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620227613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WpLaRh4uigVjrXIXfUlkki90IlhLBVFQil+C2N3mCr0=;
 b=Epff5iJM6zoLidgrZc6nc9bYowD1aN8AkHQKqZlytRrtdMzMlPC3JAEPJIfLSAfFBr5DDr
 fEBslAeiZAEQHQB6K2movYYlrdGtpBDkXYBDrbYLcxmfQ47+zG1+vV1yG+QjQtu3YLh7uK
 R7RoRFe4r7m1O7YNi7G0FxAgF1FuDTY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-v3-eKi6YNUCpCA0Bup3YXQ-1; Wed, 05 May 2021 11:13:30 -0400
X-MC-Unique: v3-eKi6YNUCpCA0Bup3YXQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED3E591270
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 15:13:29 +0000 (UTC)
Received: from localhost (unknown [10.36.110.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1050D60864;
 Wed,  5 May 2021 15:13:28 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] libvhost-user: fix -Werror=format= warnings with __u64
 fields
Date: Wed,  5 May 2021 19:13:13 +0400
Message-Id: <20210505151313.203258-2-marcandre.lureau@redhat.com>
In-Reply-To: <20210505151313.203258-1-marcandre.lureau@redhat.com>
References: <20210505151313.203258-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: pbonzini@redhat.com, stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

../subprojects/libvhost-user/libvhost-user.c:1070:12: error: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 3 has type ‘__u64’ {aka ‘long long unsigned int’} [-Werror=format=]
 1070 |     DPRINT("    desc_user_addr:   0x%016" PRIx64 "\n", vra->desc_user_addr);
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~              ~~~~~~~~~~~~~~~~~~~
      |                                                           |
      |                                                           __u64 {aka long long unsigned int}

Rather than using %llx, which may fail if __u64 is declared differently
elsewhere, let's just cast the values. Feel free to propose a better solution!

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 2971ba0112..bf09693255 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -1067,10 +1067,10 @@ vu_set_vring_addr_exec(VuDev *dev, VhostUserMsg *vmsg)
     DPRINT("vhost_vring_addr:\n");
     DPRINT("    index:  %d\n", vra->index);
     DPRINT("    flags:  %d\n", vra->flags);
-    DPRINT("    desc_user_addr:   0x%016" PRIx64 "\n", vra->desc_user_addr);
-    DPRINT("    used_user_addr:   0x%016" PRIx64 "\n", vra->used_user_addr);
-    DPRINT("    avail_user_addr:  0x%016" PRIx64 "\n", vra->avail_user_addr);
-    DPRINT("    log_guest_addr:   0x%016" PRIx64 "\n", vra->log_guest_addr);
+    DPRINT("    desc_user_addr:   0x%016" PRIx64 "\n", (uint64_t)vra->desc_user_addr);
+    DPRINT("    used_user_addr:   0x%016" PRIx64 "\n", (uint64_t)vra->used_user_addr);
+    DPRINT("    avail_user_addr:  0x%016" PRIx64 "\n", (uint64_t)vra->avail_user_addr);
+    DPRINT("    log_guest_addr:   0x%016" PRIx64 "\n", (uint64_t)vra->log_guest_addr);
 
     vq->vra = *vra;
     vq->vring.flags = vra->flags;
-- 
2.29.0


