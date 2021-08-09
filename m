Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9113E4950
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 17:55:38 +0200 (CEST)
Received: from localhost ([::1]:40802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD7cn-0001X7-G4
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 11:55:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mD7bh-0000dV-Qr
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 11:54:29 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:45580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mD7bg-0000uN-BO
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 11:54:29 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 l11-20020a7bcf0b0000b0290253545c2997so340110wmg.4
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 08:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4M2UWUTdig0XyeZxO+yevJznX4Lrn2aS3krGU2gEJck=;
 b=JFQgW9PXnDeiTLa+CZ6cgkRPnHF9cZHJCxQan80FfCZ27ydNAj2eXwkPvVzZjxuEOS
 0Ctk1TGEhLG/YcqZEPmUUNL5vhBbkjB7Ipg9+h/Z8KdH52p4pPvm4nr4Cwf1qt/kvpF+
 vrUH+NvpK7GqCQgMe20MJmuzxnb8pZMLDfGHpr92NJT2EGs6gprkFiehbBB2dnNG5BFC
 7J8je0g1P/XoaFeNQXiTXWPVcfCaQnXYpti97QQP49aU2WiHrVzW0CTCaLvhe/aG0+sf
 BLlINskdkWyVOE4jcmQPGMBWG0r0GYcnRYy6NqBvvOE1HITkIAOeC5+OWY55JPiDlpte
 fR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4M2UWUTdig0XyeZxO+yevJznX4Lrn2aS3krGU2gEJck=;
 b=SVoZm8yCbMecs2500j21JyXXx3Ur/eFLCRys635qRExV5O4HjzG0m62+4iAmnS17xC
 fkLQvbyZouY+BZA1jCfiDv9BsCj4vR1ccpd2YOznYRGwTpMdirgTwad9O4ORciiy0g3K
 F9Lco2lcZ0z5AVhclB/R7UcFWHP2QKRF6FqDjdc0xZLRbHZhzruEVvTdux3xnD7POVGD
 zATA4MRC5AC/ehx8dXVKmrCZVZqg9Vq8FbHUVzZ7UGY/MjqNP3sBCCTb5oT9JROycAk0
 9v8bdfiU0EjYpBCFt6M4wuFrzeJBiBCj6K+MnorwSWKr0+5FQWUDhDEen0DCqZinH2Fi
 bMAQ==
X-Gm-Message-State: AOAM533hncE/pjUqJHEv2gF9zSQpqRSVwBQsDZrENlFdp9ELwhaPjaZR
 2+zgYG2J9uUMIzyZZX6tHyopMKMusvaleg==
X-Google-Smtp-Source: ABdhPJycfdDrxbhNluwhGDnesn6sW+0ugi0r/WR5j2sd0WZHN2zOU18H3XklVGI23u0+ia4Bq8gXIQ==
X-Received: by 2002:a1c:4487:: with SMTP id r129mr33798804wma.62.1628524466613; 
 Mon, 09 Aug 2021 08:54:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d9sm9567982wrw.26.2021.08.09.08.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 08:54:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: Check lock_user result for ip_mreq_source sockopts
Date: Mon,  9 Aug 2021 16:54:24 +0100
Message-Id: <20210809155424.30968-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In do_setsockopt(), the code path for the options which take a struct
ip_mreq_source (IP_BLOCK_SOURCE, IP_UNBLOCK_SOURCE,
IP_ADD_SOURCE_MEMBERSHIP and IP_DROP_SOURCE_MEMBERSHIP) fails to
check the return value from lock_user().  Handle this in the usual
way by returning -TARGET_EFAULT.

(In practice this was probably harmless because we'd pass a NULL
pointer to setsockopt() and the kernel would then return EFAULT.)

Fixes: Coverity CID 1459987
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Compile-tested only; I don't have a test case to hand that
uses these socket options.

 linux-user/syscall.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ccd3892b2df..d2b062ea5a9 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -2121,6 +2121,9 @@ static abi_long do_setsockopt(int sockfd, int level, int optname,
                 return -TARGET_EINVAL;
 
             ip_mreq_source = lock_user(VERIFY_READ, optval_addr, optlen, 1);
+            if (!ip_mreq_source) {
+                return -TARGET_EFAULT;
+            }
             ret = get_errno(setsockopt(sockfd, level, optname, ip_mreq_source, optlen));
             unlock_user (ip_mreq_source, optval_addr, 0);
             break;
-- 
2.20.1


