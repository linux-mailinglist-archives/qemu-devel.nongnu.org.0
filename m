Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 085A02D9CFB
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 17:53:47 +0100 (CET)
Received: from localhost ([::1]:34556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kor6Y-0007zr-32
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 11:53:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tom.ty89@gmail.com>)
 id 1kor4F-0006B4-BR
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 11:51:23 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:34085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tom.ty89@gmail.com>)
 id 1kor4D-0002Rz-Jl
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 11:51:23 -0500
Received: by mail-pg1-x541.google.com with SMTP id g18so12846320pgk.1
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 08:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZN2QWRJBVVOnGYI5o5DsHSj5B6A++45RfDhC+dNBiww=;
 b=vdfPgMWri1KGUb68JzaLTTmzHIBG1Ij6JMaWZ6ws+IrsWKBRnrw1WXUUTQjwTqMv1Z
 dJ9gpXQkMTbLiSIG15F2K3qiFtySOeiPXpXq4kDJC+SObK/8DLxzO9Wt6o1YEk0SRY8a
 ztHD/SYZkhzgZqx2hRLXEQ+gTq6AwvX7p5WTnUpk7H6qbE0VWj1Zn1b3FwxzCMqqKraW
 VhNIZ4oCD5obwpWWGJkXnOgHpQHaPq3x3J8vYqRmHAiKnzZDT6Xputd6uBLAUqYeQEeV
 DfL4OGCU/2ARTRQ73NEmIg9NIcbw8JLKzJxc+leZ2jdyPjNCunQD8klX7a42Izj7BD+f
 58AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZN2QWRJBVVOnGYI5o5DsHSj5B6A++45RfDhC+dNBiww=;
 b=T2ZeZgW6xb5YhiQ8Dq9B5k9BBezfW5jSk/qt6niJKJKBET9YB5KoSlz02CEfisp13x
 gpx1pJcJALhE8uXUlF3YEBE3jU3o60P3nreM5p14PL1dvHkLzzXrd7G+9LUo80eiRvPt
 HIG6QWjeApV7qLr4/Yj7LOf3hQqmSOuD4LUq0YCGK6JJOjfiOyuzup8exWPzmoaeKGS5
 jnCy1sQ5Vx+0UXoDb6c9ScGny18rQwoXvNpkQeyFrfvMF4g366mFuNeWMrzFqyzcd6yi
 Gvt9pYky/6YrFv44YI+uV6fNnKE8FXovdvaLjmV8ZjszS6BZXMDikDFtXhQIW3n+oHs9
 QrQw==
X-Gm-Message-State: AOAM53156cn5lRDiMq3IUVDFMm185bZlkXqohf1WLxWwhgLqQRE7682X
 W+qNiU4bdxg9NDkGANbMPyb6W3SKZK4=
X-Google-Smtp-Source: ABdhPJy3yWoN8bTKfPW/s/TmqRmp8O81BZJkQYCKlZOY0xsaEma/O0uTOF3zTioTDSo2BV7ilayomQ==
X-Received: by 2002:a63:171b:: with SMTP id x27mr25299049pgl.70.1607964679413; 
 Mon, 14 Dec 2020 08:51:19 -0800 (PST)
Received: from archlinux.. ([161.81.68.216])
 by smtp.gmail.com with ESMTPSA id y24sm19858311pfe.42.2020.12.14.08.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 08:51:18 -0800 (PST)
From: Tom Yan <tom.ty89@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] virtio-blk: change default config-wce to false
Date: Tue, 15 Dec 2020 00:51:11 +0800
Message-Id: <20201214165111.5653-1-tom.ty89@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=tom.ty89@gmail.com; helo=mail-pg1-x541.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Tom Yan <tom.ty89@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This would allow `cache=` to be respected when `if=virtio` is used
(instead of `-device virtio-blk-pci`). Since `cache=writeback` is
the default, this does not cause a change in the default behavior.

Also, when `config-wce` is true, `cache.writeback` is still overriden.

Signed-off-by: Tom Yan <tom.ty89@gmail.com>
---
 hw/block/virtio-blk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index bac2d6fa2b..0c2ecd22bc 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -1284,7 +1284,7 @@ static Property virtio_blk_properties[] = {
     DEFINE_BLOCK_CHS_PROPERTIES(VirtIOBlock, conf.conf),
     DEFINE_PROP_STRING("serial", VirtIOBlock, conf.serial),
     DEFINE_PROP_BIT64("config-wce", VirtIOBlock, host_features,
-                      VIRTIO_BLK_F_CONFIG_WCE, true),
+                      VIRTIO_BLK_F_CONFIG_WCE, false),
 #ifdef __linux__
     DEFINE_PROP_BIT64("scsi", VirtIOBlock, host_features,
                       VIRTIO_BLK_F_SCSI, false),
-- 
2.29.2


