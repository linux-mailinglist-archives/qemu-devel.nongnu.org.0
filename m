Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A39C673534
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 11:13:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIRot-0004V8-Kz; Thu, 19 Jan 2023 05:06:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRoG-00042s-Vg
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:06:21 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRoF-0005Db-FE
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:06:16 -0500
Received: by mail-wr1-x432.google.com with SMTP id r9so1323634wrw.4
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 02:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SkoelqvlvrsqhEevYhEIlMsDmCtwS6JCJdP3XdXAQaY=;
 b=DRlkFpm4Ujwik5d5delbdEAW7f3wEd9Sn4dA1gs8+gOTt1BEmEgkIPvtU4GjoV3+fY
 pI85suLacZ02B3qtWWwjbQ6k0Oua7ZL+l9OdsLcEJjSCy/WA9xpgPI3F41VlWAnXMYUv
 C5A7xWnaI49Fl9gZ141fFRAUOAx9lXlZJ90lV8TOWXZpFIJTs85SJ9epjCtZNbanEZ18
 T/sfHNTjmwcmGGr4GWkVQVz+LOP9Va5YGM3V89RXe/P0x3l+4B+Wx5q8YdwSraR0tR27
 R1FgxbS8cfH0jPaeV64aZlLD1kY66FFBZo3kuBIs0pMeBxKXnO2YbDSn7iishF9lb9q1
 lypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SkoelqvlvrsqhEevYhEIlMsDmCtwS6JCJdP3XdXAQaY=;
 b=CAZc2QGHHrQ7Lq/g/+puOp/KxwpAMaHr6JgEutLAo9/i5LYpa7jvEccAB72hVRZspF
 Ve727R3XPaNwZy1zCoCvVwKApl7zVAB1c/8nF1w7a8cq3Tc+C1Tom5mcmMwiv4NPx3Ak
 S5YjQT9bDh+OmAer2tX/g7l4hxpsW0oGxsCsRvE6oZkLrZKpn583ftVUq37WfBBfIt9y
 rBIG0unGO0uh1tOPBMt5CsSYFvYXQK0tLofpPhYWFoRkvlZLuzo14MliVw4uSj0Fn2Ds
 hxPa3ctVcec7P1jtQO8ONyGL4fXEk4OAXkNeGj5W2Mcyvnfqt0yx0KNaiK7UkiyAv7Vf
 whhw==
X-Gm-Message-State: AFqh2krCFVL3DNQpJ+AoYvLsQr8iJluDxIObku54kafhRr4TKvxima0r
 KJ92iNs50BabAgOSmz2X49wjkaCpjMcJ8kOw
X-Google-Smtp-Source: AMrXdXtFRV6Ltwk7KwW1YBEN46/o8csF+2zKeubCveTym0yzQTOjrg//mdn02u5XmK48+dmSBL8K4g==
X-Received: by 2002:a05:6000:108a:b0:2bd:e8b2:4da8 with SMTP id
 y10-20020a056000108a00b002bde8b24da8mr4462105wrw.35.1674122774481; 
 Thu, 19 Jan 2023 02:06:14 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j15-20020adfd20f000000b002be2a4b521fsm5490774wrh.45.2023.01.19.02.06.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 02:06:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 7/8] tests/qtest/boot-serial-test: Allow running with HVF
Date: Thu, 19 Jan 2023 11:05:36 +0100
Message-Id: <20230119100537.5114-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119100537.5114-1-philmd@linaro.org>
References: <20230119100537.5114-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/boot-serial-test.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index f8d0c684c2..4a2cbcf8e8 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -19,6 +19,7 @@
 
 static bool has_tcg;
 static bool has_kvm;
+static bool has_hvf;
 
 static const uint8_t bios_avr[] = {
     0x88, 0xe0,             /* ldi r24, 0x08   */
@@ -273,6 +274,9 @@ static void test_machine(const void *data)
     if (has_kvm) {
         g_string_append(cmd, "-accel kvm ");
     }
+    if (has_hvf) {
+        g_string_append(cmd, "-accel hvf ");
+    }
     g_string_append(cmd, test->extra);
 
     qts = qtest_init(cmd->str);
@@ -301,6 +305,7 @@ int main(int argc, char *argv[])
 
     has_tcg = qtest_has_accel("tcg");
     has_kvm = qtest_has_accel("kvm");
+    has_hvf = qtest_has_accel("hvf");
 
     g_test_init(&argc, &argv, NULL);
 
-- 
2.38.1


