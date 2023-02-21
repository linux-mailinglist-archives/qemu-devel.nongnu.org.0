Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4EE69E377
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 16:32:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUUbR-0002Xh-Nk; Tue, 21 Feb 2023 10:30:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pUUb3-0002Fh-HC
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:30:26 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pUUb1-0000VV-Q9
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:30:25 -0500
Received: by mail-wr1-x436.google.com with SMTP id c5so5557283wrr.5
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 07:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aiZDv/uHG9+DVwOEhe9Bg3WCBpayODt65mdWP066kYE=;
 b=cuEMeR9F3+9YK86vTDiVLFbbusubYluR6WIfTMPF71M3ktrGay7pYR+LZ7fYjOArgg
 6YKScw/dtsYF9CsOyx3r0JEw+IKcQBVaWM6M8zWFG3bUGKWm3yyEqUqCMG/hBYt1Neue
 VZGY9KRjJPN2axP8mW+xvpCstOYGio3+1CyNmc6PmdZMSEKDf3E4p7yA48c0kYZskD40
 Cp9iXcTyRP9efOoMeibEv3RbAVz+36vGLrfe836239Nm/Ij269pqH+wGBWhiLLML7Mz9
 /eKu7llvqtRxxcxHLBsWI3mgBz2pJROfet/IdcbGUkENO6LQdM72SIIEXa497SOg4eXT
 17Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aiZDv/uHG9+DVwOEhe9Bg3WCBpayODt65mdWP066kYE=;
 b=kGiJMSD1S9RLz42QqL1VmyvB0feKcNB4n7sHRh9zvSEDm/z6q4C+6/aClufpxfYZh8
 yHoKebLWUxccPAUzuexQlWErAIbw0DRQXPm5ez6FDF1mwrQi1fpl3DxxmJb4tDOayUyo
 RJkA9S6fMY9Xb5O9azi2uIqhd6GLPot0LYHAU3bKFoQB1PuM0z8VIYC9VXsxiEjAFoyh
 1+Ym+Jy3CtTeV2I8ByUCbSOzQ3NJaqGYaeyE/KYnNsX2dQet3m1ULdVHVL6zYNtdiQjn
 ZGmLbIaeF6Q/6EQGf4IHt+mdKpsDMP8dLibFtDaE8qq5D3pcd1N/7U3q/ZS8QSOEMnEx
 8RZw==
X-Gm-Message-State: AO0yUKUDWJBIMd4+xzHPDuJRta3EL/tAKlPP7cQ8PvpgwFOdqpyRzg5k
 zoLj/Wo2OGhvQrT5dgUSiOGdVbDHnbLQ6YiVRc4=
X-Google-Smtp-Source: AK7set/nwMhAidXXErLmDU4RuryFA1MLP6cmG5TqIQDOwCZ0fV7qxuhrQB1bijakPDNH1n+k4ZX1mQ==
X-Received: by 2002:adf:fb06:0:b0:2c5:4c1f:3c9 with SMTP id
 c6-20020adffb06000000b002c54c1f03c9mr4181014wrr.49.1676993421903; 
 Tue, 21 Feb 2023 07:30:21 -0800 (PST)
Received: from volterra.localdomain ([2a01:e0a:5cc:caa0:c49d:d14a:e6ed:555a])
 by smtp.gmail.com with ESMTPSA id
 r1-20020adfdc81000000b002c5503a8d21sm2803417wrj.70.2023.02.21.07.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 07:30:21 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org, philmd@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 0/4] Adds support for running QEMU natively on windows-arm64
Date: Tue, 21 Feb 2023 16:30:02 +0100
Message-Id: <20230221153006.20300-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wr1-x436.google.com
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

Since v3:
- Remove CONFIG_MINGW64_HAS_SETJMP_LONGJMP (only check in meson)
- Fix comment to refer to windows-x64 vs windows-arm64

Since v2:

- Delete superfluous comment on unreachable code
- Fix style for multiline comments

Since v1:

- Comment why we use generic version of flush_idcache_range
- Ensure __mingw_setjmp/longjmp are available using meson
- Fix a warning by calling g_assert_not_reached() instead of initializing a
  variable

As before this was tested with:
- make check
- boot an x64 debian bullseye vm
- boot an arm64 ubuntu 22.10 vm

Thanks

Pierrick Bouvier (4):
  util/cacheflush: fix cache on windows-arm64
  sysemu/os-win32: fix setjmp/longjmp on windows-arm64
  qga/vss-win32: fix warning for clang++-15
  target/ppc: fix warning with clang-15

 include/sysemu/os-win32.h | 28 ++++++++++++++++++++++++----
 meson.build               | 21 +++++++++++++++++++++
 qga/vss-win32/install.cpp |  2 +-
 target/ppc/dfp_helper.c   |  4 ++--
 util/cacheflush.c         | 14 +++++++++++---
 5 files changed, 59 insertions(+), 10 deletions(-)

--
2.30.2


