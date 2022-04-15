Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81128502AF3
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 15:29:50 +0200 (CEST)
Received: from localhost ([::1]:59234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfM1F-0007vQ-Je
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 09:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLsd-0007xZ-I4; Fri, 15 Apr 2022 09:20:55 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:44748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLsc-00006k-0U; Fri, 15 Apr 2022 09:20:55 -0400
Received: by mail-ej1-x636.google.com with SMTP id u15so15298116ejf.11;
 Fri, 15 Apr 2022 06:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n6inZnLXWnAkdrOe9Q2dok2RBXEig9r/WC+XNq10mjA=;
 b=YdGSahfK8tWJnhUoygEuCwQR+KuIvbvAPirEaJ1eI/09vmcJFG1Fx2Tf++MzTLXthd
 NzNR5JRNP3DINLkCUhZoG7nz+SY7gOeWaohPuSJvBVGy5Y0Po4BccfAuvuhfMPCRRrwV
 Sck+SvjBBEK6H+SdrljDvaII7WvXua27Hkk404imH+FfUaDF0taytMvP8m3sy+pZQLIm
 cd543sqxmxhXODK0Ebf3ddPMMsgZFvHH/rSaPba8oZqLA21PIoSANP5EgV6+at1F5KNe
 w/TbHS1t49C57DeK+jV3QH20dH+LB2M3MTDF94z27PrMP3FQlh+h7v+dlykZholge5Da
 sUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=n6inZnLXWnAkdrOe9Q2dok2RBXEig9r/WC+XNq10mjA=;
 b=FBlrCPM6VZutlX0w9twqfgD/uL/CynPbNnzQ2UqoVYODZ4l7IcZQz0DFH3NsGAee4W
 b1JeI6Ihv1xp6zAGas4swMx1ROGe4060gOX+xOTFVj59mla5TvAqcguuY2ER/AkzsSeK
 jwzptwpC+yTrWoBnOW+vpdVJpEh77iE55msuyxmbVeUMkanGZNroMfrKePhM+AM2eqKZ
 ZonwwDjFo2NTBPE4YUYpUtHYCwjOYXQJDhYNxEhTYd/KsWixyfcjFQKyisVFeuQT/QBH
 ndAa+PMsdN1wXEjjtBrStOrwqEv6OrmtKEQhgRIokssuwZnGKgcplKAIQjYAg/nkE8XU
 1EOQ==
X-Gm-Message-State: AOAM533u60dHFklOqCQ/6bcDgR8Agl6P2A5DprxQMXnCMJ35Fr2YJ6bq
 H2DBThR1ja+21CKaPPnNB5X4RogZ0is7DQ==
X-Google-Smtp-Source: ABdhPJwLc4SFhZbsFRnypFtEhxowL5Sl+Yl/QSsr7u9TXrRyFw84OJTgsfw42gBs4E8jjbX4dAFweg==
X-Received: by 2002:a17:906:944a:b0:6e8:ac79:2b6e with SMTP id
 z10-20020a170906944a00b006e8ac792b6emr6106415ejx.377.1650028852331; 
 Fri, 15 Apr 2022 06:20:52 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 dn7-20020a17090794c700b006e8b176143bsm1683529ejc.155.2022.04.15.06.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 06:20:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/26] 9p: add missing coroutine_fn annotations
Date: Fri, 15 Apr 2022 15:18:58 +0200
Message-Id: <20220415131900.793161-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415131900.793161-1-pbonzini@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, Greg Kurz <groug@kaod.org>,
 malureau@redhat.com, hreitz@redhat.com, stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/9pfs/9p.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index 994f952600..a523ac34a9 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -424,21 +424,24 @@ typedef struct V9fsGetlock
 extern int open_fd_hw;
 extern int total_open_fd;
 
-static inline void v9fs_path_write_lock(V9fsState *s)
+static inline void coroutine_fn
+v9fs_path_write_lock(V9fsState *s)
 {
     if (s->ctx.export_flags & V9FS_PATHNAME_FSCONTEXT) {
         qemu_co_rwlock_wrlock(&s->rename_lock);
     }
 }
 
-static inline void v9fs_path_read_lock(V9fsState *s)
+static inline void coroutine_fn
+v9fs_path_read_lock(V9fsState *s)
 {
     if (s->ctx.export_flags & V9FS_PATHNAME_FSCONTEXT) {
         qemu_co_rwlock_rdlock(&s->rename_lock);
     }
 }
 
-static inline void v9fs_path_unlock(V9fsState *s)
+static inline void coroutine_fn
+v9fs_path_unlock(V9fsState *s)
 {
     if (s->ctx.export_flags & V9FS_PATHNAME_FSCONTEXT) {
         qemu_co_rwlock_unlock(&s->rename_lock);
-- 
2.35.1



