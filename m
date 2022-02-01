Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9364A67F6
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:26:45 +0100 (CET)
Received: from localhost ([::1]:58996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF1bo-0002of-5E
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:26:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExmY-00086a-VN
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:21:35 -0500
Received: from [2a00:1450:4864:20::636] (port=40679
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExly-0000bw-4K
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:21:31 -0500
Received: by mail-ej1-x636.google.com with SMTP id p15so56751707ejc.7
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ynFU7GIrDRiFDHdJik7DGdtoBE+darFWUPkAFAGxRwg=;
 b=NrA9NxxT5KKMEg8zjYbMs+ttSUxuDpRHg0ZHm2bI1Z/6VGlA3plaVNAFIE68256ISt
 XeiqL+b42ErI4FIkkiC2ubxQcaSEB+E01FHxEy9iIUjcoNeyH7apdbEcnYBMOUlUSjWq
 /TdSdzpJOjuVZuOlPyhSrkGK9dZBH4qLX4QV979IX7HW+vwtAexldsDA1cJSif6MoW/N
 R1G5XP+TZDO5Ya8yD4wKMAXKzYwZv8jB1oAwPcPdrrOdoxROTuoUVgDqCalt/LNTLeNS
 y22x/itJ6au3ObxmpDVIGT2YABD2YYrQz2khB7efAWKbg6MSGVcBg6/9AE+jCme3aiT7
 bnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ynFU7GIrDRiFDHdJik7DGdtoBE+darFWUPkAFAGxRwg=;
 b=tca+5QRC8Pxwg0FnA/b2mzuqDcnzOcA0uweCuItj4e29/eRckRMZmdDeJh5HQqo2Pg
 DgOXS+K2m1IamgRKRILNF5KoSifIlqfYTvgmy3OlLiAGomt9KPtxBIHpl4hMW4X/mMXX
 IDJr7q4uIDJmXKeeNGSdTb9hfMwkCFaR1lYUAuZWcaPbGeetBvF/JVz/79t9HKJ8ELnH
 UUwO5V3r2m+D+iaANcqR6klpw7feEU1sh7sL0ZIwCemUmczZkEdrwK5dbp2BkMa2n5ny
 gkDlPVrIPHy35Kwz0HzuzaJP27s8lyYYW4UxQNdCB5Dy5cT0Wu0tbrq5DzBxcRmJxjOZ
 HZPg==
X-Gm-Message-State: AOAM533nWLpaDDXjGqRHAWJOkRK3/kA86ptH6+onBwh8YA2CL5eCMf6H
 xp6SAlPWcprWp93GbMN0XVTvJA==
X-Google-Smtp-Source: ABdhPJyzolfoyNk3wzbSdjDv1DRVN/aOwnNaaOYukV7h/Ov060GjV2ckhVPKPZXbN6L09IF/cS1Nrw==
X-Received: by 2002:a17:907:6e09:: with SMTP id
 sd9mr18678678ejc.259.1643739652602; 
 Tue, 01 Feb 2022 10:20:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id ch27sm15681434edb.74.2022.02.01.10.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:20:51 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C1F0C1FFB8;
 Tue,  1 Feb 2022 18:20:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 01/25] tests/Makefile.include: clean-up old code
Date: Tue,  1 Feb 2022 18:20:26 +0000
Message-Id: <20220201182050.15087-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220201182050.15087-1-alex.bennee@linaro.org>
References: <20220201182050.15087-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 aaron@os.amperecomputing.com, robhenry@microsoft.com, f4bug@amsat.org,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Luke.Craig@ll.mit.edu, pbonzini@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is no longer needed since 5516623020 ("meson: convert migration
directory to Meson")

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220124201608.604599-2-alex.bennee@linaro.org>
---
 tests/Makefile.include | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 9157a57b1a..646c8b1334 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -34,10 +34,6 @@ endif
 ifneq ($(wildcard config-host.mak),)
 export SRC_PATH
 
-# Get the list of all supported sysemu targets
-SYSEMU_TARGET_LIST := $(subst -softmmu.mak,,$(notdir \
-   $(wildcard $(SRC_PATH)/configs/*-softmmu.mak)))
-
 SPEED = quick
 
 # Build up our target list from the filtered list of ninja targets
-- 
2.30.2


