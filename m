Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DD051FA09
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 12:35:40 +0200 (CEST)
Received: from localhost ([::1]:49544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no0jr-0007Sn-HT
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 06:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0UQ-0004VV-LK
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:19:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0UN-0000ka-Pp
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:19:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652091579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1/mXUDcgqTcmBh6cLuEIn7Iw84PwHaS/ajNdjHH46Gs=;
 b=BFPfXjpwxW5BpXMiNzqqHmjFZH6M/nsjQbZ/NAM+SLbshOPTXpkto4HBI/ZoGaQYFE9xs0
 deC/gsXsgcMUhzvAc9gv9wqh4GjiVizhn9/qgGdGNNUDVDPpE60NiQvJyFM6C+a8wwbqS6
 ZTjah+nbSVBNnANRos3TeQc+1V7SxvI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-M7nxfelTNlCH4wvImGBccQ-1; Mon, 09 May 2022 06:19:38 -0400
X-MC-Unique: M7nxfelTNlCH4wvImGBccQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 l24-20020a056402231800b00410f19a3103so8067017eda.5
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1/mXUDcgqTcmBh6cLuEIn7Iw84PwHaS/ajNdjHH46Gs=;
 b=X6BHE3adjGDJFdCcmnjTqpbON8L42AzeFLsv+9VtOJ0GYVOhIIO3vCxt42F/f3lAzd
 e76mVfBYQ3jVqkMy2aCWg8JcWeMLgi805b3pQJPC0bgDAytZ0xso5dRickxnaRKDQP3w
 GE8Y3wYoEmFoUeaBwXNMKeL7YX1by6Dwe+QSkCSy51IJ3UD53F/pbgoUjKYsMwJJkyb/
 nIVsDogxEbkISxjkAXhLH4AvGrlQ1ZD5qBu3CTDi6MIVZvbonp7JeIp3vUaIauOAtcu5
 YVQpoD/ESJ9xs7gr90vSpPyOW1LbGCv8aTX51Iy+zpFFOBetDuNS3EK/HTrF0C1n5MSd
 TEXA==
X-Gm-Message-State: AOAM531WPU9qJYD5VBl/T7S249c2PZ83Ew+k2yaMs9k8WLhU584Asl6Y
 ePzTyk552RVGyB29CNLKGz+uuEHPqbydnVMDSqJjJC4tqxblffmgkTF1nlWC5gVRFYq4xj72Mmu
 vTB/Ho7yDbEX9uJ09YPrf85GvtcD7COGR77toAqOe5RNhgPMHF49Uqs0NT/Pt55f9fu0=
X-Received: by 2002:a17:907:971d:b0:6f4:f5b1:eac5 with SMTP id
 jg29-20020a170907971d00b006f4f5b1eac5mr13632496ejc.285.1652091576002; 
 Mon, 09 May 2022 03:19:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqhu+57nlEI+A/8U+6jL02ogoRwOw/z8mqqGlNDWFy6oVYpwv/7vGGX4MD1Lm31erk2QBKLg==
X-Received: by 2002:a17:907:971d:b0:6f4:f5b1:eac5 with SMTP id
 jg29-20020a170907971d00b006f4f5b1eac5mr13632464ejc.285.1652091575521; 
 Mon, 09 May 2022 03:19:35 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214e1bsm4851693ejc.129.2022.05.09.03.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 03:19:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com
Subject: [PATCH] rng: make opened property read-only
Date: Mon,  9 May 2022 12:19:10 +0200
Message-Id: <20220509101909.212724-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The ``opened=on`` option in the command line or QMP ``object-add`` either had
no effect (if ``opened`` was the last option) or caused errors.  The property
is therefore useless and was deprecated in 6.0; make it read-only now.

Based-on: <20220509101907.212687-1-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 backends/rng.c                  | 18 ++----------------
 docs/about/deprecated.rst       |  9 ---------
 docs/about/removed-features.rst |  7 +++++++
 3 files changed, 9 insertions(+), 25 deletions(-)

diff --git a/backends/rng.c b/backends/rng.c
index 3757b04485..6c7bf64426 100644
--- a/backends/rng.c
+++ b/backends/rng.c
@@ -48,24 +48,10 @@ static bool rng_backend_prop_get_opened(Object *obj, Error **errp)
 
 static void rng_backend_complete(UserCreatable *uc, Error **errp)
 {
-    object_property_set_bool(OBJECT(uc), "opened", true, errp);
-}
-
-static void rng_backend_prop_set_opened(Object *obj, bool value, Error **errp)
-{
-    RngBackend *s = RNG_BACKEND(obj);
+    RngBackend *s = RNG_BACKEND(uc);
     RngBackendClass *k = RNG_BACKEND_GET_CLASS(s);
     Error *local_err = NULL;
 
-    if (value == s->opened) {
-        return;
-    }
-
-    if (!value && s->opened) {
-        error_setg(errp, QERR_PERMISSION_DENIED);
-        return;
-    }
-
     if (k->opened) {
         k->opened(s, &local_err);
         if (local_err) {
@@ -122,7 +108,7 @@ static void rng_backend_class_init(ObjectClass *oc, void *data)
 
     object_class_property_add_bool(oc, "opened",
                                    rng_backend_prop_get_opened,
-                                   rng_backend_prop_set_opened);
+                                   NULL);
 }
 
 static const TypeInfo rng_backend_info = {
diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 2feb0c506c..25bc92dc65 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -90,15 +90,6 @@ the process listing. This is replaced by the new ``password-secret``
 option which lets the password be securely provided on the command
 line using a ``secret`` object instance.
 
-``opened`` property of ``rng-*`` objects (since 6.0)
-''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-The only effect of specifying ``opened=on`` in the command line or QMP
-``object-add`` is that the device is opened immediately, possibly before all
-other options have been processed.  This will either have no effect (if
-``opened`` was the last option) or cause errors.  The property is therefore
-useless and should not be specified.
-
 ``-display sdl,window_close=...`` (since 6.1)
 '''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 2032608314..715b5f4f4d 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -749,6 +749,13 @@ no effect (if ``loaded`` was the last option) or caused options to be
 effectively ignored as if they were not given.  The property is therefore
 useless and should simply be removed.
 
+``opened`` property of ``rng-*`` objects (removed in 7.1)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The ``opened=on`` option in the command line or QMP ``object-add`` either had
+no effect (if ``opened`` was the last option) or caused errors.  The property
+is therefore useless and should not be specified.
+
 Block devices
 -------------
 
-- 
2.35.1


