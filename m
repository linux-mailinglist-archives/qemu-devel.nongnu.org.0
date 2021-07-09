Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F82E3C2637
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:47:44 +0200 (CEST)
Received: from localhost ([::1]:59700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rn5-000242-Kp
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rdX-00054S-Ub
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:37:52 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:52771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rdU-0000Hk-Em
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:37:51 -0400
Received: by mail-wm1-x331.google.com with SMTP id g10so6492928wmh.2
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cZhvdaH08fYelUb4ULYr3OjVBurCi+anAyWCQxNLVn0=;
 b=zXl9OlZL61hQUgWw38ksuhVVQSbXFSxJ3Z7P4N0aaPrZjq0bitQ3zfeUWeKe9FjN2+
 bJhjnkSs0bvAJPjTIMWM80cX47/PY0j3MUY7Rp7posD3W6IKet5RgLKMioHhK3WYDhRq
 E3hG5bf0hHk20XJ5mZNO7WA1U5PkiScxy96P34s1GdlBzdsN5GoF+m9S/zyej9Mfe1cs
 GUoTd0HjqvBOqRU9OPFVq3oibcM5WkTDbYoz3oWIyzHIPvDFZLwiUbSyO0anjjF0k2PU
 cYwbofWnOi2ruCTO8kEf+oXb02SHd30xd3Qh/U2YpZNUZTm2nQNoR71wVXA0z5i73mg/
 q/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cZhvdaH08fYelUb4ULYr3OjVBurCi+anAyWCQxNLVn0=;
 b=F+QAMRIP2p0ssqn+hI2BHNF98lpUD+G9y7fYrn7O8ES6dCFtfrPrjZG4h4NH8OuxSi
 ez/1EcABLqNdSeu7CJZJFSf0H3HN077pRLg7gBQ4WAcUD+NGjzUSqiM7jTuoWEPpJ8Sl
 E+psNUtk6cqY3HLOY3Ktn7LDyhxk8YHAQARi5WdPLXhUBPugoDG1yxoQoHEEMsbQS4AV
 Eukkm3QZTobMTVZb9lcQaK5kOFulWUMkenxL4YNvvOzpJZCIBHyzgDPuZr0CIy27jOez
 IEH3iozeorV52X6N+o7PJzrrFVBiH0xl1q1NvYQFVKKVuAn+8R4/9M1JJe1O/KIOuDKK
 UrKg==
X-Gm-Message-State: AOAM533e7sOp1M7jJWdKtK0OVeYR2QDkz7nhtxEumqoZ4euhc/IUKee+
 6GhGOmikwxtYXjSVIauGA+zpKA==
X-Google-Smtp-Source: ABdhPJx74hW5zv7OYQvFQPR9UjAhIQ+ksgfzAiFzyL4PVevOCx0kuQvYbr4OYLIYEE+qal1VrYRCqA==
X-Received: by 2002:a05:600c:4ec8:: with SMTP id
 g8mr12602284wmq.150.1625841466366; 
 Fri, 09 Jul 2021 07:37:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p7sm5319973wrr.21.2021.07.09.07.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:37:41 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 763231FFB5;
 Fri,  9 Jul 2021 15:30:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 33/40] contrib/plugins: enable -Wall for building plugins
Date: Fri,  9 Jul 2021 15:29:58 +0100
Message-Id: <20210709143005.1554-34-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 berrange@redhat.com, kuhn.chenqun@huawei.com,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Lets spot the obvious errors.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - also $(filter -W%, $(QEMU_CFLAGS)) from the main build
---
 contrib/plugins/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index b9d7935e5e..3431bc1ce9 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -24,7 +24,7 @@ SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
 # The main QEMU uses Glib extensively so it's perfectly fine to use it
 # in plugins (which many example do).
 CFLAGS = $(GLIB_CFLAGS)
-CFLAGS += -fPIC
+CFLAGS += -fPIC -Wall $(filter -W%, $(QEMU_CFLAGS))
 CFLAGS += $(if $(findstring no-psabi,$(QEMU_CFLAGS)),-Wpsabi)
 CFLAGS += -I$(SRC_PATH)/include/qemu
 
-- 
2.20.1


