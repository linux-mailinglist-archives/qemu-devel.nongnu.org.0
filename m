Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE8D6F672C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 10:22:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puUDb-00066Q-4g; Thu, 04 May 2023 04:21:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puUDY-00064p-Uj
 for qemu-devel@nongnu.org; Thu, 04 May 2023 04:21:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puUDX-0006aG-HJ
 for qemu-devel@nongnu.org; Thu, 04 May 2023 04:21:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683188494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=H3chq1JfTMd1nwtUumcWXj0KIn/9mhXh5nL1wEHSb1Q=;
 b=ejRd8uP2IgMU6DDYJSRg9QQc2QyzizklLKwv8o44zCKTEbaq6iTGKm8Fl72bc1lPiqLfDr
 yhH9opXFc7seFhR6YpI/IVU3nPhZxeVkk83+jKz8msgOdSxWQmxWCEb/cndoXm28y4Dd5A
 tju9F8nibop654gu3dGUPGgQUv4+LaM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-dYbCUaydO5mxrZIlSODQOQ-1; Thu, 04 May 2023 04:21:33 -0400
X-MC-Unique: dYbCUaydO5mxrZIlSODQOQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-50bcd245040so177975a12.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 01:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683188492; x=1685780492;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H3chq1JfTMd1nwtUumcWXj0KIn/9mhXh5nL1wEHSb1Q=;
 b=ecRApfEZcWgU+4x9yZiDmkT2DonPpvAWowXcEXEebq3tHCXNTcoS+CQQFi38OwdZzX
 cspRUklX3A2GxWTvog8lZioztu+cuRlps4lZKR1GDdsOb0Cpm2Me+CSjlK6l1SSzaZNs
 x7uL0vEb47miIROcVefYjDnaGJ05EiFyHzKPI7fMOU7tpSbvl1g0t5c4Jrb3uxdwRLgC
 gt/4ETngbhFLfhVTdES6v/CZeb9PMh/DgoldGfzryK/zOGWLcHbktECjtLwYpmN+gz2f
 ZAJzilPv401vp40jIyxWsYYqsy3FZNEb8X04Flt98H3p5nGtNxu0jtoszrVyhm9An624
 /lfg==
X-Gm-Message-State: AC+VfDzoKz2Bhez2CrhhVEGpevfqMA0mt6/3g4pz0Fg9sa5AXsio/VCq
 pw0b2zeS0qXhKDr83hBnKCXeL0TIS0msY1/E9yxOlEkK0l+ev9Iafcr9p8PkQntx/aIhoCRN/l+
 mwJ2LAqCC9q5MhE5bmxK3NwiagisVZnIuaFfhOFohAdw2Lv0uF+JCF8Fzvv9mZHHrKuvCl92Upm
 E=
X-Received: by 2002:a05:6402:3444:b0:50c:490:4d46 with SMTP id
 l4-20020a056402344400b0050c04904d46mr860635edc.6.1683188492375; 
 Thu, 04 May 2023 01:21:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Bqcw+L8AlPHjHm2KHqJpTqtoa69brqPPBaDaRxnnlIT0vye3IhXDzv9khxyLYJOVFBbHKRg==
X-Received: by 2002:a05:6402:3444:b0:50c:490:4d46 with SMTP id
 l4-20020a056402344400b0050c04904d46mr860617edc.6.1683188491946; 
 Thu, 04 May 2023 01:21:31 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 z22-20020aa7c656000000b004fc01b0aa55sm1616557edr.4.2023.05.04.01.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 01:21:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>,
	qemu-stable@nongnu.org
Subject: [PATCH] meson: leave unnecessary modules out of the build
Date: Thu,  4 May 2023 10:21:30 +0200
Message-Id: <20230504082130.210909-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

meson.build files choose whether to build modules based on foo.found()
expressions.  If a feature is enabled (e.g. --enable-gtk), these expressions
are true even if the code is not used by any emulator, and this results
in an unexpected difference between modular and non-modular builds.

For non-modular builds, the files are not included in any binary, and
therefore the source files are never processed.  For modular builds,
however, all .so files are unconditionally built by default, and therefore
a normal "make" tries to build them.  However, the corresponding trace-*.h
files are absent due to this conditional:

if have_system
  trace_events_subdirs += [
    ...
    'ui',
    ...
  ]
endif

which was added to avoid wasting time running tracetool on unused trace-events
files.  This causes a compilation failure; fix it by skipping module builds
entirely if (depending on the module directory) have_block or have_system
are false.

Reported-by: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-stable@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meson.build b/meson.build
index c44d05a13f95..c7e486e0879a 100644
--- a/meson.build
+++ b/meson.build
@@ -3213,6 +3213,10 @@ modinfo_files = []
 block_mods = []
 softmmu_mods = []
 foreach d, list : modules
+  if not (d == 'block' ? have_block : have_system)
+    continue
+  endif
+
   foreach m, module_ss : list
     if enable_modules and targetos != 'windows'
       module_ss = module_ss.apply(config_all, strict: false)
-- 
2.40.0


