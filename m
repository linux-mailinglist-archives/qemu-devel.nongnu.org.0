Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5414161019A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:27:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7mc-0002Om-JR; Thu, 27 Oct 2022 14:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7kH-0001Mk-Bs
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:36:49 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7kD-0003LD-Tz
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:36:48 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 l16-20020a05600c4f1000b003c6c0d2a445so1850502wmq.4
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TRSnrXvuAauGNSIlB6KEv6y8D1osMrZOehCLLMTb5+8=;
 b=wzG3Ka9j6KY14FbTUNyj0aXjwfNtrDBJSJMHurqm8WmJkNltFztgEx3cL0ybipJQMO
 D+tSX+0DH/JthGfSMfvEeZs7Z8FLE+1QcfbkSdY0M7n4bMmcj9zQJwWd71jB26gjoIyT
 zFbZ7/6ETTKYniAgMFlwIBykqpTNFivWJE5S0BqF03WCskdWBnrS6XrsLbzVW27Jt3VA
 wjxhvEmu0ui3bgge3HAb9BeNBufvRd9RIPVbJymO5Wboh6Be3c2BbQoV4rX0NHhRJ5bf
 Xs7YXfSl1CNgKEF32d0dHH02zEkGgVH7ZKcSb6Vu++a29wXdmMui5dPSctyoess5mESG
 hzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TRSnrXvuAauGNSIlB6KEv6y8D1osMrZOehCLLMTb5+8=;
 b=2x2AVDkeBJv9iDDomwLOMHXdu/+JlZ6ao6eb5NgJZNrp0LWNs6/HilaGBXL7ZuJU+8
 +dXtTLtxBW4QO2zA7K2ptzQUeC8IvBLP9yr0xuUTaRLFARpVmKaXlyz/Wu7j65YLiKtw
 IWstDDLBDTt5zCvyz5NTDliT87oyGbAXxhYWAuIgWoALhoqiQe68P1yNc94ApLzt6XGw
 wOmB39h3dvnC9cJ0434z87g9+lm28MEE6rq7rC9LZMrApZ2vW3ILkDiE4oqcI9YODuPL
 uXc7czcJlC5ulp8UUmuerpt73rSTodzXBP3cfM5/CsWrE2cti7FlW9jvT9kElczN5tXT
 8tCA==
X-Gm-Message-State: ACrzQf01RBRtUKxeiaUWB0WIoUskKrFTw4KUpgaDBNcZ+Cbl2ijjVq6j
 ieu+lmreMqouyRRuRv8ENHVWOg==
X-Google-Smtp-Source: AMsMyM6wf8YQZ8dIH8SB1uvjZf4Yu2sAmlq7datvvLYfpPKDijmcCgrf7tnPjK2tcXw0QZDYDwZjeA==
X-Received: by 2002:a05:600c:1c88:b0:3c6:d9a5:a083 with SMTP id
 k8-20020a05600c1c8800b003c6d9a5a083mr6867915wms.54.1666895804116; 
 Thu, 27 Oct 2022 11:36:44 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a5d4307000000b002366e3f1497sm1784015wrq.6.2022.10.27.11.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:36:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1C15B1FFC0;
 Thu, 27 Oct 2022 19:36:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v4 08/30] tests/tcg: use regular semihosting for nios2-softmmu
Date: Thu, 27 Oct 2022 19:36:14 +0100
Message-Id: <20221027183637.2772968-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027183637.2772968-1-alex.bennee@linaro.org>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The nios2 code now plugs into the common semihosting code so we can
use the same redirect invocation as the other boards. There is however
a bug raised for the fact the tests don't seem to be completing
properly and silently passing anyway:

  https://gitlab.com/qemu-project/qemu/-/issues/1258

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/nios2/Makefile.softmmu-target | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/tcg/nios2/Makefile.softmmu-target b/tests/tcg/nios2/Makefile.softmmu-target
index c3d0594a39..bc7fd55060 100644
--- a/tests/tcg/nios2/Makefile.softmmu-target
+++ b/tests/tcg/nios2/Makefile.softmmu-target
@@ -25,8 +25,7 @@ LDFLAGS += -Wl,-T$(LINK_SCRIPT) -static -nostdlib $(CRT_OBJS) -lgcc
 %: %.o $(LINK_SCRIPT) $(CRT_OBJS)
 	$(call quiet-command, $(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS), LD, $@)
 
-# FIXME: nios2 semihosting writes to stdout, not a chardev
-QEMU_OPTS = -M 10m50-ghrd,vic=on -semihosting >$@.out -kernel
+QEMU_OPTS = -M 10m50-ghrd,vic=on -semihosting-config enable=on,target=native,chardev=output -kernel
 
 memory: CFLAGS+=-DCHECK_UNALIGNED=0
 TESTS += $(MULTIARCH_TESTS)
-- 
2.34.1


