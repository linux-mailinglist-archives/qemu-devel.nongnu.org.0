Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A32D9625DA2
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 15:58:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otVRa-000745-Hn; Fri, 11 Nov 2022 09:55:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otVRO-000708-Ls
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:55:35 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otVRN-0007wS-3N
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:55:34 -0500
Received: by mail-wr1-x433.google.com with SMTP id w14so6773367wru.8
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 06:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XsIUPL4URppAX7w6NGrUdBT/BUmCRhwxzbv6AwfzKCA=;
 b=HtrhliDQn7ww5CSLs9qkjc3/H9NCaHO6AI326r3eZ27wZVABgVxI2mwwi77VAmRWaS
 Ygtb2k/snzSDMeYrPzRSEk4+9pEjIe61a4XzMWmmI8JI0BInwgbH1nMDf0AnfIRWMfFp
 /fGRvFR2lbrPzwG7E4faFgHoojXljvMymXHFBRTR9QoxlbSJuuIuw8rvd0jwT6X3Nhtu
 aO5OoX69iL9nbzkLdwHqpCscjMloH4GXW+lhpYXkQK/nkGtiEZxWHm26bfFaJMxoC6dO
 c4kjHlKpBgdFq1FZKmIvW2N8PH4kxS/YF0lLUtWMx3VmLlBZC/nYZeklhLDct6c/bDOr
 lyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XsIUPL4URppAX7w6NGrUdBT/BUmCRhwxzbv6AwfzKCA=;
 b=j91vbJokMZnpSXfvMOcRYtMcs0/8yZWVPItoXwx0HT23OhqgfmfI0YqhFvdbFxyGKU
 OmJ+sJFYhcfjApspzlIlEGJjiKm/KhdqsT4vnt+HyB1ZIWgGBkxRjxuJ4mkQsZk3w0Yf
 8sok/cWt2ifh8jX9koVYJfFEgIn1A2NebL7ktXCOaFFuKrcB0/VQDmfR5q9atGqza2Ka
 LB/D7euUD/eIVN6EFYF7GePEsJbpa26iuIEtOLsRDpDpH9ZEzcTU064e+3506+xopu14
 kbcXh9JoZZQOeYmJWY3evtv/iA9GGcKS1HBvPKFTHX9wcn/0OOL2BK9VekSorf5YRC1p
 +L1w==
X-Gm-Message-State: ANoB5pk/NQ/GfxmzFdXNY11oTWpNQq+6+xiPFpMdhls/seYPnPH58msg
 NDLtqKsZDJQ+gh8s0hzTirGXOw==
X-Google-Smtp-Source: AA0mqf6an5BShu2rU1uFIofrQtXMOHs5jKhK41eOfk0lNzpwuhE9Q7JEE/qg3ASMawRt3MPiq1ztbg==
X-Received: by 2002:adf:f211:0:b0:23a:43b7:cdd5 with SMTP id
 p17-20020adff211000000b0023a43b7cdd5mr1445319wro.387.1668178531149; 
 Fri, 11 Nov 2022 06:55:31 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a05600c46cc00b003b4ac05a8a4sm11740229wmo.27.2022.11.11.06.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 06:55:30 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 16F6E1FFB8;
 Fri, 11 Nov 2022 14:55:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 01/12] Run docker probe only if docker or podman are
 available
Date: Fri, 11 Nov 2022 14:55:18 +0000
Message-Id: <20221111145529.4020801-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111145529.4020801-1-alex.bennee@linaro.org>
References: <20221111145529.4020801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

From: Stefan Weil <sw@weilnetz.de>

The docker probe uses "sudo -n" which can cause an e-mail with a security warning
each time when configure is run. Therefore run docker probe only if either docker
or podman are available.

That avoids the problematic "sudo -n" on build environments which have neither
docker nor podman installed.

Fixes: c4575b59155e2e00 ("configure: store container engine in config-host.mak")
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Message-Id: <20221030083510.310584-1-sw@weilnetz.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 66928692b0..26c7bc5154 100755
--- a/configure
+++ b/configure
@@ -1780,7 +1780,7 @@ fi
 # functions to probe cross compilers
 
 container="no"
-if test $use_containers = "yes"; then
+if test $use_containers = "yes" && (has "docker" || has "podman"); then
     case $($python "$source_path"/tests/docker/docker.py probe) in
         *docker) container=docker ;;
         podman) container=podman ;;
-- 
2.34.1


