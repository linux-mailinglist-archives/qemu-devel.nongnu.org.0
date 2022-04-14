Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A87501AC4
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 20:05:39 +0200 (CEST)
Received: from localhost ([::1]:52692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf3qc-0006md-5U
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 14:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nf3jX-0004rZ-9p
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 13:58:21 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:40453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nf3jV-0005us-Eu
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 13:58:19 -0400
Received: by mail-wr1-x42f.google.com with SMTP id q3so7330665wrj.7
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 10:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LNVKWTMVIgClVXVxtfwmoVrEMyCS+5+mebl2pSFl+pA=;
 b=VuToi6ALkczY1gp8QtMdQidWHRvkmbu2SQZonnmfu2wXese6JCpCxUynlKiqLT2mPl
 cGHvyQVQWGceNLbkvGdZzAlwcR3fnHiFzh1Bz8CofTVAUAKePqozwWqU1fz/AP2bIPBp
 C7P3YNIiGYfLDywv8Bcx2435d0gItbHo4Q86Sta0z7rUhAqasI/409PBj2gBZG5fxcyO
 g+cJepqmeSq3jdBhEMXlylsho7/YtYN+GF7OWdHBGEKJmfnzFsJUPA8sQZ0eTDlzODBV
 9uvrP8+p9MAmO4qblijGwRD1hKbSKAXc8zstO49UgCalrwXzPg9TevINlSi04EAm/tsD
 g5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LNVKWTMVIgClVXVxtfwmoVrEMyCS+5+mebl2pSFl+pA=;
 b=hIph2FAoMYZ1vy297mafJUpkuFbNxiE1iGZi+eisdeJeawI4xQHyVbPkRDfk1mx/vw
 Lce7r2UVsZIRJw9OZ03InSWhwEmP4nde+kFGWKgZpf1k4Q67YHZAQb8NYaUZniuXgl3+
 jlmnMNakwK4CY4Zm7OgOUVIlkBbTJDTevGDNZTd3KyxtSE1wwaHP+V7BWTsiv9nlfM5T
 jfdGFikfgeFf5UupkCf2VTmgmTZbJsisks6kcSe3CZJHiXp9o42ZQe5D9SlNBleJZhsT
 9nhP9V+l6B79Vx0f/+erxBOdmD7oBoFI9koGVUbeQE4hjxgXT6BgUUhjN1yCZyHsTfkM
 kP7Q==
X-Gm-Message-State: AOAM530sFjvqiqh9Ae6EuYm61Pl39I/LB9nuv8ezzhs3edE609wQKfVQ
 rJCk4DzIK6LO1Ps/MoErwXG82gPPrAF2hQ==
X-Google-Smtp-Source: ABdhPJx9U+SaS8xxIrGGMD+t1zVChHDpDRgyfHrN2GQP87tlE/LuPvQJSYvAhOFAEdgSaVpaZLOX+A==
X-Received: by 2002:a05:6000:1866:b0:204:cce:c89e with SMTP id
 d6-20020a056000186600b002040ccec89emr3012206wri.601.1649959096111; 
 Thu, 14 Apr 2022 10:58:16 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v13-20020adfe28d000000b0020375f27a5asm2451254wri.4.2022.04.14.10.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 10:58:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 for-7.1 6/9] nbd: code motion and function renaming
Date: Thu, 14 Apr 2022 19:57:53 +0200
Message-Id: <20220414175756.671165-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414175756.671165-1-pbonzini@redhat.com>
References: <20220414175756.671165-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: v.sementsov-og@mail.ru, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Prepare for the next patch, so that the diff is less confusing.

nbd_client_connecting is moved closer to the definition point.

nbd_client_connecting_wait() is kept only for the reconnection
logic; when it is used to check if a request has to be reissued,
use the renamed function nbd_client_will_reconnect().  In the
next patch, the two cases will have different locking requirements.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/nbd.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index a2414566d1..37d466e435 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -254,18 +254,15 @@ static void open_timer_init(BDRVNBDState *s, uint64_t expire_time_ns)
     timer_mod(s->open_timer, expire_time_ns);
 }
 
-static bool nbd_client_connecting(BDRVNBDState *s)
-{
-    NBDClientState state = qatomic_load_acquire(&s->state);
-    return state == NBD_CLIENT_CONNECTING_WAIT ||
-        state == NBD_CLIENT_CONNECTING_NOWAIT;
-}
-
 static bool nbd_client_connecting_wait(BDRVNBDState *s)
 {
     return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
 }
 
+static bool nbd_client_will_reconnect(BDRVNBDState *s)
+{
+    return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
+}
 /*
  * Update @bs with information learned during a completed negotiation process.
  * Return failure if the server's advertised options are incompatible with the
@@ -355,6 +352,13 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
     return 0;
 }
 
+static bool nbd_client_connecting(BDRVNBDState *s)
+{
+    NBDClientState state = qatomic_load_acquire(&s->state);
+    return state == NBD_CLIENT_CONNECTING_WAIT ||
+        state == NBD_CLIENT_CONNECTING_NOWAIT;
+}
+
 /* Called with s->requests_lock taken.  */
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
@@ -1190,7 +1194,7 @@ static int coroutine_fn nbd_co_request(BlockDriverState *bs, NBDRequest *request
             error_free(local_err);
             local_err = NULL;
         }
-    } while (ret < 0 && nbd_client_connecting_wait(s));
+    } while (ret < 0 && nbd_client_will_reconnect(s));
 
     return ret ? ret : request_ret;
 }
@@ -1249,7 +1253,7 @@ static int coroutine_fn nbd_client_co_preadv(BlockDriverState *bs, int64_t offse
             error_free(local_err);
             local_err = NULL;
         }
-    } while (ret < 0 && nbd_client_connecting_wait(s));
+    } while (ret < 0 && nbd_client_will_reconnect(s));
 
     return ret ? ret : request_ret;
 }
@@ -1407,7 +1411,7 @@ static int coroutine_fn nbd_client_co_block_status(
             error_free(local_err);
             local_err = NULL;
         }
-    } while (ret < 0 && nbd_client_connecting_wait(s));
+    } while (ret < 0 && nbd_client_will_reconnect(s));
 
     if (ret < 0 || request_ret < 0) {
         return ret ? ret : request_ret;
-- 
2.35.1



