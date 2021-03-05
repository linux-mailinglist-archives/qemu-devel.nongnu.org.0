Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AC832E501
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 10:38:07 +0100 (CET)
Received: from localhost ([::1]:55242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI6uH-0003j2-PU
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 04:38:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lI6gU-0001EN-86
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:23:46 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:37318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lI6gQ-0004Mu-Qz
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:23:45 -0500
Received: by mail-wm1-x32b.google.com with SMTP id m1so811327wml.2
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 01:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ahXq8b+kzCw8zl3xGMhjbhyEJn9Nfqg8y+beqdse18o=;
 b=gT6GeLEzp+D055NDAQ7QSjXldI4YwCpYAJvaa0kBKZNIAFzd0ELIrr3kYf5zfmr/m9
 kBQEhLwpHxw0xxefL4HFWBLtUuUbUMRoOA3LplovwBwKncqhMCD4/a+VS/dI91QBp37q
 D8y3TRlVo+Fn7VWZ9aGOrPdLlkBoLjXMZbGCn/5gV2E/jBLUAZ7L3L50Of2iYQR12T/C
 Pea/OoeQSayJ+YrbdFYYDCBRXce8hm8QohdCFLL60bIe2ckhvgcQMRUS1IXvMQzizmKH
 XbCipbjpX5lZbnDTYpwcYm3bvwsrrZcdQ7HJjDWpXf5ViUU2Tqc5GFCSN7YYiGvamHmW
 2bXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ahXq8b+kzCw8zl3xGMhjbhyEJn9Nfqg8y+beqdse18o=;
 b=glvDq/DWmCW4u9o3cODqrusjQbvSDcjzIMGFtBtXBhQsTwzDS5KXDe4D0/txPxX0ng
 3h7e5N9F1HqS6vZh+lAd59l7TG1eN6aKwgqrZzdO/bWi8k46S1d/OL9AbIMWjk4o2qNA
 rAS6Ji8HAZN2YEX5YkQbUC6ztW3ngh4fA5hAuwM277UYiD67QC+DZJN+h8/dlSJQiYUB
 zdRYhLQQ2r4OPQYiJMwbIX5q78KrU53HESIjJSS28ruI/rYIRWOldvLPzLFJgO0/rdgz
 GwSw1wC3iUQjx5jsC0Rm9ezwu/L7Xzuk1Lrdb5eQSVSsxuTBcSNsnZZQ6/DuUP7Uv3uc
 L2cA==
X-Gm-Message-State: AOAM532HT/ANoiaHmrod4nO6M+Q7h10Nurd7FmBQvMU+/TZI3Nz9J1X8
 r2JwBsaY85kv+yHXH2P16TAfwA==
X-Google-Smtp-Source: ABdhPJysPaTuLWCLwmpbaOqdybA57iJBTkcpa9USljiJ6HidErMzBIGmqIAgRmTQCsxyq+Sq8UW/ig==
X-Received: by 2002:a1c:32ca:: with SMTP id y193mr5186093wmy.56.1614936221469; 
 Fri, 05 Mar 2021 01:23:41 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l6sm3565217wrm.71.2021.03.05.01.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 01:23:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C38851FF98;
 Fri,  5 Mar 2021 09:23:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 9/9] tests/docker: Use --arch-only when building Debian
 cross image
Date: Fri,  5 Mar 2021 09:23:28 +0000
Message-Id: <20210305092328.31792-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305092328.31792-1-alex.bennee@linaro.org>
References: <20210305092328.31792-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, f4bug@amsat.org,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

When building a Docker image based on debian10.docker on
a non-x86 host, we get:

 [2/4] RUN apt update &&     DEBIAN_FRONTEND=noninteractive eatmydata     apt build-dep -yy qemu
 Reading package lists... Done
 Building dependency tree
 Reading state information... Done
 Some packages could not be installed. This may mean that you have
 requested an impossible situation or if you are using the unstable
 distribution that some required packages have not yet been created
 or been moved out of Incoming.
 The following information may help to resolve the situation:

 The following packages have unmet dependencies:
  builddeps:qemu : Depends: gcc-s390x-linux-gnu but it is not installable
                   Depends: gcc-alpha-linux-gnu but it is not installable
 E: Unable to correct problems, you have held broken packages.

Fix by using the --arch-only option suggested here:
https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/1866032/comments/1

Suggested-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210223211115.2971565-1-f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/debian10.docker | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
index 9d42b5a4b8..d034acbd25 100644
--- a/tests/docker/dockerfiles/debian10.docker
+++ b/tests/docker/dockerfiles/debian10.docker
@@ -32,6 +32,6 @@ RUN apt update && \
         psmisc \
         python3 \
         python3-sphinx \
-        $(apt-get -s build-dep qemu | egrep ^Inst | fgrep '[all]' | cut -d\  -f2)
+        $(apt-get -s build-dep --arch-only qemu | egrep ^Inst | fgrep '[all]' | cut -d\  -f2)
 
 ENV FEATURES docs
-- 
2.20.1


