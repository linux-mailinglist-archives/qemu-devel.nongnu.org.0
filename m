Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC276137BC
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:20:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUiA-0004DA-9S; Mon, 31 Oct 2022 09:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUhu-00030n-QJ
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:20:03 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUhn-0005On-5Q
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:20:01 -0400
Received: by mail-wr1-x42c.google.com with SMTP id a14so15946447wru.5
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bA91MP2QN6W9BeOl6D0Gz9Ie0TrwUCWVor1t5nK6BWg=;
 b=Z2uEeEU4XxhShk7WVRDTOKQ5Kxtw74uJ1a0IqkzE8fYpsKPMOmR45sZmpp9OnaEKv1
 f5XjRX0PsuHhMX+AKtXTp4O3l7TjtgbYNiDvuahfjV0jNzlFSRReFD4La3NgQktrNAFq
 C0zxv4i8JgW4EGxztarEjyo6v4CESjz3uPVbfBV4N8/zVRkn24TnqCGcmgWEaj0n/9g+
 Z9W0VLa9tOBy1quuBDJjXqCLQjdo8Hpi3u41ZB7N7DuumI5+6CXc39g+1gw24VJtiT49
 dUBcnmSeOneyU+v5Fg0j2aBtgEB+m7RgKLEasxOVHEeYIDG2NRRW6bTnDeYJfm5mb6hE
 BjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bA91MP2QN6W9BeOl6D0Gz9Ie0TrwUCWVor1t5nK6BWg=;
 b=EO8qxVy3vnKGISUXgAqvgJUiUBQQEoy4Zmw0dG29bAN+ANMRURASJMxa/BecsjwB6o
 pLn687FiT6lH1ouYGaT3LGvsxFgUmJVFScyTM3MME4Am6yVCO2qRb4rlIM0mpGyL/rEt
 zaH5u4P/NJTaR036LqLrQFlvrGpmofIB+0md3LTl66LjfCd3Dq1WfZYBG1/tEtRKeiRa
 5VHXQXEsSNLcNxR4mA5qOtnH9XYn1yy9f1+GmZlxWzJtKyf5GlItxp7gF6rlWVgcY4ZT
 CUf6tvw8UM7OWsy2chqjF/xd3DcnOJ21eJkQQAERg9WruBnDYLqHXipUuygAzJXbGLBF
 IKgg==
X-Gm-Message-State: ACrzQf2huemWW1/J3N9zyN5GxFpUSh4g9vZ0ndjpQm9/Lfrk5MQecbF2
 drbRyRO8DAl+4HixTfUEMob3Gw==
X-Google-Smtp-Source: AMsMyM6Q+6qfD6KWhloA4QIunpbcB0KKOwQPwjrOWHxpbuvnizWZCNyH0CfwNcSDeWMjgapfSK9qMw==
X-Received: by 2002:a5d:64c3:0:b0:236:695d:39f7 with SMTP id
 f3-20020a5d64c3000000b00236695d39f7mr8365840wri.614.1667222392187; 
 Mon, 31 Oct 2022 06:19:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bv19-20020a0560001f1300b00236627c078esm7230338wrb.110.2022.10.31.06.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:19:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 98FE11FFD1;
 Mon, 31 Oct 2022 13:10:13 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PULL 28/31] contrib/plugins: enable debug on CONFIG_DEBUG_TCG
Date: Mon, 31 Oct 2022 13:10:07 +0000
Message-Id: <20221031131010.682984-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
References: <20221031131010.682984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

We used to rely on QEMU_CFLAGS to expose the debug flags but now this
is synthesised by meson and only available to the main build. Add our
own flags if we detect the build has been enabled with
CONFIG_DEBUG_TCG (which is the default for --enable-debug anyway).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221027183637.2772968-28-alex.bennee@linaro.org>

diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index df3499f4f2..23e0396687 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -29,6 +29,7 @@ SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
 CFLAGS = $(GLIB_CFLAGS)
 CFLAGS += -fPIC -Wall $(filter -W%, $(QEMU_CFLAGS))
 CFLAGS += $(if $(findstring no-psabi,$(QEMU_CFLAGS)),-Wpsabi)
+CFLAGS += $(if $(CONFIG_DEBUG_TCG), -ggdb -O0)
 CFLAGS += -I$(SRC_PATH)/include/qemu
 
 all: $(SONAMES)
-- 
2.34.1


