Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3FA4B9237
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 21:22:21 +0100 (CET)
Received: from localhost ([::1]:48966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKQoc-0000mg-E6
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 15:22:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nKQX2-0000Xk-PB; Wed, 16 Feb 2022 15:04:08 -0500
Received: from [2607:f8b0:4864:20::d29] (port=34565
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nKQX1-0000Pu-2g; Wed, 16 Feb 2022 15:04:08 -0500
Received: by mail-io1-xd29.google.com with SMTP id y20so1108149iod.1;
 Wed, 16 Feb 2022 12:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZZmfXA9JJyDuc75lRpnAhhZGOGAzOWR4TXt8vKOOvUo=;
 b=THSMI/n5YMlRSvY3vZ/lcS8hfiWYtW3SQwTq1U5jeDnlIdfN3XC2pqYuFDBywFIUdU
 2JBk5ti2X5nZBtQgKKrneI3LNXfpJSAOYd3dtL7e4TtTgYVBnnhxsF2NLKbAxFimhrw0
 l8BUM5KZOli2qGPdRce5S1n3yKoSX0vM7ef0v339chbEerkSJAtI+khgoXZEO/uCYHlV
 V0YKdo8jFi9POlIXG6QbTSX3+/osmMtjTbFbg//Iehx8ie0/wOMDJ7wlQNDQc3QXMJgW
 DUnigYU7vHRiVdPasBSmib0GPSNGgG0Tbz3e1c5jJog/dGR8YhmhJfsiefmDaxCj1ICe
 qe6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZZmfXA9JJyDuc75lRpnAhhZGOGAzOWR4TXt8vKOOvUo=;
 b=1gEv1NC5FfoNXUlri4u93rnvw0Du8Ye8AUNrmiQVtuQd7qXgXZ7SWD6N3m36qCr/z0
 vFLDCT+b11Xr6Toa8t9Mr4VGpQxDkZvUpRp6Wc+f2YWMXpo5YEGYrdswFCOOXpm+rCOd
 9Aidf7wqbc7HhYs6zPNc6gkBwRaBFuAIolS/DnqxTLylOAyGmJCPwppkmrawuLuOQfoR
 VSXmqSiBE/WiKx66l+8OkIhCxv4L7Mp25xekpNzTi0gHNE0JTYI7A37cQHXc3LBxhotC
 Cmoc3tjvkWIaB+di39T944kacsTN7Q/vo6YE83E2MhABZWsNW14iW4OefcN9v3M5a8Ap
 Li0g==
X-Gm-Message-State: AOAM5319fjFvWWUVPIivcTt9F9keoUd9VQqy1f2H6f1XNNKgNZWaVdXq
 AmWXVzKJK4kJrO0xZ4JPP53Rg+J/ev3rbRe3ohE=
X-Google-Smtp-Source: ABdhPJypivMBFv+e97lNgS2OH5WMCtpSAeh/72PQ6LEAb5Ihjl2I3XGho9ZJDjCglR7YmqPikNAunA==
X-Received: by 2002:a5d:80c5:0:b0:613:88a4:ecb4 with SMTP id
 h5-20020a5d80c5000000b0061388a4ecb4mr2974057ior.130.1645041845493; 
 Wed, 16 Feb 2022 12:04:05 -0800 (PST)
Received: from rygar.pwrtc.com (mont-dyn-147-119.pwrtc.com. [205.174.147.119])
 by smtp.gmail.com with ESMTPSA id
 j14sm428902ilc.62.2022.02.16.12.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 12:04:05 -0800 (PST)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v4 3/3] tests/tcg/s390x: Tests for
 Miscellaneous-Instruction-Extensions Facility 3
Date: Wed, 16 Feb 2022 15:03:55 -0500
Message-Id: <20220216200355.128731-4-dmiller423@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220216200355.128731-1-dmiller423@gmail.com>
References: <20220216200355.128731-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=dmiller423@gmail.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.978,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, farman@linux.ibm.com,
 David Miller <dmiller423@gmail.com>, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

tests/tcg/s390x/mie3-compl.c: [N]*K instructions
tests/tcg/s390x/mie3-mvcrl.c: MVCRL instruction
tests/tcg/s390x/mie3-sel.c:  SELECT instruction

Signed-off-by: David Miller <dmiller423@gmail.com>
---
 tests/tcg/s390x/Makefile.target | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 1a7238b4eb..54e67446aa 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -1,12 +1,15 @@
 S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
 VPATH+=$(S390X_SRC)
-CFLAGS+=-march=zEC12 -m64
+CFLAGS+=-march=z15 -m64
 TESTS+=hello-s390x
 TESTS+=csst
 TESTS+=ipm
 TESTS+=exrl-trt
 TESTS+=exrl-trtr
 TESTS+=pack
+TESTS+=mie3-compl
+TESTS+=mie3-mvcrl
+TESTS+=mie3-sel
 TESTS+=mvo
 TESTS+=mvc
 TESTS+=shift
-- 
2.32.0


