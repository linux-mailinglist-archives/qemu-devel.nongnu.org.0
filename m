Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F26B3030F5
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 01:21:31 +0100 (CET)
Received: from localhost ([::1]:48394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4C6r-0001yK-Ux
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 19:21:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l4C50-0001Kd-KU; Mon, 25 Jan 2021 19:19:34 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l4C4y-00070n-Sr; Mon, 25 Jan 2021 19:19:34 -0500
Received: by mail-pl1-x62d.google.com with SMTP id r4so8674371pls.11;
 Mon, 25 Jan 2021 16:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=1I4Qf9AOEnEfaNfDWFUEDyAY0wKH4VXEr9fbQaUdjQQ=;
 b=rixOMl0nfjNxkTKivcdnJsDMd94mx6WqylZu/dEVp2+VOUfz1S4KzLceSNeQUAMXNf
 IVkOFni3PGMIgrxozn+VURKUlEqzhKjVkd8GTWrdicAsIYA5Y90x/eO5Hih1BMDaly08
 adn6lnZ5eiZgLo/CHcOyBeK5U9lTmZdEaGeHMHUwnzS3uHVUI9jjIJon1M1vEwsdum0V
 Ad3p/1Q1ieA+8HuqIXVMg+mq0LMtFAlZ+vwSpEVfx1aZIxvtBdNEoq35KP7FHjy6SxV3
 msmV9YvBYnr1x+qZOxgy4Gnbdfp+vkvucMx7q3SEpnvLNSuvuSh+e8jyXgcBoI7DFcBr
 EW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1I4Qf9AOEnEfaNfDWFUEDyAY0wKH4VXEr9fbQaUdjQQ=;
 b=sFj72CC7YBoHME5oiM6GCqYHg1IffGJp3Xx4WqLMt6dqdnY71ONmFlDgnhSJIsh9NM
 livhPKjda+cyg+vGcXcWmVtsX1Aj5rtZiegfZty10sJu8jiIghJYdYuXLx/OVkLpNXHt
 5GevFqHdYKfS8JpYLGLPDGhEfODV9E1+0WCnXhRlxOXoAQmVWdOPBdjP951EjmiY82jG
 CJTYSouGSCIbt8EQfksckvLiXGkzBLDvVpbe/aHg2/DG5hKreec5AqWXdY5HFmPF9iOI
 jmUF/l+Df/eFICLqRmxWHMV7/hZx8MTT/uoFkthCHOZ+AvQRWuYp8+fAfZFCQFO+xk30
 O+lg==
X-Gm-Message-State: AOAM531zsYjuV9rACiTZGQn2SktUs5FduqyOP8tqqFjVwSP/KOthVuW5
 JVPU+BT29Z02WKAqPz0qT2RGDE7yYsqzKA==
X-Google-Smtp-Source: ABdhPJz1hqyN0aRDFFC7tdG3IRSX6oZSBs5mZeiHQ7DOuBhj46SWDHl/bH2g6i3/mNVczZa5hqKSAQ==
X-Received: by 2002:a17:90a:4588:: with SMTP id
 v8mr2917711pjg.58.1611620370433; 
 Mon, 25 Jan 2021 16:19:30 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id c73sm16229643pfb.77.2021.01.25.16.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 16:19:29 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH] hw/block/nvme: fix wrong parameter name 'cross_read'
Date: Tue, 26 Jan 2021 09:19:24 +0900
Message-Id: <20210126001924.3963-1-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The actual parameter name is 'cross_read' rather than 'cross_zone_read'.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 21aec90637fa..bf9134f73d81 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -81,7 +81,7 @@
  *         The default value means there is no limit to the number of
  *         concurrently open zones.
  *
- *     zoned.cross_zone_read=<enable RAZB, default: false>
+ *     zoned.cross_read=<enable RAZB, default: false>
  *         Setting this property to true enables Read Across Zone Boundaries.
  */
 
-- 
2.17.1


