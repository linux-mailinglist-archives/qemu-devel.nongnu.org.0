Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B35E2FFEFF
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 10:24:53 +0100 (CET)
Received: from localhost ([::1]:44544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2sgW-0004Dm-D1
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 04:24:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2se3-0001m1-FT
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 04:22:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2se1-00025M-P7
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 04:22:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611307337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5OHCRzOm+eHD6A8mSHpQXWiQ+XK/ffFCK89AaVd/zzA=;
 b=IK8PNkHKUYk1Wl2ctScmGOpbax92nWqAJ5LM0rHyu09L1U+Ctwz6z0NTcf8hG+nrNaTihr
 OGNZ7Wn3GEMNawtvMkBadJxvqyX7II7EZ1w4ABYCNVZlap7pU7FrIfPMAdGw0kESVf0+gv
 CtSgYiIx3I2Y5eKlK1e4R0F1T8iYmpY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-ahB7ym-ENG6Zn71tuADLIw-1; Fri, 22 Jan 2021 04:22:15 -0500
X-MC-Unique: ahB7ym-ENG6Zn71tuADLIw-1
Received: by mail-ej1-f71.google.com with SMTP id h4so1985207eja.12
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 01:22:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5OHCRzOm+eHD6A8mSHpQXWiQ+XK/ffFCK89AaVd/zzA=;
 b=KdgmVSPqyo1qgOKmcX25ueD5lBkPB3Hf4ciUVB3XzN42Xr5EtZY1k/vX3+nXHl3uyg
 RILRudNQHkg0voIt2iGyLO9ArYCzsXWiireG3Sb9PKiqxUert2U2qmXorMAwfA+9IugK
 0GEBrGO87dwTpBVkKcUPZ995LQP5iFj6U0RRt8e7zu1pVAjRRQE3JPnbrxjU2wJ3YCjk
 3wweVtnJXoZfyJMoJMOHcndNMBek7RsMsSrXYW+SnHnGW+mm2Up1SWxFu/3ssDwNllaF
 m0eoY8WuuXEK2fLpgSKgj328k122+Dl7yfhLMWWuEGCagk/9oP3q2LVRHYA+U3/UGkhQ
 E6NQ==
X-Gm-Message-State: AOAM532w9Xxvoq0cVgrljxJ6z0fOIH0QYrbvkT2gLrBlyi3OZaLuahRO
 Qt1fPXroL2a0FWyg5swmhLqP/1icwZIIJrbp7rOFMLu+LdW0SH3buZymgM8KeP20sZwPbk8ItsJ
 eS9/p34lO3Pr3PoBnkvBmcaks22qKRMfZwnJKoILaCml2GMRFPKJYIrXQYl+EMBRc
X-Received: by 2002:a05:6402:1bcd:: with SMTP id
 ch13mr2448974edb.31.1611307333904; 
 Fri, 22 Jan 2021 01:22:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFcg5JZBZhCvWCU1QMqCVH8/DOgHqrbvATuo3BCZ5mWcnxKwWcLtCGyxmI49Dx+zQTZWGtZw==
X-Received: by 2002:a05:6402:1bcd:: with SMTP id
 ch13mr2448953edb.31.1611307333634; 
 Fri, 22 Jan 2021 01:22:13 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id he38sm3755665ejc.96.2021.01.22.01.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 01:22:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] meson: Explicit TCG backend used
Date: Fri, 22 Jan 2021 10:22:04 +0100
Message-Id: <20210122092205.1855659-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122092205.1855659-1-philmd@redhat.com>
References: <20210122092205.1855659-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 8535a83fb70..0a645e54662 100644
--- a/meson.build
+++ b/meson.build
@@ -2419,8 +2419,12 @@
 endif
 summary_info += {'TCG support':       config_all.has_key('CONFIG_TCG')}
 if config_all.has_key('CONFIG_TCG')
+  if config_host.has_key('CONFIG_TCG_INTERPRETER')
+    summary_info += {'TCG backend':   'TCG interpreter (experimental)'}
+  else
+    summary_info += {'TCG backend':   'native (@0@)'.format(cpu)}
+  endif
   summary_info += {'TCG debug enabled': config_host.has_key('CONFIG_DEBUG_TCG')}
-  summary_info += {'TCG interpreter':   config_host.has_key('CONFIG_TCG_INTERPRETER')}
 endif
 summary_info += {'target list':       ' '.join(target_dirs)}
 if have_system
-- 
2.26.2


