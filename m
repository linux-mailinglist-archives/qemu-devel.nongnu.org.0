Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD19861E11A
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 09:54:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orbQ7-0001vK-Kl; Sun, 06 Nov 2022 03:54:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1orbPq-0001nd-At
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 03:54:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1orbPo-0002zg-TM
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 03:54:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667724843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2PBYH3/5h+QAGT2PWbT4T4jukQmY56rSz759S01ubjo=;
 b=ITjP6rlNN26/30xh9i+HGvp09TW58U4Mr5enxaIeYH9XxB1O424/xmxYrnyMBmD1qtk27a
 u8wCfud0q7kIQSggtFi9eniNlttMls26IdXn6P1O8M7eqJLpjBQEfkYCKKIqRjPk8J+cjh
 /RnA2oZy9+FPo7XoEadZeacF924tRpA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-212-yUJB92TeMTKdDoEzjIx0Zg-1; Sun, 06 Nov 2022 03:54:02 -0500
X-MC-Unique: yUJB92TeMTKdDoEzjIx0Zg-1
Received: by mail-wr1-f72.google.com with SMTP id
 s7-20020adfa287000000b00236c367fcddso2001503wra.6
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 01:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2PBYH3/5h+QAGT2PWbT4T4jukQmY56rSz759S01ubjo=;
 b=WSk8mFnlPcaaL7Mb5zt5ZzzpC3W6Uehg1WyKc7AU2mHlpOHBOgvGO2YyNHZSrUVJfI
 0W3XJWZq1Ep4OnUtWaNzED1ZkacI+OXGBC13Sa3hldJDLakcBo9sRUXJrKyGfknXs12Y
 knakyt98QnhpE5YaFb9nzd4//ES5aPL9zyFfzXZgPBxbX7JmP7keHgEtnWj/mAyk1fq7
 bCOvswVVQWTRfrLQyTMXoumNIvsQ1VKSjmvouOYRtUUFlHpzKnelNOkhuEkhnfflrCvA
 0HsR0Jm9uWJi1mZ5qt/Xy5I0+zPA2xwfOC12dDd5LOwiYg25BXiAf+xyvsiNGsEZ5K9A
 7bVA==
X-Gm-Message-State: ACrzQf0rSIS6SBaNSMi9Kilr+fZolP2IptUoDFKOiBFnHjU8IsTthgrA
 kaNKKdyeTnniQFTpB5g6r8UQ+om/AVszqlZUXt3ppM5GgS9kHlgvcksRCnQ9CVczQixiNP8ZjDQ
 UcS6lMW37hufjTKSuPss8+/4qz474UIdjckRudA99g5SYGDm0e59xI0xg6ni34hPDGSI=
X-Received: by 2002:a05:600c:4eca:b0:3cf:9d19:7fd6 with SMTP id
 g10-20020a05600c4eca00b003cf9d197fd6mr5899921wmq.163.1667724840621; 
 Sun, 06 Nov 2022 01:54:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5r6WkZFew/OHmLKvpXeIAhhmhje1+neABuA9ee0kcAaG+Q+iTEnlGh7T22+Vrn5u7XgAlOBQ==
X-Received: by 2002:a05:600c:4eca:b0:3cf:9d19:7fd6 with SMTP id
 g10-20020a05600c4eca00b003cf9d197fd6mr5899902wmq.163.1667724840352; 
 Sun, 06 Nov 2022 01:54:00 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bw9-20020a0560001f8900b00236c1f2cecesm5119596wrb.81.2022.11.06.01.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 01:53:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PULL 12/12] accel: abort if we fail to load the accelerator plugin
Date: Sun,  6 Nov 2022 09:51:15 +0100
Message-Id: <20221106085115.257018-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221106085115.257018-1-pbonzini@redhat.com>
References: <20221106085115.257018-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Claudio Fontana <cfontana@suse.de>

if QEMU is configured with modules enabled, it is possible that the
load of an accelerator module will fail.
Exit in this case, relying on module_object_class_by_name to report
the specific load error if any.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

[claudio: changed abort() to exit(1)]
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20220929093035.4231-6-cfontana@suse.de>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/accel-softmmu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/accel/accel-softmmu.c b/accel/accel-softmmu.c
index 67276e4f5222..f9cdafb148ac 100644
--- a/accel/accel-softmmu.c
+++ b/accel/accel-softmmu.c
@@ -66,6 +66,7 @@ void accel_init_ops_interfaces(AccelClass *ac)
 {
     const char *ac_name;
     char *ops_name;
+    ObjectClass *oc;
     AccelOpsClass *ops;
 
     ac_name = object_class_get_name(OBJECT_CLASS(ac));
@@ -73,8 +74,13 @@ void accel_init_ops_interfaces(AccelClass *ac)
 
     ops_name = g_strdup_printf("%s" ACCEL_OPS_SUFFIX, ac_name);
     ops = ACCEL_OPS_CLASS(module_object_class_by_name(ops_name));
+    oc = module_object_class_by_name(ops_name);
+    if (!oc) {
+        error_report("fatal: could not load module for type '%s'", ops_name);
+        exit(1);
+    }
     g_free(ops_name);
-
+    ops = ACCEL_OPS_CLASS(oc);
     /*
      * all accelerators need to define ops, providing at least a mandatory
      * non-NULL create_vcpu_thread operation.
-- 
2.38.1


