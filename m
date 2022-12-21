Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD7B652D68
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 08:45:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7tkq-00070c-W1; Wed, 21 Dec 2022 02:43:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7tkg-0006zz-G1
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 02:42:58 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7tke-00048i-Nx
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 02:42:58 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so809811wms.2
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 23:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7gzfip+VtarrKCNhyN3EQVuk1lZMb8d8K27dCXSbGMI=;
 b=Mk22DxyjD0zdw6NDjGCqF2Wcey6Ovas4yU4DvgV7TzHErQ6F1smyjrtqgqUjWFtj9j
 FR9VYwiGEkLALSgGJiOWRdJhZquwKY51vLpz+T4mwHWiN+eSndO/KzA2r6TFHkj0EBA/
 7mT3hiIwVT0FeJYwJo+sYQL8TNE+88OOSjF4IpOaSMcfObZsdyJKewUrBFz6uHAkzzaA
 XNnwfngE+YPgIVm0iJxjpt6kKVyYpFVktQbovrM2/SG5r1YjIHHMd8AtHLEEP7UfJRY1
 NSV8nFfcjNDU300lh/Q6ZjmHeKDNi3cn8juSHep0SycKfkNgPO8O2huqDIewE19tIlGG
 THZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7gzfip+VtarrKCNhyN3EQVuk1lZMb8d8K27dCXSbGMI=;
 b=RNAGe7/PpBUZmFyMyOzN5wB+wtVqgcHkC3/kOLtIcZOk9Nt1h1flcOJDst1rt/v+Lp
 0pZWC5NIkmX4x/cvC070O3BFF/B5TqrioUr5CfbstQqBQ+ScaDsgLkFfWwXbUEEOayXI
 z4HuGJdsYfjCbtYe2S/ROuYIvUUFSA3q+T7unUxrqH3ECEahTd/imvlc5Jc3OIX7SGg4
 Csa10bunXAOW61g3OEg4axDi4o7CoACQ/9d3kKVl9I5CX7eM+fs34p0mIIf71DE0jsHI
 hSMqhr/7UrfKLr2n1JHw0tjM1KgFo4X0F2AITW5VmulCXTgOE5z3T5WYPGgZxbdT76Mv
 q9Eg==
X-Gm-Message-State: AFqh2kof29MYvrI7O/6lK94BuqeQT/cg7LofRmKoeR7WKQsRW+6+MqLC
 WcWGDnLzxV3G/CxfkEA2rslilnPLo/NAKlrQ
X-Google-Smtp-Source: AMrXdXvibcHlm9FBoXciJPkYyJx55Zt4qVcJbV0YpdruGRtbCUd6RHwC+68FbzKuCOT5vexqB/rp8g==
X-Received: by 2002:a05:600c:54ef:b0:3d0:5254:8a43 with SMTP id
 jb15-20020a05600c54ef00b003d052548a43mr998797wmb.38.1671608574529; 
 Tue, 20 Dec 2022 23:42:54 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a05600c4ecb00b003cfd64b6be1sm1716299wmq.27.2022.12.20.23.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 23:42:53 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A851F1FFBB;
 Wed, 21 Dec 2022 07:42:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [[PATCH]--edit 3/6] configure: repeat ourselves for the benefit of CI
Date: Wed, 21 Dec 2022 07:42:49 +0000
Message-Id: <20221221074252.1962896-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221074252.1962896-1-alex.bennee@linaro.org>
References: <20221221074252.1962896-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Message-Id: <20221202174746.1218017-1-alex.bennee@linaro.org>

---
v2
  - only add the extra line on GITLAB_CI
---
 configure | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

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


