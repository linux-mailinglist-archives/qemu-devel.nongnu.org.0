Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DAB48C33F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 12:34:58 +0100 (CET)
Received: from localhost ([::1]:45696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7bu5-0003CY-Qp
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 06:34:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bnI-0002zK-Pw
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:56 -0500
Received: from [2607:f8b0:4864:20::929] (port=46674
 helo=mail-ua1-x929.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bnH-0003RQ-7z
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:56 -0500
Received: by mail-ua1-x929.google.com with SMTP id c36so4010322uae.13
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NiZf1GLzDxKqTCX/uduKre0a1TCmwTjxCIKA0tKqIjk=;
 b=T3ADZ+kWMi/25DcHl5qaIYE9Rp+vyRPNC7UCS8BcSrWH3eIRzIcINl8yWA1JZqxr1j
 DzEV6Cz5LhzPHne0zm4x9NTV5rLcjYZy7l9QICjyDstG6QiTXQMscr2QMRVY3uGDBe8E
 Hc9IMiYhdkSS3PH/YPqrn5Pjif+ejqSpdFd6ZK7sU2hvPm6jkNdwn7rmiTFEHIyGlbut
 SJFICilF2vGXA1iADDSJsACAUTOagTWHTl/QM0DGNtCwyqKisYscTYnr0ZkRFRX5lFMb
 WjJoIjOMlkVP0kzr+b/VXdoPk9/bnIsH9MLPCF/J4YIUjU3KoowU15tyElGUin3jb/2u
 568w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NiZf1GLzDxKqTCX/uduKre0a1TCmwTjxCIKA0tKqIjk=;
 b=lbnmAPOWib+HnoEhJndpHZb+9NO2XdTqb4rrYsatTtxw0zJmXYf1XL80GGuwwxS+Yu
 QCj14T+hQBLyJZ14WvH9wxW5Wefa1JJTEsDog5mC0wm/ofak9BOf+48NtwFuM1Z+2YhX
 MldhnSnFgPE/h7Lgf1Z0ec+S2dGcmfSWW7E1gv7YegIv8+qnx8ClBFQlB6SaWs5HI27n
 7sWpgTvCxUPUSdzf8JVyNsgcHEKZNbAW1FVt9XjzD9J9IDDT4QSVh4RyWOWu1X5UPmW0
 fLfP8J7eQ5Yr+I6+MSEqUSgI4ZKkEddNg1T1UCu2LXc/wPQ1Hlvu7RCGO7GMZwTfGQmn
 0RFg==
X-Gm-Message-State: AOAM531eGY4CEkX6nGu1AuavuhbI+/q+k84UYUezx3XoC7/nQQ0STOHp
 R1YKVuPbJRQRMYKIeq+zLk+EBQ==
X-Google-Smtp-Source: ABdhPJy4OzKbhczHKUdbF1I9uWu/EZTdKpOuhItRUmlA1+hHo/Pet80mT+n2AqEywIss646mV5B+Zg==
X-Received: by 2002:a05:6102:1009:: with SMTP id
 q9mr4005078vsp.22.1641986874389; 
 Wed, 12 Jan 2022 03:27:54 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s69sm5739401vka.55.2022.01.12.03.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:27:45 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B97F61FFC8;
 Wed, 12 Jan 2022 11:27:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 16/31] tests/docker: fix sorting of alpine image package lists
Date: Wed, 12 Jan 2022 11:27:07 +0000
Message-Id: <20220112112722.3641051-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220112112722.3641051-1-alex.bennee@linaro.org>
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::929
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=alex.bennee@linaro.org; helo=mail-ua1-x929.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

"python" sorts alphabetically after "py3-xxxx"

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211215141949.3512719-17-berrange@redhat.com>
Message-Id: <20220105135009.1584676-17-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 5a1808726e..ca4b3b58d2 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -35,9 +35,9 @@ ENV PACKAGES \
 	ncurses-dev \
 	perl \
 	pulseaudio-dev \
-	python3 \
 	py3-sphinx \
 	py3-sphinx_rtd_theme \
+	python3 \
 	samurai \
 	snappy-dev \
 	spice-dev \
-- 
2.30.2


