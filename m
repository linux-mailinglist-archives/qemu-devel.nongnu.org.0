Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDAD6473A6
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 16:56:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3JFQ-0006UL-5U; Thu, 08 Dec 2022 10:55:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3JFN-0006U3-Kq
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 10:55:41 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3JFL-0006nh-Qu
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 10:55:41 -0500
Received: by mail-wr1-x42f.google.com with SMTP id h7so2122221wrs.6
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 07:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7A3byq1utFqojjZtid/q3Srkf2m+eyCvlQeEL4Mq9ng=;
 b=rzQUl3ASQWU2AYBZMDRTxz0qu7ilDoTvuphNiUEX/0Pd/Pa5sNTG04nOVe3CcCv8MX
 Y8RvKKOGoIk8E77EjHDboBXQwTumg8/cddZskOjJ+a89gKNbVrDCdbZX5cjmkZq4ixbc
 C/zjXwTE4MMFqELTgeGQmkCPRSY+wjN7ig/40rl5H/G/7LWr0OeyY5DlwXHHDk11llZ3
 iKjPeKS5eVTwYfC7SI5wDzMqEgOsbAqHLPdfz9R8Yga7CxXpVEE/JVg0ubJbr3pjaMVw
 yk7F5K2/UIshFjVNjcZQBnAXTfqMFvzPqtqU5/Qd/Xg8gIuXiTNnNMSWIonZJfiGb7Ro
 Lbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7A3byq1utFqojjZtid/q3Srkf2m+eyCvlQeEL4Mq9ng=;
 b=RY59cY4qfqY4f4SIFME1oT1VQbTHCzRlAPF000bJiDTbDxJSRbI/nLRIt7tcG7hiwb
 ZWTu78PLCo4U2n1P+nNj35XQNVfWK8LoCMrmiawlLuMaRPcHhGUOPnpj1zodR1T0L6hV
 uhjWkT4s8HYyhZj50wE2CUbx+2v6CUnzT+U2HMP/rql5COXj/fM2sUScknWsmGCgkcaa
 gWoDObYJejFNZapFMCgtM+X1GJyO2ztuXSykYzydpSbADBf8TLySkJHA0eZd/D40v8MM
 1rgXVEsf2HKGzy97IuWanrqVXttnveDdJErx7YnA0FcICxpVLAUFjxNVuR0+69mewzPF
 Qyng==
X-Gm-Message-State: ANoB5plHejHZJ9ycLhkldfGP/htpNBaZ169JsxPVjTe95kdcXIcxISDS
 bo7AZAedRnpFimM163BZadV3oJ1/76wHmyL0SLo=
X-Google-Smtp-Source: AA0mqf64/7Mh8ta/hWro/rT3PMne0gMDVb4GThgUC8hdMHM0EF6PvLMu7VXHVCNxj58g28+/JqNCmA==
X-Received: by 2002:adf:fe89:0:b0:242:2722:f08 with SMTP id
 l9-20020adffe89000000b0024227220f08mr1716190wrr.12.1670514937575; 
 Thu, 08 Dec 2022 07:55:37 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a5d4107000000b00242246c2f7csm22516687wrp.101.2022.12.08.07.55.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 Dec 2022 07:55:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] mailmap: Fix Stefan Weil author email
Date: Thu,  8 Dec 2022 16:55:35 +0100
Message-Id: <20221208155535.28363-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

Fix authorship of commits 266aaedc37~..ac14949821. See commit
3bd2608db7 ("maint: Add .mailmap entries for patches claiming
list authorship") for rationale.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 35dddbe27b..fad2aff5aa 100644
--- a/.mailmap
+++ b/.mailmap
@@ -45,6 +45,7 @@ Ed Swierk <eswierk@skyportsystems.com> Ed Swierk via Qemu-devel <qemu-devel@nong
 Ian McKellar <ianloic@google.com> Ian McKellar via Qemu-devel <qemu-devel@nongnu.org>
 Julia Suvorova <jusual@mail.ru> Julia Suvorova via Qemu-devel <qemu-devel@nongnu.org>
 Justin Terry (VM) <juterry@microsoft.com> Justin Terry (VM) via Qemu-devel <qemu-devel@nongnu.org>
+Stefan Weil <sw@weilnetz.de> Stefan Weil via <qemu-devel@nongnu.org>
 
 # Next, replace old addresses by a more recent one.
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com> <aleksandar.markovic@mips.com>
-- 
2.38.1


