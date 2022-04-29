Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F87514C9F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 16:20:26 +0200 (CEST)
Received: from localhost ([::1]:54738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkRTt-0008VD-SZ
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 10:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkRRs-0005fs-78
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:18:20 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:42740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkRRq-0004YQ-Hs
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:18:19 -0400
Received: by mail-ed1-x531.google.com with SMTP id z19so9228722edx.9
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 07:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v0YZFWXZvJXgxjhtdyBY6KrGRYnC6+BD1SAFyqVxXeY=;
 b=Bm0xpaj1gFwFzUJM1wJD8w74WT/I2zi8SuKXsZ27X1j3heupTf0lRblo1QYl95C3NO
 1bargTUp0NWvcp2b71oPiGbr7iYimFVrcIn5urkNVCIBvRC9ExoH97jAWFd11Bnb6QCC
 gX39qVCC4Wr0xWt5W7Ir75gQtwFfsjorexcZxuu1zPoKxT6elqLlnr4daDeEq/i6Dfl3
 RK4IcuWDxHsjt70dhlZrK+9lpuo2htzQ5epnAnqeCdyvRAyTGmk0K6w0lVEcXYM9n11W
 UAYtAOVQpppfRnacOLqwa3NvOtuwIhogWy6NkH1cnAoQ5o+GGNXF7f+M/CJp2OR48s7g
 Xoww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=v0YZFWXZvJXgxjhtdyBY6KrGRYnC6+BD1SAFyqVxXeY=;
 b=YweSldHzW5Z9J7DmN5A+E+DRP/Fb1gOUnEtJostZSrywIB/NxRSatx54hihAfYNMB/
 pUBOYwVZkTOOvoqg0HTovhaOljHOYNpCmjRS4dLRdAF9lynwOl53QA1MV6f6+Uy1AJDh
 Dt6a4Qg7gYCWZcDa5u7RuEhh8VB83EbIAWs82SXmYCzuxSMnmTS/dxk4u9j4ArMH9jaz
 jXxVkiHKjR0Oe/jdjHN1IWRBueeuNWLDWOwGzIiTU8T+nYB8Zj4dyda5ficYsRrBZpkJ
 8y71EkEGQoThaXo/antJEIaU2yWp957CeLKu1y9B7b+ddPx7InjgAs7NfMpvCJNneNtX
 sf3Q==
X-Gm-Message-State: AOAM532i+sTMgV1FUlU2yWn9XWFvxvPcsneN3r/ux4pT+Y67DhLXenO1
 7FE8Bf/3NdpS1cO80eOPNO3vf8oPTqGbOQ==
X-Google-Smtp-Source: ABdhPJw+HJo+UxpcajDVO//rLlmULlCN/kWYASOz2U2N78p7kWogSYnwxf28ynF33HE5/LkP6PDSQw==
X-Received: by 2002:a05:6402:358c:b0:426:19c0:2ee7 with SMTP id
 y12-20020a056402358c00b0042619c02ee7mr13083370edc.137.1651241896813; 
 Fri, 29 Apr 2022 07:18:16 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jz1-20020a17090775e100b006f3ef214e27sm692298ejc.141.2022.04.29.07.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 07:18:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 02/12] configure: add missing cross compiler fallbacks
Date: Fri, 29 Apr 2022 16:18:03 +0200
Message-Id: <20220429141813.328975-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429141813.328975-1-pbonzini@redhat.com>
References: <20220429141813.328975-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The arm compiler can be used for armeb, and the sparc64 compiler
can be used for sparc.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 5d136492f8..a208459ff1 100755
--- a/configure
+++ b/configure
@@ -1845,6 +1845,7 @@ fi
 : ${cross_cc_cflags_aarch64_be="-mbig-endian"}
 : ${cross_cc_alpha="alpha-linux-gnu-gcc"}
 : ${cross_cc_arm="arm-linux-gnueabihf-gcc"}
+: ${cross_cc_armeb="$cross_cc_arm"}
 : ${cross_cc_cflags_armeb="-mbig-endian"}
 : ${cross_cc_hexagon="hexagon-unknown-linux-musl-clang"}
 : ${cross_cc_cflags_hexagon="-mv67 -O2 -static"}
@@ -1867,9 +1868,10 @@ fi
 : ${cross_cc_riscv64="riscv64-linux-gnu-gcc"}
 : ${cross_cc_s390x="s390x-linux-gnu-gcc"}
 : ${cross_cc_sh4="sh4-linux-gnu-gcc"}
-: ${cross_cc_cflags_sparc="-m32 -mv8plus -mcpu=ultrasparc"}
 : ${cross_cc_sparc64="sparc64-linux-gnu-gcc"}
 : ${cross_cc_cflags_sparc64="-m64 -mcpu=ultrasparc"}
+: ${cross_cc_sparc="$cross_cc_sparc64"}
+: ${cross_cc_cflags_sparc="-m32 -mv8plus -mcpu=ultrasparc"}
 : ${cross_cc_x86_64="x86_64-linux-gnu-gcc"}
 : ${cross_cc_cflags_x86_64="-m64"}
 
-- 
2.35.1



