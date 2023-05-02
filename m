Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E21326F4398
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:20:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptovK-0004AN-Ic; Tue, 02 May 2023 08:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoui-0003oP-Ud
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:34 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouY-0003Dy-6u
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:20 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f178da219bso35872855e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029713; x=1685621713;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MEsuCfBHixSM4VmgbeiUH0ibnY8tcjNUQGESqiCtfLg=;
 b=G8pSDcKEDPZ8k+tkeqhQ5DlARtvL2Pt9TV+AthQ8N76pktufuRmgJHq66QOL3uAjCc
 J/t/qKaNvXU8X45ppdMPCUDbTQhzSEphNpZ3p+LhIemyStBLk3BcdKBRs9DZ4VKJJzby
 YO4bX0eRz+rnHj6iTQVMM13TPafYxose7Xv0ER99m/QgaCjZLjap7HZXDYONTlgmKPfB
 BleiJXn++XKaBcD47vljQ+92+R+SRBlgqWJqOGYdNoaAouwgG5jnnMdBGGbSguJnaBYE
 33IKkKoo4JttDzSV9+dL6fr17wBQwYb3Woi4rnyTh05uCMriUPdE8TeoscBNhT9A+m0f
 bg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029713; x=1685621713;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MEsuCfBHixSM4VmgbeiUH0ibnY8tcjNUQGESqiCtfLg=;
 b=HbAbBbXYt9GkK7rmH6G/04Iwq07Xk5+jjt622R0ZbzXiInKHheaUUFVqgR/G8LG1+a
 RJPwNpiaQNHsiSnEIQe6/iFlAn0ecUzAZ4lZczNDXDzB3XdlfQAt3iGJMEyQrhcphSBe
 5Ir6Qk4sqdOhiXWk7w6CzkiGKvSKipZIoyBIwQ495hKs+DHYauvQJLyMOG0/lX4jQZcE
 9cRaAXE0jCHea1Ld2+NEXfvFq/BOCUszR0VOhF3CDCe9NslPvJFcl3bqWE1vy2y02dgn
 /7HDLiIp1NdSMuv+28mTcsIUQIHMxRgZiroOHPEySZbP6A4+cY5gyXwgjd9AsZ49pZO8
 0xOw==
X-Gm-Message-State: AC+VfDzpqD3bik1BkH9FFZc6BrtwlWocPDD0adLzC1jpmI1QISG+kvvb
 4RlMhqJgqcKJU2yxqV7CyAWjWhIimy2/Khu2UV8=
X-Google-Smtp-Source: ACHHUZ79VbWnZ1wNHNYoZ9zzN5XqQrDLBIv27yYiA6q/wuVlaFe0701+r8v3vXoLuktUDMR5qr2lIA==
X-Received: by 2002:a05:600c:224e:b0:3ea:d620:570a with SMTP id
 a14-20020a05600c224e00b003ead620570amr12774779wmm.38.1683029712851; 
 Tue, 02 May 2023 05:15:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/35] docs/about/deprecated.rst: Add "since 7.1" tag to
 dtb-kaslr-seed deprecation
Date: Tue,  2 May 2023 13:14:50 +0100
Message-Id: <20230502121459.2422303-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

In commit 5242876f37ca we deprecated the dtb-kaslr-seed property of
the virt board, but forgot the "since n.n" tag in the documentation
of this in deprecated.rst.

This deprecation note first appeared in the 7.1 release, so
retrospectively add the correct "since 7.1" annotation to it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20230420122256.1023709-1-peter.maydell@linaro.org
---
 docs/about/deprecated.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index d5eda0f566c..4c7f08803e4 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -258,8 +258,8 @@ Use the more generic event ``DEVICE_UNPLUG_GUEST_ERROR`` instead.
 System emulator machines
 ------------------------
 
-Arm ``virt`` machine ``dtb-kaslr-seed`` property
-''''''''''''''''''''''''''''''''''''''''''''''''
+Arm ``virt`` machine ``dtb-kaslr-seed`` property (since 7.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
 The ``dtb-kaslr-seed`` property on the ``virt`` board has been
 deprecated; use the new name ``dtb-randomness`` instead. The new name
-- 
2.34.1


