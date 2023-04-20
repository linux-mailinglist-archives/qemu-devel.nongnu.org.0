Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1CB6E98F1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:59:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppWf6-0000BP-L7; Thu, 20 Apr 2023 11:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppWf4-0000Ak-Si
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:57:30 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppWf2-0007ub-NA
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:57:30 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f09b9ac51dso23308495e9.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 08:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682006247; x=1684598247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zA2dADYFSqtV3gwOhvRaO97+ZK8AjTBqI4T+ZN/JW8Y=;
 b=KfKWCWB+MVuwduMk9ZW5fLotww9Ps48XwK5Vm/FSDlgvJ65hABERI1udQ/HV4to/kW
 7MzL+K0FqM3fLfO0OPcDmXqppnIDqTPDm579O1oxqD93oK5aroZ/NNhf9WBVhJC+Ko4A
 IigT6PjYkBj019mmTXNzAeIi5NTQtAxoI0wbafUeCayiiUoefA51s2raWFykLu5H3ONT
 LCW/XkfLaVIa6LoH0kDwBI9RZsSEdEw8QYXDc5mWb5WWAxeVIgricUuUQzMRGELdZTrQ
 JGqhPQue4tlIeD2U5f9kS3R7XqhdjS+jys/bqGwgSJrVuHaUFijHOS2lKziZilgdvEPw
 EzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682006247; x=1684598247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zA2dADYFSqtV3gwOhvRaO97+ZK8AjTBqI4T+ZN/JW8Y=;
 b=DIyIRdIa0Vy2ODk5AUWkl8+Y2a11bALUG8gmHXVFFz56rV8HdtUKjjpcFhm0azjAma
 kUFvc9T5Idlsb+fdOCAkfGewYITu18+XG7CvhRGV+Y5bjfqzT/UG7a4uddDuhHX25uXL
 CVQK2ofQ7arUN3MeTEHqNBLsIEciPdY/3Pdr9ghMhZsALyXrB5JY9g9v3lImZ8b8hjXb
 MR6l6rbWwBJ8MxE9Au5LM+tXcsTVxnXdvM9xUMsI0uqK51E+LOd/J9oMHZ+kDtgXaupz
 EzOKBj8glcR/rCGheLDvcL41EjgzsmWpAQnOxVIbpXk6alh2LO2Sk2VxbQcFHqk3r2s/
 oUHQ==
X-Gm-Message-State: AAQBX9fwMvMMHYjTS0Sd4TsDXaDOM9AlDbAt79j0K880DjC5nQDXRUI5
 7O3aF0Lhb1MChWr83j2mcUb9ViNkWeb1yt1uw50=
X-Google-Smtp-Source: AKy350bJTeHNW5CwG5o0OzqD9uOAZBO23XDRn1tVVaIXny3xArsr3mbDKSQ3FDutuAp258SY5w+2kQ==
X-Received: by 2002:a5d:594c:0:b0:2e5:8874:d883 with SMTP id
 e12-20020a5d594c000000b002e58874d883mr5302098wri.8.1682006247321; 
 Thu, 20 Apr 2023 08:57:27 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a5d43d1000000b002fdf0f6b07csm2271875wrr.67.2023.04.20.08.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 08:57:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1D83D1FFBE;
 Thu, 20 Apr 2023 16:57:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PATCH 6/9] docs/system: remove excessive punctuation from
 guest-loader docs
Date: Thu, 20 Apr 2023 16:57:20 +0100
Message-Id: <20230420155723.1711048-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230420155723.1711048-1-alex.bennee@linaro.org>
References: <20230420155723.1711048-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

A possessive its needs no ' whereas the contraction of it is does.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/system/guest-loader.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/system/guest-loader.rst b/docs/system/guest-loader.rst
index 9ef9776bf0..304ee5d531 100644
--- a/docs/system/guest-loader.rst
+++ b/docs/system/guest-loader.rst
@@ -14,7 +14,7 @@ The guest loader does two things:
   - load blobs (kernels and initial ram disks) into memory
   - sets platform FDT data so hypervisors can find and boot them
 
-This is what is typically done by a boot-loader like grub using it's
+This is what is typically done by a boot-loader like grub using its
 multi-boot capability. A typical example would look like:
 
 .. parsed-literal::
@@ -25,9 +25,9 @@ multi-boot capability. A typical example would look like:
     -device guest-loader,addr=0x47000000,initrd=rootfs.cpio
 
 In the above example the Xen hypervisor is loaded by the -kernel
-parameter and passed it's boot arguments via -append. The Dom0 guest
+parameter and passed its boot arguments via -append. The Dom0 guest
 is loaded into the areas of memory. Each blob will get
-``/chosen/module@<addr>`` entry in the FDT to indicate it's location and
+``/chosen/module@<addr>`` entry in the FDT to indicate its location and
 size. Additional information can be passed with by using additional
 arguments.
 
-- 
2.39.2


