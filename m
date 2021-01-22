Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5944C30043B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 14:33:01 +0100 (CET)
Received: from localhost ([::1]:37992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2wYe-0003Eu-EO
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 08:33:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2wW7-00024e-VU
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:30:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2wW6-0004kw-95
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:30:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611322221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ui9PEIVesR+pjrhyiwMOpt8icvFevk6frc+i55QdokQ=;
 b=SADi+7+gLFlyakGFs8lJCB2OZVAOxH2EEj9O7NhU8rcXepEv9kX0xJTVQdwzjOCl4MZt9U
 dooT+CxLWlpaeH/hjZbD5Ovy/Q7EWehdEU4RaQxKu2qwEYE7eHgNEVuhecbyty4Ba6BaTr
 zWVbLRdlWAMIiCybWW7KSpCxenuCQoQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-pmKX_i96ONWIgngTd1YqlA-1; Fri, 22 Jan 2021 08:30:19 -0500
X-MC-Unique: pmKX_i96ONWIgngTd1YqlA-1
Received: by mail-ed1-f72.google.com with SMTP id 32so2904526edy.22
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 05:30:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ui9PEIVesR+pjrhyiwMOpt8icvFevk6frc+i55QdokQ=;
 b=luSma7Et7Go6rROEpeF1tYjiIagZ0l4ZBCp4kE4SjQsESSRMVnuYt5IQFGH41APu1n
 cJQEBD/cgtcyfCRgwf7esgXCntzBE6EjKSP183pUu3CJB24Uy5e80dExu7bq5fd0HGlS
 K5VKijXdReCiGNh9rxrhjq489HRNvhng3OXOFCEXiOLfmEs8z0lq7He+yYDMNKfNNipj
 3BU6A0VweVXaMYmeybDA8g1qx0cNWr9FLr2H12fnNDpBcFerPuaCkBRyaU7WJaqSkRy1
 7AKSm7zE2IAWSpsgVexKjB1o5CiAZTB9WRFi/I5ur8wvygaMizfA9hcEgwHSdjyncYaW
 G4lg==
X-Gm-Message-State: AOAM532snMjgZL1sCYvWjYMl2xqjQ7nr0l+l7dukx2s2ZLcJAEcSSeaR
 9hJIkwN36iiDqi1S2qnaUbcJDyj53R6ZkalZHWJjFldl2zpcMbBUt7Dj70ghhHKycLFo5YT/dOi
 rSr9nkb9sW3+x2imeZpXQkurjSjS6u61/8x8PIOcpj0I6TI5rwpbwuSHYsz7sXotJ
X-Received: by 2002:a05:6402:1819:: with SMTP id
 g25mr3079018edy.46.1611322217766; 
 Fri, 22 Jan 2021 05:30:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3CX/xAcgYy/rJFitVeqKwpJ97IyOMYpVA0gCrcNv3Xe2SMlDxyel2dUpKbY+7IUrq7Z7RHg==
X-Received: by 2002:a05:6402:1819:: with SMTP id
 g25mr3078999edy.46.1611322217531; 
 Fri, 22 Jan 2021 05:30:17 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g10sm4379867ejp.37.2021.01.22.05.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 05:30:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/4] meson: Warn when TCI is selected but TCG backend is
 available
Date: Fri, 22 Jan 2021 14:30:02 +0100
Message-Id: <20210122133004.1913923-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122133004.1913923-1-philmd@redhat.com>
References: <20210122133004.1913923-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
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

Some new users get confused with 'TCG' and 'TCI', and enable TCI
support expecting to enable TCG.

Emit a warning when native TCG backend is available on the
host architecture, mentioning this is a suboptimal configuration.

Reviewed-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meson.build b/meson.build
index d5b76150e49..d3df5fa3516 100644
--- a/meson.build
+++ b/meson.build
@@ -234,6 +234,9 @@
       error('Unsupported CPU @0@, try --enable-tcg-interpreter'.format(cpu))
     endif
   endif
+  if 'CONFIG_TCG_INTERPRETER' in config_host and cpu in supported_cpus
+    warning('Experimental TCI requested while native TCG is available on @0@, suboptimal performance expected'.format(cpu))
+  endif
   accelerators += 'CONFIG_TCG'
   config_host += { 'CONFIG_TCG': 'y' }
 endif
-- 
2.26.2


