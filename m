Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FFF419C2A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:24:20 +0200 (CEST)
Received: from localhost ([::1]:39532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUuMV-0000D9-QQ
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu2l-0004Bw-9U
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:03:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu2h-0003hZ-5u
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:03:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632762230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xo8oTLyul7HaZanB9otUsIZ7T0Gdbb3D/S6pHKJH9f4=;
 b=DCkmYKISgE2/Vg0XWOHdFhDAE8Cu84qf9Nfp1jchqVSsDqTJmU7I+RwttY11FjDM55lSUm
 22JwIq/wWwkihHk/ys4iCSwpYTJQHvNl/RIVcFV+oJn/rKJZuyEqbEw1VikLEK7QVXPziG
 jkw2LL5jLUMVRHP6fz2xPTs2o6rc/vA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-Kn3pBbhQN9Ol3V3w00qivA-1; Mon, 27 Sep 2021 13:03:46 -0400
X-MC-Unique: Kn3pBbhQN9Ol3V3w00qivA-1
Received: by mail-wm1-f71.google.com with SMTP id
 j21-20020a05600c1c1500b0030ccce95837so184904wms.3
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 10:03:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xo8oTLyul7HaZanB9otUsIZ7T0Gdbb3D/S6pHKJH9f4=;
 b=77monM2MZVXNM4K9OSErCLztY+dlaV9YVvMDw5daY0MrZi5DzOaZCmfwT5Dr5CA3LQ
 1LMOl2pWbDa0k8ukQtoEZIDwMpZb6QcPpGcG8CzZ43DflcipoMTydvhHlNgL+FgzEcUX
 KwGLNS+eZFtkxXkvutd2tCM6kLkq4ju/xYuq2OcJDSjyqPfdND36oOb1w9T99oleZFAt
 i32HFGtti7viTo6BxNx0R7RY0ULgp0wTmwd8n8vioZ1/T2+YRQGLeZM8SOQFLIl0edIM
 U8sbqM2kc2RNJmfHgzA/VMdUlzgYzBHigxhuuWDEUPKb2LGkgphi2fRLeU0sHP4l7sY5
 ZbRA==
X-Gm-Message-State: AOAM532Z3WWAdLGrhj7zMZ1kzh8/p9uE9HEqm/utkq7+klAjRU4x2LqF
 5SF41E3APG+ElckJZVoHWnq3aKeyVLeV1RdAqLlyUSNI4eplMxCRppHEa2xpuRJxmrHOTTtBffU
 M3eM611a3iwhSDqUU9hwj7DiiwvUpHWyMTCtcAE2nxzwYOUXIT02SPA0Dznx0+j+h
X-Received: by 2002:adf:f48b:: with SMTP id l11mr1108576wro.254.1632762225193; 
 Mon, 27 Sep 2021 10:03:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxytqHFun0uAeOrgs4iDZ27u+U8zZkq0fHGRhElAHAxTWQyv0UI4+bPfE2NvXo0FJ72pbgMfQ==
X-Received: by 2002:adf:f48b:: with SMTP id l11mr1108555wro.254.1632762225026; 
 Mon, 27 Sep 2021 10:03:45 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id v10sm18013321wri.29.2021.09.27.10.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 10:03:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/21] Acceptance Tests: improve check-acceptance description
Date: Mon, 27 Sep 2021 19:02:23 +0200
Message-Id: <20210927170227.2014482-18-philmd@redhat.com>
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cleber Rosa <crosa@redhat.com>

The "check-acceptance" make rule won't necessarily run *all* available
tests, because it employs a filter based on the currently configured
targets.  This change in the description of the rule makes that
behavior extra clear.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210924185506.2542588-3-crosa@redhat.com>
---
 tests/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index e69c4fae53e..7426522bbed 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -16,7 +16,7 @@ ifneq ($(filter $(all-check-targets), check-softfloat),)
 	@echo " $(MAKE) check-tcg            Run TCG tests"
 	@echo " $(MAKE) check-softfloat      Run FPU emulation tests"
 endif
-	@echo " $(MAKE) check-acceptance     Run all acceptance (functional) tests"
+	@echo " $(MAKE) check-acceptance     Run acceptance (functional) tests for currently configured targets"
 	@echo
 	@echo " $(MAKE) check-report.tap     Generates an aggregated TAP test report"
 	@echo " $(MAKE) check-venv           Creates a Python venv for tests"
-- 
2.31.1


