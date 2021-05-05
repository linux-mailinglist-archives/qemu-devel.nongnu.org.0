Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5B9374A27
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:29:45 +0200 (CEST)
Received: from localhost ([::1]:38884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leP5U-0005Cw-KA
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOoG-00010G-D3
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:11:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOoE-0004eS-SH
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:11:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620249114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tKtzUuVUg3zkWjnpM9cF6E//1jWBtx7/fvE0exQ2eS0=;
 b=UNLmFJbHNlGR42vDw7CZho5RFiwbk9B66lx+BeZdKCNJZnurvWZJZ9G6An1ukp0Qf9KYAE
 O3JZCKE3htC3X/9xTa0K9p7P4BBkPobBfGMrslRa89+hHYH/8peq1GZ1cEMVC3MWqK4ar7
 9oB/reS/zm1m6o8KPfmcOsN1P0KKxk4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-P1ADspMgO_Otb07ygnCp8Q-1; Wed, 05 May 2021 17:11:52 -0400
X-MC-Unique: P1ADspMgO_Otb07ygnCp8Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 r10-20020a05600c2c4ab029014b601975e1so1789141wmg.0
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 14:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tKtzUuVUg3zkWjnpM9cF6E//1jWBtx7/fvE0exQ2eS0=;
 b=OrslVnJ4NRpsBSWlS1o8jogJxluLf0F5zXjNkskww3YcYqhDnhNiua50CUYqVes81T
 3/z4zF8ulzQ5IL4uX7EP1IYhg0zG4MFtDfzzfhzStfne7apqWq2KC0vQSqj7aZFBpJMt
 1RDqWVy1AxZhjar9FC+kKMiycQMqoyLQS7UY9AOpF3YGyMMviz8un+Ypv0dayf8lBjnq
 G6U/aSfK4BdsQZOVs+sYE9y4O8iK+dq2JeQxO2ojk+ABr2BNfHiM3uZYhbjsskvlNH0E
 DuS/0Gr498/mdMvsxU+6MEsRXKJE/2dmUudDFLeUnwnBFBo3T3vDdajQWpYV6Zt797cl
 PH5Q==
X-Gm-Message-State: AOAM532Rtg+jyIOKb5/61zTqne/g0NjjfHRBvT8Xem97Rc4YwAbMKyEy
 JFSlD9z+mBe4KnTJHFGvByfB26k9j0Rt4swV9cy5hmefZ4QZ9QS56BwPmuXKp70VjDkAUfYDusg
 JO7R2m/kgIEXS0Eb2c+58n0kUlxyzO95mUtvrqX52imSHbGBTot2c0RkjsRNx+iEk
X-Received: by 2002:a05:6000:50d:: with SMTP id
 a13mr1064644wrf.130.1620249111356; 
 Wed, 05 May 2021 14:11:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyN4fDkR14J/ZumsUGD5UvKJePZJMZ/4JldUq/xifAFnfQpL4iEP4krswocXMfVRV/FONny1A==
X-Received: by 2002:a05:6000:50d:: with SMTP id
 a13mr1064624wrf.130.1620249111193; 
 Wed, 05 May 2021 14:11:51 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id c5sm612680wrs.73.2021.05.05.14.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 14:11:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/23] hw/i386/multiboot: Avoid dynamic stack allocation
Date: Wed,  5 May 2021 23:10:36 +0200
Message-Id: <20210505211047.1496765-13-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505211047.1496765-1-philmd@redhat.com>
References: <20210505211047.1496765-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use autofree heap allocation instead of variable-length array on
the stack. Replace the snprintf() call by g_strdup_printf().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/i386/multiboot.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/i386/multiboot.c b/hw/i386/multiboot.c
index 9e7d69d4705..ccd197603b1 100644
--- a/hw/i386/multiboot.c
+++ b/hw/i386/multiboot.c
@@ -161,6 +161,7 @@ int load_multiboot(FWCfgState *fw_cfg,
     uint8_t *mb_bootinfo_data;
     uint32_t cmdline_len;
     GList *mods = NULL;
+    g_autofree char *kcmdline = NULL;
 
     /* Ok, let's see if it is a multiboot image.
        The header is 12x32bit long, so the latest entry may be 8192 - 48. */
@@ -360,9 +361,7 @@ int load_multiboot(FWCfgState *fw_cfg,
     }
 
     /* Commandline support */
-    char kcmdline[strlen(kernel_filename) + strlen(kernel_cmdline) + 2];
-    snprintf(kcmdline, sizeof(kcmdline), "%s %s",
-             kernel_filename, kernel_cmdline);
+    kcmdline = g_strdup_printf("%s %s", kernel_filename, kernel_cmdline);
     stl_p(bootinfo + MBI_CMDLINE, mb_add_cmdline(&mbs, kcmdline));
 
     stl_p(bootinfo + MBI_BOOTLOADER, mb_add_bootloader(&mbs, bootloader_name));
-- 
2.26.3


