Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F888334284
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:09:28 +0100 (CET)
Received: from localhost ([::1]:38444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1Oo-0002w3-Pw
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:09:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK1Fv-0004RT-Hr
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:00:15 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:46875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK1Ft-0002aP-0j
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:00:15 -0500
Received: by mail-ed1-x52f.google.com with SMTP id w9so28708464edt.13
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5ig15pshghu+eCUM7ti/ab+kHioEFzPWJ0umuCSDYnY=;
 b=Ewjws9Ws//3lm2s+YKf46mfREUkOBpMJDTnP6xByhPiZhy19Ncd76rUMqyKT8Iu8I6
 9A7mgOiRVavYmH4XWvpSL4jtZ7jTNBLz/S2N/Zw7Y8K8Mh18ZRFSF0V5DzeANDfe/54l
 DHLruonnX20v0DfyCOuJk7DY5difRbkj61oZ2ZIRkkoiv9saQdIP1mzj3hPV2fuVY/HS
 mc0QjjWYQS+pF2oUA8H3+CV4QByxUggK5Tnm4/kMoWSEDSCeXFA6gxiYRbHaVl8PIhZB
 A9foUBG+fKes8CIYBc6MA7tEybaFHzRr8rKYw3NjdzleNMUIOXyxVhzKxSj5Pje9UZrx
 ONGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ig15pshghu+eCUM7ti/ab+kHioEFzPWJ0umuCSDYnY=;
 b=BQskTICYQNe2dUyujqIWAEOtm9oyNFsHx7l1Lf6HdPL0jNyGVat3PfyZ/btfMm8QLM
 eLtEKjQB590o2FfM1KZyHcMTaCx1wvxcRDTmgwn7xSHNoRChlf/8/gh9QH4nS0D7xbfD
 FL5bV1sL/U1kflc+WI9ll+aVIFkub2jwu0NT+dE+s3E7T539moKUDPhdppUaqwonwbfL
 PoV7rjHDTL3XqdhDwweA5Wndt4TFhYSSgKOjuQ+lVNvvtxidflYwluRdOP3d2qjisrkt
 H8yPE9FuOvvBgePvA1kN3LGizAg5mXltpdlsf9GwVjj+pcv5TRtbtEaOTVL1PHc9Q7uo
 RM+w==
X-Gm-Message-State: AOAM530VRp+K9jbSz0zuAEVHnjM4hSGwWkC6tDBHt6UlcAEh2S1lFf3O
 MQK0/v8HBqNQAtc2MDGhfE4aUg==
X-Google-Smtp-Source: ABdhPJz1KHl9zozqiAK5unQ53K1GqZL59/jiDzjxrGgBBvYaM04F80n+cbbONdRrmbx0gTLQWgdqXQ==
X-Received: by 2002:a05:6402:375:: with SMTP id
 s21mr4060013edw.287.1615392006698; 
 Wed, 10 Mar 2021 08:00:06 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r17sm9185229edx.1.2021.03.10.08.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 08:00:03 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A8FA61FF87;
 Wed, 10 Mar 2021 16:00:02 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 01/15] docs/system: add a gentle prompt for the complexity
 to come
Date: Wed, 10 Mar 2021 15:59:48 +0000
Message-Id: <20210310160002.11659-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310160002.11659-1-alex.bennee@linaro.org>
References: <20210310160002.11659-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We all know the QEMU command line can become a fiendishly complex
beast. Lets gently prepare our user for the horrors to come by
referencing where other example command lines can be found in the
manual.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210305092328.31792-3-alex.bennee@linaro.org>

diff --git a/docs/system/quickstart.rst b/docs/system/quickstart.rst
index 3a3acab5e7..681678c86e 100644
--- a/docs/system/quickstart.rst
+++ b/docs/system/quickstart.rst
@@ -11,3 +11,11 @@ Download and uncompress a PC hard disk image with Linux installed (e.g.
    |qemu_system| linux.img
 
 Linux should boot and give you a prompt.
+
+Users should be aware the above example elides a lot of the complexity
+of setting up a VM with x86_64 specific defaults and assumes the
+first non switch argument is a PC compatible disk image with a boot
+sector. For a non-x86 system where we emulate a broad range of machine
+types, the command lines are generally more explicit in defining the
+machine and boot behaviour. You will find more example command lines
+in the :ref:`system-targets-ref` section of the manual.
diff --git a/docs/system/targets.rst b/docs/system/targets.rst
index 75ed1087fd..9dcd95dd84 100644
--- a/docs/system/targets.rst
+++ b/docs/system/targets.rst
@@ -1,3 +1,5 @@
+.. _system-targets-ref:
+
 QEMU System Emulator Targets
 ============================
 
-- 
2.20.1


