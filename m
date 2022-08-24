Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7951659F6F6
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 11:58:09 +0200 (CEST)
Received: from localhost ([::1]:55882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQn9E-00018I-3t
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 05:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmtk-0002xI-Gl
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:09 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:34742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmtj-0001Ww-1V
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:08 -0400
Received: by mail-pg1-x529.google.com with SMTP id 12so14557690pga.1
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=SN2ceznSVxwoPTz/GsOpvn+I87JiMhfV5WRmzyHm7SU=;
 b=euH1A8kw3PSGPH/748aMxpJ3UvnjdLxXSmTRJXdLMbJb9g+3IbiwQzI64ILAiSdwNN
 54vo9PevczcGqX6rfGJuiHYI5J+MFgTWYYczpDrehWIGYm/upFtjA3d4MSCpBrg0b5Cj
 0ucCrSu75IbahCpqq4PYP6ZMY5x7UQZoDSmSBZ1Vo+uxLNKUlhlJOHI+dU5ls1VrNruQ
 bh712Sp6QKB4S2k9U1hauovu79vgjhxcw4wbyyHTDpMUQdQuLH2bTWxuvWewmtUGFWSu
 TwTalVjmxsPzzh1fHPvGhRZxYd8vyeygUH4G2PGE3ZBWPCfx0n4LHskt8416kCfu8JPq
 cWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=SN2ceznSVxwoPTz/GsOpvn+I87JiMhfV5WRmzyHm7SU=;
 b=WHyLhUtK6AZTPGHatkcoxs/qopc67RUZEIBq7wPRWGStxPHP09NOA2fO5hMq6eY+gJ
 xjidBsNy95D+pvSyktXW6cPZcRcV3x6hRMA9qTgPu3OStKqZpfNhHWf9G6O1owBhf8ls
 YHLmlgzC+EZag8kjhe80tWnggmFbJ2lDMQzkipgR4apjNgNXfsM2djdUMytJztnC9bd6
 Rgmvf4jIxngnPFhp2BxWy1QRLPoyAaXUOg23fL5DA7uv1ipWDPpkaoLUpOioYO8koQBB
 VlBJhDH+HLRyUgoXZZLm4U8n9C2YCEndBWbD3PoIlME3qPgMgg68gkxSBZ4Wd8jhNaam
 XpQg==
X-Gm-Message-State: ACgBeo2iE7dGkX/6BJd1HlWlY0hET+Zt1HjPkFqzK5okJUjmKEcCnzdw
 L4l2nGuPq8J7CUYX+AlC9PQKKq4ldCo=
X-Google-Smtp-Source: AA6agR78wfyQrmvdUm2ADf0XWO+XOecbi91ZQpIrMp0ueeij7sZ4uSEHdZouuCujGBoZxF5UZ3H7rQ==
X-Received: by 2002:a65:6bca:0:b0:420:712f:ab98 with SMTP id
 e10-20020a656bca000000b00420712fab98mr23709916pgw.350.1661334124925; 
 Wed, 24 Aug 2022 02:42:04 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:42:04 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: [PATCH 11/51] qga/commands-posix-ssh: Use g_mkdir_with_parents()
Date: Wed, 24 Aug 2022 17:39:49 +0800
Message-Id: <20220824094029.1634519-12-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

g_mkdir() is a deprecated API and newer codes should use
g_mkdir_with_parents().

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 qga/commands-posix-ssh.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/commands-posix-ssh.c b/qga/commands-posix-ssh.c
index f3a580b8cc..2460112a38 100644
--- a/qga/commands-posix-ssh.c
+++ b/qga/commands-posix-ssh.c
@@ -59,7 +59,7 @@ static bool
 mkdir_for_user(const char *path, const struct passwd *p,
                mode_t mode, Error **errp)
 {
-    if (g_mkdir(path, mode) == -1) {
+    if (g_mkdir_with_parents(path, mode) == -1) {
         error_setg(errp, "failed to create directory '%s': %s",
                    path, g_strerror(errno));
         return false;
-- 
2.34.1


