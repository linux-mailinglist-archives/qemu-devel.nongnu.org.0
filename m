Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53746466B43
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 21:58:09 +0100 (CET)
Received: from localhost ([::1]:59234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mst9c-00008d-EG
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 15:58:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mst10-00009i-14
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 15:49:14 -0500
Received: from [2607:f8b0:4864:20::1036] (port=53869
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mst0y-0005W3-Gq
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 15:49:13 -0500
Received: by mail-pj1-x1036.google.com with SMTP id iq11so668075pjb.3
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 12:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TanATbqLIZD4sdWdXDqq/ZctU6NkzIRRa3wOfm+DVqE=;
 b=UjR0MnPIyaXR7mpSxqL9bfkeSEu2iIRdoKKXmieCQljG6HZEhIfvVtNYsmcjlNHqJg
 MeuuGluvYl4244wsBc9kdrguVGg+06GoFrzEL1ez7ESWPb45qG2rlIKGxT6lULWnvtMD
 gMCFT1ToORkzJU8t03qAJ8WIm4sAxDcPkyFvQJ+yfQlGHeHBbfbeDp9RlGicAwVDySzH
 wq8D0fuwpkqAHR8Xouwmvz6hoX3qDb/GnAh6oJ6gY9xbENaSq5cE9MaMTk59nskNQYkP
 pXLAgipu18bCL2qquev+WSc9a7WeEuG651RsE4Hur+cJM9DQY8glu0rq+t6Es0JumqQE
 OKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TanATbqLIZD4sdWdXDqq/ZctU6NkzIRRa3wOfm+DVqE=;
 b=E6cRrJ5OFUZfHiG0dn10iXPbXCnDoN/Qyx34gVXch6yfmrVAAurQxuuppfEH4mOBCT
 9LTDv+ZBYp9xgUI0s5/yHl07SU09JpUQushiZJ3oBWLLBewvrw+BkXLSlXyxLMP2JQTP
 4rr5at4eqvsCPvUdWRCyQQfNMh+ffapjfaaJOV0Zf6DBrEMsrKKQ0Hdt9RI5Q+rBvUDd
 ZbGpnka73zhziBsTITRUvjt2zJmALOIdZtlTFZFY/f1w/GLhoi1nXSLAqQNVfwJ9jBv3
 o2si8QSEagElxlHFu4qHJR0tWDHN2CUuTsI7bTfa78ANSqcaocB21WhKbUX7OHGtpGnF
 0UHw==
X-Gm-Message-State: AOAM531bPe0opreqWiIbxMsJT3TsOeCbWHE4NPhx9Q12rDJZlN5Z+UPP
 qMLlTmcbPbuok0bp5MYnmkvDz/lTqSBtKg==
X-Google-Smtp-Source: ABdhPJy0O3iIqpWJWpqpBFpbZxBCJNOEzBd9MCnjYXmgouRqAWdAawwJlUjv2oovfXeSq1tNeIIong==
X-Received: by 2002:a17:90b:4b4d:: with SMTP id
 mi13mr8041131pjb.192.1638478151247; 
 Thu, 02 Dec 2021 12:49:11 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id pi17sm3721391pjb.34.2021.12.02.12.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 12:49:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/15] linux-user/strace: Fix print_syscall_err
Date: Thu,  2 Dec 2021 12:48:59 -0800
Message-Id: <20211202204900.50973-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211202204900.50973-1-richard.henderson@linaro.org>
References: <20211202204900.50973-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Errors are not all negative numbers, but only the top 4k.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/strace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 2cdbf030ba..f235118fb6 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -684,12 +684,12 @@ print_ipc(void *cpu_env, const struct syscallname *name,
  */
 
 static bool
-print_syscall_err(abi_long ret)
+print_syscall_err(abi_ulong ret)
 {
     const char *errstr;
 
     qemu_log(" = ");
-    if (ret < 0) {
+    if (ret > -4096) {
         errstr = target_strerror(-ret);
         if (errstr) {
             qemu_log("-1 errno=%d (%s)", (int)-ret, errstr);
-- 
2.25.1


