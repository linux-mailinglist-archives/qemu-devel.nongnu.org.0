Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4FA4A6826
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:45:22 +0100 (CET)
Received: from localhost ([::1]:35622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF1to-0001QJ-0t
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:45:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExto-0002dq-2B
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:29:04 -0500
Received: from [2a00:1450:4864:20::42b] (port=41528
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExtl-0001fm-PS
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:29:02 -0500
Received: by mail-wr1-x42b.google.com with SMTP id h21so33726823wrb.8
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4MsdlOLB+RpwIhJNUfsqaPM7K+H2r3p9BJR5FdDlpB4=;
 b=GUg1zxBZurmDdlfNfFihWAnGxXJZnyx2DPdr+4OJhGbNW0WxTRlH8zf+vBGge55VUf
 5W5kkNzHrKfJfbPd69HYXV1qb65fK3SJNYcgWI1KyEQDXE4E79ec6Nkkc8l9WNmBXWln
 a63UcymMT6PWx01j9PnRBLMQ3h3NxIVunrFxWIATRXBv0UnKZEA1XE2V001F3xgzOVmH
 HtMd8AzYzMw3e6eX0kr/0VbrL5mUp+lv4aUbTgAypQNt/9a6g9tNEuhQwJ4fqFIcJsYp
 FxFKCWeCyvOwYchVGkrI9yywpiERvX5Y7DlCGiZwdv+COmH+6CVyM1Akvd8wlaTN2YWx
 kdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4MsdlOLB+RpwIhJNUfsqaPM7K+H2r3p9BJR5FdDlpB4=;
 b=3bd9z+UgZnVnGTdciWAFaCv/iVaqsrWeGmC1dzZRoDD9H9Y9io+1GvuSSwdWa/tWs+
 D650+RTVgSteuV3aR5lv/zeSOzN9HywhaTalZ7LxGVwIgZ31BMjA0DQDEw5ksvCo+AtK
 qjZ6kGDM3suppok2fWUW2qj0wVJ74Px3hIjG9Ia4T+IjSsl3ZIlGXWVygB1O5c+Q5knU
 L68jI0ocHPisghFW/Vu/q6jMYMk3gGC1mqndPa5WdDtpjchCuKo+cUlNSpXNOGMU11tU
 WyIiF0+ADtcAr/GvuaqwPYoa7G3VsF1P0gzeqguHZbrl95CCcwDOtztmkkelvNW8tQB1
 HeYA==
X-Gm-Message-State: AOAM532rHYlCmylJxFqm53ptvSBp0mRtFMlHXiAW6ed7dCfGeilk7Dy3
 K0scPM1cWMY1deVqPCNL9WSscA==
X-Google-Smtp-Source: ABdhPJyYoynhnghxg1SZj2Cgxqo3o4EdPpvMOKwAnUvbu+q4EkbZMM64Psk5aeoouAsms+uZ/iYc/Q==
X-Received: by 2002:a5d:5988:: with SMTP id n8mr341147wri.81.1643740140363;
 Tue, 01 Feb 2022 10:29:00 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m12sm18228854wrp.61.2022.02.01.10.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:28:59 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 11DAF1FFC6;
 Tue,  1 Feb 2022 18:20:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/25] tests/lcitool: Allow lcitool-refresh in out-of-tree
 builds, too
Date: Tue,  1 Feb 2022 18:20:39 +0000
Message-Id: <20220201182050.15087-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220201182050.15087-1-alex.bennee@linaro.org>
References: <20220201182050.15087-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, f4bug@amsat.org, mahmoudabdalghany@outlook.com,
 minyihh@uci.edu, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Luke.Craig@ll.mit.edu,
 pbonzini@redhat.com, kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

When running "make lcitool-refresh" in an out-of-tree build, it
currently fails with an error message from git like this:

 fatal: not a git repository (or any parent up to mount point /)
 Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).

Fix it by changing to the source directory first before updating
the submodule.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220201085554.85733-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/lcitool/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/lcitool/Makefile.include b/tests/lcitool/Makefile.include
index cff7c0b814..6b215adcd1 100644
--- a/tests/lcitool/Makefile.include
+++ b/tests/lcitool/Makefile.include
@@ -13,5 +13,5 @@ lcitool:
 lcitool-help: lcitool
 
 lcitool-refresh:
-	$(call quiet-command, git submodule update --init $(SRC_PATH)/tests/lcitool/libvirt-ci)
+	$(call quiet-command, cd $(SRC_PATH) && git submodule update --init tests/lcitool/libvirt-ci)
 	$(call quiet-command, $(LCITOOL_REFRESH))
-- 
2.30.2


