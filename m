Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D95461CA7
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 18:22:43 +0100 (CET)
Received: from localhost ([::1]:59484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrkMU-0003L2-Hy
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 12:22:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrkF6-0002Y7-Ho
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:15:04 -0500
Received: from [2a00:1450:4864:20::433] (port=40582
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrkF5-0001Vi-1X
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:15:04 -0500
Received: by mail-wr1-x433.google.com with SMTP id t9so21426928wrx.7
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 09:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xZRgt23Y60PR4fYaWNYKVxOYHOaixoKQNFILRYTHIFE=;
 b=EsinA5bXp0vCXx3yoOglIZB6jsOXSWGTW2jTT6ixI9YWUhUHWfO6/xSNt/HsMJvgg6
 4tusve6Rhwll7k0E9uY1jE/1kq2GgGlGbIb8LsA/mDA8Fv2qBRJi0Z1BYm/0l9bYpPTY
 tMPaBnf+HF313dQJwUOrEYHQhIj6knWqO5A8s0kKctjZ4HVaDsiBniAczd9qr2UPt9NW
 QmqrWhWO4qC/lfVH//ZOicRK6hl9R7Q0r3Nvzf7GJk9bwWwJLQZmvxE+MAMrTdSmePuz
 +iRAN45ZF0sHn4IdYoAZCwnlNW88wiDEeRzxXYqhBw0r1ShyF2zqotja6WtKo2krgRnn
 Bixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xZRgt23Y60PR4fYaWNYKVxOYHOaixoKQNFILRYTHIFE=;
 b=NeplJDpVx9a0LgHt5MCo9vAsx4cDFiH+0bFdwyk7ViHIw2yH5lxRaIHQn/3ZQYfJ67
 esyNHQdqIWzLtW15EYILVL7lE3ZGmFMN0nRCJanOnOg9dfiRLUhoRih5GV6ppUlj3w+E
 cdpHQd8ryIfQ7NVX6oixpX0Z0ZKV4fj/fVR4/7U488dpx+ftEPugvXghZfDP5PHIxgCW
 LasUnDzgkBlfA3Eq/u+U0JHa4Ik0ObhBsuS9jCNLYN/Zh07cqVgVNIqIok1eJyrYTSGI
 S29csyirqVYigpuMRQtgo6cvzvedPfWntskG49q2ZZC2r1M3tvoefvuTJKuziMuDllKi
 8fQA==
X-Gm-Message-State: AOAM530yJYxKbSl8JiyaEncaXDwtrsEaLTA/DFeerYQcfZu8YMd3zkqh
 KejxDRQMAiDoJmFnpLpGlc2X6g==
X-Google-Smtp-Source: ABdhPJwze1jbSSLm2hj85LlMZn+sTa88WWO2HeZZBGRYqwBfa636pYWjVfTaHRc/HL7ooP/webo5Dg==
X-Received: by 2002:a05:6000:156a:: with SMTP id
 10mr35412875wrz.87.1638206101572; 
 Mon, 29 Nov 2021 09:15:01 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d15sm19552500wri.50.2021.11.29.09.14.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 09:14:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 592781FF9E;
 Mon, 29 Nov 2021 17:14:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	peter.maydell@linaro.org
Subject: [PULL 7/8] MAINTAINERS: Add section for Aarch64 GitLab custom runner
Date: Mon, 29 Nov 2021 17:14:48 +0000
Message-Id: <20211129171449.4176301-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211129171449.4176301-1-alex.bennee@linaro.org>
References: <20211129171449.4176301-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Add a MAINTAINERS section to cover the GitLab YAML config file
containing the jobs run on the custom runner sponsored by the
Works On Arm project [*].

[*] https://developer.arm.com/solutions/infrastructure/works-on-arm

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211116163226.2719320-1-f4bug@amsat.org>
Message-Id: <20211129140932.4115115-8-alex.bennee@linaro.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index 8f5156bfa7..006a2293ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3511,6 +3511,12 @@ R: Beraldo Leal <bleal@redhat.com>
 S: Odd Fixes
 F: tests/avocado/
 
+GitLab custom runner (Works On Arm Sponsored)
+M: Alex Bennée <alex.bennee@linaro.org>
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+S: Maintained
+F: .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
+
 Documentation
 -------------
 Build system architecture
-- 
2.30.2


