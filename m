Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC89341E89
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:40:55 +0100 (CET)
Received: from localhost ([::1]:43036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFN0-0001ue-4O
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:40:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lNF9E-0001Lz-Ux
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:26:41 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lNF99-0004CG-N2
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:26:40 -0400
Received: by mail-wr1-x434.google.com with SMTP id v4so9100316wrp.13
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 06:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oDM8GCnYBpDqZVvOsLq7sgTXnB4+UFlSG0fMOroprbE=;
 b=KhChTaWES5Aks6JjxFdGaDmCkybR/v5wVz1KjKPS9J2CPaPVaEpnLDEQ5dteBrDJ08
 /8oGskveyWCrv5TQ3L3oYT0hnixtx8h78+v5RPJjd9c2lg2nmG3CvRF1R6rPgUBPf5Gq
 0jn0/zTJGow1tQQ6ytmH9lZdI1SRkIZVT35t72A4QO7s7k1ZpQ6K1imF65Ngovn7/ZzO
 TPASqegKfqpJCkzvmGlb5J4vO/xL52ZxpfdF2JSulUIeahR7jwdj8EcwkX3Z5QUHdGqb
 LkbPrvqmaW0+yF2F2pSSwVypu6EIag3eXzj85sJBNFZminlHjOct629Xz9isAC5QCNJE
 sOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oDM8GCnYBpDqZVvOsLq7sgTXnB4+UFlSG0fMOroprbE=;
 b=oM9rEzA66yK5CPGAkScwaplXxGjFkyjo3xLOVWSEy5XAMZWLUKeQFqzz1CZspEFPK0
 KXXcoSn9sUx2S6zDP4lAX2OTOUBpfTjcp1h0WtkqC7UWknFB1X3tSDd4kuJ90KR1epGW
 9RMjk7O4ht0s8JsQNbuMvyDkF93eN09AWc6xnxRQM03RBdZAq+a7NboHJdSZ+w14896K
 KIjjW/ovX/1oLRKsdfDIEGsDJcJOHiXBJmzdSWTm85Fup4Hp6IOxfLu81nqZN3Drc1bk
 Fw2ammNIVCLQYw5LGGNYscTN+sx5tnRqkSgS1c8RBCeK3nwWTVARzA+T3LALEYbwLstJ
 m4FA==
X-Gm-Message-State: AOAM533yQ9Xbir5QSA2FrceD4/0xniWkhqerL/y+/+1QrMfC3neYhkoO
 XZe8hQjnkNmSSgCrf8SUKYwODzwmMw4=
X-Google-Smtp-Source: ABdhPJwAY2zEVdFZmkzso2Hi1nQIUfAf1FgzDQVh1inZ1vU3zPXGYfVyfevKTTsCs5GRLdKlu/6dEA==
X-Received: by 2002:adf:c64a:: with SMTP id u10mr4595915wrg.412.1616160391728; 
 Fri, 19 Mar 2021 06:26:31 -0700 (PDT)
Received: from localhost.localdomain ([102.47.92.134])
 by smtp.googlemail.com with ESMTPSA id v13sm8889584wrt.45.2021.03.19.06.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 06:26:31 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/8] virtiofsd: Changed allocation of lo_map_elems to GLib's
 functions
Date: Fri, 19 Mar 2021 15:25:24 +0200
Message-Id: <20210319132527.3118-6-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319132527.3118-1-ma.mandourr@gmail.com>
References: <20210319132527.3118-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x434.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replaced (re)allocation of lo_map_elem structs from realloc() to
GLib's g_try_realloc_n() and replaced the respective free() call
with a g_free().

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 tools/virtiofsd/passthrough_ll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index b144320e48..d049013428 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -406,7 +406,7 @@ static void lo_map_init(struct lo_map *map)
 
 static void lo_map_destroy(struct lo_map *map)
 {
-    free(map->elems);
+    g_free(map->elems);
 }
 
 static int lo_map_grow(struct lo_map *map, size_t new_nelems)
@@ -418,7 +418,7 @@ static int lo_map_grow(struct lo_map *map, size_t new_nelems)
         return 1;
     }
 
-    new_elems = realloc(map->elems, sizeof(map->elems[0]) * new_nelems);
+    new_elems = g_try_realloc_n(map->elems, new_nelems, sizeof(map->elems[0]));
     if (!new_elems) {
         return 0;
     }
-- 
2.25.1


