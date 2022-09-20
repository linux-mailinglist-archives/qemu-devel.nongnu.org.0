Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ECA5BE48A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 13:33:54 +0200 (CEST)
Received: from localhost ([::1]:37578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oabVh-0006EV-HJ
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 07:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYm-00012X-DL
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:01 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:38737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYk-0004qr-GR
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:32:59 -0400
Received: by mail-pf1-x42a.google.com with SMTP id a29so2324862pfk.5
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=nlrLQubH0zzQT8NxHWeyyJtYXWvWCKu12s8Ktk8w2tQ=;
 b=ftKgyd3PlC5XPMzRVRca1T6EI+6fMn/Ww5us72GqSb3RmEv4AZvWY4Tn8X4Fz7GYO6
 FKzc1AXv0O+4viqCEdi2Eyoqz3xmkwTlL4USrKyscMa1BHq4Y3AvNwE2a31QesABsmGS
 X5pY9GERrwcI9p5FRy5lx2gMfvU2Y2j+UI4W0CH1y15zbtxgKj2d8p1ufVr3wBdP9to1
 NiZknwF/s5xXDgoOBR+cOI342PO47SIMSS3G/cgteJjgZdeMcRoMkz7q95zf3XIk8p6L
 gSGSLruR7OtlBtpYHMAaOWVPw8+JQkgniQCydW667ji2JTbmB8CIwLPA6nwgoUrDBQWX
 5dEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=nlrLQubH0zzQT8NxHWeyyJtYXWvWCKu12s8Ktk8w2tQ=;
 b=NbIk0vni4DXi6iuxwUDdKtOWhB6RtmerOgoiNALB7hh/SP7kudljMDr8332F5Sj0UD
 +PC2kMKUVBYC++cW7PTBhl04aYoDMTX5gLxY2TYK1a1/zFkJ4cvRllzYpQ6skyFZXg+Y
 AGVyduUo93keAJKYQb2lh8RFYxbu9yse+9xjZ1FsK13x5wNquv6aOYVx349v8lDyqAm7
 mRbXqORuIAM9dFO05HmZQ38mm+hzR6AezCr75bcU/8XHepbNBQOthifVISm+E2unTcRT
 0zdKKcxLktzfiPOc8htVX80drWw2R/KQXz7j0pWtg9yul1sPHB3bk2ogKGDOfaG27ezr
 Iazw==
X-Gm-Message-State: ACrzQf3/Qsz48ubiDQpVbmNlQG8OTrjC59H6/Ajbs2fYoIy881HrL7vs
 ck6RjWfB6/XIJypR4WSc4YtY6uQpLkM=
X-Google-Smtp-Source: AMsMyM73Insw5mptND8kRsavJ5yKVouk+byOUbBQmpLul8jAW21PyL6jaE1fNiSX0arvDO1KuNFANg==
X-Received: by 2002:a05:6a00:1781:b0:53a:8572:4453 with SMTP id
 s1-20020a056a00178100b0053a85724453mr23578849pfg.76.1663669974560; 
 Tue, 20 Sep 2022 03:32:54 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:32:54 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 15/39] tests/qtest: libqtest: Adapt global_qtest
 declaration for win32
Date: Tue, 20 Sep 2022 18:31:35 +0800
Message-Id: <20220920103159.1865256-16-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

Commit dd2107497275 ("tests/libqtest: Use libqtest-single.h in tests that require global_qtest")
moved global_qtest to libqtest-single.h, by declaring global_qtest
attribute to be common and weak.

This trick unfortunately does not work on Windows, and building
qtest test cases results in multiple definition errors of the weak
symbol global_qtest, as Windows PE does not have the concept of
the so-called weak symbol like ELF in the *nix world.

However Windows does provide a trick to declare a variable to be
a common symbol, via __declspec(selectany) [1]. It does not provide
the "strong override weak" effect but we don't need it in our use
case anyway. So let's use it for win32.

[1] https://docs.microsoft.com/en-us/cpp/cpp/selectany

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v2:
- Use __declspec(selectany) for the common weak symbol on Windows

 tests/qtest/libqtest-single.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/libqtest-single.h b/tests/qtest/libqtest-single.h
index 4e7d0ae1dc..851724cbcb 100644
--- a/tests/qtest/libqtest-single.h
+++ b/tests/qtest/libqtest-single.h
@@ -13,7 +13,11 @@
 
 #include "libqtest.h"
 
+#ifndef _WIN32
 QTestState *global_qtest __attribute__((common, weak));
+#else
+__declspec(selectany) QTestState *global_qtest;
+#endif
 
 /**
  * qtest_start:
-- 
2.34.1


