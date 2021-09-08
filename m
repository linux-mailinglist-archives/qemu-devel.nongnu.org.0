Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C9240379A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:12:09 +0200 (CEST)
Received: from localhost ([::1]:39516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuYq-0003qB-2v
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRk-0006NH-Hu
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:48 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:39575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRe-0002sX-Gm
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:44 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 196-20020a1c04cd000000b002fa489ffe1fso661778wme.4
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F257kBkfuJl6Q7MoJ0dNQEoRR26oeybWJUiYLakF928=;
 b=UEewsJibo/FBKsVDTspq5PC/Q34asjP8IiCqZcl/0szvNcPnaDCOZWhunIOy8iS7ZJ
 OypnPDpVSvLBZNhKA/m3uLXCE7wvkGuP3d+VE+QMkI2fAJuZ8X/NTYOXDNTdJ0yDzfM7
 FKP8dcemmhBDyNRot9fKenv1ueoufvSH7uWkBBjt+X+0tCyHkkJ1FfgwQWqsxYO+1m4r
 pibv5oV5ozcqQNUsAlduiIRHOY45d7WOtxkxVIdVvM5c2DVg8PAmvbiR9ppNuKBibyEj
 7IL7y2aHVOEXGeGbcnqA3mfviwQjWccU+Nxxu/KxAvN9H5zWQkZKqDpH5dgSC5JAzjK+
 DKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=F257kBkfuJl6Q7MoJ0dNQEoRR26oeybWJUiYLakF928=;
 b=KdI01TFIZi2buqorTYvo5ROQFT38HsUxHYJrXDVr4W3wu1UCc/rWIP3fRaDDLndyMs
 fz+0F1FlN8FZOxC/lsYrVvMhhH43brFFZzwoYZmOMXXsJn0ubBpDM4izzG0xuLpZjuFe
 sX+MQQQp1J+yq7XpapdC1Qm0fzI00jUXglyk992Hy2cP2N7QbCzmn+uFij6JAVZ8MEim
 QNn5cb9vMS2UqWMorQY27kXXpRX1VFD1Apuy7RpdCU6vmHKuRrJCT4bGIO4k7W24THMX
 hOBCQhk+HzhfoxscL8OHbgRjcHLQTY5oKBEv532smXQwAmZs41mB0C1Yz3dIvv9rYw9c
 XgWw==
X-Gm-Message-State: AOAM533tbP+3R8M5thXRXF/b4rsOhhdMNdRbZ4fZysZWFd4CndQUEAkU
 VP9S9XekgbMKYy2R9o2Ts3qWWOksddQ=
X-Google-Smtp-Source: ABdhPJwBjmgsh5aGTXWUL29KsIRs1Wsn8GuB9aoeveGRpe4u65X1Ue21ixncW2Hgz03XDiZd0CfsHA==
X-Received: by 2002:a1c:2c3:: with SMTP id 186mr2688823wmc.195.1631095480197; 
 Wed, 08 Sep 2021 03:04:40 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:04:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 06/43] target/i386: Added ignore TPR check in ctl_has_irq
Date: Wed,  8 Sep 2021 12:03:49 +0200
Message-Id: <20210908100426.264356-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lara Lazier <laramglazier@gmail.com>

The APM2 states that if V_IGN_TPR is nonzero, the current
virtual interrupt ignores the (virtual) TPR.

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/sysemu/svm_helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 4612dae1ac..a35b79548a 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -83,6 +83,11 @@ static inline bool ctl_has_irq(CPUX86State *env)
 
     int_prio = (env->int_ctl & V_INTR_PRIO_MASK) >> V_INTR_PRIO_SHIFT;
     tpr = env->int_ctl & V_TPR_MASK;
+
+    if (env->int_ctl & V_IGN_TPR_MASK) {
+        return env->int_ctl & V_IRQ_MASK;
+    }
+
     return (env->int_ctl & V_IRQ_MASK) && (int_prio >= tpr);
 }
 
-- 
2.31.1



