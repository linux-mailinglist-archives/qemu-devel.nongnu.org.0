Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C076137C5
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:22:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUie-0005pu-Kr; Mon, 31 Oct 2022 09:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUhy-00034Y-82
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:20:07 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUht-0005SO-GM
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:20:05 -0400
Received: by mail-wr1-x42a.google.com with SMTP id cl5so4296164wrb.9
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BP29Ki6yP/DZbhV0oFjwlgXIaAyAE9rA1CMCqvoccmU=;
 b=SUpnCi7P9kK8mOJofejpJGpzuyxNtA361HmcTdMiAiXfsm+HTFfpvl30fYoGFzeHAH
 5aVThoc2sVsPNhcw/i1Ry9myY6zl2V6tDmHHJJtepSPAWt60BKpwPvPifEjGP88oNB7U
 oD62w0AxUYkXhNQQRIaHdhcG+brSyuClHCS7dHmMTa+4YC1qvGzNAj99nCR33neGQiBc
 QnOfcWqqqcvjX/sQqJdPkp369a96hWrrD7k9AFCvLAh4OSJpVccp5AATD1hhoIMTkDu+
 SHY1C9DBlKyPmdH0kkz8/az2G65OI/HfMMU6l2G+/opOiyvqbPEqc42fuPJZPrxj1RmL
 zlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BP29Ki6yP/DZbhV0oFjwlgXIaAyAE9rA1CMCqvoccmU=;
 b=wDWd8w+eczb8fSc2X75qRWU21wv+7hvVnVTz7tddUZJ//MENN2r0Ir6yGNerg+h07s
 fdcv9RThXfqIfzNSAZQU8G7Do18Aw7cPwk1tz0lBN5Ud7wXk8PQPXa0lY81Tic6pCTdk
 Vj5OCjIjCTSTqigbCItn1kUH56/8ieSgbYDfJf5CHPoESLiau+9ApHY4bkhr9Orp7R3M
 3SsNvyjpPqtKTGka5eefD29mgAN/uXFj9bOoXKQ/9Hc12oAEW26fr1q+yJ8DCZdAxA1l
 q9HpZwmLizy3XVSStekTBUrBgkQUcAiSoaEkX6I6iUy9/zlJw8PjtmLZSdR6vZizm9QW
 HEaw==
X-Gm-Message-State: ACrzQf1zAOGZHkPBINXcFNhQxWPA6vEGveAZI9TbpPc7FGyW2xjkexKH
 f1wqjYiAseDEHVFSgN1hrk7y3A==
X-Google-Smtp-Source: AMsMyM4X9ZHTzys7ZtzlJ4knHl1k5Ac4zo1Jje8Mw1JokNSt+ECptXR0U/KHjK3tFNmBU0jANgKprQ==
X-Received: by 2002:adf:e8cb:0:b0:236:7ae2:918e with SMTP id
 k11-20020adfe8cb000000b002367ae2918emr8214680wrn.613.1667222398726; 
 Mon, 31 Oct 2022 06:19:58 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a5d5388000000b0023672104c24sm7260775wrv.74.2022.10.31.06.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:19:55 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E03331FFD4;
 Mon, 31 Oct 2022 13:10:13 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 31/31] tests/vm: use -o IdentitiesOnly=yes for ssh
Date: Mon, 31 Oct 2022 13:10:10 +0000
Message-Id: <20221031131010.682984-32-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
References: <20221031131010.682984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Ilya Leoshkevich <iii@linux.ibm.com>

When one has a lot of keys in ~/.ssh directory, the ssh command will
try all of them before the one specified on the command line, and this
may cause the remote ssh server to reject the connection due to too
many failed authentication attempts.

Fix by adding -o IdentitiesOnly=yes, which makes the ssh client
consider only the keys specified on the command line.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20221027113026.2280863-1-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221027183637.2772968-31-alex.bennee@linaro.org>

diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 4fd9af10b7..2276364c42 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -233,7 +233,8 @@ def _ssh_do(self, user, cmd, check):
                    "-o", "UserKnownHostsFile=" + os.devnull,
                    "-o",
                    "ConnectTimeout={}".format(self._config["ssh_timeout"]),
-                   "-p", str(self.ssh_port), "-i", self._ssh_tmp_key_file]
+                   "-p", str(self.ssh_port), "-i", self._ssh_tmp_key_file,
+                   "-o", "IdentitiesOnly=yes"]
         # If not in debug mode, set ssh to quiet mode to
         # avoid printing the results of commands.
         if not self.debug:
-- 
2.34.1


