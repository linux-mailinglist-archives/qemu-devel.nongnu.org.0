Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C96E5845DB
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 20:41:27 +0200 (CEST)
Received: from localhost ([::1]:56100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH8Rl-0001me-WB
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 14:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oH8Pb-00006l-10
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 14:39:07 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:34781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oH8PZ-000211-8A
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 14:39:06 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 c19-20020a17090ae11300b001f2f94ed5c6so5563970pjz.1
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 11:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D6f5sRV0SCo9+R7gXNxE07N8Dy0oFrQafBGk850asyI=;
 b=BpcoHpv7MQPiX6oBBxcb5luSATML16Mc+DR1V+SbzRv4hyVLywZYKxtEQ0aIhrRspu
 ShP9qUg1na12arcjqk6NA7YARxKFNT6o4+MNS922lBiPPhLDhTWqE0ip3KiVj4CblCOm
 X9kaTYQl8fwX4K07G39v83xO9Xx7829pEPNbYisgL5AwcLpp3BGJWQIc+f8qnXmB/RGc
 ylxy9Txhx7Wci5/u5+9SidZnvThcV9I+ibXDXkF4PVfqexeo4L4c5LdZKQoj9N2uZCA/
 52Drm+RFilJvVGhOkhqFLpFbSSYk09swWtm7zkx3cUNh3hJsbBBl6V2/+x87Ovpki82B
 YZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D6f5sRV0SCo9+R7gXNxE07N8Dy0oFrQafBGk850asyI=;
 b=G84eKoYjrFF2EJicQm0hajgu3vg95J+VtyZtXVZXb7eYILGp3bGK41RGLqHRPJAf82
 7TqIluJnfQdsI4nPcTszhK81QHUwu/8TcaxOcTdBtVbXcJED2lt6OjMJVs8ELE43eccB
 Stor5vhnjq92J0K/9VRQIu9pMv7O7zyDiFJsFJZJeWYmopwbEpwdjhuulI1l6WVs/8ql
 IfNgHr0kD0Zfs79hhvxAtq52bFvINmPBs9KxxqPC1gRxsRJVtf0YD5hh1zQRHM+6uhwO
 3YRD5je8AMUCzMpNNOULpoADs2Hfnkzj8heHMabkTNkSR0voQqjZxZsg1YWDGOje0ASB
 rI4A==
X-Gm-Message-State: ACgBeo3/dGTJiwTHyG76UkKxgDyvdqUM9sYqMuT3JiMPZeSIZUlCUBYK
 uz2JTeK6vnTki6S7c6F3+J2AoawWNGRHng==
X-Google-Smtp-Source: AA6agR46ZsQu3r4htIq6lC3Jvb0pteedmftBUngW/Jj8RV/BDrUpvh5yskCw5FEeb0f4LmZsMxuHPA==
X-Received: by 2002:a17:903:2041:b0:16d:a78a:efd9 with SMTP id
 q1-20020a170903204100b0016da78aefd9mr157769pla.71.1659033543527; 
 Thu, 28 Jul 2022 11:39:03 -0700 (PDT)
Received: from stoup.. ([2602:ae:1549:801:d1a3:8e57:d847:7607])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a170902dac100b0016c0b0fe1c6sm1744133plx.73.2022.07.28.11.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 11:39:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH] configure: Fix ppc container_cross_cc substitution
Date: Thu, 28 Jul 2022 11:39:01 -0700
Message-Id: <20220728183901.1290113-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When moving this code out of probe_target_compiler(), we failed to adjust
the variable in which the target is located, resulting in e.g.
powerpc64-linux-user-linux-gnu-gcc-10

Fixes: cd362defbbd ("tests/tcg: merge configure.sh back into main configure script")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 2c19329d58..c4c02b8438 100755
--- a/configure
+++ b/configure
@@ -2028,7 +2028,7 @@ probe_target_compiler() {
         ;;
       ppc64|ppc64le)
         container_image=debian-powerpc-test-cross
-        container_cross_prefix=powerpc${1#ppc}-linux-gnu-
+        container_cross_prefix=powerpc${target_arch#ppc}-linux-gnu-
         container_cross_cc=${container_cross_prefix}gcc-10
         ;;
       riscv64)
-- 
2.34.1


