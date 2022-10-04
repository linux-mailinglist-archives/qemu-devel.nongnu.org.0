Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA805F4404
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:15:53 +0200 (CEST)
Received: from localhost ([::1]:56664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofhm4-0005cM-KP
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYT-0008Fb-53
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:52 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:40578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYR-0007NX-Dg
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:48 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 v130-20020a1cac88000000b003bcde03bd44so141628wme.5
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=FBc/8Ox3i5EVjlFI1Uc1wT9J7ZnnN13VLBOmlnz0Obs=;
 b=SJa9f0KxxiICQq9ZN0U7hXFoXxLC6AKxIXVeY2Yob7vHBwyk4mEWoGZE+aQEaQYdS1
 91TNuxZReCpJKjg50ilhfb2bUT1bGitDYwNXJvbJfrz0GW8rgEXQ6yySF28zxSlCygtp
 obTGkpb4C6pzoxPYEn+VjSzsmnAxcGx7GcSl1QAhhNPSLbPNmBJMyN+Ugvu0JVdJOneR
 KIydvwo9UN+Ehct3MprNx8ueQV1iSbd0ehnGNchvKTPc6+MaCRAZpYEttXaSloda+egL
 3gmt8h56B8QbfzduUeWHk3R12/aFqEI7mqNfK3/a3ZEuOa5LhzjiDFOzlofAbDb4ojr3
 bEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FBc/8Ox3i5EVjlFI1Uc1wT9J7ZnnN13VLBOmlnz0Obs=;
 b=GHboJ4m/4omBasxvoNaXySAlrP8j5IOl0pdsVRgTDc2ipI3BkbJVBZSfOz/ERYpAnn
 OGrx8DfpNnTkd7L7uYnPmS3w/jkaCHRhv6CfbH+P55lMQQv00YL/dDP0sz0m3ikg0c+G
 3Kbr6C+ze09K3rxdXfeEoxsArzeyD6Hl27IoDve8sUoLcuR1aD10uiPPpa7tYibBqiZj
 86/1YJlkBSxmITjUmO7tz32vru9zNPCiqIWHVLe4iwM1OMgNb68A+VLc9cGMk6qHZJ0T
 t3mwXbxtpIo9kSTc40x94qF+0VCOGlSk1TgHr7HAYFmoYHxl80lRdG0D8VolEu1lL5mc
 fnxA==
X-Gm-Message-State: ACrzQf0G9u4kOwV/zrREga0/XgOiruwYXDeryelmH0l9sYatDG38kC7g
 aiAADYqNLsO3sRYPi6B3P/ptfw==
X-Google-Smtp-Source: AMsMyM4D/CdbltrkTQdHyqbsyZTla35QfFrqNBi6PV2972ca4m6mwsqBDfzY1oVZInJ9Gh9EqwJhrA==
X-Received: by 2002:a05:600c:4256:b0:3b4:7cfc:a626 with SMTP id
 r22-20020a05600c425600b003b47cfca626mr10352372wmm.187.1664888503718; 
 Tue, 04 Oct 2022 06:01:43 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c154b00b003a3442f1229sm20867356wmg.29.2022.10.04.06.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:01:41 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E53491FFBE;
 Tue,  4 Oct 2022 14:01:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Anton Johansson <anjo@rev.ng>,
 Alessandro Di Federico <ale@rev.ng>, Paolo Montesel <babush@rev.ng>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 06/54] target/hexagon: add flex/bison/glib2 to qemu.yml
Date: Tue,  4 Oct 2022 14:00:50 +0100
Message-Id: <20221004130138.2299307-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anton Johansson <anjo@rev.ng>

Note, the glib2-native mapping exists separately from the normal glib2
mapping. The latter uses a `foreign` cross-policy-default, and
libvirt-ci is not able to support package mappings for multiple
cross-compilation policies.

This will probably change in the future.

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Paolo Montesel <babush@rev.ng>
Signed-off-by: Anton Johansson <anjo@rev.ng>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220804115548.13024-9-anjo@rev.ng>
Message-Id: <20220929114231.583801-7-alex.bennee@linaro.org>

diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
index d9f826f8eb..0d92819249 100644
--- a/tests/lcitool/projects/qemu.yml
+++ b/tests/lcitool/projects/qemu.yml
@@ -3,6 +3,7 @@ packages:
  - alsa
  - bash
  - bc
+ - bison
  - brlapi
  - bzip2
  - bzip2-libs
@@ -19,6 +20,7 @@ packages:
  - diffutils
  - dtrace
  - findutils
+ - flex
  - fuse3
  - g++
  - gcc
@@ -26,6 +28,7 @@ packages:
  - gettext
  - genisoimage
  - glib2
+ - glib2-native
  - glib2-static
  - glusterfs
  - gnutls
-- 
2.34.1


