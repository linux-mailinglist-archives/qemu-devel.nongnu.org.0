Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366D1402C5F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 18:02:28 +0200 (CEST)
Received: from localhost ([::1]:40384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNdYJ-0000Do-00
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 12:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNdSq-0000xw-3N
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 11:56:48 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:43695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNdSo-00068Z-N2
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 11:56:47 -0400
Received: by mail-ej1-x62c.google.com with SMTP id ia27so20605653ejc.10
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 08:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KrsK8fIxtvUv82ltZLe5fPcFNik8wrG7XHWp+ymcIIU=;
 b=WgL38ZpMacZWjjBDAQwDqz96H/VL1iCnF7X/JxbSwEKfNRzuNj8SNWfv/GzIhMsDzC
 hdpu+8cCjWbFGvZVgG2guoxz3JXBIXkIAanrxvktYoGtBCEy18YxqvQrl4ea5RF+NIQP
 0NtEJUTN8zwb1ohgkkMZaCxtRWdHf9WZaY4YeCpTOhoUcPzdw5CI6oEV3nbpYuvOD58m
 4CxNwLU/oNzNE0UjxqCn1618nv/z9gIzvyPNmc3+HQX+ffO7v/4fHUmPgY/98gRd8odP
 Ejbnzyi6kAeqowcUFQhr/JsdBlXvTuc0Vwdg1mT8Kz0picugrhHPw6sJktwDwpzOMDKf
 av4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KrsK8fIxtvUv82ltZLe5fPcFNik8wrG7XHWp+ymcIIU=;
 b=E2SEkpaUUZeY1/LBhE9fbO/efzk4GWjFjD7LQGFr5khMAMEmmpF9/5w/H4FPc1pDSL
 dgACRNgRPyCuUrHrEi1Z2pnsjtIJAdPfX6xzo+7lmQrnjQAOmFuLB1sEVn+YouCuYIRs
 0bDHEVruBIk0DXIyE7eNfPKf1kPVobElwU1uCdVplEQVVdPl/tKOzEyOZridSkZzbUQL
 kldEe1VJ4K1jYoTcJGPnK3gjnrtT4/0r/HmO12P9MlzFwr/w2YBR6TD7VjoKn5q3HF25
 mGwPf9iieM09eDFRmh4pUlYDAFV5EE05rnAi5wwSFDYkN/GkIIYeKUhAtFi+83ibB/zj
 YgAw==
X-Gm-Message-State: AOAM532P5rrXuRgHLhNjvARyngJzHrKjeM5bmikZnT0OkLjX8G2MqTJk
 +iSx/eKC/ZVAx31CxFF9eCSE7AZW0+o=
X-Google-Smtp-Source: ABdhPJxbmkrNOD+DdIXta1AeQapVF5zIKqty/ewY4KKf0DggoEo9avqv7fLlPtocUGT3hHtu9Ifmsw==
X-Received: by 2002:a17:906:ae0c:: with SMTP id
 le12mr19299924ejb.169.1631030205345; 
 Tue, 07 Sep 2021 08:56:45 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h30sm6869669edz.40.2021.09.07.08.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 08:56:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] docs/system: move x86 CPU configuration to a separate
 document
Date: Tue,  7 Sep 2021 17:56:40 +0200
Message-Id: <20210907155641.197844-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907155641.197844-1-pbonzini@redhat.com>
References: <20210907155641.197844-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, cpu-models-x86.rst.inc is included in target-i386.rst directly.
To make the toctree more homogeneous when adding more documentation,
include it through a first-class .rst file.

Together with the previous changes to the man page skeletons, this also
frees "===" for the headings, so that cpu-models-x86.rst.inc need not
assume anything about the headings used by target-i386.rst.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/system/cpu-models-x86.rst.inc | 4 ++--
 docs/system/i386/cpu.rst           | 1 +
 docs/system/target-i386.rst        | 8 +++++++-
 3 files changed, 10 insertions(+), 3 deletions(-)
 create mode 100644 docs/system/i386/cpu.rst

diff --git a/docs/system/cpu-models-x86.rst.inc b/docs/system/cpu-models-x86.rst.inc
index 9119f5dff5..6e8be7d79b 100644
--- a/docs/system/cpu-models-x86.rst.inc
+++ b/docs/system/cpu-models-x86.rst.inc
@@ -1,5 +1,5 @@
 Recommendations for KVM CPU model configuration on x86 hosts
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+============================================================
 
 The information that follows provides recommendations for configuring
 CPU models on x86 hosts. The goals are to maximise performance, while
@@ -368,7 +368,7 @@ featureset, which prevents guests having optimal performance.
 
 
 Syntax for configuring CPU models
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=================================
 
 The examples below illustrate the approach to configuring the various
 CPU models / features in QEMU and libvirt.
diff --git a/docs/system/i386/cpu.rst b/docs/system/i386/cpu.rst
new file mode 100644
index 0000000000..738719da9a
--- /dev/null
+++ b/docs/system/i386/cpu.rst
@@ -0,0 +1 @@
+.. include:: ../cpu-models-x86.rst.inc
diff --git a/docs/system/target-i386.rst b/docs/system/target-i386.rst
index 22ba5ce2c0..c9720a8cd1 100644
--- a/docs/system/target-i386.rst
+++ b/docs/system/target-i386.rst
@@ -19,7 +19,13 @@ Board-specific documentation
    i386/microvm
    i386/pc
 
-.. include:: cpu-models-x86.rst.inc
+Architectural features
+~~~~~~~~~~~~~~~~~~~~~~
+
+.. toctree::
+   :maxdepth: 1
+
+   i386/cpu
 
 .. _pcsys_005freq:
 
-- 
2.31.1



