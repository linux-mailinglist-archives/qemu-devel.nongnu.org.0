Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F916EC8C9
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:25:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsQ5-0007Xr-27; Mon, 24 Apr 2023 05:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsPb-0007Ei-Gh
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:23:07 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsPP-0004mU-OO
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:23:07 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f19afc4fbfso19027795e9.2
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 02:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682328174; x=1684920174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lZgm+vGcTA1V9BHjB7oPcAA/f7caN4cqjQx2QPPAA1g=;
 b=nsNVKmcQvjG9yzQn35Z8ya1Aiv0aVEam3dE+syo8uSwP0o6H7d+2jyvTGdGIm+7nZI
 7e1hi3Fa+f+YRbZ1oevdZiiE5O4wMolQbAPNUm+Sr1uEGaB+OlCSC3IuzGptaw2sh6eS
 n2GOe3ajQb7oNODrLZPyF+omRIVNq9XQ8eUx56nHw8lArSj1fdtgcjhhUFZlwr7tFrCA
 nW0OFJokZTiJ2eCOcTnHpyL425a1KvPpfvkF7+2N7tE/OQ9g35DFbfD5xwbVvH4IHexm
 2sMpQOnEdVdDB1x8oFwpsemTbRVjER5575TT+sPvlMujP00fa9oByChTdS40DJe3wGt9
 vJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682328174; x=1684920174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lZgm+vGcTA1V9BHjB7oPcAA/f7caN4cqjQx2QPPAA1g=;
 b=PmLQYGT3jPLqrzIvmlkDzf9U4PjDPwLwzmhRsKnLYYebEpOROTZ8BXDjfj+pS+9DqV
 OZWyw13BXRPIpwBZuyiy8Y1WNj6BYdlT02ip58kFH0tFRfD5QTNjwG4MKyRFrbRRMNCQ
 kj5RuFJsvysQqd359Qy1bMPLyhqQV+KcVhtTCa8SrlwQWLDccQaLjCC3wo8FGA7M9T2K
 L/z378MAnsjsL96+U4SCVCYBdAmcNr5TAw2vHJA/XqO4+pCe+6HKcshoQIb8z4LMcms5
 Oye7ZKZ31ZYhikEqBAfdqU2p2ckJHx+P0spyf1h+jg6mFnNtovdLLbpsZqxQpugvwW2d
 oSww==
X-Gm-Message-State: AAQBX9fiZEYUB8V1w7u0dW4BbKQAf1pVuBmpiDzJcome1MClkiFoDy1I
 f9emkt3GgzX3DfwuslREVpgLzA==
X-Google-Smtp-Source: AKy350ZZWddZbsDTvYPBW8teJMFZLTjijRgt2OOuNIRgGkAh0w51nWLzRqyVhShnGnk/zAloCcCaOg==
X-Received: by 2002:a7b:cc98:0:b0:3f1:6ebe:d598 with SMTP id
 p24-20020a7bcc98000000b003f16ebed598mr7049943wma.7.1682328174013; 
 Mon, 24 Apr 2023 02:22:54 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a1c7902000000b003f193d7c6b7sm8205288wme.41.2023.04.24.02.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 02:22:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2550C1FFBE;
 Mon, 24 Apr 2023 10:22:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Markus Armbruster <armbru@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 06/18] qemu-options: finesse the recommendations around
 -blockdev
Date: Mon, 24 Apr 2023 10:22:37 +0100
Message-Id: <20230424092249.58552-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424092249.58552-1-alex.bennee@linaro.org>
References: <20230424092249.58552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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


