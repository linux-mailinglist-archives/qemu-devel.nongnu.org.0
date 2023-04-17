Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E56796E4A35
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 15:44:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poP8z-0000yN-2y; Mon, 17 Apr 2023 09:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poP8p-0000wb-UQ
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 09:43:36 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poP8n-0006Rh-NH
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 09:43:35 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f09b4a1584so10389955e9.2
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 06:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681739012; x=1684331012;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OSKTGeVvxMRFHaTMOhie+UZrwE1FFDQH+ewlD3woTE0=;
 b=AVo8XnOhDxYTKD/J4AYoOcoEduuUCixW25KFn9VpVoHvxgIfp6GgCp5AXB+ZnSa9Q6
 MPraOhNaexi81nM/lxjVPtb6FaoPup+U8LSySkkuvK5L1TTK1Wj4rY/b9rcofvOGU1zV
 FzFDTRmCQSXAldXzOQ/9tMHyhs/9mEDc+1y5eXXG8VqYWCQ8NZdIlQb4iOpFN7xZjfpj
 Fq7U7Qb24BHYqvjL5JC9+0sQ6mN1TFt8iVmmYjQFfFj00/IQtdbGnfLejsRlSGx4kKGm
 QhEeq7Rqm+eIiSyztNT0Ts+0Wu8bkQwDqkexLHbZ1sPxqjogsUBesKGRW6HGC9kvcWhQ
 oNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681739012; x=1684331012;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OSKTGeVvxMRFHaTMOhie+UZrwE1FFDQH+ewlD3woTE0=;
 b=HEHkdW/PJlN3L7gyd9P+RLHFu9mPN7ujgxAvsiRO80z5h43bFVBbgd1HCNT9OJIude
 6DT9Cr2uAloyIVVCbBD8AWZGIqMrZVtXa6Co+wv25mO9n4nWNnTCT871bQTBagrNlokw
 yhctZ8BIZXSNMi5Vans3Eaikp2cMHQvhfZOuiqJDGIsBHFYlcFXMpye/J6Xv8i7Kgwdh
 iuQMd/tEg3++nTk8B8HJ1ZXHjdhwKQ6wrfxNrZO1FUpdijNycuRTwLYeVb8i/8TjT1fM
 OYmRO5QuBgWqbh3IKytEuxw8eROufXzuN40FrZdgIrZyisiLX7QXoIH/+IVAT1v1IRch
 ssUA==
X-Gm-Message-State: AAQBX9dLXx7vqk/JfSHUF9ao2oSm4lPran4rAkaS+UdlSZWGC40SnMbB
 zW2kIXjpkQxU+R9AO7cI1CD5hw==
X-Google-Smtp-Source: AKy350YYdotjt70nweynTsI2jU2Xi6fD9SW0bT3mWElkdEgOQSAlIkkkMzQvAV4RUsSgcFy4FlsY+A==
X-Received: by 2002:a5d:564a:0:b0:2cf:efc7:19ad with SMTP id
 j10-20020a5d564a000000b002cfefc719admr6087233wrw.53.1681739012267; 
 Mon, 17 Apr 2023 06:43:32 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a056000120b00b002e45f6ffe63sm10570412wrx.26.2023.04.17.06.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 06:43:28 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 719411FFBE;
 Mon, 17 Apr 2023 14:43:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH v4 6/6] qemu-options: finesse the recommendations around
 -blockdev
Date: Mon, 17 Apr 2023 14:43:21 +0100
Message-Id: <20230417134321.3627231-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417134321.3627231-1-alex.bennee@linaro.org>
References: <20230417134321.3627231-1-alex.bennee@linaro.org>
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


