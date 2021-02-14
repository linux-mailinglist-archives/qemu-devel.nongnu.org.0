Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A71631B1DC
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:17:24 +0100 (CET)
Received: from localhost ([::1]:49204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBLxT-0000X0-0h
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:17:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLha-0007ze-2G
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:00:58 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLhY-0004Yt-F4
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:00:57 -0500
Received: by mail-wr1-x42f.google.com with SMTP id v7so6062653wrr.12
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=omFKrMKfMKAUYuqEWFQKfmLF68dd1WCyeAVMWMjtasg=;
 b=G+nwTw8wpnUguA4/wY9mSGUJvHeLI6HW0UNOZI0CcnMbBCtQKY/UgxXSaU9pJJRZ6I
 20038Ie8wZ3KjzC3enA3vSamPunm7d7i3F1yPjNEWtYRBlMg3g5l9YrXf7F7G8uqCFWC
 5lZoyBASQNlurs8RBufVfFOEYJngWlBGATB3Y3cYWq0c2W84/KJhj3ETuSQalgoyFiV+
 f693ahRHcLypiL2uWYgEWOpw/TGV6DBxuYlHg2DeuTt8B5d1B0ZbqPpr4rBm5BVooEte
 K/DBYq2V8ggVC0icwTUtp/+YZC2rnmRAbs1z7CqurwtHlpU/AYycPeg25KxLWI9hOY2j
 dC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=omFKrMKfMKAUYuqEWFQKfmLF68dd1WCyeAVMWMjtasg=;
 b=c3byNwR+QE/vTBioNBwI8JskPmhsJ+Djs33f5zjOr8F+SL5nTFRNOUS4WfwiCZu8nv
 L1cu72K5VmMKmzegwRgVQv/xDGYUQw6/6miMegLZ9jsqEzi1v/RNixe9JTLP5I7jgP7n
 vNr6TBGBeKQjT/Z8rGykSMae1yUC+mDUy287tirYlfA0oRfPoe62SFGZUvOtZZG48xlX
 ux3+66r8bidMfD+7tOKEB/KEVv7a4R7GewQiZY5DytiYhA1DcDLexgiE5XincMfj9wjL
 //ZOIMsGXJ/xzYJnkK6wBRHxfPOTdAUT6jg/PxJz2Ea+AXrsp39fOSMPXtWPrIWDWvxF
 NMVw==
X-Gm-Message-State: AOAM530bOZcvPkaBSQhqQZAPbwlWQewZowzjA1m/8F8nQMbWS1yPF7AT
 miZYuj3ZT8lg/Mr0Ud4bfSiNqFFZxAA=
X-Google-Smtp-Source: ABdhPJwAEw2X+suAJ95ukiTka0wYZucudR+mZfAj/KbV8rX+UBpQBoe7YGCtCVm+VGSzXIHFw4bl1w==
X-Received: by 2002:adf:f8cf:: with SMTP id f15mr15221119wrq.121.1613325654917; 
 Sun, 14 Feb 2021 10:00:54 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v17sm15268445wru.85.2021.02.14.10.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:00:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 20/42] target/mips/tx79: Introduce PCGT* (Parallel Compare
 for Greater Than)
Date: Sun, 14 Feb 2021 18:58:50 +0100
Message-Id: <20210214175912.732946-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the 'Parallel Compare for Greater Than' opcodes:

 - PCGTB (Parallel Compare for Greater Than Byte)
 - PCGTH (Parallel Compare for Greater Than Halfword)
 - PCGTW (Parallel Compare for Greater Than Word)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tx79.decode      |  3 +++
 target/mips/tx79_translate.c | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
index cfe721755ca..63fbe9694bb 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
@@ -32,8 +32,11 @@ MTLO1           011100 .....  0000000000 00000 010011   @rs
 # MMI0
 
 PSUBW           011100 ..... ..... ..... 00001 001000   @rs_rt_rd
+PCGTW           011100 ..... ..... ..... 00010 001000   @rs_rt_rd
 PSUBH           011100 ..... ..... ..... 00101 001000   @rs_rt_rd
+PCGTH           011100 ..... ..... ..... 00110 001000   @rs_rt_rd
 PSUBB           011100 ..... ..... ..... 01001 001000   @rs_rt_rd
+PCGTB           011100 ..... ..... ..... 01010 001000   @rs_rt_rd
 PEXTLW          011100 ..... ..... ..... 10010 001000   @rs_rt_rd
 PEXTLH          011100 ..... ..... ..... 10110 001000   @rs_rt_rd
 PEXTLB          011100 ..... ..... ..... 11010 001000   @rs_rt_rd
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index f084faa48a7..04249b0c20a 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -327,18 +327,36 @@ static bool trans_parallel_compare(DisasContext *ctx, arg_rtype *a,
     return true;
 }
 
+/* Parallel Compare for Greater Than Byte */
+static bool trans_PCGTB(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_compare(ctx, a, TCG_COND_GE, 8);
+}
+
 /* Parallel Compare for Equal Byte */
 static bool trans_PCEQB(DisasContext *ctx, arg_rtype *a)
 {
     return trans_parallel_compare(ctx, a, TCG_COND_EQ, 8);
 }
 
+/* Parallel Compare for Greater Than Halfword */
+static bool trans_PCGTH(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_compare(ctx, a, TCG_COND_GE, 16);
+}
+
 /* Parallel Compare for Equal Halfword */
 static bool trans_PCEQH(DisasContext *ctx, arg_rtype *a)
 {
     return trans_parallel_compare(ctx, a, TCG_COND_EQ, 16);
 }
 
+/* Parallel Compare for Greater Than Word */
+static bool trans_PCGTW(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_compare(ctx, a, TCG_COND_GE, 32);
+}
+
 /* Parallel Compare for Equal Word */
 static bool trans_PCEQW(DisasContext *ctx, arg_rtype *a)
 {
-- 
2.26.2


