Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1EB6F543F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:15:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8Xi-0003qL-6N; Wed, 03 May 2023 05:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8Xc-0003jr-G5
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:12:56 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8XY-0005r8-I7
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:12:51 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f4000ec71dso1029065e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683105166; x=1685697166;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pBDt9csZMEMzirr1KFUgqo8hIPC/BF3NBiFIeY/i+7A=;
 b=kZFEoTSAqv1IoBok+05SHwQEmlr3LgLKYoucIaBAAnxIOjwsvkiDV2ilaFT06MZBbK
 7TmK5rCWmSwQCU/WpyDg7EiXCh/FflYkL9oDLi5jwBt4600yZg0rvuMy8kbxgLBmfy94
 0xvDG93b8HCliuaguu5NF+X8qjvsOTT4kr6ifG4F7ZTuWF2UbyrN/xC6lw4/v0P0AkM3
 8oHb8ILQs8cBiDdzox11Z9QUTjBIeA3R1fwgeG8q6nPe6mgJvHUNMg9IrNId3KvUJfxm
 DSyKrpJoXXV6m4xwbeG4LRjxEu8AtGn0z9V7Bbd7yJSTzK3pb+nmStPV4PX4s5hGSHe+
 fK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105166; x=1685697166;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pBDt9csZMEMzirr1KFUgqo8hIPC/BF3NBiFIeY/i+7A=;
 b=Yny4UBz++NKqLM1fbUpkpkoT8QxtKFHE8NUNWsxW6i0nuhMA9WDIScbUnR3wfW24uT
 0J0/L0qgkfgqpMdLY0NcP0nDXMU2sMiVPbAKN5OPoS7MiXPJoxiQ4gRAI/Kc9fgSacY3
 yy7QaIxoCFwoxYXHrLlCABZ2Cwa5pJpn6yEDkuvRXvBBnjNXfUW1sVlkCw//ebtv6eUr
 JH6Bfg3XArDvZYFnfkkxVU2yJEwoo0cBG7pDaQlhKMNoWReSbOtnTGgQBr6eiRNTPyG6
 +nCnOGIw8OjVNR4v8PTe4IEg0YP9GWt7PJWRpt8pbuVzQdpW+FbuscXjUQJDkSkQ0TdF
 iBWQ==
X-Gm-Message-State: AC+VfDzZ1WC0WfW1Y4M1fQ3kNYSjK9nayTE5SFMjM5lHgVqeHQ/DoXj8
 41wTyyoXzpi/y9PgqTduvjVFSQ==
X-Google-Smtp-Source: ACHHUZ7JbnRhISvCWJPx7sthSzT75lrwjvQcYFIY6n4CfjPZric+NfuKKyzbljIM/KJhH2lCh8uhZw==
X-Received: by 2002:a05:600c:2051:b0:3ed:ea48:cd92 with SMTP id
 p17-20020a05600c205100b003edea48cd92mr14798725wmg.15.1683105166493; 
 Wed, 03 May 2023 02:12:46 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a7bc7d3000000b003edef091b17sm1252710wmk.37.2023.05.03.02.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:12:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3DF351FFBC;
 Wed,  3 May 2023 10:12:45 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Helge Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 02/22] tests/docker: bump the xtensa base to debian:11-slim
Date: Wed,  3 May 2023 10:12:24 +0100
Message-Id: <20230503091244.1450613-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503091244.1450613-1-alex.bennee@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

Stretch is going out of support so things like security updates will
fail. As the toolchain itself is binary it hopefully won't mind the
underlying OS being updated.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reported-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/docker/dockerfiles/debian-xtensa-cross.docker | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/dockerfiles/debian-xtensa-cross.docker b/tests/docker/dockerfiles/debian-xtensa-cross.docker
index 082b50da19..72c25d63d9 100644
--- a/tests/docker/dockerfiles/debian-xtensa-cross.docker
+++ b/tests/docker/dockerfiles/debian-xtensa-cross.docker
@@ -5,7 +5,7 @@
 # using a prebuilt toolchains for Xtensa cores from:
 # https://github.com/foss-xtensa/toolchain/releases
 #
-FROM docker.io/library/debian:stretch-slim
+FROM docker.io/library/debian:11-slim
 
 RUN apt-get update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
-- 
2.39.2


