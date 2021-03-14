Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC85633A8D8
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 00:36:40 +0100 (CET)
Received: from localhost ([::1]:32900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLaHj-0007P7-TO
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 19:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLaBM-00007P-DQ
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:30:00 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLaBK-0003kJ-P6
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:30:00 -0400
Received: by mail-wr1-x42a.google.com with SMTP id v4so4812189wrp.13
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 16:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=omYqz1dBbqgnwbqos/CkuFX5mITKAgtBS0In2um2yKk=;
 b=garltiyyObrLsT9P5uLMXRvWWCELa8cLtHJfM8XThPwu3/v2SxJLT7FurF9FWULH5o
 WxErGQbvn6eiS/u0rGtJT3R6cNkzhiCh9iSBp02OET4i9ml1zVMTOfMd/+zRqlLRNNJT
 aNqj+60YC3huNDaUgluI8FY2Rrbqn9iq8wFM7N9sH9zgkQYT6fV54rCUvxu6FUw/xEvC
 9/g4CUDoPtIImspXQkUSaoCAUtrz16gCjE9SuM4ja1EHIyPRl0Dq9CEd5zaxBuPSLlkI
 /WbUao93T2lfGuTsWKjrVzZcKJNlybKdqZdPisooYRRZXoXm0msvJpVnxTQaTJnq/bys
 jXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=omYqz1dBbqgnwbqos/CkuFX5mITKAgtBS0In2um2yKk=;
 b=ijygDyGkPvV2YoxlZJ3DEAgV9XQAmcsq3UnHXZsdKwC+6IIMr/TrDU6fQP7rOTxZ5V
 StDnZn8cKkvH3ErnLqhdfDecLoJhWkmqAD0hfMIImjx1zLrAKH1zaJ0r0XfvKYJnk83R
 3MwxTFV1Mzf2lCqNOjwNEvGNfN+7ZtZyoaN61MvotxFcRuMwmn9O0T+JG0UGkOngjNBK
 PR6HtM/+FhfmaRyqmzhACRSoV9F51XFPaUefJjrUxqrYlSggfXJHa5u8X1XnGCRuOUFP
 R4urre8H+zyb29Udc8a/av+P6TUiAoPQFxhpf7umjX9MMekSxoZVma5i8LCE+Su93hjJ
 drBA==
X-Gm-Message-State: AOAM532Q5vZ3Gr/6zwpIsHdf8oFu8lXNBsjgxEqr4kCLHm4aN9HB44YQ
 zjzmboe2X2ZELf+uvAQBQIvvoax21LCIVQ==
X-Google-Smtp-Source: ABdhPJxAmp1QFt+9Wcs/WVlU4KvZUtK8eq0jGOwzLGfLhpejtzagvwU5JLVVPE0+A+Rzmy6WSZwL4A==
X-Received: by 2002:a5d:6312:: with SMTP id i18mr24967028wru.149.1615764597150; 
 Sun, 14 Mar 2021 16:29:57 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id q19sm17336065wrg.80.2021.03.14.16.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 16:29:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 8/8] softmmu: Restrict CPU I/O instructions
Date: Mon, 15 Mar 2021 00:29:13 +0100
Message-Id: <20210314232913.2607360-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210314232913.2607360-1-f4bug@amsat.org>
References: <20210314232913.2607360-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict CPU I/O instructions to architectures providing
I/O bus.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/meson.build b/softmmu/meson.build
index ebf063b8990..3df196917a0 100644
--- a/softmmu/meson.build
+++ b/softmmu/meson.build
@@ -2,7 +2,6 @@
   'arch_init.c',
   'balloon.c',
   'cpus.c',
-  'cpu-io.c',
   'cpu-throttle.c',
   'datadir.c',
   'globals.c',
@@ -16,6 +15,7 @@
   'cpu-timers.c',
   'runstate-action.c',
 )])
+specific_ss.add(when: 'TARGET_HAS_IOPORT', if_true: files('cpu-io.c'))
 
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: [files(
   'icount.c'
-- 
2.26.2


