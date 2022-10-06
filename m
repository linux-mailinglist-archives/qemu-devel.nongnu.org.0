Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 704A35F6BB4
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 18:26:35 +0200 (CEST)
Received: from localhost ([::1]:54718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogThh-0001UQ-Gs
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 12:26:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSfp-0004aq-EH
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:20:38 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:44890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSfl-00060D-OY
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:20:32 -0400
Received: by mail-pl1-x629.google.com with SMTP id x6so1975325pll.11
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dC57FSaNPYR/x92KSGPBjowij7AJPPetJ5174vwrMiQ=;
 b=qjc6P7Pn7dExSieq+WdpEoZzCWX9ODdYC4yaA5tQ4CLJQEMxIQniFxveJayg5ekwJW
 33HQ/wA2uCB9chP946vuRtfT7MlXZMWkiwtH/VcI41b7/Fo1JQGjMbze3kET416twcfm
 7uFxh9BmPggzv7XxIW3ySW8qe+tvKdGvYbDo7KrNs2QcqJpWmBnARaG4wZ56jVuhl/3C
 pncseEUBwZTUetOEUtVDlUjndlZEFso9ki2AjuBURqNityKsSl7eUdeevE7Gjx8KzjP7
 8agGp1qMVZqc09zrIYaU4HWXGPnyqs4TLHRaK+c7vIQ5tppROK1XhIvQpraCkU9f+DW6
 Eg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dC57FSaNPYR/x92KSGPBjowij7AJPPetJ5174vwrMiQ=;
 b=x/YPcGLgxeIFkm5rZBM8hd8Z+PhqpOYta+QIqFIa1e9lA7Jc6RLKdi/XmPlNYecCjj
 /UWPgq1KievX1Cnh7CBpVS2IRjAsUIERfFsmM7Qv6gLGxm4znfhCBTH30e+aKcOsEyTZ
 WuVfNxbMXPHOLzAV3ubFmC3rLyI067SOzrCbB9h/xXr2C12Fop/UHofFZ9deQCRiznuj
 lLyuDV/NUxr2LRezFYGIsz4JJmQRIpQtfNuV5aE/cZN2ANxsUYdVJGQ6QfeSgeiyHBRg
 2vJeyQvaslUdRmAb570WMMVLwr3ep+4a+RwxtLLt+0Pd6NbJ9+pn8tBxJbYzYC0rtbgX
 gcYg==
X-Gm-Message-State: ACrzQf1CsDYEa252MIHnJSVUgUSKJNi8aebURJQ4wu/z7THtw9iNlM2q
 s/FJIcFkrYP8cimQwUhf0jemVO1wrTs=
X-Google-Smtp-Source: AMsMyM4mkX3ZELJpdATdJ+upIvFSj9m9Xz+VGJD19a3WkT6J3v/Y+ahvDkV3z8Xf2daCh/NwGTk1ew==
X-Received: by 2002:a17:903:4d4:b0:17f:7ecc:88e3 with SMTP id
 jm20-20020a17090304d400b0017f7ecc88e3mr350513plb.169.1665069623547; 
 Thu, 06 Oct 2022 08:20:23 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a170902780d00b0017c37a5a2fdsm11426759pll.216.2022.10.06.08.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:20:23 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v5 18/18] tests/qtest: Enable qtest build on Windows
Date: Thu,  6 Oct 2022 23:19:27 +0800
Message-Id: <20221006151927.2079583-19-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151927.2079583-1-bmeng.cn@gmail.com>
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

Now that we have fixed various test case issues as seen when running
on Windows, let's enable the qtest build on Windows.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---

(no changes since v3)

Changes in v3:
- Drop the host test

Changes in v2:
- new patch: "tests/qtest: Enable qtest build on Windows"

 tests/qtest/meson.build | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 455f1bbb7e..8701c3a8e7 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -1,9 +1,3 @@
-# All QTests for now are POSIX-only, but the dependencies are
-# really in libqtest, not in the testcases themselves.
-if not config_host.has_key('CONFIG_POSIX')
-  subdir_done()
-endif
-
 slow_qtests = {
   'ahci-test' : 60,
   'bios-tables-test' : 120,
-- 
2.34.1


