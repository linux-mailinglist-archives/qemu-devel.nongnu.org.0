Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF60E53ACA4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:21:53 +0200 (CEST)
Received: from localhost ([::1]:50264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwSye-0001Ni-Pc
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSrE-00022D-3p
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:14:12 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:37674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSrC-0006aQ-3W
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:14:11 -0400
Received: by mail-ed1-x52c.google.com with SMTP id v19so3302427edd.4
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 11:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i26F3+Q0n/BReGHdGsgVZCatwKSaPTC4hSNsalSbC6U=;
 b=mw3uhgR7gjbGfSOaMXVQ4pDtmmy9AP2yQlKsvAvYsSQJcYA04J1fXEWg9HKDpx689m
 C20AE8AegZ8rMQxBl2CIDFJQRsieHUrKXZq4kTJq8lcTC9sgL9j1VOLk3pyYNsang7x0
 H2f0ImlljOPvEDnTr8bOnZSAO3JtD9RF1d2PnmUGu/wD7dhAMVf6R3Qox66wb4tXgMqx
 exc1PwSJXA3/c9EhoDZjzyUHEVV5F0mJqmfFKqkWVuPpe5hAHS5zyTyiSp2RVBIN6I/I
 4rtYKNczOFCF7WU0UQqR77a6LJLhOpXp+PJQnON4MCGSoCfHfdLQhLapoT9+t/2hDtCB
 5jCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i26F3+Q0n/BReGHdGsgVZCatwKSaPTC4hSNsalSbC6U=;
 b=glbR591u4QImgvz1O/KSSxqfPhgop8fp0Fg9B12M5ZKISID00vqMMFOZRGW1rTHYhq
 Uol092N1bBz7e9NVgOk02NusRD1I26d8ZDr/w0dWdW98tpoljee8jv6MY2x4hT74XRlg
 OmWJ30aLsEpmqV0LpoIoMLx4TKXbbC3t4oaKG53voZ+8VTzaDQoKcTGLPrpADupSeB6t
 MM5t/Xig6fgWOtBWr/ef/NoKkH/QO1dNxeKAWMHtO0Bfa+HabpPR/1KVtmN1hjwXGhhg
 nNSTPpcM45Vi8kaODlDnwUIXFeeM2PZN8HgZvfoGjyHlRBkNcOapZmuilQ3EU3OFDqf0
 R5Xg==
X-Gm-Message-State: AOAM533Jx7WBC/vKwKlO5aPWvPKk6LzwlYPMNR9Xz6CpFe0t6UFezciH
 77v+eIyKeNt2SR4KCNjIuty3wQ==
X-Google-Smtp-Source: ABdhPJzKPQZHps59pzpUGod3/EWSb1ckC/rxu+32Xi7RGNclt/1zWEXCTTyn5istJXTCetZNbHNyRw==
X-Received: by 2002:aa7:cac7:0:b0:42a:b00a:eeb2 with SMTP id
 l7-20020aa7cac7000000b0042ab00aeeb2mr1128637edt.60.1654107248466; 
 Wed, 01 Jun 2022 11:14:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 r11-20020aa7d58b000000b0042df0c7deccsm1296475edq.78.2022.06.01.11.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:14:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4EC781FFC9;
 Wed,  1 Jun 2022 19:05:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 17/33] tests/tcg: correct target CPU for sparc32
Date: Wed,  1 Jun 2022 19:05:21 +0100
Message-Id: <20220601180537.2329566-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601180537.2329566-1-alex.bennee@linaro.org>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

We do not want v8plus for pure sparc32, as the difference with the V8 ABI
are only meaningful on 64-bit CPUs suh as ultrasparc; supersparc is the
best CPU to use for 32-bit.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220517092616.1272238-7-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220527153603.887929-18-alex.bennee@linaro.org>

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 691d90abac..59f2403d1a 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -70,7 +70,7 @@ fi
 : ${cross_cc_riscv64="riscv64-linux-gnu-gcc"}
 : ${cross_cc_s390x="s390x-linux-gnu-gcc"}
 : ${cross_cc_sh4="sh4-linux-gnu-gcc"}
-: ${cross_cc_cflags_sparc="-m32 -mv8plus -mcpu=ultrasparc"}
+: ${cross_cc_cflags_sparc="-m32 -mcpu=supersparc"}
 : ${cross_cc_sparc64="sparc64-linux-gnu-gcc"}
 : ${cross_cc_cflags_sparc64="-m64 -mcpu=ultrasparc"}
 : ${cross_cc_x86_64="x86_64-linux-gnu-gcc"}
-- 
2.30.2


