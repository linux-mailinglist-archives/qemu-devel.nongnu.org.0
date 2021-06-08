Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B918839F2E5
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 11:52:01 +0200 (CEST)
Received: from localhost ([::1]:37794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqYOt-0001EC-NQ
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 05:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqYDo-0004e4-DN
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:40:32 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqYDm-0001uM-Av
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:40:32 -0400
Received: by mail-wr1-x432.google.com with SMTP id r9so4118318wrz.10
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 02:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qzpXFnyjgRnwQsHIuTfmXtl8Hzry0AV1o6f9R8rYdXg=;
 b=Ez1zo9Ww/47Muge28SLE1xIluNeq5CprwHSYB8B3ev07THNS7H1qSnhCO4KnYobzri
 /BzzN7gYgl1avvORo6v9jxhuYvwy4wMIxPOzWVdHU6jJoKNWD9YftG5E3HidzyusTgbu
 R3GjUyo7gNB0zNaxWyqgXA7ga9JjxPuUTff/Eu1Yv8vB64OljXGmVDYXUDi95shrpnKT
 z2AJ7/8Gb68hoBmWYoZ51lYupEfEJfJJ55mZC0CzuIARRuGc/TzCnxAvcHHeZ/sAB68e
 I4Dj12Unxm/P2SR8lSGGUPMM/jbqj2mHV9tG4TG7GikyypSVypCbxgeY3NYdDe9LOLYJ
 RBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qzpXFnyjgRnwQsHIuTfmXtl8Hzry0AV1o6f9R8rYdXg=;
 b=dxJ+kjZ7VQbWX0nQYrS4t4lG5ZKMthwoypOQvgvNmMBY2LE0bLm4P92vOlKjZBPutz
 At19ZTFdg58QQDyCvmnttyRyRmXMjS3+Tx87AeOzmlvDh15YqNQUPd7n1S4MOzLU2rSs
 pEKcChDlwRltrRjltOHS8YMAL5qCJcoearrF258z977MaDo1R2ik5iz2PIV95LfmV96A
 mVljbAXY4GImF6ce6kT1CfI0p/v2OWBFM6wQwsieLsZ+h92DjYSabFRZIqAha1I/mF1b
 h8lDrk6+NTfBLLepFYPi4L1QeXIvrWM6EHJf7kLTZYMKgYmE0DuRTlfjrL0Lqvx7KnP0
 hhWw==
X-Gm-Message-State: AOAM533yrGbyiiK0dmYx7yFYwniD4AUYzB48EiuaIMMgNZroiDXGigTr
 LOH4rugWlBUhEDalYE9b7pNvJmWPXtU=
X-Google-Smtp-Source: ABdhPJwSQEvOUA0zQH25P1DzxHkt7OPNUevyv6q1MytJ9RaCX8px3WZ/nS3j0rLU3Kj1JsqQdV9RRQ==
X-Received: by 2002:a05:6000:2cc:: with SMTP id
 o12mr4847886wry.279.1623145229026; 
 Tue, 08 Jun 2021 02:40:29 -0700 (PDT)
Received: from avogadro.lan ([93.56.169.140])
 by smtp.gmail.com with ESMTPSA id d15sm8608764wri.58.2021.06.08.02.40.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 02:40:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/12] machine: reject -smp dies!=1 for non-PC machines
Date: Tue,  8 Jun 2021 11:40:15 +0200
Message-Id: <20210608094017.392673-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608094017.392673-1-pbonzini@redhat.com>
References: <20210608094017.392673-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 9ad8341a31..ffc076ae84 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -746,6 +746,10 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     unsigned cores   = config->has_cores ? config->cores : 0;
     unsigned threads = config->has_threads ? config->threads : 0;
 
+    if (config->has_dies && config->dies != 0 && config->dies != 1) {
+        error_setg(errp, "dies not supported by this machine's CPU topology");
+    }
+
     /* compute missing values, prefer sockets over cores over threads */
     if (cpus == 0 || sockets == 0) {
         cores = cores > 0 ? cores : 1;
-- 
2.31.1



