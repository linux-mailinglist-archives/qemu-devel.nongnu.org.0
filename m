Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D7B325E80
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 08:57:17 +0100 (CET)
Received: from localhost ([::1]:53538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFXzw-00082I-3p
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 02:57:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lFXyv-0007ZY-TB
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 02:56:13 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:43850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lFXys-0006wJ-7M
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 02:56:13 -0500
Received: by mail-ej1-x62a.google.com with SMTP id k13so13207691ejs.10
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 23:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=LVjjUW5BDudtt7mvafWZ3VEC3ihgBcWA9JHoPZXMXVk=;
 b=EAC8ZTG8WetsUNl21BQha14mExGdew1LOqPC+w1W2P5th2VzEinXzYvtjS5o4ruFKR
 f6FX+wcLRtY8SSNUpT0lUHMLMS2nb13VW3Dx5JXrjM53Gdh3lsMGtbmP1mAD/j1LZise
 Nt2v8+zzaiQTiHAJ1iWCajZKZExbzKBVrvHWc6r2+CclEDCkrlbJZXRE2l1rjPIj3Xu8
 vkha9yt1CYmsA71SRRg6RLN69suwqm+MhxrEg8zkXX6C9KFqMGmXTljljiZp/PTKjXEC
 Ip4EkSgyUfAmWfQnoZ4NZViawbGb2lPX9+IJ0hTFfxpxNF7g/W0xCVKueoz63ZTBLrvN
 txUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=LVjjUW5BDudtt7mvafWZ3VEC3ihgBcWA9JHoPZXMXVk=;
 b=tAvjWprcjGRZz+TzwNa3lUS+/dGRk4af4Aq1d+2KynwcOLiC1Z0px+DNEXqozubcrC
 ud1TZ1oINgAVqpfWMjfZG3pX9tQ17tcJ2RYD6DNPBq2rDY9+7cKpCtXYCcPvMOprkHPZ
 K5JPOWZpoFdnT3HNSUsgZA8fc0IxwRqlU/QHwGvmgGwCzDtNTDr25DAOdwRk+kU/auVi
 BCjnpiJJRZNM1HjlU7pPpLJfWrfL8ch+JIo3viHju/Wgki0mxsRluc/9IOcwAyxeaA5R
 gCSbQYszME3R+AdLL3Qh17CKEcJt/GEQs4ds9ei8kPc02QZH0g5IpKSdjruF/QWoUwOx
 FaNA==
X-Gm-Message-State: AOAM531n53z13G3SsSANbPLQIJ7etljexMzUkNPFeHKn1/kTPHvH2ypm
 QzAanXL0XIdbGs4RCdKfwDw=
X-Google-Smtp-Source: ABdhPJz45F2vSn3fDUigOGRO4v3O3NQPoCGoMd8C1/NtJqip0GYs6kUQumR717JSUnWrDj0Iz7P+1A==
X-Received: by 2002:a17:907:3daa:: with SMTP id
 he42mr2044857ejc.54.1614326168040; 
 Thu, 25 Feb 2021 23:56:08 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id s18sm5450880edc.21.2021.02.25.23.56.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Feb 2021 23:56:07 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH] net: Fix build error when DEBUG_NET is on
Date: Fri, 26 Feb 2021 15:56:01 +0800
Message-Id: <1614326161-65017-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62a.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

"qemu-common.h" should be included to provide the forward declaration
of qemu_hexdump() when DEBUG_NET is on.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 net/net.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/net.c b/net/net.c
index fb7b7dc..32d71c1 100644
--- a/net/net.c
+++ b/net/net.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu-common.h"
 
 #include "net/net.h"
 #include "clients.h"
-- 
2.7.4


