Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1F75FCB2E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 20:57:08 +0200 (CEST)
Received: from localhost ([::1]:53402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiguh-0005Jt-7b
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 14:57:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1oigsM-0003ey-Dz
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 14:54:42 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:43965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1oigsK-0006dZ-MD
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 14:54:42 -0400
Received: by mail-io1-xd35.google.com with SMTP id 187so14161076iov.10
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 11:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EcEn/MPEcp7Orardhffba022UeWLHLN8pp6ZchjscQE=;
 b=fI2BHMJKqzyZiLGs7PSQwmtXcioXvgmTH7G2wfmIZhHZiAFQku+TQ8JWaCrmIOSSF9
 /KubaWNOcrB+wliHVv2b9sC4MdAm1zE8o082jVfh147HehpO4H0/6HoTuXhSWIJ1Heok
 SCWJfV20Vqb41U0DTiWPZnqaauada9RnCUECasXuSsfIsgp7pHKZ0byWmpp0OS6+BvUg
 voDKUJip9ZFIrKZMaP4JCnWJQDC9MoHp4c80HLFLPatLVveu+lMuaIZyBxnudgv+4J7m
 buY1ZtfaMQP8jOH8dNn7nQVb+1IruL0+Uv3RPlJnc5qwgGnaUO4Wkk/Z5HMmtex6sjJv
 gp1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EcEn/MPEcp7Orardhffba022UeWLHLN8pp6ZchjscQE=;
 b=nWn0LL1Q+g+9wG3kj/WlMVst/oxfaW8ZSicvDqRXrD4vTGFdaagYS2E5ysZwCCPxHX
 Krm8ztwHiX/LN3dQE+EnEyAG13Lal822Oc3NvcXfsQiFglHMPsKdr2t5I7iN981KubTe
 amgHqNtnLajj2zgcHqX712bGQoiwRoPmgqNFsRvuZusNmevziRNXgBypsVLIfZH2zXWM
 0mww1Ne4fv/5BTpom5FulopPjKX2Ot+R80S3YmnVUqee7hQXyfsD6Z7mBT02J3LRpl8t
 iorqRbpUFwPEAjqo2IskoWngYf+BRqItig5GincVMr+/c/MkAtUGNunFTLoiFJy1J/ba
 OM6g==
X-Gm-Message-State: ACrzQf2LnDvdDDiFOBbgE9qAc/21qP+AiFV6vH7QpwiS3o3XKfxApTE6
 I3SzTQOLR7Qu53Gpf6T679wgTl5ugecCNQ==
X-Google-Smtp-Source: AMsMyM4jAQ8EVC8tQ1MGK3c+HDGeidKazMNDoUlRl2gjSaQ8goJru2QHpP8gUmqOmaQxOcDRY3Nzyg==
X-Received: by 2002:a05:6602:2c95:b0:6bc:c082:a2f9 with SMTP id
 i21-20020a0566022c9500b006bcc082a2f9mr889768iow.117.1665600878205; 
 Wed, 12 Oct 2022 11:54:38 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 b6-20020a029586000000b003637915c721sm6463958jai.157.2022.10.12.11.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 11:54:37 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, John Baldwin <jhb@freebsd.org>,
 Kyle Evans <kevans@freebsd.org>, Muhammad Moinur Rahman <bofh@FreeBSD.org>
Subject: [PATCH] bsd-user: Catch up with sys/param.h requirement for
 machine/pmap.h
Date: Wed, 12 Oct 2022 12:56:31 -0600
Message-Id: <20221012185631.89617-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Muhammad Moinur Rahman <bofh@FreeBSD.org>

Some versions of FreeBSD now require sys/param.h for machine/pmap.h on
x86. Include them here to meet that requirement. It does no harm on
older versions, so there's no need to #ifdef it.

Signed-off-by:  Muhammad Moinur Rahman <bofh@FreeBSD.org>
Reviewed-by:	John Baldwin <jhb@FreeBSD.org>
Signed-off-by:	Warner Losh <imp@bsdimp.com>
---
 bsd-user/host/i386/host-signal.h   | 1 +
 bsd-user/host/x86_64/host-signal.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/bsd-user/host/i386/host-signal.h b/bsd-user/host/i386/host-signal.h
index 169e61b154c..ffdfaba534a 100644
--- a/bsd-user/host/i386/host-signal.h
+++ b/bsd-user/host/i386/host-signal.h
@@ -9,6 +9,7 @@
 #ifndef I386_HOST_SIGNAL_H
 #define I386_HOST_SIGNAL_H
 
+#include <sys/param.h>
 #include <sys/ucontext.h>
 #include <machine/trap.h>
 #include <vm/pmap.h>
diff --git a/bsd-user/host/x86_64/host-signal.h b/bsd-user/host/x86_64/host-signal.h
index 47ca19f8814..32ac4e41803 100644
--- a/bsd-user/host/x86_64/host-signal.h
+++ b/bsd-user/host/x86_64/host-signal.h
@@ -9,6 +9,7 @@
 #ifndef X86_64_HOST_SIGNAL_H
 #define X86_64_HOST_SIGNAL_H
 
+#include <sys/param.h>
 #include <sys/ucontext.h>
 #include <machine/trap.h>
 #include <vm/pmap.h>
-- 
2.33.1


