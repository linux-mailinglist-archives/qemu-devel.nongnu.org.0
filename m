Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 417CE698488
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:28:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNPN-0006hi-47; Wed, 15 Feb 2023 14:25:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSNPK-0006gn-Ec
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:25:34 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSNPI-0001fr-TS
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:25:34 -0500
Received: by mail-wr1-x435.google.com with SMTP id co8so16494340wrb.1
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WM6/8uD1nkP3DANq3sh0KIkSDB5grWzaeai/tBVh8W4=;
 b=XtdIM31AIzDHxM6T4Bk5uNoEnuf8BT8L7dxz82gi0mNM9nMl70Rx5l3+d0JptqMqjp
 u/h1+pYF2SnLt7oZ1ZZzQwkObhn6jrWw3ShoFDbdtRt8PII9qqZClvvd2urXgXKZaDHU
 l1hd0kH7Pgrgl5usbjJH7js8iD1MY6MvgPvQLWp2106UyueINEz1nKGapkch9gnZ5hFv
 r0urC7nY2CoSCQZshwuM8UlZ28EtKlLq+Fa3C178WsIOqPTIHi6gBWwvFWaGsFo2TEsV
 lpYGn2HtH3rCz9kgAZZg/ZqVNqwyS3G73ql5L/77ldJAlts+T+bvuQElXPH3nYVqeiKV
 grWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WM6/8uD1nkP3DANq3sh0KIkSDB5grWzaeai/tBVh8W4=;
 b=weVxXybQgLNroINsQ4tcQUeTbwG8uUcUg1VTNmGU7Ze2ELSYXdR4SsOWY1TWdZQzuZ
 7J/tmiBKPBUcc9HiF+NrAcIJE5G++OVcMl8Og/Scb6RNq0q6eBtPT7MOl43VbjSGh5Hc
 76T5sEKATBP/knH7VcQzYg0G1yZfMtA48X+bxA4iMewL1JrTTiVl9UcYMe+T498yQM3C
 HeriMR3DZFASSL5l32a+fNTNA22z+BdAznE2U/lG0P+r3cPF34EWWE/pfnozby1ExskJ
 H7pMZgsV5+eio3ehXyIyy0O98x8oAymI5KXul5Z97bgoEOK68q+ChUseKY5UlA8r1K5v
 pNrA==
X-Gm-Message-State: AO0yUKWZceTfCAliNa3uCgqV/NW0e+liyHGO5OLoY9dt72hbQIOvtqs6
 u8D3F84Ln6jeVMaiFyaM38LJWQ==
X-Google-Smtp-Source: AK7set/xrk2LPUtkT+d3i3HPxHLER/HtJQ0g/qqTCSXnb1ziKSShxBWQhEMK7Jac1cDheElMJICG6Q==
X-Received: by 2002:adf:ef02:0:b0:2bf:b839:c48b with SMTP id
 e2-20020adfef02000000b002bfb839c48bmr2809119wro.51.1676489131485; 
 Wed, 15 Feb 2023 11:25:31 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 w11-20020adff9cb000000b002c54e9f6bc2sm11834697wrr.77.2023.02.15.11.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 11:25:31 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 80A191FFB8;
 Wed, 15 Feb 2023 19:25:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 01/12] gitlab: tweak and filter ninja output to reduce build
 noise
Date: Wed, 15 Feb 2023 19:25:19 +0000
Message-Id: <20230215192530.299263-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215192530.299263-1-alex.bennee@linaro.org>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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

A significant portion of our CI logs are just enumerating each
successfully built object file. The current widespread versions of
ninja don't have a quiet option so we use NINJA_STATUS to add a fixed
string to the ninja output which we then filter with grep. If there
are any errors in the output we get them from the compiler.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest-template.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index 73ecfabb8d..3af51846cd 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -21,7 +21,7 @@
       then
         ../meson/meson.py configure . -Dbackend_max_links="$LD_JOBS" ;
       fi || exit 1;
-    - make -j"$JOBS"
+    - env NINJA_STATUS="[ninja][%f/%t] " make -j"$JOBS" | grep -v "\[ninja\]\[.*[123456789]/"
     - if test -n "$MAKE_CHECK_ARGS";
       then
         make -j"$JOBS" $MAKE_CHECK_ARGS ;
-- 
2.39.1


