Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 315266D935B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 11:55:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkMJb-0008Fj-Bq; Thu, 06 Apr 2023 05:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pkMJR-0008F5-OD
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 05:53:50 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pkMJH-0008Nx-Do
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 05:53:49 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 i5-20020a05600c354500b003edd24054e0so25217251wmq.4
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 02:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680774807;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OSKTGeVvxMRFHaTMOhie+UZrwE1FFDQH+ewlD3woTE0=;
 b=lust/Wx2eqnTuI1KI8aheXDuuwE7MUEHKhoi+cAaRScCoEiwFVHsUOM+5wa9VZO1M1
 UNl9eABTvbi8hDpYRQmiuh3w3Q63IXKIcDOcuwD/E3wGGaiE+7r/o00MmTST/RKjAG+7
 snGZSfypWLGAGo4jXPIMKyFalAZ8bDNbUW9fBI68Y28N3Olhhb+4+tpg0uiSsprg4acP
 JOfVnRdSYhIXI6JwnL5JbOCn1IEdSAmpenYNaQ3ToWHKVEF0VQU7IMX401d0acllL2oR
 cZeyZ26WI/XFy07scnvCOIwmfaEteYZCkShJZUifA5jrky/7jfW7im3U1HO8pDuKPTpC
 BWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680774807;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OSKTGeVvxMRFHaTMOhie+UZrwE1FFDQH+ewlD3woTE0=;
 b=5KD1zyZbJ0IcCUb8a4Oo2rrMpb4Ri6fmxVfD6kIZDost6YmpckojjRGb2dy9+6kCGX
 MnsNwDB8VIPJJ7uAuqMyBDgkXFx7dkn52FEyGZKno7TrLMHQ3ljYbnV9cnbs4XXOr4Ah
 mnnCjUU/VVMdrMSdExTeExPDPMULN2gflkykPp+WiCTco5AzC6OdrbRC8S+94PgQpb/l
 ZJZjGPfuY2W7Xi9zFXxbSAi3XayKOshknu21n3kO0okGJBT5cauS3WjJ4V9ZBzquiuNw
 Drbm85QKdTQM22Ue2z08mlnlKVQ8k4d3IDhsFrnnzyQbBy14cJKerDrdgPMD12TTtGek
 zzDQ==
X-Gm-Message-State: AAQBX9ffwemPv441vjIbOLNft24fpyOTREBBN6GeiFMSHiJH0jgOQ/2Z
 4xcNxpTpSprrE0fveVMu0QOSHg==
X-Google-Smtp-Source: AKy350aDyqSTFTBgBXTPlt/lX1pa0tY75co4VxgnmQztZ4o5os7g9LXwPU0nZzQcqUm680Btr0kFdQ==
X-Received: by 2002:a7b:c85a:0:b0:3ef:7594:48cc with SMTP id
 c26-20020a7bc85a000000b003ef759448ccmr6695991wml.23.1680774807575; 
 Thu, 06 Apr 2023 02:53:27 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003ee58e8c971sm1117820wmq.14.2023.04.06.02.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 02:53:27 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DA5471FFB7;
 Thu,  6 Apr 2023 10:53:26 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH v3] qemu-options: finesse the recommendations around -blockdev
Date: Thu,  6 Apr 2023 10:53:17 +0100
Message-Id: <20230406095317.3321318-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We are a bit premature in recommending -blockdev/-device as the best
way to configure block devices. It seems there are times the more
human friendly -drive still makes sense especially when -snapshot is
involved.

Improve the language to hopefully make things clearer.

Suggested-by: Michael Tokarev <mjt@tls.msk.ru>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230330101141.30199-5-alex.bennee@linaro.org>

---
v3
  - more re-wording to try and approach consensus
  - add explicit warning to -snapshot option
---
 qemu-options.hx | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 59bdf67a2c..4b8855a4f7 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1143,10 +1143,22 @@ have gone through several iterations as the feature set and complexity
 of the block layer have grown. Many online guides to QEMU often
 reference older and deprecated options, which can lead to confusion.
 
-The recommended modern way to describe disks is to use a combination of
+The most explicit way to describe disks is to use a combination of
 ``-device`` to specify the hardware device and ``-blockdev`` to
 describe the backend. The device defines what the guest sees and the
-backend describes how QEMU handles the data.
+backend describes how QEMU handles the data. It is the only guaranteed
+stable interface for describing block devices and as such is
+recommended for management tools and scripting.
+
+The ``-drive`` option combines the device and backend into a single
+command line option which is a more human friendly. There is however no
+interface stability guarantee although some older board models still
+need updating to work with the modern blockdev forms.
+
+Older options like ``-hda`` are essentially macros which expand into
+``-drive`` options for various drive interfaces. The original forms
+bake in a lot of assumptions from the days when QEMU was emulating a
+legacy PC, they are not recommended for modern configurations.
 
 ERST
 
@@ -1639,6 +1651,14 @@ SRST
     the raw disk image you use is not written back. You can however
     force the write back by pressing C-a s (see the :ref:`disk images`
     chapter in the System Emulation Users Guide).
+
+    .. warning::
+       snapshot is incompatible with ``-blockdev`` (instead use qemu-img
+       to manually create snapshot images to attach to your blockdev).
+       If you have mixed ``-blockdev`` and ``-drive`` declarations you
+       can use the 'snapshot' property on your drive declarations
+       instead of this global option.
+
 ERST
 
 DEF("fsdev", HAS_ARG, QEMU_OPTION_fsdev,
-- 
2.39.2


