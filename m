Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 956096AB490
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 03:14:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ0Lh-0003Dy-Gr; Sun, 05 Mar 2023 21:13:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ0Lg-0003Dg-4m
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 21:13:12 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ0Le-0005zN-EU
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 21:13:11 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so11776229pjh.0
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 18:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678068788;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=YpKGSzqdAWertsr358P7xKFALs53lceR67hobAtE4GU=;
 b=oxmj9TNKFbSWusim5jtJQHO7PBdWuk4VeFLP0F3ColnFyHc6uVkfHdmctJ3ZdLbYFJ
 muiluNqjUaOsOhLYPy5y8Vs8kPnt/GO9lNERCFkZ84ZCwnJQBNOw0vtCWP7af0SJ96ff
 aIWSnQvUOUlqZtLy/5p7a71mbic0nBpI0Ywip+GinDxq1xGbfuffLWCa9fDLTIHAk1R+
 zEHvvK6XI2GkhnGZEIxoalxZxQjIc+G193MlB9AFq6jJGvpcMGILloo23vMPnTqaUdHn
 LW9gAKJleJO0DFCjnmKVA7ad96kCo8Sbm0fekbvjXPteLojwkh73PhbUyddjXdFjnGXY
 qd/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678068788;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YpKGSzqdAWertsr358P7xKFALs53lceR67hobAtE4GU=;
 b=De4gfxaPRqtlUQ3USjIWK9FKOH4bnwqsDmVS8UyJtFWKq2IwvxxIYtmxx0o3t+m474
 Nu17N5H5VAV5yktsdvmMez9+q/k8jmGUEHWDM24A1XPHHzBsUi2XRqq+iI8XedarTsZd
 2Hiu9WB4sX6m4x9Al7yUpotMgSB5YBem3BqMWBrEQhMd1XF9tz0z80Ocr4kogllC8W4C
 syPsaHHhDfOeMwpGq1fuijiJEV3EtwW6TtNhT+AjovNwBCErl7sF+TSBtuz6igiJo7av
 s+739NNXvZePQCLxh/nnTTbqpCCy+2Qv8JFoqvj+sUZcn6TxfoMBeuANoMpx5FYp/stE
 FkvQ==
X-Gm-Message-State: AO0yUKVP6l2nY+XspURuJay1cLqzEEEAWgFr2ed4FVSnyJOXyMKlhDGm
 mp1uFhKs2UhYtYlucFdJZtipeF53J+izLdU+wb+3Yg==
X-Google-Smtp-Source: AK7set+DF1ioCxck36SUOm6MdVAGp26EmPvEwFz5ZAhUYXVtOyX4vsw2dzG/SV62zHTpoxvA5rv93w==
X-Received: by 2002:a17:90a:4d88:b0:23a:6d45:128 with SMTP id
 m8-20020a17090a4d8800b0023a6d450128mr10259584pjh.39.1678068788588; 
 Sun, 05 Mar 2023 18:13:08 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a630e12000000b005030136314dsm5048434pgl.71.2023.03.05.18.13.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 18:13:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/9] accel/tcg: Fix page_set_flags and related [#1528]
Date: Sun,  5 Mar 2023 18:12:58 -0800
Message-Id: <20230306021307.1879483-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

This requires that we adjust reserved_va as well, because of

-/*
- * There are a number of places where we assign reserved_va to a variable
- * of type abi_ulong and expect it to fit.  Avoid the last page.
- */
-#   define MAX_RESERVED_VA  (0xfffffffful & TARGET_PAGE_MASK)

and the related

-        /*
-         * reserved_va must be aligned with the host page size
-         * as it is used with mmap()
-         */
-        reserved_va = local_max_va & qemu_host_page_mask;

whereby we avoided the final (host | guest) page of the address space
because of said overflow.  With the change in representation, we can
always use UINT32_MAX as the end of the 32-bit address space.

This was observable on ppc64le (or any other 64k page host) not being
able to load any arm32 binary, because the COMMPAGE goes at 0xffff0000,
which violated that last host page problem above.

The issue is resolved in patch 4, but the rest clean up other interfaces
with the same issue.  I'm not touching any interfaces that use start+len
instead of start+end.


r~


Richard Henderson (9):
  linux-user: Diagnose incorrect -R size
  linux-user: Rename max_reserved_va in main
  include/exec: Replace reserved_va with max_reserved_va
  accel/tcg: Pass last not end to page_set_flags
  accel/tcg: Pass last not end to page_reset_target_data
  accel/tcg: Pass last not end to PAGE_FOR_EACH_TB
  accel/tcg: Pass last not end to page_collection_lock
  accel/tcg: Pass last not end to tb_invalidate_phys_page_range__locked
  accel/tcg: Pass last not end to tb_invalidate_phys_range

 include/exec/cpu-all.h      | 19 ++++++--
 include/exec/exec-all.h     |  2 +-
 linux-user/arm/target_cpu.h |  2 +-
 accel/tcg/tb-maint.c        | 95 +++++++++++++++++++------------------
 accel/tcg/translate-all.c   |  2 +-
 accel/tcg/user-exec.c       | 25 +++++-----
 bsd-user/main.c             | 18 +++----
 bsd-user/mmap.c             | 18 +++----
 bsd-user/signal.c           |  4 +-
 linux-user/elfload.c        | 47 +++++++++---------
 linux-user/main.c           | 44 +++++++++--------
 linux-user/mmap.c           | 38 +++++++--------
 linux-user/signal.c         |  4 +-
 linux-user/syscall.c        |  4 +-
 softmmu/physmem.c           |  2 +-
 target/arm/cpu.c            |  2 +-
 16 files changed, 169 insertions(+), 157 deletions(-)

-- 
2.34.1


