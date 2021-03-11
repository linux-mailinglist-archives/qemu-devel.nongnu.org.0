Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6F133688B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 01:23:55 +0100 (CET)
Received: from localhost ([::1]:55330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK97K-0006Jl-0P
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 19:23:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95c-0004dJ-B0
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:08 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:35899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95Z-0001JD-Ia
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:08 -0500
Received: by mail-oi1-x22d.google.com with SMTP id o22so11499377oic.3
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 16:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ew8qZdu81WnFij1k26f+T5scId3naFPXGZ2aYVLbpZU=;
 b=kFkBvYI+LK4qKlnbc+hsAhBJReaMyFbeIRbRLtkjYq3N0BIPtZOMyIxE7aB/RX2GOC
 d8k5txEiogEfOpPjPESDG/lh6Dh285IhzrztpOsfIadwPOn0kU1lxIERxKiSoBeaWpU6
 6NJWyVr5RfmPMqkUkEDZ/m0RCmJ0DdHUDg4QcRpnrsI6XvJclf9zaJNTOZ2BKi3C0YNg
 SKc8Bwrum1BbU4lKZge5emlAr00L04s5n6wJlDHAtmqniBeXQcsiE232kja9mGKDYVCJ
 YidD0ZM0m8AH4VvEf7mLPF7JtxPihcdDIb1KiBD5pnoZoBW+JkWYqo/A42kBCq39VDtX
 yiHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ew8qZdu81WnFij1k26f+T5scId3naFPXGZ2aYVLbpZU=;
 b=tgGGEzJKIB5R+VbL2pc4IjnIgGG5tHy1CnW0yAYaNrfJkqg48Sw8PqrMn35DipBR8b
 hGkjgqaMfewb7Uo4EvjADwcn8RPPEms4z2JSV3juAze7EfEmNVkPPOzAP+zPNYCSODU0
 oQ7emDRHOi/300StCg+MB94sKVYBplssoyRGJyoKZ/9jQTPzS0MFzR1HRD+fZRoMssAG
 gUmSN/yYQSRPWoBI9qsjRL/w6r0fAPe0TQktmr+RNB9Yfc5qunPoDEAuSJqzziY55XKf
 IKeTNc55i4qVn7/IzrxENWIad8RCQkk3JkuqqqhcgX6+q4we+qwSZKPDSOX9l/lKZAoE
 oapg==
X-Gm-Message-State: AOAM533gBGALpf9OdBp7jplWHBAnxYCVRgRtKuaG4As4iBO6Zfg+1tA4
 a9kILgeFfWrgOqGBYRW75BYpaFPaoP/LxfIp
X-Google-Smtp-Source: ABdhPJz7PVGwhXtfJa1kZ6oBN+iBZ9V7xSXQmB0NZN77Z1Hu+eTFJHzML4XdB+9nRmJD2sYGfGyT1g==
X-Received: by 2002:aca:3507:: with SMTP id c7mr4322139oia.26.1615422123321;
 Wed, 10 Mar 2021 16:22:03 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a6sm300962otq.79.2021.03.10.16.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 16:22:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/26] meson: Split out fpu/meson.build
Date: Wed, 10 Mar 2021 18:21:33 -0600
Message-Id: <20210311002156.253711-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311002156.253711-1-richard.henderson@linaro.org>
References: <20210311002156.253711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build     | 4 +---
 fpu/meson.build | 1 +
 2 files changed, 2 insertions(+), 3 deletions(-)
 create mode 100644 fpu/meson.build

diff --git a/meson.build b/meson.build
index f884a62682..c8a5ca65e5 100644
--- a/meson.build
+++ b/meson.build
@@ -1934,9 +1934,6 @@ subdir('softmmu')
 common_ss.add(capstone)
 specific_ss.add(files('cpu.c', 'disas.c', 'gdbstub.c'), capstone)
 specific_ss.add(files('exec-vary.c'))
-specific_ss.add(when: 'CONFIG_TCG', if_true: files(
-  'fpu/softfloat.c',
-))
 
 subdir('backends')
 subdir('disas')
@@ -1946,6 +1943,7 @@ subdir('net')
 subdir('replay')
 subdir('hw')
 subdir('tcg')
+subdir('fpu')
 subdir('accel')
 subdir('plugins')
 subdir('bsd-user')
diff --git a/fpu/meson.build b/fpu/meson.build
new file mode 100644
index 0000000000..1a9992ded5
--- /dev/null
+++ b/fpu/meson.build
@@ -0,0 +1 @@
+specific_ss.add(when: 'CONFIG_TCG', if_true: files('softfloat.c'))
-- 
2.25.1


