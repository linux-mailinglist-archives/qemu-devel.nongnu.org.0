Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EE742008B
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 09:53:00 +0200 (CEST)
Received: from localhost ([::1]:43632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWwIt-00010N-2p
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 03:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9F-0003Gh-AL
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:01 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:33744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9D-0000oj-Q9
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:01 -0400
Received: by mail-ed1-x535.google.com with SMTP id p13so23616814edw.0
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 00:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K6TQCFQzXuXQd9NucqfZ6yW3PdHeHGmJiGpTXeBzS4s=;
 b=CzlzJX/YKjdTF1nRiuiPY1d2bwtqAhjYcaRu7nUoBizvJSvou2+Fgj5Ci5db4lzzmw
 KA3NK0VOd8tNoUO1cxJpJFVBAvS4WAkltUmUOm/qXaGb3abAR/9cMM4xQOb92en320ok
 vO0XRlpFgaAhqBK+kqlKDNrCqvj9j7Qp47WeTx7aVglcPURZGCQ6KwNf6VvqCOURTnPI
 FO/zsyO+FMKSpoYuvcNPiLB5x5yTBWm6/arOQ/bDjwY9aYG8lAgOot7vH51F54N1SRw6
 s7azPfwOpreRYQ0qrUCSP+hqrGLCqwB7juyq7kOmXD2Vjj2xpKOW1j0ORGAAgtZ3WqVQ
 14nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=K6TQCFQzXuXQd9NucqfZ6yW3PdHeHGmJiGpTXeBzS4s=;
 b=ksZeqkxrYY2fsdzG1923YvAz2wC0hmE7VvODoNNv5R/UvpXB4vJvuGD7YohX5tuz4w
 sfeCYGyWsA+Jcft8uI7MaRsOahHgPp1m6tLeaFIxoxf2Rpww8LMvKxKHsuPkUX897und
 YBiSgLcEtfU7mH8Hcjg2x7zlN9Xd+j2qo2XgodEGIPw9NlSn2/N2Mw7g2wyA8f2R/7fO
 /LA0YU5iEBaVvu9NG34rzoTg1SxPfVPQthdSMexui5wQuA6je6T9llksDi30eQTMPY1L
 AKXlxFAst1mxZ72PdX6NP/zO7eVDMyqT2MFWVV/jvF5pRRkeUraKe0+y+vLjfqXTbtK6
 oPoA==
X-Gm-Message-State: AOAM530R2fGeQYcKVBnPeHaDDxjGexMtO8UUa2B7bmIpEzqFQIx3n5DU
 A7eISjc0W2sLRGFEOwcqgz59IL+hhy4=
X-Google-Smtp-Source: ABdhPJwKvMqPnjPANoCr/J3s8oEEm1S+57zLLHJjHL+ulmNe0DdzfVNIW61DTPzdvvhQxmrgskjK/Q==
X-Received: by 2002:a17:906:2bc7:: with SMTP id
 n7mr8746342ejg.238.1633246978568; 
 Sun, 03 Oct 2021 00:42:58 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm5560856eds.10.2021.10.03.00.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 00:42:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/30] qtest/numa-test: Use detailed -smp CLIs in
 test_def_cpu_split
Date: Sun,  3 Oct 2021 09:42:28 +0200
Message-Id: <20211003074250.60869-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003074250.60869-1-pbonzini@redhat.com>
References: <20211003074250.60869-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

Since commit 80d7835749 (qemu-options: rewrite help for -smp options),
the preference of sockets/cores in -smp parsing is considered liable
to change, and actually we are going to change it in a coming commit.
So it'll be more stable to use detailed -smp CLIs in the testcases
that have strong dependency on the parsing results.

Currently, test_def_cpu_split use "-smp 8" and will get 8 CPU sockets
based on current parsing rule. But if we change to prefer cores over
sockets we will get one CPU socket with 8 cores, and this testcase
will not get expected numa set by default on x86_64 (Ok on aarch64).

So now explicitly use "-smp 8,sockets=8" to avoid affect from parsing
logic change.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210929025816.21076-9-wangyanan55@huawei.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/numa-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
index fd7a2e80a0..90bf68a5b3 100644
--- a/tests/qtest/numa-test.c
+++ b/tests/qtest/numa-test.c
@@ -42,7 +42,8 @@ static void test_def_cpu_split(const void *data)
     g_autofree char *s = NULL;
     g_autofree char *cli = NULL;
 
-    cli = make_cli(data, "-machine smp.cpus=8 -numa node,memdev=ram -numa node");
+    cli = make_cli(data, "-machine smp.cpus=8,smp.sockets=8 "
+                         "-numa node,memdev=ram -numa node");
     qts = qtest_init(cli);
 
     s = qtest_hmp(qts, "info numa");
-- 
2.31.1



