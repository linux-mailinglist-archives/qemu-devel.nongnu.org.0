Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3C053ACE4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:37:46 +0200 (CEST)
Received: from localhost ([::1]:47704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwTE1-0002NZ-2j
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwT0n-0005iR-3c
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:24:06 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:42715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwT0k-0007wB-MD
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:24:04 -0400
Received: by mail-ej1-x62a.google.com with SMTP id q1so5443580ejz.9
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 11:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sw2OZqRVvOz9tIkmle+PbxpD88wzm28TBbpK/4AWTv4=;
 b=kNDzNz3lLx/88IIoM3R1jkKc4NtduFyUinL0P4U5WzNDfL8K1AgKUk7iR486pwBL+T
 Al3XXwlIh3D0y2GAZDvQ5XAjmv8QBGc3W0PHFbHU9Hx7Z0lFCII6rq8ozrEjStc9aRlq
 tFQHbXGH3Iyqu7Le/5KVwykrsUsz/5OI4p5irTWeJ29CLPD+17aMLQQxldE2QcNrk0di
 GNZvhiBdZkp/T5X7uwjK0IR+wRRZzTqDVz8I+ExLJDxYHwEqCxHsa9H+9xyUN99TnNGR
 dzYXl/x9HDHgGElajIEHyZjJCDGPoCy4U55iIJBm1btES3cbjrLaAq5V7XhfXoNRNgv2
 fG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sw2OZqRVvOz9tIkmle+PbxpD88wzm28TBbpK/4AWTv4=;
 b=KoW+iSPD4n/Qh45GexDSzEfahBM0V9r6P/8gGI5mq/j6LvfZNLv+4sMj4+yBT8aU5X
 dCWu5AOAoY6IcDq0DZ37IVk8RykTlNS07xVxpnrp+Wo5/6uBmTocWN/Q1xfW5DyEw3zr
 FIhe9lT20cYCRGC3qB1sQwHvt3AXkwZi+K4pR8LaBleTWNJTfu7RaUesJJvM9g0fCI3j
 Y4B9gWYsFs/kruabyQogj16vmXC9EzYzU7a3taB3N3wnpD/XeGbWassUvEzJASbcox4r
 VU9oMavU0St3j8L+faWq3NX6Dof8RMF8TL3P4j52bixCiuQet/LnD/PXzsNlWoJOL1Fh
 NybA==
X-Gm-Message-State: AOAM533aNnPtba2Qz5ovAerFhjXt3yfpMtBxmJ300gR16L6hPxF2f7u5
 Hs2NUbmeBcGvx+8FCL6+d49t+Q==
X-Google-Smtp-Source: ABdhPJwAhAWJ5bhMW1NAtJsJQHbsXAr+C/Wb3QCrfVzzs2bWpN2nNhX2kFyOjqyXQCWFRmP0LAP+/Q==
X-Received: by 2002:a17:906:974e:b0:6f5:2d44:7e3c with SMTP id
 o14-20020a170906974e00b006f52d447e3cmr740104ejy.167.1654107840752; 
 Wed, 01 Jun 2022 11:24:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 v4-20020aa7dbc4000000b0042de38b8c49sm1339509edt.34.2022.06.01.11.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:23:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7CD0E1FFCA;
 Wed,  1 Jun 2022 19:05:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 19/33] configure: add missing cross compiler fallbacks
Date: Wed,  1 Jun 2022 19:05:23 +0100
Message-Id: <20220601180537.2329566-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601180537.2329566-1-alex.bennee@linaro.org>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
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

The arm compiler can be used for armeb, and the sparc64 compiler
can be used for sparc.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220517092616.1272238-9-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220527153603.887929-20-alex.bennee@linaro.org>

diff --git a/configure b/configure
index f91ac632e7..fbf6d39f96 100755
--- a/configure
+++ b/configure
@@ -1827,6 +1827,7 @@ fi
 : ${cross_cc_cflags_aarch64_be="-mbig-endian"}
 : ${cross_cc_alpha="alpha-linux-gnu-gcc"}
 : ${cross_cc_arm="arm-linux-gnueabihf-gcc"}
+: ${cross_cc_armeb="$cross_cc_arm"}
 : ${cross_cc_cflags_armeb="-mbig-endian"}
 : ${cross_cc_hexagon="hexagon-unknown-linux-musl-clang"}
 : ${cross_cc_cflags_hexagon="-mv67 -O2 -static"}
@@ -1849,9 +1850,10 @@ fi
 : ${cross_cc_riscv64="riscv64-linux-gnu-gcc"}
 : ${cross_cc_s390x="s390x-linux-gnu-gcc"}
 : ${cross_cc_sh4="sh4-linux-gnu-gcc"}
-: ${cross_cc_cflags_sparc="-m32 -mcpu=supersparc"}
 : ${cross_cc_sparc64="sparc64-linux-gnu-gcc"}
 : ${cross_cc_cflags_sparc64="-m64 -mcpu=ultrasparc"}
+: ${cross_cc_sparc="$cross_cc_sparc64"}
+: ${cross_cc_cflags_sparc="-m32 -mcpu=supersparc"}
 : ${cross_cc_x86_64="x86_64-linux-gnu-gcc"}
 : ${cross_cc_cflags_x86_64="-m64"}
 
-- 
2.30.2


