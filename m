Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E71214EAA9F
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 11:37:49 +0200 (CEST)
Received: from localhost ([::1]:35984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ8IP-0003Ue-2L
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 05:37:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nZ8GX-0002QS-7I
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 05:35:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nZ8GU-0008GR-UP
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 05:35:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648546550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Dtq9HyoXLJwxSplhVLKvViaa6J+8snKGvjgsiMOpbJA=;
 b=DEacE8KLEpzHYWqsHSYwxfyKzMhkZpJ7C6XFlSMOvDpipoJsqmAwM7JYA0WzwtCrChjMsl
 iUV7/Cp5bGs/YvGD3VAqlVlPpp7dCgcx7hxxkcZU2t+qxtTSl73/48CIJTaOHf9twMTAMt
 BE9uCpWHLAhRoPR29vfdvTWEhwzah6E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-_bSzwOngO4uIN5wogmjMMQ-1; Tue, 29 Mar 2022 05:35:47 -0400
X-MC-Unique: _bSzwOngO4uIN5wogmjMMQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA59128EC103;
 Tue, 29 Mar 2022 09:35:46 +0000 (UTC)
Received: from localhost (unknown [10.39.194.242])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CEB340CF8E7;
 Tue, 29 Mar 2022 09:35:46 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-7.0] main-loop: Disable GLOBAL_STATE_CODE() assertions
Date: Tue, 29 Mar 2022 11:35:45 +0200
Message-Id: <20220329093545.52114-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These assertions are very useful for developers to find bugs, and so
they have indeed pointed us towards bugs already.  For users, it is not
so useful to find these bugs.  We should probably not enable them in
releases until we are sufficiently certain that they will not fire
during normal operation, unless something is going seriously wrong.

For example, we have received a bug report that you cannot add an NBD
server on a BDS in an I/O thread with `-incoming defer`.  I am sure this
is a real bug that needs investigation, but we do not really have that
time right now, so close to release, and so I would rather disable the
assertions to get time to investigate such reports.

(I am just putting the link as "buglink" below, not "closes", because
disabling the assertion will not fix the likely underlying bug.)

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/945
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 include/qemu/main-loop.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index 7a4d6a0920..3bf8aeb3cd 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -272,7 +272,8 @@ bool qemu_in_main_thread(void);
 /* Mark and check that the function is part of the global state API. */
 #define GLOBAL_STATE_CODE()                                         \
     do {                                                            \
-        assert(qemu_in_main_thread());                              \
+        /* FIXME: Re-enable after 7.0 release */                    \
+        /* assert(qemu_in_main_thread()); */                        \
     } while (0)
 
 /* Mark and check that the function is part of the I/O API. */
-- 
2.35.1


