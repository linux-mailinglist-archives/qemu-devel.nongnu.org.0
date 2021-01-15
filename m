Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C952F7F22
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:13:09 +0100 (CET)
Received: from localhost ([::1]:38870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Qmi-0005rP-WA
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:13:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0Qji-00043P-Mp
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:10:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0Qjg-0008It-5L
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:10:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610723397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RNVtd4o7MvAgZeXi6TxxZ/2iuwmVNRUF2Da2XYVkLog=;
 b=FCR5QvHDPwzWQ5XBxApSuWaLohGuAnfetSi02IVyg7+eQFSTEHlLc3pVSQ8eETl8yjG/uu
 KPzTwuiisa/Q12kcLyFISGdEJW98Yfczw/RjkHAMd8EH/BkpMP0H9eCr+XQNdJSgLRJbET
 5THq0sS9HD6B7YK4UO6+5Z9bf4vne48=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-O7wDNkoVPACjwRf5BfbNQQ-1; Fri, 15 Jan 2021 10:09:54 -0500
X-MC-Unique: O7wDNkoVPACjwRf5BfbNQQ-1
Received: by mail-ej1-f72.google.com with SMTP id gs3so3696685ejb.5
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 07:09:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RNVtd4o7MvAgZeXi6TxxZ/2iuwmVNRUF2Da2XYVkLog=;
 b=ID2tye7X5G9+v68wOJGDvOje+BOnQCS0WhFwPrj6MGnG+gxEMxtf6bXJ8bZjX5H+xg
 mt35czTjU7snolc/30pjez9sYCbVvnH+jHNqUZ63ksj1YXcJVoMLZXPZu+RkcjMNHhCv
 Sh/fSEZSBdog3GYNiFlPQ4p+lVHUQ23ywMcMUkskMDApkDYq2nuBMDYlvCvHkWtzxNUa
 fiz4BASXhIAmnbDY1jTjW/RhK+hfdSdAuHW3wXamG+4tQvKCPiiUo14FAiUz69m/ZreU
 1hYO3vDqnz0X3gZOmtpl/NAd+3xcA9p/KqLhiliQpganiZpvO0RDzBPZen8c3zVBqGE6
 V3Ew==
X-Gm-Message-State: AOAM530V61kbZBZdkuZrE37X/uIGpk+xIpy7wP12APmVg0f2n8vLv1UD
 R0f5DVDGHuFM01Zl1RT4CqFq1gjdpVv+032SXQGYURk5RD1+WyZzvgX96WyOYgMLvUVtO2JJShH
 Vz9pnKIghwLVC8HyuR4me3fa1IuFwT8UzL+pt2tti0ct4y31MrFRDQfFtARHc+nK5
X-Received: by 2002:a50:d50a:: with SMTP id u10mr9732760edi.58.1610723393303; 
 Fri, 15 Jan 2021 07:09:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZX7BZh8OokyHz8V9cno3q0hxctCJzdYu6oh4ydjgQckYRiWv47ayXW8h+eZX2Q6FTAAr13g==
X-Received: by 2002:a50:d50a:: with SMTP id u10mr9732732edi.58.1610723393038; 
 Fri, 15 Jan 2021 07:09:53 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g18sm3999142edt.2.2021.01.15.07.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 07:09:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] tests/qtest: Make fuzz-test generic to all targets
Date: Fri, 15 Jan 2021 16:09:34 +0100
Message-Id: <20210115150936.3333282-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115150936.3333282-1-philmd@redhat.com>
References: <20210115150936.3333282-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@gmail.com>, Hannes Reinecke <hare@suse.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tests in fuzz-test's main() already check for the supported
architecture before adding tests, therefore this test is not
specific to the X86 target. Move it to the generic set.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index bcbb04d2bb4..874f5d34674 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -13,7 +13,9 @@
   'qom-test',
   'test-hmp',
   'qos-test',
+  'fuzz-test',
 ]
+
 if config_host.has_key('CONFIG_MODULES')
   qtests_generic += [ 'modules-test' ]
 endif
@@ -50,7 +52,6 @@
    'bios-tables-test',
    'rtc-test',
    'i440fx-test',
-   'fuzz-test',
    'fw_cfg-test',
    'device-plug-test',
    'drive_del-test',
-- 
2.26.2


