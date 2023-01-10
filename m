Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCDD664634
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 17:35:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFH6Z-0003X9-Sd; Tue, 10 Jan 2023 11:04:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH6D-0003KF-8m
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH6B-000557-Pe
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673366619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LD0ZnDQG+7PlYWCzQLV8D8Fhy1u5VFQqJLQLd70bB28=;
 b=YKxkQq9C7EKmSCibEPsO1oxeqRKmWSwoqhEgwCCpIgk775wG+roOkJQtSFycaFkvodE63r
 rQup+iAOzAjdbjy1VCIDpfy5Y8aQL6VO+JD/gmmCXlF09Nf61pfWFTm22Lp+tgT1nclxsb
 kOuxn1Bwa4xfG9ZKI8Ysroi7J7xxOzY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-445-AjJv8aqbOvWD80NKpoNd6g-1; Tue, 10 Jan 2023 11:03:37 -0500
X-MC-Unique: AjJv8aqbOvWD80NKpoNd6g-1
Received: by mail-wm1-f69.google.com with SMTP id
 m7-20020a05600c4f4700b003d971a5e770so6489849wmq.3
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:03:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LD0ZnDQG+7PlYWCzQLV8D8Fhy1u5VFQqJLQLd70bB28=;
 b=kgcmkRvLBuggI2oP6N96GvmlnINo7RZKfGXErxdQhHqcqCtX9LVKmohk/nnWLihZKk
 69+dnXKJlUQZEO6hBiejIGPchA6pfmUKAQV8ILPsiA78FqGKIJ/BCfSu/0JnJgZRH696
 NMwQg/0MgKTv8u/PzydMCmpnfWryTWpGwJxntNT46z7+nVMODct1N5UYtAcg1QwZPRzY
 2V398DpHWNglU4F4uMPzd+9jvmFfiGNk6oF6oldOWyvOS+tfNwR2Em4N6H/sgjk5Y9HU
 zFQWM96KAN6cdZZtgWf2QYKQBZ5oGqAI/7MIOk2juFEfXvLJFAU81QzobH18y8RiuXe0
 TpDg==
X-Gm-Message-State: AFqh2koGLwqUgpWOZ/nKwQ09rRGo0Qn6luuORKT6BRntnbyfsIzZa90Z
 Elb/4ZLL/N41qZNU1rJTRWgefDvBuKImEdPoklrmZZl5y5rvGvbpkOI54dAqkXLANozXPFixBUN
 oLe3zdVYSt5A1MyY58OeOVKUg9g+wb072zWrX4gnw0CnMVeWDgvKZs1q96xfeLEDFblI=
X-Received: by 2002:a5d:470b:0:b0:2bb:9106:d0e with SMTP id
 y11-20020a5d470b000000b002bb91060d0emr8006551wrq.18.1673366615952; 
 Tue, 10 Jan 2023 08:03:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsP14plIxoYY/I5BJ+j9M4+YNy5IkkdN2GiV8tkmSuOUK/N51xyI2VRVWpm1r76P6MRmjQdlQ==
X-Received: by 2002:a5d:470b:0:b0:2bb:9106:d0e with SMTP id
 y11-20020a5d470b000000b002bb91060d0emr8006528wrq.18.1673366615671; 
 Tue, 10 Jan 2023 08:03:35 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a5d4ec1000000b002882600e8a0sm11665573wrv.12.2023.01.10.08.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:03:35 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Holtmann <marcel@holtmann.org>
Subject: [PULL 22/29] libvduse: Provide _GNU_SOURCE when compiling outside of
 QEMU
Date: Tue, 10 Jan 2023 17:02:26 +0100
Message-Id: <20230110160233.339771-23-pbonzini@redhat.com>
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

When the libvduse sources are used by another project, it can not be
guaranteed that _GNU_SOURCE is set by the build system. If it is for
example not set, errors like this show up.

  CC       libvduse.o
libvduse.c: In function ‘vduse_log_get’:
libvduse.c:172:9: error: implicit declaration of function ‘ftruncate’; did you mean ‘strncat’? [-Werror=implicit-function-declaration]
  172 |     if (ftruncate(fd, size) == -1) {
      |         ^~~~~~~~~
      |         strncat

The simplest way to allow external complication of libvduse.[ch] by
setting _GNU_SOURCE if it is not already set by the build system.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Message-Id: <407f3665f0605df936e5bfe60831d180edfb8cca.1671741278.git.marcel@holtmann.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 subprojects/libvduse/libvduse.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvduse.c
index e089d4d546cf..c871bd331a6b 100644
--- a/subprojects/libvduse/libvduse.c
+++ b/subprojects/libvduse/libvduse.c
@@ -16,6 +16,10 @@
  * later.  See the COPYING file in the top-level directory.
  */
 
+#ifndef _GNU_SOURCE
+#define _GNU_SOURCE
+#endif
+
 #include <stdlib.h>
 #include <stdio.h>
 #include <stdbool.h>
-- 
2.38.1


