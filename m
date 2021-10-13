Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEAE42BB39
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:11:59 +0200 (CEST)
Received: from localhost ([::1]:54058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maaIo-0005GN-25
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEi-0002Cv-4O
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:44 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:36387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEb-0005fs-KB
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:41 -0400
Received: by mail-ed1-x52d.google.com with SMTP id d3so7317696edp.3
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6C7qmO/3CizDFj/nvo16BV7vTh+VUkta9xLU7/ZlGCc=;
 b=XPve3E2+PEilFaGI0Zc91jzLE34rMimGFM//kySi1b58cbDxhPniQrnXCEaaykzmcp
 qcr9qa1VFzbhWWH6iyPVryf947YUUboXZng4v9jTPj1Bx5oSVMvVeRgjIQseG/wnqbLo
 QCnrN0i4v9IQPLyMpoO87egnSBuB9F9bpc2Syfwa8YQnWeBCvJv3/2++mJxE5vxIzqjZ
 6MwE/QbmeYWqIMQo9MnRtUbnzsrxILLv4ar3oO60VAS4LOLIzUNhlnIj76iP1bi5bDTB
 +IakhAfO0NXG+dgs9fGXbH0GvjuoI7SqBmW6sOWFBiaN+0kdPuuyHT2RBcCn+rhN5qk2
 xHyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6C7qmO/3CizDFj/nvo16BV7vTh+VUkta9xLU7/ZlGCc=;
 b=l6vxThZWbpoMF6VoU7LRmJa+sAiFY0VGdMAX1YE70zzcz8BFa56F0cj4vMk/hFsVUU
 iMrl+/oJk82eTuAAX9sH2xKSEKozawLOXTi31B4n7i0LrFFrFn2aYcLqBEQbz0ZuCsfN
 un+3G1KUX1IeOSLGheZ9cFOVTgiarTOZO1I7L6rlJkycJ8EbfrknTVe+1xE4xYTMnp5K
 qfVU/+ONoUWQ3i+ByTm7xdEfxsdlhSCipALoXAP4yvl8nAdFT4BS1Wg8I4SGtERSk3Zl
 F2jHjlbwVIc6bD1y2yaj0RgZ8UqdrZX6obhPcVmv25UssjgPPUHQryB+30YTSecmxjQg
 lRcg==
X-Gm-Message-State: AOAM532J+IrwzAs81qEVGsO1+g1DAlUtswnkrbSocI8pGk7pB3Q693tZ
 Mc5DqlYDeRR+kA0WRLTOWLCgMZ8BZS4=
X-Google-Smtp-Source: ABdhPJyC+hlcVRyGLOLsRkNRfqsvDA9eyR3BFmZqPw4Fw0wsHoy/JXOdOldwODb0GxACNeIjFbjPcA==
X-Received: by 2002:a17:907:c0c:: with SMTP id
 ga12mr9246750ejc.111.1634116056179; 
 Wed, 13 Oct 2021 02:07:36 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/40] target/i386/kvm: Restrict SEV stubs to x86 architecture
Date: Wed, 13 Oct 2021 11:06:57 +0200
Message-Id: <20211013090728.309365-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

SEV is x86-specific, no need to add its stub to other
architectures. Move the stub file to target/i386/kvm/.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211007161716.453984-5-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/meson.build                 | 1 -
 target/i386/kvm/meson.build           | 2 ++
 {accel => target/i386}/kvm/sev-stub.c | 0
 3 files changed, 2 insertions(+), 1 deletion(-)
 rename {accel => target/i386}/kvm/sev-stub.c (100%)

diff --git a/accel/kvm/meson.build b/accel/kvm/meson.build
index 8d219bea50..397a1fe1fd 100644
--- a/accel/kvm/meson.build
+++ b/accel/kvm/meson.build
@@ -3,6 +3,5 @@ kvm_ss.add(files(
   'kvm-all.c',
   'kvm-accel-ops.c',
 ))
-kvm_ss.add(when: 'CONFIG_SEV', if_false: files('sev-stub.c'))
 
 specific_ss.add_all(when: 'CONFIG_KVM', if_true: kvm_ss)
diff --git a/target/i386/kvm/meson.build b/target/i386/kvm/meson.build
index b1c76957c7..736df8b72e 100644
--- a/target/i386/kvm/meson.build
+++ b/target/i386/kvm/meson.build
@@ -7,6 +7,8 @@ i386_softmmu_kvm_ss.add(files(
   'kvm-cpu.c',
 ))
 
+i386_softmmu_kvm_ss.add(when: 'CONFIG_SEV', if_false: files('sev-stub.c'))
+
 i386_softmmu_ss.add(when: 'CONFIG_HYPERV', if_true: files('hyperv.c'), if_false: files('hyperv-stub.c'))
 
 i386_softmmu_ss.add_all(when: 'CONFIG_KVM', if_true: i386_softmmu_kvm_ss)
diff --git a/accel/kvm/sev-stub.c b/target/i386/kvm/sev-stub.c
similarity index 100%
rename from accel/kvm/sev-stub.c
rename to target/i386/kvm/sev-stub.c
-- 
2.31.1



