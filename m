Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80352380CAD
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:16:47 +0200 (CEST)
Received: from localhost ([::1]:47534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZYT-0007nb-Lt
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVb-000550-8E
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:13:47 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:36831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVZ-0006sE-If
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:13:47 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id ez19so1210257qvb.3
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m5pOvmri75aSMp9jUNbeNGu2Eucnq9QWheV45DR8TJ8=;
 b=Chu/flMdl0d8e9iFiO9mzN33UuRYNa8Bo86vF1uTjLIZrm2bHQR0mWexVUji0k/xe8
 lDg554J4XLYUg4PyNi+tEPSwYakY2VfN7lLYT75nQ9vFvd9LBLx2ryT/pux+CExIhTmG
 qA6/+mzrYvsb7UxhG162kcSsJzBL9RyOTaUaicPzpDMPcEm0OC3gdvaxJHa6haYQUvLz
 le/w7IfIaOhWXx0/H+9EZGnfx6D6SH2sxh4el7wo4zXZ9nM1OJsqm2k0ZIS30Ds8j6So
 2G2uzZfxejRTTnWhQ//q01e797QLzH10nU3NYbe0pqdGuAfoWT1voNwj6e5cqN/hSngZ
 rUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m5pOvmri75aSMp9jUNbeNGu2Eucnq9QWheV45DR8TJ8=;
 b=YRnoo2goZKzENYjzew3ePvucJjQlAwlz3PEV/4shqvYZEvD16MzLcnQCV2ZuRYN75Q
 gDhEZWe1BurU5jaYJcuuWxlJ3i6I1jUrUHEBL6AlHCD91hcETW+BITMSKWWIQ4/1XDbp
 3FQZt6RXaBZZwI72d5f0aYpqiefGcrndy+RdlOrW9ptk8Y/XLnKhLZX2IQpDRxLiAFsN
 cJoDkKfDq0Zg35WVcg92So0MzpXVniEXxSglJQAs5riIKz9HA6yDBzcB/EFsEaiC/K4Z
 xuSfY2HZbqvMnUDmqp0I2AK4d3emnfn1sIpkX17758cFpb5Go5cE1p7uNrWKTP8TyLp+
 ib9A==
X-Gm-Message-State: AOAM532wv4xWpqHecXQWg9rEr+CwIDQ/UL8VxYBw4bf4MeEwr/h332No
 NUp1kWGP7d2ouRRE/WvvE/qKeUmBxAdXrP+fu+Q=
X-Google-Smtp-Source: ABdhPJzhxu8U632yiU61VCC/bzQQygoLn7bDjWeWUSOfDQhKi9ELsdAO06Ar9eCJb7J4sRH6V5haIg==
X-Received: by 2002:a0c:ee23:: with SMTP id l3mr46903013qvs.55.1621005224407; 
 Fri, 14 May 2021 08:13:44 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:13:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/50] target/i386 translate cleanups
Date: Fri, 14 May 2021 10:12:52 -0500
Message-Id: <20210514151342.384376-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2c.google.com
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
Cc: pbonzini@redhat.com, f4bug@amsat.org, ehabkost@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Supercedes: 20210228232321.322053-1-richard.henderson@linaro.org
("i386 cleanup part 3")

Claudio's prerequite patch set ("i386 cleanup part 2"), is now merged.
Version 2 here fixes some minor rebase conflicts that crept in.
Only 4 of the 50 patches have been reviewed.

Blurb from v1:
This started out to address a fixme in Claudio's patch set, then
wandered a bit, with cleanups and bug fixes in the code that I was
touching.  I stopped when I reached my original goal of removing
target/i386/tcg/user/*_stubs.c.

There are a lot of patches, but hopefully they're all small
enough to be obvious.


r~


Richard Henderson (50):
  target/i386: Split out gen_exception_gpf
  target/i386: Split out check_cpl0
  target/i386: Unify code paths for IRET
  target/i386: Split out check_vm86_iopl
  target/i386: Split out check_iopl
  target/i386: Assert PE is set for user-only
  target/i386: Assert CPL is 3 for user-only
  target/i386: Assert IOPL is 0 for user-only
  target/i386: Assert !VM86 for x86_64 user-only
  target/i386: Assert CODE32 for x86_64 user-only
  target/i386: Assert SS32 for x86_64 user-only
  target/i386: Assert CODE64 for x86_64 user-only
  target/i386: Assert LMA for x86_64 user-only
  target/i386: Assert !ADDSEG for x86_64 user-only
  target/i386: Introduce REX_PREFIX
  target/i386: Tidy REX_B, REX_X definition
  target/i386: Move rex_r into DisasContext
  target/i386: Move rex_w into DisasContext
  target/i386: Remove DisasContext.f_st as unused
  target/i386: Reduce DisasContext.flags to uint32_t
  target/i386: Reduce DisasContext.override to int8_t
  target/i386: Reduce DisasContext.prefix to uint8_t
  target/i386: Reduce DisasContext.vex_[lv] to uint8_t
  target/i386: Reduce DisasContext popl_esp_hack and rip_offset to
    uint8_t
  target/i386: Leave TF in DisasContext.flags
  target/i386: Reduce DisasContext jmp_opt, repz_opt to bool
  target/i386: Fix the comment for repz_opt
  target/i386: Reorder DisasContext members
  target/i386: Add stub generator for helper_set_dr
  target/i386: Assert !SVME for user-only
  target/i386: Assert !GUEST for user-only
  target/i386: Implement skinit in translate.c
  target/i386: Eliminate SVM helpers for user-only
  target/i386: Mark some helpers as noreturn
  target/i386: Simplify gen_debug usage
  target/i386: Tidy svm_check_intercept from tcg
  target/i386: Remove pc_start argument to gen_svm_check_intercept
  target/i386: Remove user stub for cpu_vmexit
  target/i386: Cleanup read_crN, write_crN, lmsw
  target/i386: Pass env to do_pause and do_hlt
  target/i386: Move invlpg, hlt, monitor, mwait to sysemu
  target/i386: Unify invlpg, invlpga
  target/i386: Inline user cpu_svm_check_intercept_param
  target/i386: Eliminate user stubs for read/write_crN, rd/wrmsr
  target/i386: Exit tb after wrmsr
  target/i386: Tidy gen_check_io
  target/i386: Pass in port to gen_check_io
  target/i386: Create helper_check_io
  target/i386: Move helper_check_io to sysemu
  target/i386: Remove user-only i/o stubs

 target/i386/cpu.h                    |   8 +
 target/i386/helper.h                 |  43 +-
 target/i386/tcg/helper-tcg.h         |   5 +-
 target/i386/tcg/bpt_helper.c         |   2 +-
 target/i386/tcg/excp_helper.c        |  18 +-
 target/i386/tcg/misc_helper.c        |  79 +--
 target/i386/tcg/seg_helper.c         |  43 --
 target/i386/tcg/sysemu/misc_helper.c |  52 +-
 target/i386/tcg/sysemu/seg_helper.c  |  29 +
 target/i386/tcg/sysemu/svm_helper.c  |  30 +-
 target/i386/tcg/translate.c          | 891 ++++++++++++++-------------
 target/i386/tcg/user/misc_stubs.c    |  75 ---
 target/i386/tcg/user/svm_stubs.c     |  76 ---
 target/i386/tcg/user/meson.build     |   2 -
 14 files changed, 600 insertions(+), 753 deletions(-)
 delete mode 100644 target/i386/tcg/user/misc_stubs.c
 delete mode 100644 target/i386/tcg/user/svm_stubs.c

-- 
2.25.1


