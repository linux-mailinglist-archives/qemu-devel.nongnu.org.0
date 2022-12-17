Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A53F464F9D4
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 16:26:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Z3f-0003N7-I2; Sat, 17 Dec 2022 10:25:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Z3d-0003Ma-AJ
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 10:25:01 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Z3b-0005Bp-Tc
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 10:25:01 -0500
Received: by mail-ej1-x632.google.com with SMTP id gh17so12536936ejb.6
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 07:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4w2rpPEp7eAU85A9eInwl5J4/wX8EbvXzKdVrXPiomQ=;
 b=duBH/ZwYsNfPpVTMgzv9wZrPgIXvRuooDQprB1m/jsW6bCFlh9tt1wcIK24fZRvt2Z
 8RUUIkOtFsI6fkvWwEiqDzyIyDjMZSlX/k3pY9EtYZ0ZqkCSwV9xXhqPKdqWZwOvl8+i
 BnovlqBO61bUg5W638BeJkOJQ685Qm67eiXNlU6DkNe4rqKdcc4t1lUBU7ZsqS0UCz1/
 zUSJbxiJes8E9pEw3s1uV5exZF9bX5CJre9IlSC/P3fBuBf3JY0X2ly8ww05LwKuYDNW
 vHYKt89g4Q3b/2RXK7WloJC6RbVTkgjQ+fZ71MBW11cGt11bCf67ZKQxQNr/rfAXqSI/
 eTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4w2rpPEp7eAU85A9eInwl5J4/wX8EbvXzKdVrXPiomQ=;
 b=eh+2leM1mlK7z6OToeS3dJ7MYGKklZtv7z207gnqjWwOFlXVMxQCPJBVgnNu3FXn42
 1rNUkVn+KMphCvYETBoJVO2Trp99Ox2Go3MkfOSkBLlL5GvZVTaeKQTa0nuVStgkIBjT
 Va5pHw0bcI9hB0ejZXr0HmKLM0OogMKsuL3mcIq0c/zJzVXJKsD5z7ACYXqjcRBaAPLz
 wd3o7L8WMWvBgcqBssGZ9uRf3XXGeMmfYm/4KgPXipDl9shqA/pFS2/EFDh9N14zU54h
 A2JcqGWkHL8wBv5/XeD6GYlOlHIZLDDqkDl5qPLmFL1baIm1nG58tEQUi+YDEdah4+1h
 JlaQ==
X-Gm-Message-State: ANoB5plMUUmVct2tQ02qH0r1jOsuyziR9iGsJuJ4VGpl5xghrqgtfc6c
 6oInP4GD7QPqDdPEnXZHnR8Y8tEVUG0VvjqtNBw=
X-Google-Smtp-Source: AA0mqf51ur/I4swI6vs9HoRX3/O4l9EfgYAZxmbOtTpcsAioZp1JYwVm44qwfr0Unet3vMKTzH+/Ew==
X-Received: by 2002:a17:906:c52:b0:78d:f457:108f with SMTP id
 t18-20020a1709060c5200b0078df457108fmr29189839ejf.76.1671290698205; 
 Sat, 17 Dec 2022 07:24:58 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ia11-20020a170907a06b00b007ae32daf4b9sm2080186ejc.106.2022.12.17.07.24.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 17 Dec 2022 07:24:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 0/5] target/s390x: Header cleanups around "cpu.h"
Date: Sat, 17 Dec 2022 16:24:49 +0100
Message-Id: <20221217152454.96388-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These patches are part of a big refactor cleanup
around "cpu.h". Most changes should be trivial IMHO.

Since v1:
- Fixed s390_pv_init() on non-KVM hosts
- Keep "exec/cpu_ldst.h" in user-emu (rth)

Philippe Mathieu-Daudé (5):
  exec/memory: Expose memory_region_access_valid()
  hw/s390x/pv: Un-inline s390_pv_init()
  hw/s390x/pv: Restrict Protected Virtualization to sysemu
  target/s390x/tcg/misc_helper: Remove unused "memory.h" include
  target/s390x/tcg/excp_helper: Restrict system headers to sysemu

 hw/s390x/pv.c                  |  4 +++-
 hw/s390x/s390-pci-inst.c       |  2 +-
 hw/s390x/s390-virtio-ccw.c     |  6 ++++--
 include/exec/memory-internal.h |  4 ----
 include/exec/memory.h          |  4 ++++
 include/hw/s390x/pv.h          | 13 -------------
 target/s390x/cpu_features.c    |  4 ++++
 target/s390x/cpu_models.c      |  4 +++-
 target/s390x/tcg/excp_helper.c |  8 ++++----
 target/s390x/tcg/misc_helper.c |  1 -
 10 files changed, 23 insertions(+), 27 deletions(-)

-- 
2.38.1


