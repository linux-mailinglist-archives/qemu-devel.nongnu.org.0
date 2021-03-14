Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4034333A738
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 18:53:58 +0100 (CET)
Received: from localhost ([::1]:33678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLUw9-0000OZ-AJ
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 13:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lLUsq-0004NE-V2
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:50:32 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lLUsp-0006fm-F4
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:50:32 -0400
Received: by mail-wr1-x42e.google.com with SMTP id 61so4548399wrm.12
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 10:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YhBo1ZSoIBwZQ5KKbNpd+bGBZNvKDhx/Uj/CIpS1xWc=;
 b=s0QCUFXGJE5CkEya4qhsBpal6oevQPylOLuEu7wswHXLJ0WKIUSfEjWnKvXIit59x6
 6tn7bxePTGCw0AXWw3J7w974xk4ZcttVNN0fjEPWMqZqA2O2vIS60Aqvsrzv3txptUjq
 5a6ySS8QW+EPvdbbj0yekUsN1ccnxLXZSfi9yLZGma7fnir8yNMv/staiwqA7/rHjtW6
 H5cW43KBxUAyKJMAbVZRuewB6vQysrM7PAg6JbbAtXb4EXKbzn0juqR0pB+bySJf9ltl
 P2h/vDHHcFsbmZ2N1uBfzGVMGdctkXL7TD9xHiwOTLKsiTfDFFj+oNLppFMDZgl2hd+P
 PYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YhBo1ZSoIBwZQ5KKbNpd+bGBZNvKDhx/Uj/CIpS1xWc=;
 b=MbnevBgOxb6cDNnJJZCsKkacTDb6v/Fo0h8gaAsh5u0ssi8ZiH09F13NPooXkTVZ6v
 fudn8pEmFjTrgT5o3rc/vc6bOVLR1mFxJqYgv7fnlUjqVEI61MMH1BX+olKP/KykKqa8
 dhiQPLK7MsigEJb6rgEwnfeNKNa+CYvGJd8JtCOwT9CI1/paE557/acYWOFwzDuo/v52
 gl2gPACSkxJoXWpNmo4qmWpufE2ffGVIh8aMtQ52vT+HtlvqeTbLgmcp/D1Y2SzX9N+3
 pW04aFjRwUGkDIITK8fVKT5drR/F1BhhlIZvxxBegP1PcFhKX5+ycZN2tJxy63dugh0B
 VANQ==
X-Gm-Message-State: AOAM530nr8uuprQmS7hbbx98fMgt480NWHYUXNxU4fcO/VmGwH2N3qWQ
 1AfwwEek3mPOpnkt65VH4BWb4uV+DIE=
X-Google-Smtp-Source: ABdhPJzcs/stBwgmJD/EIHZtYsVlI5+7oqD2ZC1AdlzbAAwksFUOtQosQeeOEKMPKJ+dbv+wdtmpvg==
X-Received: by 2002:a05:6000:10cf:: with SMTP id
 b15mr23708166wrx.183.1615744230277; 
 Sun, 14 Mar 2021 10:50:30 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a6sm11442749wmm.0.2021.03.14.10.50.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 10:50:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] hexagon: use env keyword argument to pass PYTHONPATH
Date: Sun, 14 Mar 2021 18:50:25 +0100
Message-Id: <20210314175025.114723-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210314175025.114723-1-pbonzini@redhat.com>
References: <20210314175025.114723-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This feature is new in meson 0.57 and allows getting rid of the "env" wrapper.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/hexagon/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
index bb0b4fb621..aaeee11ac1 100644
--- a/target/hexagon/meson.build
+++ b/target/hexagon/meson.build
@@ -156,7 +156,8 @@ dectree_generated = custom_target(
     'dectree_generated.h.inc',
     output: 'dectree_generated.h.inc',
     depends: [iset_py],
-    command: ['env', 'PYTHONPATH=' + meson.current_build_dir(), files('dectree.py'), '@OUTPUT@'],
+    env: {'PYTHONPATH': meson.current_build_dir()},
+    command: [python, files('dectree.py'), '@OUTPUT@'],
 )
 hexagon_ss.add(dectree_generated)
 
-- 
2.29.2


