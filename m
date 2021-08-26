Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF1D3F903F
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:44:35 +0200 (CEST)
Received: from localhost ([::1]:48888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJNAo-0004SW-Hp
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMgJ-0006nm-Vb
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:13:04 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:41546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMgH-000769-Hd
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:13:03 -0400
Received: by mail-io1-xd36.google.com with SMTP id j18so5558164ioj.8
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QdVAD5Ozu3VkCZu+3yXfvcd+75Hgy2jYJkzz4LyRfYY=;
 b=d46dgRT3ZF3RNvGDW8vlaFmGluL+90EDwFezlzW7z+wq90Lpt3BGrIi75Wpi01q4Fc
 5zVZjrjU7wTQcKvzawAo1wim9g8WyHWcqBFhbvSjkNV0ev9Ey5CQb/EqCEdmjrxXLm1h
 zc1W9zkrgVKia77KBX4evg4VVLJDcJag/U2T3TsYl+TN3h/ZKzmekgH7aaFiIcH/RSkl
 +jby3HON8+bIIqf6TYrnDwpvAsMU9ZGYdf9mvYGZud8lG60yUrF4UH+V08N3oZaJY5qm
 RCwqB5ZcWovNq82YrBo3v1cwh1LqyhQQbUCQ5GXqCjORGJXApxXLOwyXsDDTaB0PkHNs
 VXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QdVAD5Ozu3VkCZu+3yXfvcd+75Hgy2jYJkzz4LyRfYY=;
 b=Qf90UTSaPH/+fHFauD2qZtLpiCKwrC9s3tYA/Ik1mldFJvVJAykc7RLz4D/vWh+X8p
 RMuLr3KAZBvh3cOmGENXGL/R4whUvx0eZJeeJuRTMUu4g+GwMidmEJSkExGiCZ+PnD3+
 XKAqcK8ry11bQG9hNlW6Tf7EvTDYraUsIvefbyQnsV2X3aQuVmGjpXRTSc9uOk0609yx
 u+6zvPbiRYxBQm3cDQ81xbrj2s6Ew1QVIW3jf5hhG7dJPVNZNVt9evJ08UJcdyrbr/NR
 Ju5/zmc1k4SOQpJE6MJDCmgEi6Vk1WY/tV3fSh6JtK1xakxY3PrxjdeXq3KLh38vAi5V
 1IFw==
X-Gm-Message-State: AOAM531+raFG61x9Sp83WB3RagpkqeR3fAcIHOQLdYUmcWI+KD8GR6l1
 lYKIqgD8Vvlvw8kuSlwkIC4au1NzYZd+nTky
X-Google-Smtp-Source: ABdhPJz4cJIY014awzSQUnNWwpYAdnTJbV7R97PV3N6Rd0BLJy2+qrWbBOyTlAd1mvoPwqMvRRbt8g==
X-Received: by 2002:a02:90cb:: with SMTP id c11mr5195777jag.53.1630012380110; 
 Thu, 26 Aug 2021 14:13:00 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:59 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 42/43] bsd-user: Add '-0 argv0' option to bsd-user/main.c
Date: Thu, 26 Aug 2021 15:12:00 -0600
Message-Id: <20210826211201.98877-43-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Colin Percival <cperciva@tarsnap.com>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Colin Percival <cperciva@tarsnap.com>

Previously it was impossible to emulate a program with a file name
different from its argv[0].  With this change, you can run
    qemu -0 fakename realname args
which runs the program "realname" with an argv of "fakename args".

Signed-off-by: Colin Percival <cperciva@tarsnap.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index b35bcf4d1e..ae25f4c773 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -268,6 +268,7 @@ int main(int argc, char **argv)
     char **target_environ, **wrk;
     envlist_t *envlist = NULL;
     bsd_type = HOST_DEFAULT_BSD_TYPE;
+    char * argv0 = NULL;
 
     adjust_ssize();
 
@@ -390,6 +391,8 @@ int main(int argc, char **argv)
             do_strace = 1;
         } else if (!strcmp(r, "trace")) {
             trace_opt_parse(optarg);
+        } else if (!strcmp(r, "0")) {
+            argv0 = argv[optind++];
         } else {
             usage();
         }
@@ -413,6 +416,8 @@ int main(int argc, char **argv)
         usage();
     }
     filename = argv[optind];
+    if (argv0)
+        argv[optind] = argv0;
 
     if (!trace_init_backends()) {
         exit(1);
-- 
2.32.0


