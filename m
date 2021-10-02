Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 275CC41F9DA
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 06:37:31 +0200 (CEST)
Received: from localhost ([::1]:59310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWWm9-00078v-P9
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 00:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1mWWib-0004iZ-QU
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 00:33:49 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:33421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1mWWia-0006MU-8G
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 00:33:49 -0400
Received: by mail-ed1-x52b.google.com with SMTP id p13so13675489edw.0
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 21:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=S+r1MqQzeJ/petG1H+7UvIZSfhmbpPCl6FfP4B8MYKU=;
 b=GoColk1mrBckll8ExFsXvTRqNfs4ZWwQybOVKts1r/8Yb0zffTfdzWZelzOw5k2YKd
 gWgE0nHLHDQNjBWzLVgWyo4Yr7aNOTHsgwJVELQOfxj7OzSw8pT4UbtzpC/1l/vFR7Hr
 0FgHXr8QoUFqQJILEPiIAQmyPliEK7nnh9u5cfS0piPVWDav7J+ARES5Hw4fHmmyReOV
 LSk7Z3BNLDFpDVLAXaJ3ymGlGLyBWLrDfFcfGZrz6H7HrBQKmwEgHpF4olRMdQTjNA1x
 JVKjh8t1OTj0a9t2DizEITi9tglXe2Q+clUJFHNP10jHJYIVQlJh/TUTvpYRjo5t7xbC
 SwBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=S+r1MqQzeJ/petG1H+7UvIZSfhmbpPCl6FfP4B8MYKU=;
 b=IYazRgugJIBsUWW4Qu1QfPKm50DV3NkfHGIKF3ZdhpDqeYyUu1bSYb9flBGMI7C7ny
 24KaTonLHLQGiZVRTEPQdF90cC+L2ZbZoE8az0XtkWrHWZmYyLQf4r15ljLnHoi7CwJW
 RifXiCBYVsvGNMo6HIwGmQTdpSlkh+lDA2cDYkbX0cXjWyKyDsWBsJNeheVDFaJm6Wlt
 xWDLRsd+rWvo/aB2a45jdDEc8k3d9p6E3nhEFYAou9DeYg2/FVwmLOkKkFP/3X9wUs/t
 zAiuugKzoWkBBV8hdbbTFMB4CWX4qikgPhUjNKBA4MCEZt5/IxrQI1O1kroMnQU4wYQG
 uN6g==
X-Gm-Message-State: AOAM5304CWAwK6/iiQ0iAvQhDsT4JKrMLwnrTBMkyg3M+nNjoZwD4n8V
 wa41UgV+eXdHsA6XtbgQ0omYgbXEgpHFgoJr6yU=
X-Google-Smtp-Source: ABdhPJz9TQDLZvtJ91Zd+WsQ2rssWXD8ui7aAW3Rg1HLSxHIS9FvgNuSWsHlO3mOHU0pP5xWLLbnQErI+m/h2yZlQUo=
X-Received: by 2002:a50:8206:: with SMTP id 6mr1835361edf.220.1633149226294;
 Fri, 01 Oct 2021 21:33:46 -0700 (PDT)
MIME-Version: 1.0
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 1 Oct 2021 21:33:34 -0700
Message-ID: <CAMo8BfLnjCQfjotBR4QoqwT_8WnBt9rX3oBKkLMKO5SkveU6gg@mail.gmail.com>
Subject: running TCG tests for xtensaeb
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

I've tried to use

  make check-tcg CORE=test_kc705_be CROSS_CC_GUEST=xtensa-test_kc705_be-elf-gcc

to run TCG tests for a big-endian xtensa core. I thought the following change
would be sufficient to do it:

---8<---
diff --git a/tests/tcg/xtensa/Makefile.softmmu-target
b/tests/tcg/xtensa/Makefile.softmmu-target
index 9530cac2ad95..6588388967d9 100644
--- a/tests/tcg/xtensa/Makefile.softmmu-target
+++ b/tests/tcg/xtensa/Makefile.softmmu-target
@@ -2,7 +2,7 @@
# Xtensa softmmu tests
#

-ifneq ($(TARGET_WORDS_BIGENDIAN),y)
+ifneq ($(shell $(QEMU) -cpu help | grep -w $(CORE)),)

XTENSA_SRC = $(SRC_PATH)/tests/tcg/xtensa
XTENSA_ALL = $(filter-out $(XTENSA_SRC)/linker.ld.S,$(wildcard
$(XTENSA_SRC)/*.S))
---8<---

but it turns out that tests/tcg/Makefile.target uses the following
code to load target-specific bits:

-include $(SRC_PATH)/tests/tcg/$(TARGET_NAME)/Makefile.softmmu-target

and for big-endian xtensa TARGET_NAME is xtensaeb.
However all xtensa tests are under tests/tcg/xtensa, so
Makefile.softmmu-target isn't getting loaded at all.
If I replace '$(TARGET_NAME)' with 'xtensa' in the above
line everything works as expected.

What do you think would be the best way to fix it?

-- 
Thanks.
-- Max

