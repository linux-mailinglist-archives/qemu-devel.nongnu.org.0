Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0E6408ABC
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:09:09 +0200 (CEST)
Received: from localhost ([::1]:46824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPkln-0000fc-W6
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkay-0002nV-9l
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:57:56 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkaw-0005qw-VW
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:57:56 -0400
Received: by mail-wr1-x436.google.com with SMTP id t8so9226881wrq.4
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 04:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F257kBkfuJl6Q7MoJ0dNQEoRR26oeybWJUiYLakF928=;
 b=CsnMPFk5g/c4vXiEDCsijRlM2O2hRMBn4a3zurCFVHqa+1d/WirCxjBqet1Dndre+L
 e/mwyqUXalaA+qBejT0mMdHdQeDNO51aCdgMENWen7I/E8GrAKpDtTNVo8qXtKGimLuB
 1yerqZUFGi9p+OgeR3L2Gb9v1gSSbb5g6zODVOGZKwR5WNRetIEPDQnr0mm/FwF1NI/r
 jg3D9INtEL4pEgaIIH0zgZ1MyctooUsUaZ4r/rgRU7f46g4MKYEb1rApI+hJY9oibyOq
 1y7KuP5LH0XwNLqPjpGJsqWIcJsWqIG8VVg4SxcALbaCwIQmbjiw/AMfFQBqlCXzS3R1
 gPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=F257kBkfuJl6Q7MoJ0dNQEoRR26oeybWJUiYLakF928=;
 b=B+ORVFRm5eiKiOTt39IeZeVVTEY215+a01dkCJesbpyIGjo9pTgCMQ+QHUYygtkXpI
 zbPYuzHZ85R3OUVXLIpIVhno9IhDHcVfR7wN2iVqwtPXs4GReOCfRWgfveXVA4cktg3I
 Ak1ffgzeXHHDw9OqXX0PfjtPGBKFPc9InV1ymLQhL5RrTgLEZQ/NdniHTVy0uvyIK4rS
 HQSNgDB85vCM7dLT/tQRRhV0dsgBFN097kriLvX6fxBD3XCiSl4qXA4Lx1Tykn6P+OL5
 pLD1jqpkyTEnvBKJX3qL0oWo19z8FGo6n3XMZ3U+JTQw2FWtGqF2wca+atIWkP941i+a
 G/xQ==
X-Gm-Message-State: AOAM532VObAqLAJISabvfMBG3e3V9vpY4ZIVd2NVFUvJp1A3h1S4BUpq
 Jt63o0dFzrqAG33Edy2x21nHy4dM5nY=
X-Google-Smtp-Source: ABdhPJxCnBGMvMWn0J3aAvKTof1L/eJoxtxargFyjIbEm2Lr64uHJDzYA/XaWmZF0LLgl+jvpjy55Q==
X-Received: by 2002:a5d:46cb:: with SMTP id g11mr12067771wrs.60.1631534273642; 
 Mon, 13 Sep 2021 04:57:53 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n186sm6011037wme.31.2021.09.13.04.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 04:57:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/21] target/i386: Added ignore TPR check in ctl_has_irq
Date: Mon, 13 Sep 2021 13:57:27 +0200
Message-Id: <20210913115742.533197-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913115742.533197-1-pbonzini@redhat.com>
References: <20210913115742.533197-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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



