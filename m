Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D04CA323BC8
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 13:11:49 +0100 (CET)
Received: from localhost ([::1]:33778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEt19-000458-A9
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 07:11:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEszJ-0003Ur-T6
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:09:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEszI-0002rb-Ft
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:09:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614168591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8BFURTx2FHMKRCb53xpPHrRIq4KIxDw9TuSbhZUYBGg=;
 b=hQ02HXpR+9ugVZna6/poW4M1QlC8vQ496FqAbHeNS2Ly4SqQ5UmjAwHMvm9nSY3w9Ppn5J
 RgsW0STr7J/GlazoMVkyWvkAHbtjBDS6FNb8KUzMeY8NcQ7WgIXUjZKP6ozTiigt0XtZw0
 zJo6zZwzmj6qc1E4zs6nNZXwMyKv18E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-yoeVGsnrNsiYOXYBxstjDA-1; Wed, 24 Feb 2021 07:09:27 -0500
X-MC-Unique: yoeVGsnrNsiYOXYBxstjDA-1
Received: by mail-wm1-f72.google.com with SMTP id g82so181812wme.4
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 04:09:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8BFURTx2FHMKRCb53xpPHrRIq4KIxDw9TuSbhZUYBGg=;
 b=HwQRsYAqk24U8Gw+Lj1Nova+B4T+N1+cKcffqOB/m+P8MjbF6PUrOl3G2nyUfweYwZ
 /5S2rqgNXY/hzX6mKFXAnz1Viwbls1JRdNKT8cqURb1W8ICXch6xZm7flkmifnUXarA+
 9uPGmoQNjl0kquhpt3M/jfYt4knTtFm08roLfXkgH4wk3fmqU7M8FoOLEEhKP85Axi9Y
 36cl2XezOe9yuGX7JZOQWsylahGpqMaAqAseOnMW4gzRhVRKDFE22Q+WRUYvaEbuMJa8
 slJUl6yvxId13Xq/mA7vgLiAAHYi3BV+tPqS3ms8d2eyWQWvcSjrA+9dv3jPoz7h/YNU
 BGmg==
X-Gm-Message-State: AOAM53161pLefdqeOwTATZGEhG98NHlkftWHfGoryaP6VwcPMmoE5yPp
 hQyosiDN2/C4D9wAEgvJpM+GBhONC2tMyykgkmJitjB5LmpnfLptnwm249oJeE0oRrKJHmK0w9T
 Q6klO0grzTqN654HRZwxpX6r71VuHAG5GMqzJEcU+xmW9zzV3XoL4hTHIWDmuKEgh
X-Received: by 2002:a05:600c:3511:: with SMTP id
 h17mr3518696wmq.2.1614168565927; 
 Wed, 24 Feb 2021 04:09:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmKKNnhVJTRD2E5tCg0eMI5t8kEobGYyhwtcozVZow0b4xuKuxMsEpxYVfeVgaB0Z/AAyGmQ==
X-Received: by 2002:a05:600c:3511:: with SMTP id
 h17mr3518675wmq.2.1614168565725; 
 Wed, 24 Feb 2021 04:09:25 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h17sm2426926wrt.74.2021.02.24.04.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 04:09:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: Only generate trace files for selected targets
Date: Wed, 24 Feb 2021 13:09:23 +0100
Message-Id: <20210224120923.3154325-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't need to generate trace files for targets we
are not building. Restrict the the ones selected.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/meson.build b/meson.build
index 05a67c20d93..c9b0433667d 100644
--- a/meson.build
+++ b/meson.build
@@ -1826,15 +1826,6 @@
   trace_events_subdirs += [
     'accel/tcg',
     'hw/core',
-    'target/arm',
-    'target/hppa',
-    'target/i386',
-    'target/i386/kvm',
-    'target/mips',
-    'target/ppc',
-    'target/riscv',
-    'target/s390x',
-    'target/sparc',
   ]
 endif
 
@@ -2166,6 +2157,7 @@
   t = target_arch[arch].apply(config_target, strict: false)
   arch_srcs += t.sources()
   arch_deps += t.dependencies()
+  trace_events_subdirs += ['target' / arch]
 
   target_common = common_ss.apply(config_target, strict: false)
   objects = common_all.extract_objects(target_common.sources())
-- 
2.26.2


