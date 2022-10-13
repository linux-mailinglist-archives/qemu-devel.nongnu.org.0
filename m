Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553C45FD574
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 09:13:37 +0200 (CEST)
Received: from localhost ([::1]:45800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oisPP-00012l-SO
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 03:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois68-0005W4-PJ
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois67-0006tj-1x
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665644018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zz+Qt34oE4M5mrMgManCQwGhH1+sbvEnpgqeJuJljuY=;
 b=SGXfSgcgMb3XSKbQ7mAhURCgP7pbwzATpsArTSDbcQezF/IiDy0HYbfuE/AvzeVPRbVmi3
 xAXyC3uIn8YzToXzBSWh13BgSktPyF2bupAX8IgvbtkWXHWYIcWHoGjAb9GLm0hdF4WAXs
 aUMpf/oa6u0vL6HgE3MTdC958E0tZec=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-0HHEpvmUNPqxI2T_vu6GLg-1; Thu, 13 Oct 2022 02:53:34 -0400
X-MC-Unique: 0HHEpvmUNPqxI2T_vu6GLg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFAB929DD9AF;
 Thu, 13 Oct 2022 06:53:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FAE8140EBF3;
 Thu, 13 Oct 2022 06:53:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3318718009DB; Thu, 13 Oct 2022 08:52:25 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 lu zhipeng <luzhipeng@cestc.cn>
Subject: [PULL 15/26] cirrus_vga: fix potential memory overflow
Date: Thu, 13 Oct 2022 08:52:13 +0200
Message-Id: <20221013065224.1864145-16-kraxel@redhat.com>
In-Reply-To: <20221013065224.1864145-1-kraxel@redhat.com>
References: <20221013065224.1864145-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: lu zhipeng <luzhipeng@cestc.cn>

Signed-off-by: lu zhipeng <luzhipeng@cestc.cn>
Message-Id: <20220929122352.1891-1-luzhipeng@cestc.cn>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/cirrus_vga.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index 3bb6a58698c1..2577005d03ce 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -834,7 +834,7 @@ static void cirrus_bitblt_cputovideo_next(CirrusVGAState * s)
                    word alignment, so we keep them for the next line */
                 /* XXX: keep alignment to speed up transfer */
                 end_ptr = s->cirrus_bltbuf + s->cirrus_blt_srcpitch;
-                copy_count = s->cirrus_srcptr_end - end_ptr;
+                copy_count = MIN(s->cirrus_srcptr_end - end_ptr, CIRRUS_BLTBUFSIZE);
                 memmove(s->cirrus_bltbuf, end_ptr, copy_count);
                 s->cirrus_srcptr = s->cirrus_bltbuf + copy_count;
                 s->cirrus_srcptr_end = s->cirrus_bltbuf + s->cirrus_blt_srcpitch;
-- 
2.37.3


