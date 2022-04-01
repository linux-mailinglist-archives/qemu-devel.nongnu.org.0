Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBCA4EEDBA
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:03:22 +0200 (CEST)
Received: from localhost ([::1]:45640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naGvx-00014q-H1
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:03:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naGsd-0007Qe-3T
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 08:59:55 -0400
Received: from [2607:f8b0:4864:20::22d] (port=34597
 helo=mail-oi1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naGsb-00036q-FO
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 08:59:54 -0400
Received: by mail-oi1-x22d.google.com with SMTP id v75so2752665oie.1
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 05:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lHTIKlFTOyTuMO3EN5hl6x3OzHRNh+rfoK+IU3lo3bQ=;
 b=fLeiycm2oEsK9O1d/+vkn7gtS0HqLho7ekpy96fpfbfto+Xp3adwFdqUHEXpO/VmGq
 uQif6+q/u2C0831jv0vf9Px379ZaFQH75PfWZ5aiu67ViwhNrdFvfl8+TIJpI1sp7bXR
 8+QQV3ZQaR2r60iLRLRRuGjXxphto2gGQZhGIfCVDxPY/1H1j2tdAI8EFawzmRpMLbjV
 GSlkJRU78xum9QkT+LD5wC0g+lM5VWkrAsTOKfzi+pFH8BUcx19oy+TIhLDLDQVApfuP
 LzLE7/gWFjLViIyJ0UB0n/so+ZLZZ3aYb2tcRpT+4WI+pIb0vYvypyzzbAFwWCawDG8d
 o4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lHTIKlFTOyTuMO3EN5hl6x3OzHRNh+rfoK+IU3lo3bQ=;
 b=TIIuNk58jri3MrjRbf92Za0061Ns5JZURNhTFexajtHdHeGZJ88FS/rK5IFgbJ0wXr
 dcxykB/R3557stBR3MXZ9LtNAxYQrr3cy7CVNDTVw+1dztF4SHP21/4gAm/+aiq7FpBU
 ojF7dEmsk8gBCA2mrvCARMnaL0qvEeOG0MKtjmvpJv03dmXOwzdt4mF8TUhdu/8v7Hve
 jWZZCL4a+SClZrMl7qnWztOB8281fDbeNxNo/crR99Snpk9cvKNd4hZeZaL/UlIvL+r3
 kBNAUQW8fvN2sn+cD/kE7s64SwjMsOWa8+SPCg7KHeydrFlbRHIlnOZ+08/G372+zcM+
 lI1A==
X-Gm-Message-State: AOAM533LSMz2ZTd74bHrFI+q6a59bKKJTfFt5jo6HTMLJJLCFGiBOhhD
 qRIoDCv+77CNCMQ8oEKzEMK7mF8J+TtJ1mvDIKA=
X-Google-Smtp-Source: ABdhPJwPYX54Zzx4Z+3Vz3taOEAh8k+Em9SDXhjzsX7/lfeypI/ZHhB49FxG3dQMGt4l5+riWHG/aQ==
X-Received: by 2002:a05:6808:8f4:b0:2f7:20e5:1188 with SMTP id
 d20-20020a05680808f400b002f720e51188mr4525809oic.46.1648817991013; 
 Fri, 01 Apr 2022 05:59:51 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 h6-20020a9d7986000000b005ce0d5433cdsm1066665otm.15.2022.04.01.05.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 05:59:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/riscv: Annotate atomic operations
Date: Fri,  1 Apr 2022 06:59:46 -0600
Message-Id: <20220401125948.79292-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-riscv@nongnu.org, bin.meng@windriver.com, alistair.francis@wdc.com,
 palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If an atomic operation fails on RISC-V, we want to generate
a store/amo fault and not a load fault.

Annotate amo insns, so that we can recognize them after unwinding.
Transform the implementation access type to store/amo for reporting.


r~


Richard Henderson (2):
  target/riscv: Use cpu_loop_exit_restore directly from mmu faults
  target/riscv: Mark amo insns during translation

 target/riscv/cpu.h                      | 15 ++++++
 target/riscv/cpu.c                      |  3 ++
 target/riscv/cpu_helper.c               | 62 +++++++++++++++++--------
 target/riscv/translate.c                |  9 ++++
 target/riscv/insn_trans/trans_rva.c.inc | 11 ++++-
 5 files changed, 79 insertions(+), 21 deletions(-)

-- 
2.25.1


