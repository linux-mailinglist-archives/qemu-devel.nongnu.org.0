Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A932C664677
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 17:46:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFH6f-0003bQ-O4; Tue, 10 Jan 2023 11:04:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH6B-0003Jk-9k
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH68-00054h-6A
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673366615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hiAekfFiEvKLd8dB3ANRhfP/pRCQs37ncgREKupv5eE=;
 b=bSJQCECquA6mzaeJqvWPB8c+z6xeOOHQi0NeV5123ecAxTK4I+FAJs2Rz26v5U1GhDAcbc
 zVc9cLS5QKhnAhHff8bNhyFNSh+VXWNefDbTjVhRh0ZWKi9hugfQjowjL7CsZGrtMrN7S+
 0JNzurOwVcLoPWQHb2J4Vnb9ve6E3fs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-536-7IHXaekBO-CirSS9ncL0oQ-1; Tue, 10 Jan 2023 11:03:34 -0500
X-MC-Unique: 7IHXaekBO-CirSS9ncL0oQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 fl12-20020a05600c0b8c00b003d96f0a7f36so6494499wmb.1
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:03:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hiAekfFiEvKLd8dB3ANRhfP/pRCQs37ncgREKupv5eE=;
 b=pHTpQ1vFWHAiPynkqnziA/Wa0RlxuZpJ0Pt56Gi5JGnth7H4bNnp8e44bdBzQ62kCs
 OpDuVzBXbODxZl8FCa/95tG4wahkznB7uQ6wZauPxIoujIsIWckDlZsy7PzwSNmH45TW
 LjUoa7X0eOWjzHydafsElB1baM/41yptgugux7J4415HgOuXs/DA6u6p3DPf2qiLVm7A
 GBdgCWFmEo3EacQ5s3IuGus5Rwmv2pbbM7AHrRLgKp35Q4FCbCnvuwSpPCd90yhRxsfA
 4x8+tXSebDk14iHMCs6D1IdeIUEE2c0SEgvmekAsiwT8NiXaGhB6CiaWxVgazekO3pFe
 01GQ==
X-Gm-Message-State: AFqh2kor4vmzLNI5j2QpY9N8QPozTWq/o9ZxNPjpgSW22kEFvkIRAS/J
 VFCmtVsj8vnpkHDkrHRP+2/Uq6u4djAW/nCJAswmPwzmp1ir8tTPFM3mQSbqGdiP5KztDP9USND
 C35U8Yp/j8eBe9DiFvZG6ovfaNW+cZm1z3wK0UW+xaiZbRTxXc7bUXcrTkj0koxUAiJk=
X-Received: by 2002:adf:e184:0:b0:2ba:4ee8:d708 with SMTP id
 az4-20020adfe184000000b002ba4ee8d708mr12936818wrb.32.1673366612754; 
 Tue, 10 Jan 2023 08:03:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXubGoKQmnJHMn0QHOj3QwOWeTamXssPqE/5ao5SDKMyoY7g5dg9pHz4KX8gmnKBpPDwGRCkEw==
X-Received: by 2002:adf:e184:0:b0:2ba:4ee8:d708 with SMTP id
 az4-20020adfe184000000b002ba4ee8d708mr12936791wrb.32.1673366612469; 
 Tue, 10 Jan 2023 08:03:32 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 t6-20020adfe446000000b002bb28209744sm11166960wrm.31.2023.01.10.08.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:03:32 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Holtmann <marcel@holtmann.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 21/29] libvhost-user: Change dev->postcopy_ufd assignment to
 make it C90 compliant
Date: Tue, 10 Jan 2023 17:02:25 +0100
Message-Id: <20230110160233.339771-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110160233.339771-1-pbonzini@redhat.com>
References: <20230110160233.339771-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

The assignment of dev->postcopy_ufd can be moved into an else clause and
then the code becomes C90 compliant.

  CC       libvhost-user.o
libvhost-user.c: In function ‘vu_set_postcopy_advise’:
libvhost-user.c:1625:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
 1625 |     struct uffdio_api api_struct;
      |     ^~~~~~

Understandable, it might be desired to avoid else clauses, but in this
case it seems clear enough and frankly the dev->postcopy_ufd is only
assigned once.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <74db52afb1203c4580ffc7fa462b4b2ba260a353.1671741278.git.marcel@holtmann.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index bf92cc85c086..b28b66cdb159 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -1599,12 +1599,13 @@ vu_set_config(VuDev *dev, VhostUserMsg *vmsg)
 static bool
 vu_set_postcopy_advise(VuDev *dev, VhostUserMsg *vmsg)
 {
-    dev->postcopy_ufd = -1;
 #ifdef UFFDIO_API
     struct uffdio_api api_struct;
 
     dev->postcopy_ufd = syscall(__NR_userfaultfd, O_CLOEXEC | O_NONBLOCK);
     vmsg->size = 0;
+#else
+    dev->postcopy_ufd = -1;
 #endif
 
     if (dev->postcopy_ufd == -1) {
-- 
2.38.1


