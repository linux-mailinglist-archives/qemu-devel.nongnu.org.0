Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6531E3A2D4A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:42:37 +0200 (CEST)
Received: from localhost ([::1]:37416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKxA-0007I2-El
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lrKqg-0001ia-If
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:35:55 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:52110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lrKqd-0005gU-Hf
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:35:54 -0400
Received: by mail-wm1-x330.google.com with SMTP id l9so6204574wms.1
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 06:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qzpXFnyjgRnwQsHIuTfmXtl8Hzry0AV1o6f9R8rYdXg=;
 b=o3orkLcxGSnXxx+RvuoYTdJ9SMiJHSEnLeAGv8jQO552y1N7z4jCBM7t1pD1vOW/Gu
 w2ytTiRWIF66i+d4C95snZvmsA9pMyUtdw6MM5wQKTTycdmfI1hk4z34BQy6vINriW18
 04gnDulvYA2I69fHsNUY5VYPbkZi6n1zuosWrx+cI5Ckh+5z2zamXJinhLoiOpsdiPvK
 3jN3fFZcMxOlPIMkdJ/0zAcodyLW/XcwIf5D8bB1nfpAObDbU+h4uscFRlpGElyUaUZ1
 QJun6V6rBFrqpV5i51cp7fBFZrklzM6rOt7VmZtEKs+OB2R0bVWgIJ46azAX6Mbj0ORc
 Pn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qzpXFnyjgRnwQsHIuTfmXtl8Hzry0AV1o6f9R8rYdXg=;
 b=G2LNv06rXyownK5mWgQ/KStAF1eHdfxTXIWV2jS8+wX6cau0UYtpag09ImwIdoOzHm
 EpOXlg2/x8qNEyWDfSGQ/GwsqNL0nlmk7zxG6PwTliN3dImvcZlbvcoKvsarpscy2sfd
 2slNj8HKFyNRDdLwnKaatQ8qNrSXDDBv46dmPtZyJGZ3fZ/JDKc4tzdHYr2X3L6mRTKK
 Hhq/G2cdKK36B4ra8c5tkcAWqNE2kYziWaairG77oU7PEFA4t2wpySCZvmcNVSj76Zxq
 7dBXwaxHo3cxZqjn7suETyc7+1UDlRQ0u4egzvIdQFIQCCbvt5M9OVTKONzuq+oPKIcd
 wWug==
X-Gm-Message-State: AOAM533XM0puD3WUg9tGaVKEJgwAvireOUu1cvBZcnWdY4YLIcNTWD7J
 pXU320Ra2PRtKkG6jLcayjhqkxH5G+93Ug==
X-Google-Smtp-Source: ABdhPJyzzuAltizO2p4e/LVClc+cETec7mj9whMSnZn4RVO0D+fxlH42RpFxTkd3BRA7xEM7Y76CVA==
X-Received: by 2002:a1c:ed03:: with SMTP id l3mr5257102wmh.130.1623332148891; 
 Thu, 10 Jun 2021 06:35:48 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 v8sm4032519wrc.29.2021.06.10.06.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 06:35:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/11] machine: reject -smp dies!=1 for non-PC machines
Date: Thu, 10 Jun 2021 15:35:37 +0200
Message-Id: <20210610133538.608390-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610133538.608390-1-pbonzini@redhat.com>
References: <20210610133538.608390-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
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
Cc: berrange@redhat.com, armbru@redhat.com
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



