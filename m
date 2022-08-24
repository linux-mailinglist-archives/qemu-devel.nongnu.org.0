Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5FA59F70F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:04:05 +0200 (CEST)
Received: from localhost ([::1]:41632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnEy-0000pN-2A
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmtB-0002bB-RP
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:41:33 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:36580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmt6-0001NS-3e
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:41:33 -0400
Received: by mail-pf1-x42b.google.com with SMTP id w29so10406521pfj.3
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=hjdri8IS0vHiKp8ufTWi8yEKyLd7PN9XXMLuAWqNzss=;
 b=bwqtZfXir5VLsjLv0GMiUpHqv3oAUV1nlAmY308E+vai6ebHqLhC9WuYqiQPXn0luN
 5Yd4g4dh8VHVUWvH4Ccbtm50D3jL7zc4SXBNwgauLd1Jgsu2tFsprtzqctDN/UMRPhKr
 3gnAgnVCeHWjSydL2D1k/++b7Q5qI7K7U/SU3KTudS3zvEPaE8z7CY/VPvAlSnYUXal3
 WICTlFHQGGGLDOAjEm3P6j87R8BTETt2tXSGnVnanpcVSzUmii+/62VOeQ1qVOMIur/9
 l4j/3VRnjsXAogdJuGI8gKFwF8EnE8JGpRgW1ftqk9lFw+5tMrPNUO9+70ti1+LjohMp
 9zeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=hjdri8IS0vHiKp8ufTWi8yEKyLd7PN9XXMLuAWqNzss=;
 b=dWypxDzpKN8z6uQ+48QMHf9L7+SQmc2D3/EeCjuV2SmLObXYdoQzP5CFwJug6lT85K
 U9xj+By4fADHCM/j2AJZrk2fUuK/f6mxBEXx+HnPOU0aim2jyrin6DkEFYfM4xJbbsRV
 d8ctBos1Nr3ArKaoejme4VYXA4zKsIoanOlO/S0ahdxu9PY7ukSLK0Y8xNNGOwuGcC89
 Zu4MyxfmOFk1qy77pUa1kRm+Hgucqazn901rUdUXn0bvjN6oLoPvLburCgaSVL43tVMN
 +6bz4wv4O4kiV8OFBnjU77/yNsgvM7Sr6b6sBs1R/qxeF9yg+PEcQwGL2zqA5GjSCepn
 Vn2w==
X-Gm-Message-State: ACgBeo2J6zG/8eG0oTsbxQtf3v/1UWtyaf5Ekd7zUfswZG2RbcQQdGbt
 mheKoDqoQitx1+uuSS2jlQqmRSNOzdE=
X-Google-Smtp-Source: AA6agR5zXJev3TG/qw7WAroQsFZJCSwOK8iGF2Obq+9gByiqkFBmxxxes+Wdp6LOTa8Ea8PP4/6alw==
X-Received: by 2002:a05:6a00:1ac8:b0:536:f09a:eecc with SMTP id
 f8-20020a056a001ac800b00536f09aeeccmr7794376pfv.50.1661334086448; 
 Wed, 24 Aug 2022 02:41:26 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:41:26 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 06/51] util/qemu-sockets: Use g_get_tmp_dir() to get the
 directory for temporary files
Date: Wed, 24 Aug 2022 17:39:44 +0800
Message-Id: <20220824094029.1634519-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Replace the existing logic to get the directory for temporary files
with g_get_tmp_dir(), which works for win32 too.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 util/qemu-sockets.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 83f4bd6fd2..0c41ca9e42 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -919,9 +919,8 @@ static int unix_listen_saddr(UnixSocketAddress *saddr,
     if (saddr->path[0] || abstract) {
         path = saddr->path;
     } else {
-        const char *tmpdir = getenv("TMPDIR");
-        tmpdir = tmpdir ? tmpdir : "/tmp";
-        path = pathbuf = g_strdup_printf("%s/qemu-socket-XXXXXX", tmpdir);
+        path = pathbuf = g_strdup_printf("%s/qemu-socket-XXXXXX",
+                                         g_get_tmp_dir());
     }
 
     pathlen = strlen(path);
-- 
2.34.1


