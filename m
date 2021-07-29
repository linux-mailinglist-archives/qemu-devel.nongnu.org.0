Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5179A3DA36A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 14:54:21 +0200 (CEST)
Received: from localhost ([::1]:49264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m95YK-0000w0-CN
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 08:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m95Ra-0003Xy-FJ
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:47:22 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:43565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m95RY-0007Xc-VE
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:47:22 -0400
Received: by mail-ed1-x52e.google.com with SMTP id n2so7997396eda.10
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 05:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YnCVY1ZWNmUlC0ht0KAn5MbtR3nNzeZ/8T3oekadPC8=;
 b=CvM6H2PS8AvNVbaPyLWr3KoIin1fdtdERzu7fPJcVjU6Xr8pa3MQtW6vHhIXTTa9IC
 o8QIkNCDizBT6W7rnT1MUvFFO5LvBlrfjInY7mnmWbUO2H4NiwU1y1v4NwYCdjjI4xVr
 vjVfC6MwmbkTlIQ8PHV4yokbq8mJCH6k1QFdjgLG00/mHvvTM/N54jKkcnYBkgV/kps+
 7A++Kc5LjlIs1v6y1QC176db9I2HuCWoi5CxyStw6YCYQcZPgmjcTuDJIdKye2UGJmv2
 7DKMJFRxmkD5Syrt3icx+c1N2wD/OZx9PkxAibuQhaSSFwIvwnErCBh2wTqE29o6QQN6
 Edcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YnCVY1ZWNmUlC0ht0KAn5MbtR3nNzeZ/8T3oekadPC8=;
 b=daRG9vmr1TdIR4SSjVp9nUcWpypYkPB374hOaZAxxXtvb/FyLBUkrqGQ88l+PyhSFn
 GrlMem3nUdxSOjNjaQg5bT8TakFU8Ji1KwzlFqA4Ey1nEZm3wjiFL9rxCXfIteDbgsoU
 E6m3eNHUcypuEWqp8zvvaoC7Ve34HPeLucba3x1xxtejXkw7wTpgoWdSGFVZxD3WbiA+
 Bv7tbbCiL9zNzLNeKlxz3zmtuhnxoLHdHav4cTWdLQRSiZVYyO64iV5vaB5a1/KR1nYv
 7nV96Iy+YHxq0ClQLLBeFx4lXWeVduO4ZlEm40ZFnYy5cUnBSKBw0Bnidbio7RvNN3+a
 lPvg==
X-Gm-Message-State: AOAM53229/YbVkPl1itMiIMgF1+ec8VUrxZz8kOBiEFslwkNSoPcXIbL
 AqBuDUouE7tAX9a7tQJ81Gtkeq2A3oq+Vg==
X-Google-Smtp-Source: ABdhPJwhVgqFNqaO896TuhVgUkjWcQaVN7xZ/O1MKuUW6HiOs3VhuQphYdrHOE0ZH7JXwRY8M5415g==
X-Received: by 2002:a05:6402:35c1:: with SMTP id
 z1mr5833560edc.89.1627562839692; 
 Thu, 29 Jul 2021 05:47:19 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id m12sm954659ejd.21.2021.07.29.05.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 05:47:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/7] configure: Add -Werror to avx2, avx512 tests
Date: Thu, 29 Jul 2021 14:47:09 +0200
Message-Id: <20210729124713.208422-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210729124713.208422-1-pbonzini@redhat.com>
References: <20210729124713.208422-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

When using clang, we get

ERROR: configure test passed without -Werror but failed with -Werror.
       This is probably a bug in the configure script. The failing command
       will be at the bottom of config.log.
       You can run configure with --disable-werror to bypass this check.

What we really want from these two tests is whether the
entire code sequence is supported, including pragmas.
Adding -Werror makes the test properly fail for clang.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210719200112.295316-1-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 79e2ddc74e..422a456f0b 100755
--- a/configure
+++ b/configure
@@ -3881,7 +3881,7 @@ static int bar(void *a) {
 }
 int main(int argc, char *argv[]) { return bar(argv[0]); }
 EOF
-  if compile_object "" ; then
+  if compile_object "-Werror" ; then
     avx2_opt="yes"
   else
     avx2_opt="no"
@@ -3911,7 +3911,7 @@ int main(int argc, char *argv[])
 	return bar(argv[0]);
 }
 EOF
-  if ! compile_object "" ; then
+  if ! compile_object "-Werror" ; then
     avx512f_opt="no"
   fi
 else
-- 
2.31.1



