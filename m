Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8D95F6AA1
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 17:31:59 +0200 (CEST)
Received: from localhost ([::1]:36782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogSqo-0000V2-Qo
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 11:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSXY-000393-OM; Thu, 06 Oct 2022 11:12:00 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:54032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSXX-0004Zm-6T; Thu, 06 Oct 2022 11:12:00 -0400
Received: by mail-pj1-x102d.google.com with SMTP id fw14so1994165pjb.3;
 Thu, 06 Oct 2022 08:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mASgTbgC1fZZDNGRrUnVCNQGIWuAR0DCWfyrQC7EGTU=;
 b=TkiKcW7X9R/0lTL6npTDE04kdSi+VqU2sQRyS5vINubLom5afweUGnMqeyLOe7ME9e
 xdFoo3uPaHn9S1QQAwMfmT//5ithqO9GsAkB6M54JbHAeMUdPr0cmI4Um1t1fNPzDhSx
 DUD+dZRGzSaLwQ2248LwOLBbW1ASKe8fatDDm+lSGAqs8CfDj0rBaW8YrrFulkTDrSoN
 LFn174UwDSLz04CiJ20/aLScyk1TfNcqNIJy4rx3TfSLHvU5T4G8Jjzg4TADPSE1P5hJ
 zzWRuzl1wi+ymAorZx1aGUAL8S9Oz5s1hWKI1kEi1kzXxMXj/gP9th7o5yRZxg4O5Tdn
 BAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mASgTbgC1fZZDNGRrUnVCNQGIWuAR0DCWfyrQC7EGTU=;
 b=Kthqc4UE2qbV5fVGfQrXnJ6aIV3pX7Ym8sSRFd4Ez10MIwYe+0ELwfFEEzYI52Xe9b
 klDPY/Y61Ch1OUmM3OhqduHrAeg+DVOasgki70Ci6kVElPj0hJ0f9JSctYwx+7317OiT
 257Nf+blZplun4aZUYgZjaq3EvDWlYEbqVCyBWr64v2xvmZICuwF1jV7K6vh7OXSGq8d
 OEM3UA+ZRW1u/CeOhkxQnOo8FrNZFb9XqieMyts/lVONrhJBHrA3OXr1iUm8b/VlITeZ
 mxd83EF9PhzE2e1L3r3QXMptIl2pVJfeqw+d0jfiVnQNv/VFdg0Odydcxhe12EdXMQeG
 Vr4w==
X-Gm-Message-State: ACrzQf2lnuvWNR/E2zEaWduHEtMbzKYwYqslXF5EovpZliU1FtASip5R
 zebTgwffcktc7Ba+wLb85jdyEBHlk+M=
X-Google-Smtp-Source: AMsMyM7hHc/srnZOYT1GLI7DoLI8tynuRrFglLG6qa7XvfW6/5OOCu0lPmhH2GJ2jSkoOZyzvAjQgg==
X-Received: by 2002:a17:902:bd46:b0:17e:8ee5:7b61 with SMTP id
 b6-20020a170902bd4600b0017e8ee57b61mr406732plx.44.1665069117189; 
 Thu, 06 Oct 2022 08:11:57 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 135-20020a62148d000000b00540c8ed61ddsm8589067pfu.150.2022.10.06.08.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:11:56 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: [PATCH 05/18] block/vvfat: Unify the mkdir() call
Date: Thu,  6 Oct 2022 23:11:22 +0800
Message-Id: <20221006151135.2078908-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151135.2078908-1-bmeng.cn@gmail.com>
References: <20221006151135.2078908-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102d.google.com
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

There is a difference in the mkdir() call for win32 and non-win32
platforms, and currently is handled in the codes with #ifdefs.

glib provides a portable g_mkdir() API and we can use it to unify
the codes without #ifdefs.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v2)

Changes in v2:
- Change to use g_mkdir()

 block/vvfat.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index d6dd919683..723beef025 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -25,6 +25,7 @@
 
 #include "qemu/osdep.h"
 #include <dirent.h>
+#include <glib/gstdio.h>
 #include "qapi/error.h"
 #include "block/block_int.h"
 #include "block/qdict.h"
@@ -2726,13 +2727,9 @@ static int handle_renames_and_mkdirs(BDRVVVFATState* s)
             mapping_t* mapping;
             int j, parent_path_len;
 
-#ifdef __MINGW32__
-            if (mkdir(commit->path))
+            if (g_mkdir(commit->path, 0755)) {
                 return -5;
-#else
-            if (mkdir(commit->path, 0755))
-                return -5;
-#endif
+            }
 
             mapping = insert_mapping(s, commit->param.mkdir.cluster,
                     commit->param.mkdir.cluster + 1);
-- 
2.34.1


