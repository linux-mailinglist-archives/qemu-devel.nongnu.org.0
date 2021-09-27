Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9449419AE2
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:12:51 +0200 (CEST)
Received: from localhost ([::1]:43212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUuBO-0008ME-Np
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu2S-0003jW-VW
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:03:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu2R-0003Tu-JQ
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:03:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632762215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VcZeajeug5FjjL0Vw6aTUbYAKJ2OWK+8xl7oF2aw2Yg=;
 b=OY6KtAYyrOYFNa7dmQ0uTTJ2jZVjtF1uAiF7cSJ/S5TyEdMuarJTmVBHqnqOF6k6NPo7Mc
 W5WM8ACrqzis1yOcb/o/GIjbDONP1uKl6Y6TJyh5367o8F725M/OkqCO819LOmZIs9pujF
 zH5KarBIYHewioxtvC/z78T3eEI3TFc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-dyyoAZMsOUeeF9MndTa1KA-1; Mon, 27 Sep 2021 13:03:33 -0400
X-MC-Unique: dyyoAZMsOUeeF9MndTa1KA-1
Received: by mail-wm1-f72.google.com with SMTP id
 b139-20020a1c8091000000b002fb33c467c8so508058wmd.5
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 10:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VcZeajeug5FjjL0Vw6aTUbYAKJ2OWK+8xl7oF2aw2Yg=;
 b=uiJvUbTrTgys+Ke86jW7Y3ipgwuAKvMOYUTMNw31PPQ2/mC2IJITty+W9PX08VRfGE
 OQiTr54I3qJB+hqXIDZ40/mt5FvJE+swucUrRuUD9r/HbR4NDJbNBf+91zv1cG48lcyY
 b1kegX8foAnz5xqjotVWuQwY9JyhHy2eNZY0XwTaxJEyk3OdDFA7pcAYgcPR6wEyzh4S
 Ke7jrohrId11I9W7+Lwkbqd8JY0RM6im+oowgSHwYw+QeIVSGMmBGFW8V2kR9ItYcAMD
 E1YdcTbN1Kt4fDIEAtAMOhCLViG7CKKTblQGqiqLztAtpgkx/osEZg2ijTUKeBExZQ8u
 tb1w==
X-Gm-Message-State: AOAM532q5TQayxcvcQ5SMuA0pohlkD6ot8rnojJwAkqyD+8OdH51U32+
 ozdH+tG6/OFPtk/eylSCFtaPrfW8aIuRxdgM5xqQT6ER1I1dNUbS+Dfd5E/kdnGJdtGLM0KAMH4
 g49HLZ6TFlwbB4LXM6Vr3/MuSyUUbXz+S8pVOuYuweRaqRCCckJjip2xHSSFPgC2r
X-Received: by 2002:a5d:43ca:: with SMTP id v10mr1073680wrr.139.1632762212126; 
 Mon, 27 Sep 2021 10:03:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0rm/vrSaFMIpx0IL74+ni1jvPIBw7S8oZns+HLKILW4h1j6iMoqkqGTGKgBiSZ7K80DyXpQ==
X-Received: by 2002:a5d:43ca:: with SMTP id v10mr1073658wrr.139.1632762211937; 
 Mon, 27 Sep 2021 10:03:31 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id i1sm18026488wrb.93.2021.09.27.10.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 10:03:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/21] docs/devel/testing: add instruction to run a single
 acceptance test
Date: Mon, 27 Sep 2021 19:02:20 +0200
Message-Id: <20210927170227.2014482-15-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927170227.2014482-1-philmd@redhat.com>
References: <20210927170227.2014482-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Willian Rampazzo <willianr@redhat.com>

Add instructions to the Acceptance tests section about running a
single test file or a test within the test file.

Signed-off-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210923161141.232208-3-willianr@redhat.com>
---
 docs/devel/testing.rst | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index d1841e35d57..c9f6b97f876 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -754,6 +754,34 @@ may be invoked by running:
 
   tests/venv/bin/avocado run $OPTION1 $OPTION2 tests/acceptance/
 
+Note that if ``make check-acceptance`` was not executed before, it is
+possible to create the Python virtual environment with the dependencies
+needed running:
+
+ .. code::
+
+  make check-venv
+
+It is also possible to run tests from a single file or a single test within
+a test file. To run tests from a single file within the build tree, use:
+
+ .. code::
+
+  tests/venv/bin/avocado run tests/acceptance/$TESTFILE
+
+To run a single test within a test file, use:
+
+ .. code::
+
+  tests/venv/bin/avocado run tests/acceptance/$TESTFILE:$TESTCLASS.$TESTNAME
+
+Valid test names are visible in the output from any previous execution
+of Avocado or ``make check-acceptance``, and can also be queried using:
+
+ .. code::
+
+  tests/venv/bin/avocado list tests/acceptance
+
 Manual Installation
 -------------------
 
-- 
2.31.1


