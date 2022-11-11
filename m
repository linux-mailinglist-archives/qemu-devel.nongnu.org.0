Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8E462548A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 08:43:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOft-0006dY-BV; Fri, 11 Nov 2022 02:42:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfn-0006Qr-Eu
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:59 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfk-0007wx-Vn
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:59 -0500
Received: by mail-pl1-x630.google.com with SMTP id c2so3606800plz.11
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KbxYnYMZOdgUIKzB3W7e4WMSmPoKgVqMloJtF9P8blQ=;
 b=JIq3MuhGP0xwgKD7RVZhZAtekwztkmgNKhrEPRscQ4bjdpIqzEhyDZ3b5upHGgqZ9e
 yebruR2XNtCPWMqgPS6jQbXCc7Ebx+YcTL4NtP7lnJvT2/d8/syi0oSgMhIkW7Ic3JZr
 LrgfBv3g1jcMGAHOiT7Mor9WbwA73XOG9j6FA55975u+1MMzLyln1xkR4czbz6MTi/Ql
 BIApSoav1vWNmEWep6k0FAIpMYiz0yT5bkozL91vutXmIqMmrUYx59iSuEU5UPf1v4ll
 yDxD6KkyOzqA03i371UnA4f/6Q8tq6dXYMzzsLgqBa57FQDHRYSrldz7ONnjbR+gv/dM
 YKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KbxYnYMZOdgUIKzB3W7e4WMSmPoKgVqMloJtF9P8blQ=;
 b=xH5kfjGuFH3g0kK+Llg0NQLAlK42epzLQ5ECn1nmf7ch+k61M9K7C4oJly9kNhi5QX
 4VaYxcDS+mAGqRHP/YU3UhJh2qq9WP8BdM1GXVDp8jwBpPtpyWn7LoMFqreUzhQgqfC3
 spDq707be8/9xz4FsRf1VxHzRCExDhjXi6D7DiglM6jarKbfeZCzWj8PQQEIfHeSRB/v
 57y7vV9lvYxf5elRn69/ZX6gaNbKgWf3ZcsQ4OvLcSqUXPyu1gnottLZhOSyaw7U34Bk
 Vlc7Yiw8Mlvlmbq8lFJf5NbhEKLZxvQgrKvFAIb1XPV5Skmx87L8sbDTNb3aK88XNSyW
 tDOw==
X-Gm-Message-State: ANoB5pnFvzUZfUlTA4lTcnjoc0Uo4nUQpgjM6gm7NRIXbkLjv2qL9S3Q
 TMHNKrExEU9IlZKQ30XS4FLMbiP0BuxAh037
X-Google-Smtp-Source: AA0mqf7sLR4CiNBY8GSTlFfPKRyCu2mcPVZP+N1+SQriKbHolGkvpv1l9sQYjMKGnx0nrtncuqkuNw==
X-Received: by 2002:a17:90a:ac11:b0:213:f398:ed51 with SMTP id
 o17-20020a17090aac1100b00213f398ed51mr575046pjq.216.1668152514904; 
 Thu, 10 Nov 2022 23:41:54 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001754fa42065sm976069plg.143.2022.11.10.23.41.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:41:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 v3 20/45] accel/tcg/plugin: Avoid duplicate copy in
 copy_call
Date: Fri, 11 Nov 2022 17:40:36 +1000
Message-Id: <20221111074101.2069454-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

We copied all of the arguments in copy_op_nocheck.
We only need to replace the one argument that we change.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/plugin-gen.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 9e359c006a..77e6823d6b 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -397,9 +397,7 @@ static TCGOp *copy_call(TCGOp **begin_op, TCGOp *op, void *empty_func,
 
     func_idx = TCGOP_CALLO(op) + TCGOP_CALLI(op);
     *cb_idx = func_idx;
-
     op->args[func_idx] = (uintptr_t)func;
-    op->args[func_idx + 1] = old_op->args[func_idx + 1];
 
     return op;
 }
-- 
2.34.1


