Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C56F9302677
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 15:50:41 +0100 (CET)
Received: from localhost ([::1]:54858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l43CS-0006iP-TP
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 09:50:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l437t-0003zi-T0
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:45:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l437s-0002tT-At
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:45:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611585955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B2Gd3t26d/y3LY2H+JD2tvGw/gAXWP5A1DeG2ouC98o=;
 b=ans76OWiacsJSqSAHalFYoES04TWW1CfGpvIjVAye3FNhEX/Tm6PuT8jkCM6Mb5OoR1Cp2
 Bo/M6X57G2vk1c/mqa9eCGlkwlPkfUwJPrNDo8qSDtITRnmh1WEjfQvZA5ozbzbm379/MD
 NvnFCsh9lowfT3Cew6nBYdCd4SddUfA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-ZW-Mrge0PVGurjP2giZLyQ-1; Mon, 25 Jan 2021 09:45:54 -0500
X-MC-Unique: ZW-Mrge0PVGurjP2giZLyQ-1
Received: by mail-ej1-f70.google.com with SMTP id p1so3855458ejo.4
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 06:45:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B2Gd3t26d/y3LY2H+JD2tvGw/gAXWP5A1DeG2ouC98o=;
 b=O6D45UpXBnxCujP9M6qwnMuvs/ORtVyCySOHFdjzdS5bEEFv8dFFLhDK8gEwLIIfiN
 qQAoBTwcHbvF7cJajvM89QfLUV/63vIRjeKQ60s7ciidBdKeq3VE4uGue9gYPH+3ybP+
 wiQD9EVrSLLl1XMX03WDT3z22c+6+TbXPIj/pQaXm4LpceB6Y3Bv3RLbImX5lCiWh+Ay
 TobBkXoxe+3Q+85uju1bLSJY16SpcLYczq5k3ElkM3eDkNJmQuPjQ5d9SG9alS3wffbS
 7na1LCGuoCWZVuN8vrjNHB1QYjK8yqw9+86DdARWuOEz4NknaU0PL23ND2dTsCP2HlXi
 1EUw==
X-Gm-Message-State: AOAM533IzQCFFCSL8GCG2aFbO56n3f7wQvH5m8eg+CHNup7gYZdEdl+S
 F8Q0aHv7cJ8KWJ4Rwt3KQLW8aeI4oPd1/i8N+rCBUkywL3brcpo6TLgdEe4VAk6LHWKkAZJA8m8
 gXs+L/8LKoNwlfRoF7JjNEihVdzrW9SzA8CRp1QXbI6uhQXguMNzgNMh/2LHXEH9O
X-Received: by 2002:a50:fd84:: with SMTP id o4mr751455edt.340.1611585952696;
 Mon, 25 Jan 2021 06:45:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyA0fXL//k93o4UH9A4XlD7FiddFN+j95oeaipptv/B9N4spO8S6tWfqxWTLyTL/YHLG2FCg==
X-Received: by 2002:a50:fd84:: with SMTP id o4mr751439edt.340.1611585952571;
 Mon, 25 Jan 2021 06:45:52 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id o4sm4324731edw.78.2021.01.25.06.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 06:45:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/4] meson: Explicit TCG backend used
Date: Mon, 25 Jan 2021 15:45:29 +0100
Message-Id: <20210125144530.2837481-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210125144530.2837481-1-philmd@redhat.com>
References: <20210125144530.2837481-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 35a9eddf5cf..16b2560e7e7 100644
--- a/meson.build
+++ b/meson.build
@@ -224,7 +224,7 @@
 if not get_option('tcg').disabled()
   if cpu not in supported_cpus
     if get_option('tcg_interpreter')
-      warning('Unsupported CPU @0@, will use TCG with TCI (experimental)'.format(cpu))
+      warning('Unsupported CPU @0@, will use TCG with TCI (experimental and slow)'.format(cpu))
     else
       error('Unsupported CPU @0@, try --enable-tcg-interpreter'.format(cpu))
     endif
@@ -2447,8 +2447,12 @@
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
2.26.2


