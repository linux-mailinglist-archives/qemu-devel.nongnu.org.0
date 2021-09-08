Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BBE403822
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:43:50 +0200 (CEST)
Received: from localhost ([::1]:39942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNv3V-00035S-DC
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuS9-0006xC-MT
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:15 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:51824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuS4-0003HY-DH
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:11 -0400
Received: by mail-wm1-x32e.google.com with SMTP id y132so1292727wmc.1
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gp7mqeRq3e3ylXQpJ7SvcJk+47ZSWE8k331AQJCQtB4=;
 b=crt4fMRKvcBgxvy2W3yzBP+5h0hGg7a80f0gy2SFLpfQYtqmqpAdwpirWLbFFf1bZb
 +MMESRZyO1m7CvNWhlx0Gz3aXCdgA0bXZCT1ujYBTkpMSjDRnRzQWEvTeiMGkp0zqFkg
 k5VCzx9UmcLDgMRj1zBwxcHbe+9DUVfLLHJbp2SInf6ap5CMvPqadXtk3dRfujMOQ/8U
 bunPin1LDEXiDroC2vS56oFZHEZcMhua36IjOHVyTyAyaiPhtKsxaMjZV7gyOJWQmUCh
 u0MX82nC6EREdo/x6bhkAiRf0MzX6qhFzlZ4wvcXAA/Iwp8CTdR1l45ji7U8Po/lS/c8
 DJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Gp7mqeRq3e3ylXQpJ7SvcJk+47ZSWE8k331AQJCQtB4=;
 b=bsSvF5lyn5BkUFsc4z1HTRo278YQZVvPzLeOu7nepe3XGXDbxMorhnyYl53VZHmUSg
 aANnPxNw5tzNsBflwNDdMKb8XJEiQNtG9/O0n3jiYvEZuJqCASCEInqRp+PEX7tK0CGE
 F/XsH5swKNq1Es30UCbSuVZkgfM9T0gtDb8scZ77xVbMCFAlYS5L3bZW8P4FsGEhSIjW
 554cafKZyJmP7GLpKeqgXYDbmfOX2QydMPG4kFu6hNx70S5hO2eqJWq/RZCv3un9eNqr
 MgS9qbPewjmI68HmwP5Q02C0fG0VAdCxyN10vLJt7DLN/gUUETNbZ9uUMjnq50kUZwAL
 CDNQ==
X-Gm-Message-State: AOAM530AnBTou396OY2Plq6EI0HvbeSlZPKhX8y0zTzg64T/P08pv/mH
 CnvtA6YBKGJRmXz7gWc29BcI0mTMRIg=
X-Google-Smtp-Source: ABdhPJwmLPaNZgFQ2gm1GFEHJOOKfMrtaRNoAvHSj+QwdrQ0lyN4S3EZZASGnnZXZQgrOYhu+yjEiw==
X-Received: by 2002:a1c:e91a:: with SMTP id q26mr2030146wmc.128.1631095507206; 
 Wed, 08 Sep 2021 03:05:07 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.05.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:05:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 43/43] ebpf: only include in system emulators
Date: Wed,  8 Sep 2021 12:04:26 +0200
Message-Id: <20210908100426.264356-44-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

eBPF files are being included in user emulators.  That is useless, and
it also breaks --disable-system compilation because ebpf/trace-events is
only processed if a system emulator is included in the build.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/566
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 ebpf/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ebpf/meson.build b/ebpf/meson.build
index 9cd0635370..2dd0fd8948 100644
--- a/ebpf/meson.build
+++ b/ebpf/meson.build
@@ -1 +1 @@
-common_ss.add(when: libbpf, if_true: files('ebpf_rss.c'), if_false: files('ebpf_rss-stub.c'))
+softmmu_ss.add(when: libbpf, if_true: files('ebpf_rss.c'), if_false: files('ebpf_rss-stub.c'))
-- 
2.31.1


