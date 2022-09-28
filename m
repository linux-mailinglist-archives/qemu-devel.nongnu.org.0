Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D495EDF3D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 16:52:34 +0200 (CEST)
Received: from localhost ([::1]:33874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odYQK-0003ed-7u
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 10:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1odYFk-0005L5-51; Wed, 28 Sep 2022 10:41:36 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:36623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1odYFh-0006f5-6g; Wed, 28 Sep 2022 10:41:35 -0400
Received: by mail-pf1-x430.google.com with SMTP id y136so12738367pfb.3;
 Wed, 28 Sep 2022 07:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=iG8zKOA7eQMVNipI0gqg8iTCFv4UKzsfQifj7X/1NnI=;
 b=R2FCL9Vx7Wg5p3rYrPFd78vu0qDWdDHhajcqNUeISqYejXKK6ZrBTLL77eAOdii5O9
 24nbv8luEGpXHrGGei6B3QxB3NH03EhRWSEPmRp532jDdFrNBC/yKM05k+3JZoGyvqhe
 chSdx2gCoPVC2yNIPVIN+vup7Qr35rbrEQDLbq+uEa4dAREPwgZ0lGEYTwB1FweJ0j9o
 K7bBYc8NE9MbxiDJI7lhXdfPysDEI2r9IXYRssMcsB1RVvR01fm3Stwd9///vQYMtxXu
 e2J2abGmW6Bm4DkcdkpVB9pzgDXiGPgJQG3h9wamgX7Qv6IAb8bkadhGtb+5x3F6jJ31
 UpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=iG8zKOA7eQMVNipI0gqg8iTCFv4UKzsfQifj7X/1NnI=;
 b=jqkNo2wokwjK1lMEARDW8NevWQ3rDIc5TiJBeg7/p/cJT2VHg3gHEfh2e3/qn+6v/L
 dAEpiEN6ZD3RMGHe/gzsSaOFU7d/M/L/HxbFnOkxGe6w0q7hul6YR9hkrVywMPKuKZlC
 +HEu5qg5M87YrIPLiElut4GYQHApaLTLDLGyUaSllhYMSbId4a4oUdINxZHo0KvwVbnq
 BwHCW3Ptp3MHXKY6TJWB9Sflg2EToxefiH8lJQ8Glkh6en91f9D/XdO7oB3dP7FRJTHz
 IINVxkmlEToTnoGaxNX0QF2oEX+8D8zFx9TLSevKT/3O2SKKX8TVjhYZSTJKOYooQqCz
 s3RQ==
X-Gm-Message-State: ACrzQf2sMyxG7q09kmUdAAqUmMjIqqkY7d00ABpxVdF8uIGblleoV3iD
 JJjJ+1me1rvv3wjYIsAekUA=
X-Google-Smtp-Source: AMsMyM4NIjCkWXh3uCVgo/1g2wyPoOGij+j9AH+xSH/xIx09Uq27VfTZ/LYN0aySp1lCkFpor7AcUw==
X-Received: by 2002:a63:ea48:0:b0:43c:69c4:68d4 with SMTP id
 l8-20020a63ea48000000b0043c69c468d4mr22670276pgk.416.1664376090239; 
 Wed, 28 Sep 2022 07:41:30 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 w187-20020a6262c4000000b005546fe4b127sm4075906pfb.78.2022.09.28.07.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 07:41:29 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: Bin Meng <bin.meng@windriver.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v5 1/2] block: Ignore close() failure in get_tmp_filename()
Date: Wed, 28 Sep 2022 22:41:24 +0800
Message-Id: <20220928144125.1997128-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

The temporary file has been created and is ready for use. Checking
return value of close() does not seem useful. The file descriptor
is almost certainly closed; see close(2) under "Dealing with error
returns from close()".

Let's simply ignore close() failure here.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v5:
- new patch: "block: Ignore close() failure in get_tmp_filename()"

 block.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/block.c b/block.c
index bc85f46eed..582c205307 100644
--- a/block.c
+++ b/block.c
@@ -886,10 +886,7 @@ int get_tmp_filename(char *filename, int size)
     if (fd < 0) {
         return -errno;
     }
-    if (close(fd) != 0) {
-        unlink(filename);
-        return -errno;
-    }
+    close(fd);
     return 0;
 #endif
 }
-- 
2.34.1


