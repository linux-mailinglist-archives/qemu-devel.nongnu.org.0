Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C946BED7A
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 16:57:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdCQ7-0002l1-8h; Fri, 17 Mar 2023 11:55:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pdCQ1-0002kH-OS
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 11:55:04 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pdCQ0-0007my-5Z
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 11:55:01 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 e15-20020a17090ac20f00b0023d1b009f52so9597270pjt.2
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 08:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679068498;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TLzZJKXYe2splB34A5U/oixxtgHz8ttW964o8352g+M=;
 b=iFq5TelxZPfRltnAu+Dmvwr7vgTWi0d2oJ3+pZY7OvTSPjIw1omH/DI0O/5+dRWXfN
 2n1ihTyDfMv1fHc4W76TtB9ObFBf9yvL8UtBL0DrQHa39oAD8PLp3iyUfNZej+FYHOMA
 1iOCgOTGt+BcJCduiYT8taJYdKzFS5zrtwM3Zoa4d7a/bfGQFW0U12LwPHFES6TTT3AB
 ppBIYWA88j/5AF19iUkPFjKNjbttVP4rBDSBTP6cWjAGHwPJTsM7tnQPapJOY34hUrX0
 9AVZRqgdVmgMAVJ7Vz4rO6NsKwnGomFkcndg5vvb6M28/bhqPa4FY5iEX62GMvp3wfg6
 EoIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679068498;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TLzZJKXYe2splB34A5U/oixxtgHz8ttW964o8352g+M=;
 b=WJwfK/nNaDeJfGWQxsr1oOz6EVnoQ0zP4LSBf+71su1gkBjtT88CpZqB/AJvcT0dwz
 +4I5RmV6UDjiBLIsTEHogkilRF2y6aYiPuqzBuzAWNZ8yiSptA0XUIpdncDKITbr3Im6
 AMjZVWLGuyjykzitKWR+iiqnKXrNpFluLLl9gcjCtG/GZnPGYFjOJSZ+HRgTfOc5xkDC
 ZV1Bx2lJcQEQb1tt+MNTJ3FMZMA/Q2r+jf7ozww5RU/nNKn3ZjSYRNMB3fka7z6Jhjh4
 XaTP4yEFvBKoPMsylHOPkQwqohdAj/GhaI3r5km9wAdTSa9w4x3G061N5ZKuRPaStH1+
 x+mw==
X-Gm-Message-State: AO0yUKX8B4AHdwpaQPwTlNwf35nopU7yx8VRBscSL9xB4OERO05ILAgc
 Hm9OJ5ZzEY/7mPevhA9GEMxrwNTQFgI7cE49afQ=
X-Google-Smtp-Source: AK7set9WKz5Svow63Tagz9kVmMHp3ChH1EUab4WupDFmucBQVC8xMhpkH/yLonYihGLBWtIZs6R6jA==
X-Received: by 2002:a17:903:6ce:b0:1a0:57dd:b340 with SMTP id
 kj14-20020a17090306ce00b001a057ddb340mr6250081plb.64.1679068498172; 
 Fri, 17 Mar 2023 08:54:58 -0700 (PDT)
Received: from stoup.. (96-82-119-43-static.hfc.comcastbusiness.net.
 [96.82.119.43]) by smtp.gmail.com with ESMTPSA id
 s5-20020a656445000000b004fb3e5681cesm1668986pgv.20.2023.03.17.08.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 08:54:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PATCH v2 0/9] accel/tcg: Fix page_set_flags and related [#1528]
Date: Fri, 17 Mar 2023 08:54:46 -0700
Message-Id: <20230317155455.341843-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The primary issue is that of overflow, where "end" for the last
page of the 32-bit address space overflows to 0.  The fix is to
use "last" instead, which can always be represented.

Changes for v2:
  * Leave -R 0 unchanged; whether it's currently broken,
    or unusable by design is unchanged by this patch set.
  * Drop reserved_va -> max_reserved_va name change;
    it doesn't really make sense.

Require review:
  01-linux-user-Diagnose-misaligned-R-size.patch
  03-include-exec-Replace-reserved_va-with-max_reserve.patch
  08-accel-tcg-Pass-last-not-end-to-tb_invalidate_phys.patch


r~


Richard Henderson (9):
  linux-user: Diagnose misaligned -R size
  linux-user: Rename max_reserved_va in main
  include/exec: Replace reserved_va with max_reserved_va
  accel/tcg: Pass last not end to page_set_flags
  accel/tcg: Pass last not end to page_reset_target_data
  accel/tcg: Pass last not end to PAGE_FOR_EACH_TB
  accel/tcg: Pass last not end to page_collection_lock
  accel/tcg: Pass last not end to tb_invalidate_phys_page_range__locked
  accel/tcg: Pass last not end to tb_invalidate_phys_range

 include/exec/cpu-all.h      | 15 ++++--
 include/exec/exec-all.h     |  2 +-
 linux-user/arm/target_cpu.h |  2 +-
 accel/tcg/tb-maint.c        | 95 +++++++++++++++++++------------------
 accel/tcg/translate-all.c   |  2 +-
 accel/tcg/user-exec.c       | 25 +++++-----
 bsd-user/main.c             | 10 ++--
 bsd-user/mmap.c             | 10 ++--
 linux-user/elfload.c        | 32 +++++++------
 linux-user/main.c           | 37 ++++++++-------
 linux-user/mmap.c           | 22 ++++-----
 linux-user/syscall.c        |  4 +-
 softmmu/physmem.c           |  2 +-
 13 files changed, 135 insertions(+), 123 deletions(-)

-- 
2.34.1


