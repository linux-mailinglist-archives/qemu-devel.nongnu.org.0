Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C754C66D795
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 09:09:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHh1I-0002tw-Mo; Tue, 17 Jan 2023 03:08:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pHh0g-0002nx-SQ
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 03:07:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pHh0c-0000Rg-5u
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 03:07:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673942873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s2CxFTHityeNV5UFpIKrh+T9Z/RsPZNuWUHcYXPHaQg=;
 b=LJHMUwb51Gc4U4Im/zk31kheheRhJMqyVQJ7P0inyByAYBAVT9xCXoQQCXF5hegE/C2k6Q
 e+2MnRUDyrqem1BsE6VsSY3+YMghLJY4K/7CqGxplnqGJG8FcDJWfqLKgIDnXcJC3G7IMY
 4aXbRB5PEWm8fYU08SIcKKZGduiwoEg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-267-QRgN9NKwMKCPDz_lja8Gwg-1; Tue, 17 Jan 2023 03:07:52 -0500
X-MC-Unique: QRgN9NKwMKCPDz_lja8Gwg-1
Received: by mail-ed1-f70.google.com with SMTP id
 m7-20020a056402510700b00488d1fcdaebso20458786edd.9
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 00:07:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s2CxFTHityeNV5UFpIKrh+T9Z/RsPZNuWUHcYXPHaQg=;
 b=0cWRgVmN3zPxSsuyS96rcBdvRJOnGQAUO4w4foz4/Z7PtH/bsOvqnSd5Vpqlk+5bsp
 WQ3ciB4PY70utwAsxfnRLRRLjYTiJtL2dLy6Rf5RQxOyXYmSueAxzHfFXpYylZLF4N9z
 lZA+1grYnBuv1wgFiyHBtg4pdAr2XYjSCWuCgyGEMqABgAlsWAejyVbvKlcjqtfXf0QB
 birZ1HFgdPrjuzJR62zP/UVcYDk+yOGYb2dOcyWkBbNCgF5mmqhQXMdaKmCuGixAkVy+
 PS8NNMQyKoyn2FyjpHHfHWXMaN/lOm2a8SbVkQ1GXZvLuaL5o+CkFMk4AJDgMTwCpKxd
 ntmg==
X-Gm-Message-State: AFqh2kohMiHbaHb0IIATxcQkmb2X8gPVKhhI+6icSlGSsdZH1hNh8Z/B
 3cpCUV3Ky98kkje7Cn3OP2Ag37RMS85Ay9+vF9X9ywVgxJllw5vUjCiINL3ofFCWofG22IY/tKf
 j0W4zDlSE6hBdtvURAV31DWPbA0sE198sH4aIstiDLx8FJvuDndmwljxfnbg7cI371Gw=
X-Received: by 2002:a17:907:1747:b0:86e:7300:1fa8 with SMTP id
 lf7-20020a170907174700b0086e73001fa8mr2056968ejc.35.1673942870426; 
 Tue, 17 Jan 2023 00:07:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsYmlYMPt5PiigqaBkFJIRJY8WwSSKmYNoSq8q7fMmJJT4spbbMoZ9SvFr9t08eQVWHTpZQPw==
X-Received: by 2002:a17:907:1747:b0:86e:7300:1fa8 with SMTP id
 lf7-20020a170907174700b0086e73001fa8mr2056953ejc.35.1673942870224; 
 Tue, 17 Jan 2023 00:07:50 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a170906b09900b0080345493023sm12606424ejy.167.2023.01.17.00.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 00:07:49 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com
Subject: [PATCH 1/4] vl: catch [accel] entry without accelerator
Date: Tue, 17 Jan 2023 09:07:42 +0100
Message-Id: <20230117080745.43247-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230117080745.43247-1-pbonzini@redhat.com>
References: <20230117080745.43247-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

While QEMU catches invalid -accel command line options:

    $ qemu-system-x86_64 -accel foo=bar
    Accelerators supported in QEMU binary:
    tcg
    xen
    kvm

the same is not true of configuration files, which instead crash.
Avoid a SIGSEGV and return an error instead.

Reported-by: Thomas Huth <thuth@redhat.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1439
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 9bd0e52d016a..b6deaee52da4 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2204,14 +2204,18 @@ static int do_configure_accelerator(void *opaque, QemuOpts *opts, Error **errp)
     int ret;
     bool qtest_with_kvm;
 
+    if (!acc) {
+        error_setg(&error_fatal, QERR_MISSING_PARAMETER, "accel");
+        goto bad;
+    }
+
     qtest_with_kvm = g_str_equal(acc, "kvm") && qtest_chrdev != NULL;
 
     if (!ac) {
-        *p_init_failed = true;
         if (!qtest_with_kvm) {
             error_report("invalid accelerator %s", acc);
         }
-        return 0;
+        goto bad;
     }
     accel = ACCEL(object_new_with_class(OBJECT_CLASS(ac)));
     object_apply_compat_props(OBJECT(accel));
@@ -2221,14 +2225,17 @@ static int do_configure_accelerator(void *opaque, QemuOpts *opts, Error **errp)
 
     ret = accel_init_machine(accel, current_machine);
     if (ret < 0) {
-        *p_init_failed = true;
         if (!qtest_with_kvm || ret != -ENOENT) {
             error_report("failed to initialize %s: %s", acc, strerror(-ret));
         }
-        return 0;
+        goto bad;
     }
 
     return 1;
+
+bad:
+    *p_init_failed = true;
+    return 0;
 }
 
 static void configure_accelerators(const char *progname)
-- 
2.38.1


