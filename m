Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B29DF35CF3A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 19:07:49 +0200 (CEST)
Received: from localhost ([::1]:46292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lW02O-0003b9-8N
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 13:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lVzxp-0002Kj-CV
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 13:03:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lVzxm-0006Fg-Ag
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 13:03:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618246980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1fB3s6acNZaWEL9CR0kUeQrmSUdbUvbWIwVGGqKlqG8=;
 b=M3eutFecnCEUipO/GKXeHozcYyXQFHnuDtdpvNPE7IKorLREzUhDsZiC3qiFWnr55aGYOJ
 duCFKAW8PAn8CQRDAnw3HQjTpvH5NRs5CN9ln8Zf417hhMGdI/dHvWA7ykmFGrvU3z8MOW
 apTTpvuZv1fdVkBnKnwJVE3ZrwYF2uE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-miJ135L3Nc-uZIU3JmAH5Q-1; Mon, 12 Apr 2021 13:02:59 -0400
X-MC-Unique: miJ135L3Nc-uZIU3JmAH5Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8D6A1E586;
 Mon, 12 Apr 2021 17:02:57 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-252.ams2.redhat.com
 [10.36.113.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A19BB60BD8;
 Mon, 12 Apr 2021 17:02:56 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] cutils: fix memory leak in get_relocated_path()
Date: Mon, 12 Apr 2021 19:02:55 +0200
Message-Id: <20210412170255.231406-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

get_relocated_path() allocates a GString object and returns the
character data (C string) to the caller without freeing the memory
allocated for that object as reported by valgrind:

  24 bytes in 1 blocks are definitely lost in loss record 2,805 of 6,532
     at 0x4839809: malloc (vg_replace_malloc.c:307)
     by 0x55AABB8: g_malloc (in /usr/lib64/libglib-2.0.so.0.6600.8)
     by 0x55C2481: g_slice_alloc (in /usr/lib64/libglib-2.0.so.0.6600.8)
     by 0x55C4827: g_string_sized_new (in /usr/lib64/libglib-2.0.so.0.6600.8)
     by 0x55C4CEA: g_string_new (in /usr/lib64/libglib-2.0.so.0.6600.8)
     by 0x906314: get_relocated_path (cutils.c:1036)
     by 0x6E1F77: qemu_read_default_config_file (vl.c:2122)
     by 0x6E1F77: qemu_init (vl.c:2687)
     by 0x3E3AF8: main (main.c:49)

Let's use g_string_free(gstring, false) to free only the GString object
and transfer the ownership of the character data to the caller.

Fixes: f4f5ed2cbd ("cutils: introduce get_relocated_path")
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 util/cutils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/cutils.c b/util/cutils.c
index ee908486da..c9b91e7535 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -1055,5 +1055,5 @@ char *get_relocated_path(const char *dir)
         assert(G_IS_DIR_SEPARATOR(dir[-1]));
         g_string_append(result, dir - 1);
     }
-    return result->str;
+    return g_string_free(result, false);
 }
-- 
2.30.2


