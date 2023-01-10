Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A87FE66462A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 17:33:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFH6W-0003V8-Lq; Tue, 10 Jan 2023 11:04:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH65-0003IP-OG
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH64-00054T-8E
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673366611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F0m+oaujy6Qxd5mN3bMkWen0X+N06gV/UBfSfVbYUnw=;
 b=iZcmDe+iUbXKOs8RPe+FxiY9ehd0rg0T6JO3Stk+/XQDuptMbUae0Jm6ObD6NboGtuXFcD
 HetCoqsR2QWcgQQ1QeMxOTjeJ6/CBsZmC03YSpdA4XDr+QBDqblA3gp9SDzmuJD+7nH5Wi
 UQLKIOpa04+DXSUuya60QKwYVm0S/xY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-553-ZsoXekedOqm7MhAoBu5oLw-1; Tue, 10 Jan 2023 11:03:30 -0500
X-MC-Unique: ZsoXekedOqm7MhAoBu5oLw-1
Received: by mail-wr1-f69.google.com with SMTP id
 m12-20020adfa3cc000000b002b881cb0cb4so2098789wrb.3
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:03:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F0m+oaujy6Qxd5mN3bMkWen0X+N06gV/UBfSfVbYUnw=;
 b=FZCY9rw97cjBb0yq3Gg2Di11LWgrH8l+4p2akaTX8he+0DIJceEicrOsTppr1yS7FC
 T6jq3MOvO8Ua35e2DXtcf888yVHuuw5adHkicIMQUjl8TwFMV94Xp+qfbDZMkJGLtjJE
 Ap+1xGzQ8Gm8NkSV3mr4arDN2hqJIa5sK1Razs0m36+lsNa0/gdT56UIgdwtmD/v133O
 WaxkBOWeF/zHXfyaHu+weGLDduPX8dZ3Qx6LaNtttszfn/hQ7zi2k5SdbOEKCpYRVCNB
 ctKWcWpauBNGjNCeryCn/tMsfEWJXpaKfb99pB6VDUn7K0XQHWYS/omjsA3+YAIq8BUC
 1vqw==
X-Gm-Message-State: AFqh2kp9qeRksHcWxRofzvNb6nGGKRI54NqIMOCTJXD7leh23gO2Xg+r
 DsuEIaL+NdS+sl7nMgdzRKT7abAGA2VcNrK++2BtPld6iifdcZpkzRJs3kr/Y4tqXHmMioWAuO6
 Qw67+ukVswJZbd8Q+k0ltga7wffzhid/dmbrIan7wRtvH27WbIkA+fJkyh7th03Y+55E=
X-Received: by 2002:a05:6000:1b88:b0:242:5dd7:8115 with SMTP id
 r8-20020a0560001b8800b002425dd78115mr41728666wru.64.1673366608204; 
 Tue, 10 Jan 2023 08:03:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtzsTHVX/HAktplHIaI/O7GPLVjq9kKCdrQeKo0cd6bZh3VENvmqZJRNLB9wM7koCLN2eH/uQ==
X-Received: by 2002:a05:6000:1b88:b0:242:5dd7:8115 with SMTP id
 r8-20020a0560001b8800b002425dd78115mr41728637wru.64.1673366607863; 
 Tue, 10 Jan 2023 08:03:27 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a5d5182000000b00236545edc91sm11689539wrv.76.2023.01.10.08.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:03:27 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Holtmann <marcel@holtmann.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 20/29] libvhost-user: Declare uffdio_register early to make it
 C90 compliant
Date: Tue, 10 Jan 2023 17:02:24 +0100
Message-Id: <20230110160233.339771-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110160233.339771-1-pbonzini@redhat.com>
References: <20230110160233.339771-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marcel Holtmann <marcel@holtmann.org>

When using libvhost-user source in an external project that wants to
comply with the C90 standard, it is best to declare variables before
code.

  CC       libvhost-user.o
libvhost-user.c: In function ‘generate_faults’:
libvhost-user.c:683:9: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
  683 |         struct uffdio_register reg_struct;
      |         ^~~~~~

In this case, it is also simple enough and doesn't cause any extra
ifdef additions.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <556c2d00c01fa134d13c0371d4014c90694c2943.1671741278.git.marcel@holtmann.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 211d31a4cc88..bf92cc85c086 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -626,6 +626,8 @@ generate_faults(VuDev *dev) {
         VuDevRegion *dev_region = &dev->regions[i];
         int ret;
 #ifdef UFFDIO_REGISTER
+        struct uffdio_register reg_struct;
+
         /*
          * We should already have an open ufd. Mark each memory
          * range as ufd.
@@ -659,7 +661,7 @@ generate_faults(VuDev *dev) {
                     "%s: Failed to madvise(NOHUGEPAGE) region %d: %s\n",
                     __func__, i, strerror(errno));
         }
-        struct uffdio_register reg_struct;
+
         reg_struct.range.start = (uintptr_t)dev_region->mmap_addr;
         reg_struct.range.len = dev_region->size + dev_region->mmap_offset;
         reg_struct.mode = UFFDIO_REGISTER_MODE_MISSING;
-- 
2.38.1


