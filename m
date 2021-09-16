Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEAD40D2F2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 07:58:34 +0200 (CEST)
Received: from localhost ([::1]:54578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQkPp-0001rl-Vf
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 01:58:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mQkO1-0008LR-0t
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 01:56:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mQkNz-0006fv-Ew
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 01:56:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631771798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yA8RBI8jMXEWIF9/ev4jT3tPVNoGcGdTl7ZIWWLVpyY=;
 b=Ae46uhDf3GQAYFkq4vfrIWAzu4xdnvM+VGm/7wq6zqZMjvdxNxriuO9go/iHqqx0mwKWbn
 8kdFCAwoevkoDkKhs0YdHVQWOiNmoOwM8wYGM1QlwJt6pQclnMOffTkv4KsaTW19YtZK19
 tcbofkYH65EeghuZ/McyJByz22qTJZg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-QbWJ2NVRNU-WtXm33Boahw-1; Thu, 16 Sep 2021 01:56:37 -0400
X-MC-Unique: QbWJ2NVRNU-WtXm33Boahw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B941B1006AA0
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 05:56:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 830AC60583;
 Thu, 16 Sep 2021 05:56:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DDE1818000B2; Thu, 16 Sep 2021 07:56:23 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/6] qxl: fix pre-save logic
Date: Thu, 16 Sep 2021 07:56:18 +0200
Message-Id: <20210916055623.1846418-2-kraxel@redhat.com>
In-Reply-To: <20210916055623.1846418-1-kraxel@redhat.com>
References: <20210916055623.1846418-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Oops.  Logic is backwards.

Fixes: 39b8a183e2f3 ("qxl: remove assert in qxl_pre_save.")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/610
Resolves: https://bugzilla.redhat.com//show_bug.cgi?id=2002907
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210910094203.3582378-1-kraxel@redhat.com>
---
 hw/display/qxl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 43482d4364ba..29c80b4289b7 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -2252,7 +2252,7 @@ static int qxl_pre_save(void *opaque)
     } else {
         d->last_release_offset = (uint8_t *)d->last_release - ram_start;
     }
-    if (d->last_release_offset < d->vga.vram_size) {
+    if (d->last_release_offset >= d->vga.vram_size) {
         return 1;
     }
 
-- 
2.31.1


