Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0F66F0897
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:46:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3oE-0001sL-88; Thu, 27 Apr 2023 11:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3o7-0001pr-9I
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:19 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3o4-0004ia-MB
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:18 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f315735514so29119855e9.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 08:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682610316; x=1685202316;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SI6uYTd7Q0+IVe4nYn/2huKDCgz0raMlMXhc7QX3q+I=;
 b=BS3uaJPowCtUB+tvsByZoj1Ht+0mVzlaqQ3EoWlo8/52qbjtQt2frhnGqUYB6MDQR9
 f+SP3kH2+c6z9fYJAmFmjOKthAmT9xy2tGQJBvV0ZEGmZwLKHi48AnQGX0piFA4q/vwh
 NYQ7zjJpEr2rK07HaDzXEaIp+gD6HltUgjIcWnctcBRr+MBGz3xzxWfNMFodJEeboDHJ
 NhA27ICVtosSdssvD/QPMZwgcD0zcpHsGwtmG5kqNUe9HmQ6bt6tX+cmriajYuUPv22s
 mer0dzvBTvDHMsX9HHiRtZYKDaer7UtrD9cKpqm9rLRMh2g5hlhXYvIZTAXjeQQ/olh+
 75Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682610316; x=1685202316;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SI6uYTd7Q0+IVe4nYn/2huKDCgz0raMlMXhc7QX3q+I=;
 b=AneRqIsZLrJJ1FCSW2x+r7+t0rG8bKu906NZkWSkHhMp3324do7ln0uOfffdRE2v/T
 bmNhhIztpQZDAY5LdbAcOLVFvD+Br9oWeSuG/+CyfSIZUURl9MNMSpop8dOZQb7mlYXe
 h7HhKjwGTJtKdj/fdr2f8WjJ2VG4DtiVHFNFFN4pNCQVm16d4WKfGcSa4xhtbEBdFNJZ
 2znoXBfDz4Zd8CLE2/nG7sOPyIpkKPWMr/z1KPhhSh2NckGgEV7bhz4LxQKJCLXoFBm8
 9QsUFU1ZvEwlwDM1j19INDPSFolN3l88WT5cwd/vxRFDvRMYm58mUwXoe8i4U6o6UGEF
 TuqA==
X-Gm-Message-State: AC+VfDxE6LkNSOCAmKtHx/G8fJWt4Q7BHVIwMcQrkf0bNqJCHdRilKGo
 lupcYrnpgu6ENwlokVSjot1Z5g==
X-Google-Smtp-Source: ACHHUZ4j55R9nCON1VzY2fVDWClLCs2Dh7zzxfNJw96LC0UvGJShD48GsCDpx5ZEEytV/w4xPB9/bA==
X-Received: by 2002:a05:600c:3b2a:b0:3f1:73d3:5362 with SMTP id
 m42-20020a05600c3b2a00b003f173d35362mr4755619wms.13.1682610315818; 
 Thu, 27 Apr 2023 08:45:15 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a1cf209000000b003f321e61c1asm330892wmc.21.2023.04.27.08.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 08:45:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4F05A1FFBE;
 Thu, 27 Apr 2023 16:45:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [PULL 06/18] qemu-options: finesse the recommendations around
 -blockdev
Date: Thu, 27 Apr 2023 16:44:58 +0100
Message-Id: <20230427154510.1791273-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230427154510.1791273-1-alex.bennee@linaro.org>
References: <20230427154510.1791273-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Message-Id: <20230424092249.58552-7-alex.bennee@linaro.org>

diff --git a/qemu-options.hx b/qemu-options.hx
index 04c259157a..baa0589733 100644
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


