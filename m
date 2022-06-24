Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C334559E38
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 18:11:20 +0200 (CEST)
Received: from localhost ([::1]:51666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4ltu-0005tl-VR
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 12:11:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4lrV-0003Ca-5f
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 12:08:49 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4lrS-0004q6-V5
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 12:08:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=grR6YeQ6HqYZ9rX9yIbT3DZjpIqy9MAgZ2bJTwBstYY=; b=znrfmT6pddwFQ0yS+oj04YdYLd
 0CNTtmFa861puswmfket+Cz6Lpv36u5OYFCctcEEFCGDmvVQeyiINO0FYJ7iIFgOIyJN/LuVyq21F
 23mJ28+FMVWjDv8ZV4ZjyWtQj9rtRv9JH+KR6H6//3xVHSJGzHWyy/C9et6JglPSBwc8NuduElCsg
 E+6hw6mY6FFMac2Apk16nLyBo7dv/qd1XmtjpzNFgpraaGP8mPH5n/OalbczXsgEjOOojGQUNwo/V
 5aAVxSXacRcmR6baDl+skK8WjmzNXUmse2z7QsTnFtE/nTYroDe4ssB1dvcf1fSU9CSMSzVW2d/RS
 vM84mGqOfh7hZcEONtZYwpDWnu2Hfa4DcEtADNAADMSQFee4X2nVwct8jaZz8OzKsoOcgR/9fF5hI
 9Vek0EKi6fthZXf2QkWKWzKkGuQPwMWvdEnWHPqOyONedoBDDhvdxteIyGrhPWjOkCBh4nnfkP3zv
 TPw2D8IpWg/n6SyIRH2AS5PBcR0666/QpNhGVFe74w9X3Q6oQzTRb+jR1DTK2vn4litIfhHK2xZYi
 NZsk0MjM+5PDTfTQg3r71O2YFI3lenkJy12TM5Cowuy/US1WxQP3HWGEYjMpuYrq1URoC6/PA1ZON
 OBOXPKMwUmXoLcy4q0Zvw8upsQA9G3ifTDpzP3tBo=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4lqG-0004Nm-Sd; Fri, 24 Jun 2022 17:07:33 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: deller@gmx.de,
	svens@stackframe.org,
	qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 17:08:39 +0100
Message-Id: <20220624160839.886649-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH] artist: set memory region owners for buffers to the artist
 device
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This fixes the output of "info qom-tree" so that the buffers appear as children
of the artist device, rather than underneath the "unattached" container.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/display/artist.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index eadaef0d46..fde050c882 100644
--- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -1358,7 +1358,7 @@ static void artist_create_buffer(ARTISTState *s, const char *name,
 {
     struct vram_buffer *buf = s->vram_buffer + idx;
 
-    memory_region_init_ram(&buf->mr, NULL, name, width * height,
+    memory_region_init_ram(&buf->mr, OBJECT(s), name, width * height,
                            &error_fatal);
     memory_region_add_subregion_overlap(&s->mem_as_root, *offset, &buf->mr, 0);
 
-- 
2.30.2


