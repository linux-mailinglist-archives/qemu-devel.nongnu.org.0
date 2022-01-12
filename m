Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E65848C364
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 12:42:35 +0100 (CET)
Received: from localhost ([::1]:34338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7c1S-0006Bd-DO
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 06:42:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bmu-0002cF-IQ
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:32 -0500
Received: from [2607:f8b0:4864:20::a2e] (port=44558
 helo=mail-vk1-xa2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bmr-0003NY-Hp
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:32 -0500
Received: by mail-vk1-xa2e.google.com with SMTP id b77so1401197vka.11
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WTh92i1BO2OOVgeffrU3D/gzl+s5Mo3VxHnxRRugIRI=;
 b=z53P9IVmNRCIItSshsmMek7X2nPKNDd9p/CWwAf0XXZndPe1sg5BCm8gnjjhEHE4wf
 cIO6Q2haZ2Qpxvvly8DICFmajeR+XvVamLdDtXnRwE6MEdm5094aTNYm43To7XBwsfcF
 GTu7/eoASlJ2ilCvitoxFUOukxJdyBZEdSpPxmxPAbNzC+bhpeysmcO+0eyjMet3ivVp
 tPnJ789paCdQcDDG2NivErCK65lX1HETAfxB0U3SaE8umjmH8Tdbc9iFS9wRK1OeQA8H
 3KQyd9R6F8clJ4fKYhE5R6gbaLHKn84xWj7vFuxyLCyNmH8r+4Bh8fKb9CS+35Qk8V2o
 UwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WTh92i1BO2OOVgeffrU3D/gzl+s5Mo3VxHnxRRugIRI=;
 b=3Ta6JZNsJ8Ui+Qwb4pEuzo/auhTUMZokk3JhSSe9zUI4aL1wlzCJEIxKb45xy/HDPh
 RDQ2qJVnQHiIdwVUX9E9HRnmiVU7IIBZO2+M7FTaBMdPlxn0kW9A+u0B7pbh8MQBDmol
 64Qy7TI8G4b1FBAo0SYaMHoa/BCSDnu3AxxmCsUXGnKRAb60jr3AfwU9CzKvS7DoKjmi
 8hahfkHBoUaNHaWjOUCYDT7yakGSDYKYXa/PWdrCT8IcJjkdDrb7v7L/lsD7afVY/UJd
 yvw1D4SJGk6JB1oEL+qVVzupuBFLQ8yzV9leNG48Ig4IqaHEpNxZSjODSYg5ro0zIhPM
 h14w==
X-Gm-Message-State: AOAM5331k8g1kOK+JHsoM3wbtDHcDN91v5C0rSTv73MgXPgdZpMzhDA8
 aHGDlFgB+lLQhY7zcUx9weOwCC5vjojtKw==
X-Google-Smtp-Source: ABdhPJyDkDhwKQOyfGdhwT9tAkq/QB3eFHok1kr+NeULNAwVX7/CwGvoRD81Q7xE0zLwIQuW5oWW/Q==
X-Received: by 2002:a05:6122:8c6:: with SMTP id 6mr4361338vkg.5.1641986848511; 
 Wed, 12 Jan 2022 03:27:28 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a29sm3557300vsl.25.2022.01.12.03.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:27:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8FF7C1FFBB;
 Wed, 12 Jan 2022 11:27:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 03/31] meson: require liburing >= 0.3
Date: Wed, 12 Jan 2022 11:26:54 +0000
Message-Id: <20220112112722.3641051-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220112112722.3641051-1-alex.bennee@linaro.org>
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=alex.bennee@linaro.org; helo=mail-vk1-xa2e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

openSUSE Leap 15.2 ships with liburing == 0.2 against which QEMU fails
to build.

../util/fdmon-io_uring.c: In function ‘fdmon_io_uring_need_wait’:
../util/fdmon-io_uring.c:305:9: error: implicit declaration of function ‘io_uring_sq_ready’; did you mean ‘io_uring_cq_ready’? [-Werror=implicit-function-declaration]
     if (io_uring_sq_ready(&ctx->fdmon_io_uring)) {
         ^~~~~~~~~~~~~~~~~
         io_uring_cq_ready

This method was introduced in liburing 0.3, so set that as a minimum
requirement.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211215141949.3512719-4-berrange@redhat.com>
Message-Id: <20220105135009.1584676-4-alex.bennee@linaro.org>

diff --git a/meson.build b/meson.build
index c1b1db1e28..076d85baba 100644
--- a/meson.build
+++ b/meson.build
@@ -440,7 +440,8 @@ if not get_option('linux_aio').auto() or have_block
 endif
 linux_io_uring = not_found
 if not get_option('linux_io_uring').auto() or have_block
-  linux_io_uring = dependency('liburing', required: get_option('linux_io_uring'),
+  linux_io_uring = dependency('liburing', version: '>=0.3',
+                              required: get_option('linux_io_uring'),
                               method: 'pkg-config', kwargs: static_kwargs)
 endif
 libxml2 = not_found
-- 
2.30.2


