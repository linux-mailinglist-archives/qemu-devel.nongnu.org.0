Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C2B401D95
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 17:29:43 +0200 (CEST)
Received: from localhost ([::1]:51540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNGZ4-0003sc-Bt
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 11:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNGWY-00085L-Iy
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:27:07 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:34795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNGWW-0006DI-W9
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:27:06 -0400
Received: by mail-ed1-x52d.google.com with SMTP id i6so10008763edu.1
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 08:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/7nrEReoQoR7zRCQbazGzZCmxeeaU0xNt1erxfpNR44=;
 b=bu/lK2+NPD/aMxtxJsKZTuekaU191rri9GlxRExvG+JorJs4yWKgTGL0d55cDqurV1
 dNM+WijorysB2UBjboo0PtiP8SbyPKhqO42D6JNRkTVvc4iM/5d+Pb56c8UdzM1v9X3T
 p/XvggS7vpCXXVo5ZYlzzxz9V8mboCZshuPm/7O9jguZ8euepoJai447DMyvRNhDVk9B
 FJ7pSqVOoKocjcVScUE8yuS/zdiqPSQAhfDHV1lY6RrKbHyBoTDoDb9Fr9gW/4ZLgUz2
 wncHVP4eGLEmTXf2W/5p73BLXgA3BD6cqxYebWsO7p66OdRSwcPFQc7mUuNoTBl3D1w7
 aKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/7nrEReoQoR7zRCQbazGzZCmxeeaU0xNt1erxfpNR44=;
 b=CCNt1aB51tOwK3RJ6vlvNjVAGPUwdUEU4e9nhw8wWFD/1OmUP2gdpRvASSmfCOrF2Z
 yNLlE5Bct568hg67Yt94+XQjLurN1Qc+jbSAHpRvzh16+QBNLt84VwTMweC9oka3HbPZ
 z3mAi5XA7KHdoFZlin6D6ociotLAZtHf+yxvelYStxElO+LNTDAoXP3EOq950mjcFSUh
 6uQrbgsweZoLbZKTrEL1vSCVNvMbFQ02E0tW3QtMSQ+RJT0l8VG+t/2OSeqArslZPKXQ
 Sc8GzvJ+3bjX78PQXiYwiCFPIGKeSTPy9ZRZUye49zyyq3xUaLkmFXM4P7KNiv0MbgNa
 wh8w==
X-Gm-Message-State: AOAM532UeoOAX0p/FTS+m8YwglTCcLJyFyPqZcfye3zjr83zarP2/fsJ
 DMoz5OXxEPWoxKCowJiABOXKAkpdgVM=
X-Google-Smtp-Source: ABdhPJwzJ5OjdQl8KHDmjBeaZqsCPgoFfOz08xKAnXAWuxjtQ9eedotBWau9xNKJOFavJE+yN7cybA==
X-Received: by 2002:a05:6402:350d:: with SMTP id
 b13mr13821193edd.1.1630942023207; 
 Mon, 06 Sep 2021 08:27:03 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 e7sm5139739edk.3.2021.09.06.08.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 08:27:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 01/36] target/i386: add missing bits to CR4_RESERVED_MASK
Date: Mon,  6 Sep 2021 17:26:57 +0200
Message-Id: <20210906152657.72046-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906152657.72046-1-pbonzini@redhat.com>
References: <20210906152657.72046-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

