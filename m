Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3064C67C9F3
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:32:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0LP-0002Ky-Js; Thu, 26 Jan 2023 06:23:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LJ-0001g5-SU
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:22:58 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LH-0003hj-QZ
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:22:57 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 f25-20020a1c6a19000000b003da221fbf48so906342wmc.1
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uCn56T6orLePDi22PpfDY7Bln8QKxCeK4Q3TTEITxy0=;
 b=NQPOxLQJYppw80QFssT9x/dItvm4Q5xYN0ztRzs9iNpmGoMtlhOWJUyPP7pvswzCNW
 f7TSp+RqNzj9yWNPSCfwwnGykpv35xTBRwoglysRmK7bZqeHykk1/tEDcoWcAkl/IfHK
 h4LS7TDUhFIDHLHG1zb1wS+8oLv57VmZY/TrrzFJzAXQhqMoMtijApr+fVwGWfSLXaHH
 eaS0ylVdHQCnKCCpymwSt9D4qAYzCbO44o8fycEy2XPDRZKcrPtHgvLyg61ueHaz6bSf
 9t/UT/wh036aUBdOCvXuxM9+LoFij5iYt/VIBIEzaXm7hxu7C2HuDd05OzLCsvO71OqK
 8YVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uCn56T6orLePDi22PpfDY7Bln8QKxCeK4Q3TTEITxy0=;
 b=LoTk2LRk1jYDUL2wx98WRVpwuFVaSI2ETOLfHU710w3HonGqiOf5bkfHe6KZbeQi5V
 E11CmXN4S2U7l1D6xZJoU8g4h/wyd73ew82+IT3+ImE+90u0AnoiVf1HbxCX/pu0KIiZ
 fQB1kBabmNroD6BkFhi/HcKtalrf4suSUfs1nsmR+GwmIV2GqPw0Kg8+pD7CUkzKEWDG
 0Yxu03ot+cqfZGujdE2AohfDGAEtK/NoZFAKtOlN0vqgZBDhGNXxSxKrQ8iZDClkAHHX
 f0x2kJ5LPEKkKXCYc+LNvdkJJYBEO6e10+Zwe7enmCnMqYFY/gRcJsNzpCv2jWPXjKEv
 aayg==
X-Gm-Message-State: AFqh2kqlqLAHfSVUYebwpszBVBpTRmmWkThVPTwQZ/d85klN0aklrEoj
 opEF7izdErRXQIWZm5kfn/bKtg==
X-Google-Smtp-Source: AMrXdXuGERhwcECXPYQUEEFOezdsQmSQE1B8oq2T+2kFPhTDepx9ABvbhz3XkrirSXwiEZd/HL8vXw==
X-Received: by 2002:a05:600c:331d:b0:3d3:591a:bfda with SMTP id
 q29-20020a05600c331d00b003d3591abfdamr42438805wmp.27.1674732174294; 
 Thu, 26 Jan 2023 03:22:54 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a05600c180a00b003daf672a616sm1167506wmp.22.2023.01.26.03.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:22:53 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8B69B1FFBB;
 Thu, 26 Jan 2023 11:22:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 03/35] gitlab: just use plain --cc=clang for custom runner build
Date: Thu, 26 Jan 2023 11:22:18 +0000
Message-Id: <20230126112250.2584701-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

I think this was because older Ubuntu's didn't alias clang to whatever
the latest version was. They do now so lets use that and not break.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230124180127.1881110-4-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
index abeb33eaff..725ca8ffea 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
@@ -81,7 +81,7 @@ ubuntu-22.04-aarch64-clang:
  script:
  - mkdir build
  - cd build
- - ../configure --disable-libssh --cc=clang-10 --cxx=clang++-10 --enable-sanitizers
+ - ../configure --disable-libssh --cc=clang --cxx=clang++ --enable-sanitizers
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check
-- 
2.34.1


