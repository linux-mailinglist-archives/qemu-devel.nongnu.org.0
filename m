Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAC7489BEF
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 16:13:45 +0100 (CET)
Received: from localhost ([::1]:60956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6wMi-00038P-W0
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 10:13:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vrR-0002lC-Fl
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:41:25 -0500
Received: from [2a00:1450:4864:20::529] (port=38636
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vrL-0000XP-NG
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:41:22 -0500
Received: by mail-ed1-x529.google.com with SMTP id u21so31873846edd.5
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 06:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=niEASEzg6Pyx+usIoUf1FTEHstXld9dwD71XIbZUubA=;
 b=NOMaxqzoLqmVGOD2v8Fenjj25dKf19CT5rKjORYLjJbxqlghF8nzkDBhx4tvoyKek1
 X98HQwGGszTC95F1H/1DjrEbryXUCEK8YbWuO3QZSqiak7WIcmh+stoYQ9RsjSKY21Xr
 xFXRlFEyN1Iw0+wbhQsmZewjAX/z+y6TgoT+yg983ka26apiNAdXViO5FR19+mcR7+BN
 Tj+3EmZ1oCov5hI69jgsZrPK990/apNf+etjbankwgnVxD6z2OpOfRguIENSnfDSlnll
 xs83tZHGXu+jvDzUrgsbsfNvuJl4uos8vkEWe9olqwmSMkkY3J3IpstJ8ppAMyAIWSTu
 +QpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=niEASEzg6Pyx+usIoUf1FTEHstXld9dwD71XIbZUubA=;
 b=cz62vVV2DFB8BQcKehoYpgueKpkyL2JXyqeVtaW4JSu+CP3vjJxSJo/ytluKsiy+CH
 cjaMVu6RF+OCo4j/MHPdfUknMVhq5VSVRMjo2YYV7oFaqporeIdb8UrCpoIMbeTHR/Yl
 gVC4+QsgPRcEUgMAIQWbXqkyvNFE6M561pTZQiHzPVdLbGR1+tW7q+uRsWxfOglgMfR2
 nmFT6/Wa1udNxfrK3/2skHpsm4J46zUBTguC/YuOT1FiWAeDhrxlheXHkjrNCzzmySsQ
 AvG/IG3GRFLn+e3gOPONlCdIHo8uOKEyZVl5jkkZ4SvZddZB/x0z24GbJiwlsVWXFx+6
 vVGA==
X-Gm-Message-State: AOAM530VXfL7mJ85HaCFySvGyGhTgnWe5jrk9e9BKl2/MAl+CyAHZjxY
 vAOk7+w8xRuvaVVyon2C8ckrG8YePiU=
X-Google-Smtp-Source: ABdhPJyXmCiJaEXK92dr7osAFo+doNhKyrsr27R2mUv+/xwkLjuTFUYgAh/lmiPQaCwuJ+Q9yrdBbg==
X-Received: by 2002:aa7:d9c6:: with SMTP id v6mr9564210eds.7.1641825668229;
 Mon, 10 Jan 2022 06:41:08 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k25sm2549498ejk.179.2022.01.10.06.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:41:07 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/18] meson: reenable filemonitor-inotify compilation
Date: Mon, 10 Jan 2022 15:40:34 +0100
Message-Id: <20220110144034.67410-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110144034.67410-1-pbonzini@redhat.com>
References: <20220110144034.67410-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

Reenable util/filemonitor-inotify compilation. Compilation was
disabled when commit a620fbe9ac ("configure: convert compiler tests
to meson, part 5") moved CONFIG_INOTIFY1 from config-host.mak to
config-host.h.

This fixes the usb-mtp device and reenables test-util-filemonitor.

Fixes: a620fbe9ac ("configure: convert compiler tests to meson, part 5")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/800
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20220107133514.7785-1-vr_qemu@t-online.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/meson.build | 2 +-
 util/meson.build       | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 90acf5b0da..64a5e7bfde 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -129,7 +129,7 @@ if have_system
     'test-vmstate': [migration, io],
     'test-yank': ['socket-helpers.c', qom, io, chardev]
   }
-  if 'CONFIG_INOTIFY1' in config_host
+  if config_host_data.get('CONFIG_INOTIFY1')
     tests += {'test-util-filemonitor': []}
   endif
 
diff --git a/util/meson.build b/util/meson.build
index e676b2f6c6..c9a9cc1cf5 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -84,7 +84,10 @@ if have_block
   util_ss.add(files('readline.c'))
   util_ss.add(files('throttle.c'))
   util_ss.add(files('timed-average.c'))
-  util_ss.add(when: 'CONFIG_INOTIFY1', if_true: files('filemonitor-inotify.c'),
-                                        if_false: files('filemonitor-stub.c'))
+  if config_host_data.get('CONFIG_INOTIFY1')
+    util_ss.add(files('filemonitor-inotify.c'))
+  else
+    util_ss.add(files('filemonitor-stub.c'))
+  endif
   util_ss.add(when: 'CONFIG_LINUX', if_true: files('vfio-helpers.c'))
 endif
-- 
2.33.1


