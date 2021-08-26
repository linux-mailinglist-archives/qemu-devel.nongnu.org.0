Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7E03F8CC8
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:15:21 +0200 (CEST)
Received: from localhost ([::1]:48868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJIyF-0005WR-T7
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:15:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImz-0006AI-Pv
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:42 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:52743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImx-00007V-W0
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:41 -0400
Received: by mail-wm1-x329.google.com with SMTP id f10so2260321wml.2
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0BjkPVSUV5NOpt5gcu1p+i8xXiaDTXmQKZV/ES6sZ4M=;
 b=JrjPwr/Rt0ffFZ3LpiJ0St52SdmEicAteA0TVigkNVYezxOZ30DUsl6idN2Nz22sjM
 fthYCGhVxoeWB14oRrKLS5dXJjAxH5upg4pVEQneadY1ePYLKGfnZqk2RRbQToRzUnoO
 76zxWkq53pOBasWTkXjgrl414BB5bao4DlGvcShFhA6NmH1vuo+HvuFQiD8KmYXLV992
 c5hZd3oeWjyG359u2vLWZrilQud/gxWhjPCoXfnSUfobWdGbnL5UgpauRZW7OlXsL5bP
 WJEHvwVDLIgGO1ltsAZO+K2wREktbtYMOUlwfzRIwwH0g2d7RpKDn1hqXrIP1MR1QfV0
 LGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0BjkPVSUV5NOpt5gcu1p+i8xXiaDTXmQKZV/ES6sZ4M=;
 b=Ae9UiLpitZ0M1BzWHNkXoxgGmOaiIk2znD9v8iq9ie6s+AVYougsd6naaI9tTkv0g+
 mzKO4ZvMTF9TBw1nVzj1I+2vHmS1keCkOw2YDlT9X3LUWs1OSo3VlOc1P38p2Ri1mBzo
 beGGWwVa1IVvVoDi42aQ0R+eo4Eyq9So5sa45tCcHd8I77xsm1l9xHe4+kOgPfpfwBS2
 HSQd2/y/c4IF4GziLPo6KapqffuJUtBGxAL4NzvK1IJeOw8/sWsEUgqp4t2L8FEpmCOz
 Lya0BDsfr9Sz8OBVJIYnRfG7SficzzCxdlYEVxnTNaRvFQaF49/jZQ33Z1yIXGuK5aHh
 5+GA==
X-Gm-Message-State: AOAM532ySbik6DZ5yJziEpj+nCNGNzpPpdThVoF11+j5eUIAiDa+HB79
 JB8lx/5EscGYzo3GuF5jinc07hNzOn8J9Q==
X-Google-Smtp-Source: ABdhPJzqMppBSuwLadm/PMZENgSzJax1bCC6tXtdf5Lk293LfoqfM6ZBIfK1m1HymcpjhtLN7WrtXw==
X-Received: by 2002:a05:600c:1d11:: with SMTP id
 l17mr4624035wms.58.1629997418666; 
 Thu, 26 Aug 2021 10:03:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/37] tests/qtest/ipmi-bt-test: Zero-initialize sockaddr struct
Date: Thu, 26 Aug 2021 18:02:58 +0100
Message-Id: <20210826170307.27733-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Zero-initialize the sockaddr_in struct that we're about to fill in
and pass to bind(), to ensure we don't leave possible
implementation-defined extension fields as uninitialized garbage.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Corey Minyard <cminyard@mvista.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Message-id: 20210813150506.7768-4-peter.maydell@linaro.org
---
 tests/qtest/ipmi-bt-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/ipmi-bt-test.c b/tests/qtest/ipmi-bt-test.c
index 8492f02a9c3..19612e9405a 100644
--- a/tests/qtest/ipmi-bt-test.c
+++ b/tests/qtest/ipmi-bt-test.c
@@ -378,7 +378,7 @@ static void test_enable_irq(void)
  */
 static void open_socket(void)
 {
-    struct sockaddr_in myaddr;
+    struct sockaddr_in myaddr = {};
     socklen_t addrlen;
 
     myaddr.sin_family = AF_INET;
-- 
2.20.1


