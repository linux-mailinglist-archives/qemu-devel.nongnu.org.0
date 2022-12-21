Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B11CC653287
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 15:41:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p80Gm-0006vM-7w; Wed, 21 Dec 2022 09:40:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p80Gf-0006uu-UN
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 09:40:25 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p80Gd-0004te-FY
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 09:40:25 -0500
Received: by mail-wr1-x42b.google.com with SMTP id m14so15144326wrh.7
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 06:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fpgYus7iOWXvnIUVIMKMYfK2sIKW9bCGOnHmbC/Arqs=;
 b=KN8rViwKS1RaBRjTWIm9VwiRhE6hnaaCPrT3uwJIIs8NaaaCGocozEdf84CQxW7Qwl
 AoJHYnOXL/0a/YOxfmWD9p/lQe73LoB/6fZcR+CTkNuKzx44D3Y8Pi93HbKJaoYu4otQ
 XxauMSvvDRtZBNi9HGs3hs55Pe+j7Q0CL72j38s6O6Y/zhOl1s4JdCM3z+xUq4k6DyhO
 PQpHETfHo5IczaOTgd00ntH9/B4L3wVBvzXakHGKD2zZKN4qhf37ossjNuZ4n5QEfvgU
 qpY34Vvd5VNqg/qUiOJk3O83yggDz/B6prXi9jd+eVB09g9m227DUPzeQaSdGZEogYTa
 sREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fpgYus7iOWXvnIUVIMKMYfK2sIKW9bCGOnHmbC/Arqs=;
 b=KcZ+tJhkgkZLeJRNFk9SVZpS1SCCZP7Fae9YsNhuxidVIYtTdUPMd3Ky+GVh6I0H/4
 q9p5VBF7qrgs/7nvd4fbVvQUiEh7VqSaLLRPPrYyYNHzZ/LHjTmT379oL00TYk9B3NpH
 gAz6mX5TMP7cKZn0waK6v7lUgLPPArG9qF2Siv6l+uZ9t6T5uf5HsbXKd5UMCApvlCjx
 /R+dXaUduED1VpPiZv0yRy9SksovLaDMpWGQw+Bz9Ho0dcmqrD8s+SA3vycWLqBqv0bf
 p3iq0G62qx+1w5MUPGxuvf5YcuhANCSzlr6N3ATZcvbLEucaCo1Gc7jcwBKjDevOmshR
 OEuQ==
X-Gm-Message-State: AFqh2kox+HFZp86r90r0mWuUuBliGf8p0jSjS6zRCpIOBy0X4uAtV8tD
 2WslXkZuH4NHJeRKZD4IOIpENQ==
X-Google-Smtp-Source: AMrXdXvzZjnfUrhxyS73UpfP0ptGtfzRsA2f6p3ypeyTzIqApleJWk2v1hNvhgEj52Rjlg/d0qalyw==
X-Received: by 2002:a5d:6b11:0:b0:24b:6cc7:a61b with SMTP id
 v17-20020a5d6b11000000b0024b6cc7a61bmr1666222wrw.41.1671633622104; 
 Wed, 21 Dec 2022 06:40:22 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z1-20020a5d6541000000b00241f029e672sm15314141wrv.107.2022.12.21.06.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 06:40:21 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1555A1FFBB;
 Wed, 21 Dec 2022 14:40:20 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PULL 3/6] configure: repeat ourselves for the benefit of CI
Date: Wed, 21 Dec 2022 14:40:16 +0000
Message-Id: <20221221144019.2149905-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221144019.2149905-1-alex.bennee@linaro.org>
References: <20221221144019.2149905-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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

Our CI system echos the lines it executes but not the expansions. For
the sake of a line of extra verbosity during the configure phase lets
echo the invocation of script to stdout as well as the log when on CI.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221221090411.1995037-4-alex.bennee@linaro.org>

diff --git a/configure b/configure
index 7a804fb657..d89e883844 100755
--- a/configure
+++ b/configure
@@ -83,9 +83,10 @@ rm -f config.log
 # Print a helpful header at the top of config.log
 echo "# QEMU configure log $(date)" >> config.log
 printf "# Configured with:" >> config.log
-printf " '%s'" "$0" "$@" >> config.log
-echo >> config.log
-echo "#" >> config.log
+# repeat the invocation to log and stdout for CI
+invoke=$(printf " '%s'" "$0" "$@")
+test -n "$GITLAB_CI" && echo "configuring with: $invoke"
+{ echo "$invoke"; echo; echo "#"; } >> config.log
 
 quote_sh() {
     printf "%s" "$1" | sed "s,','\\\\'',g; s,.*,'&',"
-- 
2.34.1


