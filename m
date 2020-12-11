Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAFE2D72B4
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 10:17:40 +0100 (CET)
Received: from localhost ([::1]:58868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kneYV-0003p5-FV
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 04:17:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kneU6-0007Dd-LN
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 04:13:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kneU1-0004i4-E9
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 04:13:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607677980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wq9bxXFiEZiWNfxB3VKZXN/zH1Ik3kNE0TlN/sqibYg=;
 b=W81aw87dZmTCYHzDSxRuiHke9ltGMeYG6Htk/kJYtACGtQfAZ0JA7Lt8cnXRoBhwMrcB83
 jg4BjMAlbvEoELJX9uSF3NYoq5GhFhxaxCUuI+1sY6SpCERzwuyxKwI0SvxUUHt5UiyCBU
 XIzyXLMt3xX9o+PPbHXwvQYwiofplsw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-rbzm6aU6Pt23drjG-vQAyQ-1; Fri, 11 Dec 2020 04:12:57 -0500
X-MC-Unique: rbzm6aU6Pt23drjG-vQAyQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DA38107ACE8;
 Fri, 11 Dec 2020 09:12:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED6931002393;
 Fri, 11 Dec 2020 09:12:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 18CC89D9D; Fri, 11 Dec 2020 10:12:51 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/8] ui/vnc: Add missing lock for send_color_map
Date: Fri, 11 Dec 2020 10:12:49 +0100
Message-Id: <20201211091250.1415-8-kraxel@redhat.com>
In-Reply-To: <20201211091250.1415-1-kraxel@redhat.com>
References: <20201211091250.1415-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peng Liang <liangpeng10@huawei.com>, Euler Robot <euler.robot@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peng Liang <liangpeng10@huawei.com>

vnc_write() should be locked after the RFB protocol is initialized.

Fixes: 0c426e4534b4 ("vnc: Add support for color map")
Cc: qemu-stable@nongnu.org
Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
Message-id: 20201116141338.148911-1-liangpeng10@huawei.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/vnc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ui/vnc.c b/ui/vnc.c
index 247e80d8f5c8..34e6dc437c0f 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2168,6 +2168,7 @@ static void send_color_map(VncState *vs)
 {
     int i;
 
+    vnc_lock_output(vs);
     vnc_write_u8(vs, VNC_MSG_SERVER_SET_COLOUR_MAP_ENTRIES);
     vnc_write_u8(vs,  0);    /* padding     */
     vnc_write_u16(vs, 0);    /* first color */
@@ -2180,6 +2181,7 @@ static void send_color_map(VncState *vs)
         vnc_write_u16(vs, (((i >> pf->gshift) & pf->gmax) << (16 - pf->gbits)));
         vnc_write_u16(vs, (((i >> pf->bshift) & pf->bmax) << (16 - pf->bbits)));
     }
+    vnc_unlock_output(vs);
 }
 
 static void set_pixel_format(VncState *vs, int bits_per_pixel,
-- 
2.27.0


