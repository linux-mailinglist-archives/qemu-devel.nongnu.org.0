Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF546FC259
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 11:07:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwJHg-0005Ho-Go; Tue, 09 May 2023 05:05:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHb-0005G5-Jz
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHV-0004v1-Qs
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683623111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XF+9trcgwcQ5RKOh8bKidL0/LjIKx4RL/4OZJgAfRtA=;
 b=Rl2jwCzeuW9Y+2EWKhTy3TMvBYLuwbxUIyEypiDBIiRo0L2DcOKcRGN7crxgdeZ8uAHYc2
 Xj2x+MylDOpz4sP4dsOaeZSiN5IPojRpCJFLZLg1XRNu7tOipR/KOmAiUnTN69BcmqQsyY
 sLlloXcICR8fjxFovVap05+PxGajo5A=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-P4bVdj1sPkidpf9vPVN-eg-1; Tue, 09 May 2023 05:05:10 -0400
X-MC-Unique: P4bVdj1sPkidpf9vPVN-eg-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-50a094d5876so6423750a12.3
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 02:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683623108; x=1686215108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XF+9trcgwcQ5RKOh8bKidL0/LjIKx4RL/4OZJgAfRtA=;
 b=g9BBz7lz5Ewlioeva2LMACETZEbzHTwK5NGD5RvYhcWTiw8oPmJt5q73niHtwzaChg
 NxEq0ieO7GG7k+NNH0RxUxV6glKSRqQ6mYMFZM318+XFCh+tSbnvmoXA5XDt+tyhPhm+
 elQJh84bOQV0nhtI61dY5geopDhqKrJ6KgvEbGN+EuLIzcXEmXDQlq9aJW2m5g2G6J5V
 oLM1kjF0fXl8jaQjsIMKmubmvcGUeyd8i9qT2YIq1GT/etqau3c48zpjS3mpXIuSLYVF
 19R4TD+JJ8PhSj9dJGHhXW/oMVQjeaJEhuyOiZ6/OuxojQ+DFKrIRksZDlLjRUALjeq6
 O6Kw==
X-Gm-Message-State: AC+VfDzTHr8dibik0DmyMthVknVWDg0ghdREZSt9cJPyC5vA1tt0xkoI
 GHBmGgMhCd40Eg9cMr8IakJBETMLpnl0UMElNPSINM/vF4nRxswifrbXOb8TdbZLT3BcLsIf8a5
 cO5h7KXBZK1fjEmg2rnLuXbV+QcZzWbgaxIdYIfZSc2YGCqUO62CVGS1drFyDjEyRRwBDmeRBn+
 o=
X-Received: by 2002:a05:6402:886:b0:50d:b7e5:fde8 with SMTP id
 e6-20020a056402088600b0050db7e5fde8mr1299874edy.26.1683623108584; 
 Tue, 09 May 2023 02:05:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7goL1F+56z9MJ5H7Lla6wejDULRG3Jj2rHJlgjitHDsmL67rt3h1bGKqezE9U6j6AShk3oSA==
X-Received: by 2002:a05:6402:886:b0:50d:b7e5:fde8 with SMTP id
 e6-20020a056402088600b0050db7e5fde8mr1299860edy.26.1683623108168; 
 Tue, 09 May 2023 02:05:08 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 m26-20020a50ef1a000000b0050690bc07a3sm533192eds.18.2023.05.09.02.05.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 02:05:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/16] MAINTAINERS: add stanza for Kconfig files
Date: Tue,  9 May 2023 11:04:43 +0200
Message-Id: <20230509090453.37884-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509090453.37884-1-pbonzini@redhat.com>
References: <20230509090453.37884-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 55102f476184..f757369373f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3910,6 +3910,16 @@ F: configure
 F: scripts/mtest2make.py
 F: tests/Makefile.include
 
+Kconfig
+M: Paolo Bonzini <pbonzini@redhat.com>
+S: Maintained
+F: scripts/minikconf.py
+F: docs/devel/kconfig.rst
+F: Kconfig*
+F: */Kconfig*
+F: hw/*/Kconfig*
+F: target/*/Kconfig*
+
 GIT submodules
 M: Daniel P. Berrange <berrange@redhat.com>
 S: Odd Fixes
-- 
2.40.1


