Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D17E64ED039
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:37:30 +0200 (CEST)
Received: from localhost ([::1]:44672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZhsX-0001sM-U4
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:37:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsv-00083R-JC
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:45 -0400
Received: from [2a00:1450:4864:20::135] (port=42544
 helo=mail-lf1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfss-0003EL-V6
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:45 -0400
Received: by mail-lf1-x135.google.com with SMTP id d5so38070206lfj.9
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uGuhODNDtdx0o1No7NswfaxfWsI5Jg2nwGbCTeve7eQ=;
 b=mFevxxABhstW6S+KZKTR1LlYTcAxvbkzF4ihs6IeBcSo89lgbN9a/HoBl8RUpZaDzy
 7wYNE4VkUkNTtb9dfmkWAshvr2kz6OA1EYO1j63gmlyGwRF9AL1eGR+bBYFgh6+TWhFl
 j8E7m36LErbDqAK/KsMyJIFLC5aUpxDdLufYxT8ZyTBvNx1adWYKdjsWTzXrrjXFa+D3
 NtuQE0GSdOzkbBO10BW7zOJjxqGi+MgzZrvYeQM3vg/anod0eBZV4fM9IWBLl0LwVm2v
 yur5YGJJsaTpjOaaJVHCqMlWvHkcdBER4yKFWJxaBCVCu1ODlSbTtTVVd3EpkDpZwjo6
 3L6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uGuhODNDtdx0o1No7NswfaxfWsI5Jg2nwGbCTeve7eQ=;
 b=EYkUhmAXEaLzFq/EGtzdq+kMRXY2JYw30dc9U1me0IgENDcxPOYh/IduRusyq8q826
 dHrpp9kjM+CnO+X+ELH08g80Cyjz88hZE+bLt6o06Q94AdEs6nNn1HyfP0BRoAOs1jD9
 ONCg89J89jWtYS1A7lKBi+5MdyS88ZQiiVDed+4kLb35pmGK81z0dccQG4HF46mYRRql
 vIlKH+gOms/EwPp0ND/uTxFNiaFwvkFC1Qd+o1Zl8wKd7U7qSCSmnI9HoewzLgPjrjCa
 IKC7yKt502FhBIy0BW2j6N07K/vL4X1QKi+MjgQ1WnmqsfZWT1uCy3wx/7ZcsEes8UXO
 L77g==
X-Gm-Message-State: AOAM530ZByFq7GawE49A4ATmQaOkg8VBGjVIMsq8qFNq18t7zKThYe+8
 A/+O8o1DLc4dbbElMZ5h02eDjA==
X-Google-Smtp-Source: ABdhPJwHJLNiJPJcYrMEHYRe+LnDMl3iliwgAlUz1+9oW+mNmGf+xrCdpnJ/o0cXeCf+IEFYak3W3w==
X-Received: by 2002:a05:6512:11cc:b0:44a:5770:7425 with SMTP id
 h12-20020a05651211cc00b0044a57707425mr8206430lfr.406.1648675781349; 
 Wed, 30 Mar 2022 14:29:41 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:41 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 16/45] block: drop bdrv_detach_child()
Date: Thu, 31 Mar 2022 00:28:33 +0300
Message-Id: <20220330212902.590099-17-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::135
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x135.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:25 -0400
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
Cc: kwolf@redhat.com, hreitz@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only caller is bdrv_root_unref_child(), let's just do the logic
directly in it. It simplifies further convertion of
bdrv_root_unref_child() to transaction action.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block.c | 45 ++++++++++++++++++---------------------------
 1 file changed, 18 insertions(+), 27 deletions(-)

diff --git a/block.c b/block.c
index ea5687edc8..34e89b277f 100644
--- a/block.c
+++ b/block.c
@@ -3048,30 +3048,6 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
     return 0;
 }
 
-static void bdrv_detach_child(BdrvChild *child)
-{
-    BlockDriverState *old_bs = child->bs;
-
-    GLOBAL_STATE_CODE();
-    bdrv_replace_child_noperm(child, NULL);
-    bdrv_child_free(child);
-
-    if (old_bs) {
-        /*
-         * Update permissions for old node. We're just taking a parent away, so
-         * we're loosening restrictions. Errors of permission update are not
-         * fatal in this case, ignore them.
-         */
-        bdrv_refresh_perms(old_bs, NULL);
-
-        /*
-         * When the parent requiring a non-default AioContext is removed, the
-         * node moves back to the main AioContext
-         */
-        bdrv_try_set_aio_context(old_bs, qemu_get_aio_context(), NULL);
-    }
-}
-
 /*
  * This function steals the reference to child_bs from the caller.
  * That reference is later dropped by bdrv_root_unref_child().
@@ -3158,12 +3134,27 @@ out:
 /* Callers must ensure that child->frozen is false. */
 void bdrv_root_unref_child(BdrvChild *child)
 {
-    BlockDriverState *child_bs;
+    BlockDriverState *child_bs = child->bs;
 
     GLOBAL_STATE_CODE();
+    bdrv_replace_child_noperm(child, NULL);
+    bdrv_child_free(child);
+
+    if (child_bs) {
+        /*
+         * Update permissions for old node. We're just taking a parent away, so
+         * we're loosening restrictions. Errors of permission update are not
+         * fatal in this case, ignore them.
+         */
+        bdrv_refresh_perms(child_bs, NULL);
+
+        /*
+         * When the parent requiring a non-default AioContext is removed, the
+         * node moves back to the main AioContext
+         */
+        bdrv_try_set_aio_context(child_bs, qemu_get_aio_context(), NULL);
+    }
 
-    child_bs = child->bs;
-    bdrv_detach_child(child);
     bdrv_unref(child_bs);
 }
 
-- 
2.35.1


