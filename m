Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 370EA35DDF0
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 13:41:26 +0200 (CEST)
Received: from localhost ([::1]:54604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWHQ5-0007Bz-B0
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 07:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lWHMY-0005mO-K9
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 07:37:46 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:36697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lWHMW-0005Fl-U8
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 07:37:46 -0400
Received: by mail-ed1-x533.google.com with SMTP id 18so19003689edx.3
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 04:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uoroPSipsmTryj2/OedJ876MCw3ljVm6Muf6Z6RmUfM=;
 b=M39pm5/tToPrPkbPmsSQN9k2bLDVwKHQwzomfNtt0p+hUab/vOBBz8uknYqCF9vVvN
 vD74d1ezYvCYu2cT5i/OeZ3mTtxE2rASwIT9EksA7DOXlpq0wG3PyPxpXTGwFAgsMfcc
 z80GB9/fnVc2zGUjZ6nNXhAtLFVcDYVD1n8KYl8Ec8hSZjWpaBPUzjY5X7/Lix3m1VfM
 R2fBEgZH3tc0eMN/WCHNU1CHmAOJueU8BWTqBxYHy5b6OpID2q0IspsAqisfa7r2yInA
 mAcODxI1cW+wF/N0DndE/l+/VBoJ4LGBXABU7glLalmmogz/oTFMn+u494wY0vH0BdyU
 NvEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=uoroPSipsmTryj2/OedJ876MCw3ljVm6Muf6Z6RmUfM=;
 b=FJVgDHQnZN2DuifuhKnrKpDDoGJmIC1O6JWXJ5jJGWeNWV1kBpQ46M4IyQ5eMKOZmk
 Y2KKeJYrGLoPvtn+Dnnt7IEYaUf7ssOQLRZwIVnQJcbtiZufn5xrOh4sZI6d71IDHVt/
 Qbr0LZ6p4YwikIE2DNZphdESAcHgOzsCCTL3JZnvqXJlM2qBo8pTrNYMaEGBCCaaU5Wu
 wF02G8psRMVkK8TcL2RDsQ2lAjD27YqCqcGDaFn5C/vsl8moRUKb6pDUNjgvl9qS2e27
 6akGCRzCEdvMCgxppGedGq6MObPQAXaF9obHerXHiZ2OM0fwS4q3niJpH6XK7fTvzuRg
 S8XA==
X-Gm-Message-State: AOAM533usvG8iRCgElthIfy3BnAahsagylnZObm8se7WE/nZwU21Le3z
 rFPUP/V1r13Fjof9FAAwqULHpxqFKwI=
X-Google-Smtp-Source: ABdhPJyZQmtLA98IAx9VzHdqihf4NcXgd8jlkCcq/5W/K53qcDwdhg1ioSYLz3wu8mS7JGfZxQ42Hw==
X-Received: by 2002:a50:ff13:: with SMTP id a19mr30576218edu.300.1618313862717; 
 Tue, 13 Apr 2021 04:37:42 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 s17sm7640965ejx.10.2021.04.13.04.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 04:37:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] osdep: allow including qemu/osdep.h outside extern "C"
Date: Tue, 13 Apr 2021 13:37:39 +0200
Message-Id: <20210413113741.214867-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
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
Cc: peter.maydell@linaro.org, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu/osdep.h is quite special in that, despite being part of QEMU sources,
it is included by C++ source files as well.

disas/nanomips.cpp is doing so within an 'extern "C"' block, which breaks
with latest glib due to the inclusion of templates in glib.h.

These patches implement Daniel Berrangé's idea of pushing the 'extern "C"'
block within glib.h and including system headers (including glib.h,
and in fact QEMU's own glib-compat.h too) *outside* the block.

(CI has not finished running yet, but it seems encouraging).

Paolo

Paolo Bonzini (2):
  osdep: include glib-compat.h before other QEMU headers
  osdep: protect qemu/osdep.h with extern "C"

 disas/nanomips.cpp      |  2 +-
 include/qemu/compiler.h |  6 ++++++
 include/qemu/osdep.h    | 13 +++++++++++--
 3 files changed, 18 insertions(+), 3 deletions(-)

-- 
2.30.1


