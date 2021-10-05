Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87FE422F50
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:37:32 +0200 (CEST)
Received: from localhost ([::1]:41394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXoNf-0001RX-Nb
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXnYF-0007sd-GV
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:44:23 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:40823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXnYD-0003zw-WF
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:44:23 -0400
Received: by mail-ed1-x535.google.com with SMTP id g8so1227035edt.7
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VMxPJY6t4uoMf/I961hE4R2GzgtcCFDrssDoN4r5NzQ=;
 b=A1sZe2WpmWg13qvHB8ePsix5r/JJPfIazuU9qFj19Thb8YSqzVhn+MyDKlYsjWTSkC
 cUpICsVKwcm0o8HHSMJjNuwn97/hM0XgpJGHykCw/ZMf5uDfWKSF4VV43EiHVCfOhAVn
 xHIRm5nkCnkYgybRkE+Zau9ylwUAIs0gV5BFVcbzin0Ma8FkrDXPp4DtOb2u1vEiPmyB
 xJrktKpKk8ZpuXJ9wPV7hzvqE9bWB12rkxTK/SzsYV3yZsEcuWwQnufg9YQnJn7j68Xa
 MSFdxRh8sydD71GVF9e4sdZStl2S+t6DUd3kOEQGzhQuL68QAW1RxHOpPnQbb3NgDM5i
 ls0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VMxPJY6t4uoMf/I961hE4R2GzgtcCFDrssDoN4r5NzQ=;
 b=Aykq08XcT0wjHnU/XXc760bslD7kNJJor0iPcGqcKM2WS0ui7fUqD4XLQZFbZB/2EQ
 b/QhCVXKkGtQRB69kRMEYq2dLck3TBNZVrOYqNCtNRgRfhg/UcxgfAzR0bzSludR2geF
 x+jbEE6/sOFgbItfwlH8bVvdBkZSHMM/3W+E6CbcpVwn/c2MmWkrB0i/fcBphPuTXdRJ
 w6t9DMsbwK1mgpW577GjY4LDOy9vRHAi5N4tiP6bfImAKOdVQ0qSvVh0B03624J8ExP8
 QeTncsOeWhJR/OtfpTWaEMlnXdwKKZ+ymWhusHgcqFBEWaxrdeHJ9GfF1jDIR4Cg3IbK
 bLsw==
X-Gm-Message-State: AOAM5332TdCCLaJgfmJWI9iJRjT+Z2Kh/kJn1E9PD24EDtqZKpGBHaBz
 4v15FHyPxTElBaZ83CVZxpCH+3Rvd5A=
X-Google-Smtp-Source: ABdhPJx44QLNIO6lvI4d+ME3eMjdXAs/WnSh4l3VP8M8IswX7pPA+TrGfjSjjJ1hiuXUNak26Y1e+g==
X-Received: by 2002:a17:906:3402:: with SMTP id
 c2mr25929857ejb.271.1633452260688; 
 Tue, 05 Oct 2021 09:44:20 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x14sm6101392edd.25.2021.10.05.09.44.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:44:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/12] hexagon: use env keyword argument to pass PYTHONPATH
Date: Tue,  5 Oct 2021 18:44:06 +0200
Message-Id: <20211005164408.288128-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211005164408.288128-1-pbonzini@redhat.com>
References: <20211005164408.288128-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
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
index 6fd9360b74..c6d858ffb2 100644
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
2.31.1



