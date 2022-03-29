Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F1E4EAF06
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 16:06:13 +0200 (CEST)
Received: from localhost ([::1]:33698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZCU8-0000Mq-LH
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 10:06:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nZCOi-0004HE-DZ
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:00:38 -0400
Received: from [2a00:1450:4864:20::62b] (port=44832
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nZCOg-0001ba-JR
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:00:35 -0400
Received: by mail-ej1-x62b.google.com with SMTP id lr4so26924372ejb.11
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 07:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=392qi39pKaegU7AhHQ8M6RjycLzh3KMFd/WgeU21XDU=;
 b=mDn2VfoxQVL3DnJw3iLpnKduNcPZa/f3lHNy3IyAgPtJyHeLGxBDuTW+D6tuZjAC3F
 ZJSzU6KBVaMdnVHspXjMoMETVCErwdhj/TezPUopcf4/mRx2eRh+iyl2NXIUYN5/u0wU
 OUb85SHF57nIh/JL4MH8tI2oHd6Fpx7PPA0BN6LEHT8mSrEhCMhJuDICOEKop1RWphNf
 XwIRqiHWb64iVoToe0nAky6aZikB5R9P8AJcgZnZI+fExFk6pqZn2AszbRlZGpLCbY8F
 YSmztVC/Wr57An2wSibi6sC93/ZfYc2/Aq/2/AVelNMcmU8Flu9acBE/DWlIGsO10qhH
 lesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=392qi39pKaegU7AhHQ8M6RjycLzh3KMFd/WgeU21XDU=;
 b=TClOn+FaT7Iz8TaG8s3ncER3IhlYX4FLXkxatXXtQCqx7pOOZqfrQKVMGyHe9Pad/o
 pAPMkAFD4Yc91HfgjaCUfnM+zvT40rwK5qKItCJ10AeoQh1uXtS6l86QPzluc3G2mmvg
 N4cZMvKql5mCZVb/Ms6q8UgG8z7On+TFxpdwOv0Ylw7KT/vRBjAOHYIr7uj2YGVc0RzD
 x7G/k7qb8TG6qxj3oN/2g89H7FdcZcf/M4FvxbXu0+nEn7g2YP55a0NHpa18p0ZDiwpl
 ZA2jPxTnMwFdHhunY24bxArnsHAtB9sZcbk0TLfx4t9LpbThJITcfos7Kdcmrbet6Hdc
 c6qg==
X-Gm-Message-State: AOAM533j+RWPfu1BxPkvC9cbA3qCgj2nBysSsbDfSelQmvIctJJBR3cl
 NfAZd78jX89i5GEjUKP0jlPNX/uILbk=
X-Google-Smtp-Source: ABdhPJwUM08xXrYi/aMlVoyx3HOBfzhMFZNYM/hMylh1+KcCJJgBoE9ckTYmQ2xu1L7ZL4d2GdGQbw==
X-Received: by 2002:a17:907:7ba6:b0:6df:ee7d:10f2 with SMTP id
 ne38-20020a1709077ba600b006dfee7d10f2mr35194448ejc.98.1648562433120; 
 Tue, 29 Mar 2022 07:00:33 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:8ca6:a836:a237:fed1])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a170906165300b006a625c583b9sm7117506ejd.155.2022.03.29.07.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 07:00:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] tests/tcg: really fix path to target configuration
Date: Tue, 29 Mar 2022 16:00:27 +0200
Message-Id: <20220329140027.869953-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329140027.869953-1-pbonzini@redhat.com>
References: <20220329140027.869953-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This was attempted in commit 533b0a1a41 ("tests/tcg: Fix target-specific
Makefile variables path for user-mode", 2022-01-12) but it also used the
wrong path; default.mak is used for config/devices, not config/targets.

While at it, explain what the inclusion is about.

Cc: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/tcg/Makefile.target | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index ae8004c76e..acda5bcec2 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -32,8 +32,10 @@
 all:
 -include ../../../config-host.mak
 -include ../config-$(TARGET).mak
+
+# Get semihosting definitions for user-mode emulation
 ifeq ($(CONFIG_USER_ONLY),y)
--include $(SRC_PATH)/configs/targets/$(TARGET)/default.mak
+-include $(SRC_PATH)/configs/targets/$(TARGET).mak
 endif
 
 # for including , in command strings
-- 
2.35.1


