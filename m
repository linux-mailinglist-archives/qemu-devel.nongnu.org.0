Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CB6314298
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:10:59 +0100 (CET)
Received: from localhost ([::1]:57222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9EkE-0000cE-OV
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:10:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCU-0003MA-Tu
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:54 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCT-0006CC-Bj
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:54 -0500
Received: by mail-wr1-x431.google.com with SMTP id z6so18323541wrq.10
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FB792gMakZ0hTlgIYeDNLYESrKnUaofy8ukq0Ox5nFg=;
 b=jvfLLk50IXK/jiyJiG0Ig29V+tZKRfZEtrC3IG86aaDkmpayVC5XWB1ZsitB8ktLGx
 2j976yAbpTtm+pnRkTX+Uec8Um4DReB6d2IMt0HdrvZTp9r+Bhl5PFo07yP4FCt670+U
 F060czCyVsEhx4Bxj9WvE8A9u48pk6u1yYrhENhfi5Nk/ln/AWLPL0d6s1ORFp4Jyn2b
 udKsyPKOLm2N96tNVIi0IOGL3jzKWBaaJjeg4h+DDZCkrQW+UuBzC8fKY/acWRSNpTzE
 UTTu5MU2Mi3brrA2GlsWux4ifH4aYCvyRQininO1PEdoQ5SABS4mYH5R/uJ0qTla6Pz3
 dlqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FB792gMakZ0hTlgIYeDNLYESrKnUaofy8ukq0Ox5nFg=;
 b=JJkRhlLTHiW+jEiHPs4yIsS6bcNCqAZk6Tr99dnZYbpc4/PlV2iDfmsRSStz+XSLGd
 XKebXDxg9xI3aW0VOdBtLzJlu3y+fEcTUj8TYZlAkthbi9mKISakrSP8zwn2+uJ2xYvx
 o9xMz1SqkHT7mxr9jQb7hoPrBrrFY1O0xTLND2zHlaY+OmtLoCUKIAtpSuoeTBgIpOYL
 /U73rBbz1Lp9GWM/vtW9VRfggtR6ZkRFjbiupL8UwIpfWkO7/kiH1+SXzu3GLyMLzPbl
 fhqU2qY69ByQvgaDEyFDvRM8bvAsQc80W/Q/l4dx3YjnS4+MsJqvdn7cC+ocEswawWB1
 fAxQ==
X-Gm-Message-State: AOAM531F9tmMb6jD2QctPLQqTVYeTTer4swW7Z6ZcQPKvRk/jCRlMFdE
 W0+fht5mgusiZdI93lrymvRUnxnw037yQQ==
X-Google-Smtp-Source: ABdhPJwjMstddpKSFGcxjVbblH8HQjgdC876tWc2Z70A/Y9yxuKL+/GpZusvPkLPyrPomaL11z0ngw==
X-Received: by 2002:adf:ab10:: with SMTP id q16mr3367162wrc.376.1612808632189; 
 Mon, 08 Feb 2021 10:23:52 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:23:51 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/46] meson: Explicit TCG backend used
Date: Mon,  8 Feb 2021 19:23:05 +0100
Message-Id: <20210208182331.58897-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210125144530.2837481-4-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 5bd22f431a..3a13ba3307 100644
--- a/meson.build
+++ b/meson.build
@@ -227,7 +227,7 @@ tcg_arch = config_host['ARCH']
 if not get_option('tcg').disabled()
   if cpu not in supported_cpus
     if get_option('tcg_interpreter')
-      warning('Unsupported CPU @0@, will use TCG with TCI (experimental)'.format(cpu))
+      warning('Unsupported CPU @0@, will use TCG with TCI (experimental and slow)'.format(cpu))
     else
       error('Unsupported CPU @0@, try --enable-tcg-interpreter'.format(cpu))
     endif
@@ -2509,8 +2509,12 @@ if have_system
 endif
 summary_info += {'TCG support':       config_all.has_key('CONFIG_TCG')}
 if config_all.has_key('CONFIG_TCG')
+  if get_option('tcg_interpreter')
+    summary_info += {'TCG backend':   'TCI (TCG with bytecode interpreter, experimental and slow)'}
+  else
+    summary_info += {'TCG backend':   'native (@0@)'.format(cpu)}
+  endif
   summary_info += {'TCG debug enabled': config_host.has_key('CONFIG_DEBUG_TCG')}
-  summary_info += {'TCG interpreter':   tcg_arch == 'tci'}
 endif
 summary_info += {'target list':       ' '.join(target_dirs)}
 if have_system
-- 
2.29.2



