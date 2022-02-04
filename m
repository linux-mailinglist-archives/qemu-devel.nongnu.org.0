Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA63D4AA16D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 21:53:05 +0100 (CET)
Received: from localhost ([::1]:41960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG5Zo-0004GO-W3
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 15:53:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5Qv-0006kn-Ci
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:43:53 -0500
Received: from [2a00:1450:4864:20::430] (port=41885
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5Qs-0007ML-Ik
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:43:53 -0500
Received: by mail-wr1-x430.google.com with SMTP id j16so13362134wrd.8
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 12:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2KHr0kxH9CLEWlHl0W4fK5P4+OBM1Yg1uq7/VVGxFQs=;
 b=VHgK3jv5bjT9aMQr3xpV3Q0JaYdy8IJeUJND5yA39HCTwIui3JHK9eV/CjuCBuoRqd
 VWwegHW9z5Zh25SHEtg/qpPzRbhpniWlPfK4P/DeAPMCSlY3fH89k91Ttm7FNtZtnuWx
 6gBaiFep7QAOCfP98jOA8YqSfro3osFApSu1vsMYyMZHZTUIfaiCe2jKjKipa1JtZNMb
 sm7INTjLwvvv02E4PJFa3wqFczAUiBaHsEowXm41OVxMZrUaI1hF3bDXABTQtAD6HqcH
 NR6PmZwgQnqpidRxY4ZR6kwqN7SUOAZ+VvTbw5SejgmIooK2wbWOs6aZ+Cvo3p/lIJ4R
 4d2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2KHr0kxH9CLEWlHl0W4fK5P4+OBM1Yg1uq7/VVGxFQs=;
 b=frTGMfg3VcvkrBOlF+l2kgyPFs2nSQ+Bhv+AHVqebv8A2EesUPdQssu3F3N82cu1PB
 FJcdEzOem8TD/fUpJzvl0PXG7q2dNxYXr3b8PmK438IQiEQbVv7bdMMhD3wNpZ9ZRcyn
 wtY5ThsDsU8D6qVPLOXtLx8fELqFc+cQkg4btc2hAxJGV6onyu89ShETlOhiFkPHkFk3
 G7sS6n1ViosTQTWnQzheHV89VqBxz7djDwjrWyzLFvrZyESudIHu+kApTJ+Qeup3kF+V
 LJa2XBco7Kdo95hylbVN6SB5/L7xYzzTOmcpSasojDykZya8tN1Q3d9YiC5oA2WPsMnx
 viiQ==
X-Gm-Message-State: AOAM5326FCEXQCC7b4Pq4TLNWiz9TkPlGMubJZ0yA/eYn0/K4ptaYe3l
 m2Wz41ZRFhNXzuwYR0A7ntmZfw==
X-Google-Smtp-Source: ABdhPJxb4zad/jNe4eBvDr0GHtUksJjiSKp2YN8A6UfqLkyvANtDcAIljODwidwwcegHqDuZLE8Jdw==
X-Received: by 2002:adf:ab18:: with SMTP id q24mr521536wrc.617.1644007429323; 
 Fri, 04 Feb 2022 12:43:49 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n5sm2476762wmq.43.2022.02.04.12.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 12:43:42 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AA36C1FFBF;
 Fri,  4 Feb 2022 20:43:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 07/26] tests/lcitool: Include local qemu.yml when
 refreshing cirrus-ci files
Date: Fri,  4 Feb 2022 20:43:16 +0000
Message-Id: <20220204204335.1689602-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220204204335.1689602-1-alex.bennee@linaro.org>
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
 Luke.Craig@ll.mit.edu, kuhn.chenqun@huawei.com, f4bug@amsat.org,
 robhenry@microsoft.com, aaron@os.amperecomputing.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The script only include the local qemu.yml for Dockerfiles.
Since we want to keep the Cirrus-CI generated files in sync,
also use the --data-dir option in generate_cirrus().

Fixes: c45a540f4bd (".gitlab-ci.d/cirrus: auto-generate variables with lcitool")
Reported-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220121154134.315047-4-f4bug@amsat.org>
Message-Id: <20220124201608.604599-8-alex.bennee@linaro.org>
---
 tests/lcitool/refresh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 033120e223..25301f2ef0 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -62,7 +62,7 @@ def generate_dockerfile(host, target, cross=None, trailer=None):
 
 def generate_cirrus(target, trailer=None):
    filename = Path(src_dir, ".gitlab-ci.d", "cirrus", target + ".vars")
-   cmd = [lcitool_path, "variables", target, "qemu"]
+   cmd = lcitool_cmd + ["variables", target, "qemu"]
    generate(filename, cmd, trailer)
 
 ubuntu1804_skipssh = [
-- 
2.30.2


