Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D338F33C409
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 18:23:40 +0100 (CET)
Received: from localhost ([::1]:35458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLqwN-0006eA-KN
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 13:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1lLqgP-0002Eo-2D
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:07:09 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:34884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1lLqgJ-00020b-1C
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:07:08 -0400
Received: by mail-ej1-x62c.google.com with SMTP id dx17so67560490ejb.2
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 10:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pylLHJgAinjqlE5sLHdTsAWxspsO0C5etrtQxMg+F3E=;
 b=uTy2lCD1y9mRhCwJtNw7s0kLJI/rSe+JAm5x9WwxR4VkSbe3GBDcbZsg2NZJIN3K+C
 bqjj0hGKAPhm/BlLGl/3JhLwK3l+Ofs98Xu+RKXJaD3jaoN1tOuZ0U9wDzyU9NWsneJs
 dNmxks+voRWER1b5Y1Dsghct6Fq4OKgwk6bZOMnZdkSwgW3BUKneQItujAt4j1vm/TLU
 g3rDkxtFne0EJtbz1pbq03+qxizvVjnhAneUV4y2XBZyvRPn5ad+ClZsZSTl+QfV01zd
 9kwqXCZnM8MCwk3L0QvYy0H57p0B977wZyDl11tWeyx0bF+ykCuf4T0aIrHrIAe2KDLz
 WqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pylLHJgAinjqlE5sLHdTsAWxspsO0C5etrtQxMg+F3E=;
 b=mCXbvzuiGG7GkXwUb8Rbn/1qcw4V/PPOQ/lMVAYzMoRirWWk7FJvZqAD4ksxd0/6I1
 L1EaMofjCEx5ivGdJ3qb2laaCTXHNnqCemdAM7Hca8VEh6En6zkrap8csCSxogtXXr/y
 RgTZNd9q5Nt4AICtPv4QFFzHWfYJ+ksakovUEBp3UByJqZ9/JF7cCqDTdKUHGzYx5dvz
 Pqhuonv/d2Dg4XgrZ8PQsQ2xgYPh8g6zor8E3ecR3jQ23UXTm0XrViPrds+mKyUJoKYM
 +3mAq1NuiP3q8eqzMYQiEPgDLwKmzk62fmd/xaio01ui9uTZnV31IUAiC+FHmqI+FXzH
 Y8AQ==
X-Gm-Message-State: AOAM532CFnQYjj16A398ffJVqglyjq7wkhaK9SzHC2GgsitYmCewX6TO
 2f4UqkERn54iC0m7K+xBPHo=
X-Google-Smtp-Source: ABdhPJwgkM1Vnzd/k0rlBAaZI0bp4Lwee3QKoKzIuxTs/3R+UlVccBsOEv4gWEbGEXdMvAiAdBaHxw==
X-Received: by 2002:a17:906:81d5:: with SMTP id
 e21mr24488633ejx.102.1615828019076; 
 Mon, 15 Mar 2021 10:06:59 -0700 (PDT)
Received: from lb01556.speedport.ip
 (p200300f1170e2e5189750ed020d14fdf.dip0.t-ipconnect.de.
 [2003:f1:170e:2e51:8975:ed0:20d1:4fdf])
 by smtp.gmail.com with ESMTPSA id u15sm8728412eds.6.2021.03.15.10.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 10:06:58 -0700 (PDT)
From: Li Zhang <zhlcindy@gmail.com>
To: marcandre.lureau@redhat.com,
	lukasstraub2@web.de,
	armbru@redhat.com
Subject: [PATCH 1/2] Fix the segment fault when calling yank_register_instance
Date: Mon, 15 Mar 2021 18:06:35 +0100
Message-Id: <20210315170636.704201-1-zhlcindy@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=zhlcindy@gmail.com; helo=mail-ej1-x62c.google.com
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
Cc: Li Zhang <li.zhang@cloud.ionos.com>, pankaj.gupta@cloud.ionos.com,
 alexandr.iarygin@profitbricks.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Li Zhang <li.zhang@cloud.ionos.com>

When executing the QMP commands "chardev-change" to change the
backend device to socket, it will cause a segment fault because
it assumes chr->label as non-NULL in function yank_register_instance.
The function qmp_chardev_change calls chardev_new, which label
is NULL when creating a new chardev. The label will be passed to
yank_register_instance which causes a segment fault. The callchain
is as the following:
        chardev_new ->
            qemu_char_open ->
                cc->open ->
                qmp_chardev_open_socket ->
                    yank_register_instance

Signed-off-by: Li Zhang <li.zhang@cloud.ionos.com>
---
 chardev/char-socket.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index c8bced76b7..26d5172682 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -1421,10 +1421,12 @@ static void qmp_chardev_open_socket(Chardev *chr,
         qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_FD_PASS);
     }
 
-    if (!yank_register_instance(CHARDEV_YANK_INSTANCE(chr->label), errp)) {
-        return;
+    if (chr->label) {
+        if (!yank_register_instance(CHARDEV_YANK_INSTANCE(chr->label), errp)) {
+            return;
+        }
+        s->registered_yank = true;
     }
-    s->registered_yank = true;
 
     /* be isn't opened until we get a connection */
     *be_opened = false;
-- 
2.25.1


