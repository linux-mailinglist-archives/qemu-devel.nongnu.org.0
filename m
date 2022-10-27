Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCFD6101DC
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:40:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo82r-0001TF-4q; Thu, 27 Oct 2022 14:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo829-0008WE-VK
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:55:19 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo81n-0006A7-Gl
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:55:17 -0400
Received: by mail-wr1-x433.google.com with SMTP id bs21so3753509wrb.4
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A0SXCM+KSqiVxWBvTd3VpYjIcK+dRrJ055VbgsI9csQ=;
 b=iiY712eK6CAp/VUCSHW2N8lxgtMOfRVKPbT0gYFgxNFHerCMtSxI5VueLLe1rKicLq
 dHfTjENXN2cFJLTXWuZbCTLhZ6V9PvSYD5GtYBgK50zNgnwwR0YV7ncR/jn7sR4fc7Ac
 LkrlXEXsZFyP8dcODFAMODxma/FkcAUqG5uv7DEQQI6XvdK4biIO52LgSYEJeEMffkCd
 lOKUfP1rodoyxuMohKXDg8I8vYowuAegIu9hK7FY0idW5BlNmZs7/hq4oRNUpzeyQpEA
 ALFxYJGzN6va2V1eiCiYUwNAnukgWIXOF859xmd1qhEzZdsjqb4V3pYAuZvbRyuyo79n
 raNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A0SXCM+KSqiVxWBvTd3VpYjIcK+dRrJ055VbgsI9csQ=;
 b=B/wS46UKypH5EJdoe+E8uRzjCkKc/6rw88SOykNJS/5tQOajjJxqAvyWwgBopZwJAz
 PGqpkFfPGErtBf1ictUbGO+W5xI6qlYO6QvdMKg6SVHGlMfNA0lEef+JTMWIYbddQKR1
 e1+g9uj7RlOE7kzz5Cq4u7NTvkQPSPYxbNkpsNvuOYd1bDfqfbR9VVwpq5g0UskUA5Hl
 D9UsNOHUtIjygby5gmMzTqGlFVXq1m/nqlqjR98fz2xWXe5b8epC+XdeQmoBOEJ8SKEw
 kDNdRqZzREbKekW41LMiCqcQ2qlikgmkj/Jz64MWA+tHnT9f5POHnx71ZXUE4VzPB34V
 U1mA==
X-Gm-Message-State: ACrzQf2J4FuMVGFQZnfODXNUEy9n/QedHhMcNWBlAUG7AlFbovl+PoIV
 vSoCc0IzFzbjkx0qO2xmH8fMew==
X-Google-Smtp-Source: AMsMyM74fEyJ7J/m3diPZFLh4nEuazLf7elEEB5eHQwk8zBGEVMXjg3A1FFyp2LjsFEo9wgVrI0P5Q==
X-Received: by 2002:adf:e84f:0:b0:235:d53a:2d7f with SMTP id
 d15-20020adfe84f000000b00235d53a2d7fmr27219508wrn.334.1666896892149; 
 Thu, 27 Oct 2022 11:54:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a5d6188000000b0022e035a4e93sm1886126wru.87.2022.10.27.11.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:54:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 26A0B1FFD3;
 Thu, 27 Oct 2022 19:36:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v4 30/30] tests/vm: use -o IdentitiesOnly=yes for ssh
Date: Thu, 27 Oct 2022 19:36:36 +0100
Message-Id: <20221027183637.2772968-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027183637.2772968-1-alex.bennee@linaro.org>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Ilya Leoshkevich <iii@linux.ibm.com>

When one has a lot of keys in ~/.ssh directory, the ssh command will
try all of them before the one specified on the command line, and this
may cause the remote ssh server to reject the connection due to too
many failed authentication attempts.

Fix by adding -o IdentitiesOnly=yes, which makes the ssh client
consider only the keys specified on the command line.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20221027113026.2280863-1-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/vm/basevm.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 4fd9af10b7..2276364c42 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -233,7 +233,8 @@ def _ssh_do(self, user, cmd, check):
                    "-o", "UserKnownHostsFile=" + os.devnull,
                    "-o",
                    "ConnectTimeout={}".format(self._config["ssh_timeout"]),
-                   "-p", str(self.ssh_port), "-i", self._ssh_tmp_key_file]
+                   "-p", str(self.ssh_port), "-i", self._ssh_tmp_key_file,
+                   "-o", "IdentitiesOnly=yes"]
         # If not in debug mode, set ssh to quiet mode to
         # avoid printing the results of commands.
         if not self.debug:
-- 
2.34.1


