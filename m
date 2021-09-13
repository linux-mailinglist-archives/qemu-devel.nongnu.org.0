Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE93408AA4
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:01:43 +0200 (CEST)
Received: from localhost ([::1]:58670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPkea-00068K-5f
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:01:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkau-0002lu-IT
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:57:53 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkar-0005lL-1t
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:57:52 -0400
Received: by mail-wr1-x436.google.com with SMTP id u15so8206957wru.6
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 04:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/7nrEReoQoR7zRCQbazGzZCmxeeaU0xNt1erxfpNR44=;
 b=MLJywj489R6zX6kU0hKeVjBdhFwAfmFSmdwVIpIVSCmKJvN61hDPPWUCn1yPp9aW0Q
 c9FqnPGk7CGqNK4Ek668MjdAHTWUDxS+f3RMybdIDuxhVpFYUOqSR6EaoG5NJT2bgz8n
 Q687N6Cipp0D7GKSXqpekWG6bJpW+IrB62EOZfLnESfCpFHBzuk6W1ztW4HJjJa4a4nM
 aW6ajGTapSdXTea2XiusC3qQw2rNwxUa+Ho+mymiAuv0RkfFSKWGOKcbTvuRxjCfYviA
 GAXHLtROurGAoFgDpybFFcOFmQumUr2K+OInHRCRHVK31bSjCzgaU/PwqYzfhWefd8dG
 bEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/7nrEReoQoR7zRCQbazGzZCmxeeaU0xNt1erxfpNR44=;
 b=5bsohNBM3O5osIDvS4C/vUy8IFQY6s3wj+tlgqdZLqMNuL/icqIMm1Y9o5z8CGah+T
 3ejwFGcDchGFdADk4wKECVbSbqnACIR/aBGuLexFFtd0ZnxwD60hN9Z2px4j0ZSi/Sqd
 Q1a2kadFE9hqhxP5/RywvjCjIMaamxG4Ce2EhO8DU2mkMRE9LFt0bejX5/TMbv3Ei0RM
 EDE2fIxqlBbJ72C6ZCTHq1nQekW4+kTdZUyVsYvKLxNdpx8mmI+nYYeJH7u0RfuGcKRW
 a/bNePZpJGeAQlGWhqyuLLckNSGZ3ZrVaGRBRxFl/Z8rIvcyO9XVvdkLdnspqS2EK5BK
 +zpw==
X-Gm-Message-State: AOAM532yn8aUgfCvYdbM5+FVgdAcsZsawEb9kiwUfkBa1PE6H/Cyitpy
 C3pASv3vUP2/g8NEINbFmCh3xce1Dvg=
X-Google-Smtp-Source: ABdhPJxd6tGSyL8XGh61vt7niCCEaI/bb/Z2EsSvqg2E5W6WM0woEy5VjOL9nyQY7CmmfI45DdgBRw==
X-Received: by 2002:a5d:504f:: with SMTP id h15mr12347812wrt.69.1631534267547; 
 Mon, 13 Sep 2021 04:57:47 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n186sm6011037wme.31.2021.09.13.04.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 04:57:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/21] target/i386: add missing bits to CR4_RESERVED_MASK
Date: Mon, 13 Sep 2021 13:57:22 +0200
Message-Id: <20210913115742.533197-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913115742.533197-1-pbonzini@redhat.com>
References: <20210913115742.533197-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

Booting Fedora kernels with -cpu max hangs very early in boot. Disabling
the la57 CPUID bit fixes the problem. git bisect traced the regression to

  commit 213ff024a2f92020290296cb9dc29c2af3d4a221 (HEAD, refs/bisect/bad)
  Author: Lara Lazier <laramglazier@gmail.com>
  Date:   Wed Jul 21 17:26:50 2021 +0200

    target/i386: Added consistency checks for CR4

    All MBZ bits in CR4 must be zero. (APM2 15.5)
    Added reserved bitmask and added checks in both
    helper_vmrun and helper_write_crN.

    Signed-off-by: Lara Lazier <laramglazier@gmail.com>
    Message-Id: <20210721152651.14683-2-laramglazier@gmail.com>
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

In this commit CR4_RESERVED_MASK is missing CR4_LA57_MASK and
two others. Adding this lets Fedora kernels boot once again.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Tested-by: Richard W.M. Jones <rjones@redhat.com>
Message-Id: <20210831175033.175584-1-berrange@redhat.com>
[Removed VMXE/SMXE, matching the commit message. - Paolo]
Fixes: 213ff024a2 ("target/i386: Added consistency checks for CR4", 2021-07-22)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 6c50d3ab4f..21b33fbe2e 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -257,6 +257,7 @@ typedef enum X86Seg {
                 | CR4_DE_MASK | CR4_PSE_MASK | CR4_PAE_MASK \
                 | CR4_MCE_MASK | CR4_PGE_MASK | CR4_PCE_MASK \
                 | CR4_OSFXSR_MASK | CR4_OSXMMEXCPT_MASK |CR4_UMIP_MASK \
+                | CR4_LA57_MASK \
                 | CR4_FSGSBASE_MASK | CR4_PCIDE_MASK | CR4_OSXSAVE_MASK \
                 | CR4_SMEP_MASK | CR4_SMAP_MASK | CR4_PKE_MASK | CR4_PKS_MASK))
 
-- 
2.31.1



