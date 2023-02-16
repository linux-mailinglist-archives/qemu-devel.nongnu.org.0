Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D5F698AD9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 04:02:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUT3-0003OC-AQ; Wed, 15 Feb 2023 21:57:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUSy-0003Ne-IV
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:57:49 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUSw-0005UJ-OH
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:57:48 -0500
Received: by mail-pg1-x530.google.com with SMTP id r18so399606pgr.12
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 18:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jzoBh6h+eW5YyC2mEGGgFAPiTTpJh3Si9+ZlAorRV5U=;
 b=Pl5w9+qSdp9zQZeai32JyzgTY+SsukJgIIaB9000wcPRoziThkVPIbxhVATiq9F/TA
 yHcZPbtsHcHOEKs2bLSZMzyukFU8iWMVoHgYrIpEubYcLTGWDOS9bwUHujmHqHqgEyZe
 hTzTUZJYgKTYW0pAz7tjPUzxZkGk2mXH35rJIsHx1y22ogWXGGU89Q7BwJxdBoXb+VJn
 ACqI+AZKEm9pKPgL4yQhucFywJnPOQmBbKemjPl7wEye/7LlLzmVLmPWQacKi1gkwwO/
 38i2yDhWXTcNUft2h2gpTfBA6uTgBSolFDbehyxGaWITfCWCGkRIfLeksJJOUO9V9ULJ
 tjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jzoBh6h+eW5YyC2mEGGgFAPiTTpJh3Si9+ZlAorRV5U=;
 b=noHZGBAncJ+CUYeHspeN4Nff/bByNQK1El0IykdnGZBumjbLtTUmycirVI1xynoPjk
 eIKoStCegzH4CrWBPYCWtUf7cbPecOUMDViYRdlGht1TqSazHJ0Sa5Lm94yxF5DWioUl
 0II/iy3/HQTmJOkB8XFbs8Uf63BNS3ptr4CalmnpaUeZe8IZxGqNnlY1ik21HUgMMhK9
 NBEjmOKl7k9FcxFZSU0iRmjVN6XTjTD10O3G7f3htJEPoQ/8zUwX+7IxRBRslFj42LV1
 32116KqJ5zRuBtn+/9vrQYqht5Nn+cHx6GKu+KD8VDm5yXK7WivySOrlt/fOhQlO+NVG
 Bpow==
X-Gm-Message-State: AO0yUKWvX3hXrBK8dhNCXBl7BOg2XYJo8qim6ky8TZQSOws1JdyNND6G
 h9Y9wiIktTy5kBRa630cRhgUn3L3xG87Cj1hKSk=
X-Google-Smtp-Source: AK7set/qDNhlYHZdEi2Ny2vcaBFDNJ1MyNQbkHTrKy76NfnosNSlI20uG10/KBXBf/+duI9MIW1Pqw==
X-Received: by 2002:a62:27c5:0:b0:5a8:a138:9a82 with SMTP id
 n188-20020a6227c5000000b005a8a1389a82mr3461007pfn.24.1676516265291; 
 Wed, 15 Feb 2023 18:57:45 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a62aa0e000000b005a816b7c3e8sm89655pff.24.2023.02.15.18.57.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 18:57:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/30] include/exec/memop: Add bits describing atomicity
Date: Wed, 15 Feb 2023 16:57:11 -1000
Message-Id: <20230216025739.1211680-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216025739.1211680-1-richard.henderson@linaro.org>
References: <20230216025739.1211680-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

These bits may be used to describe the precise atomicity
requirements of the guest, which may then be used to
constrain the methods by which it may be emulated by the host.

For instance, the AArch64 LDP (32-bit) instruction changes
semantics with ARMv8.4 LSE2, from

  MO_64 | MO_ATMAX_4 | MO_ATOM_IFALIGN
  (64-bits, single-copy atomic only on 4 byte units,
   nonatomic if not aligned by 4),

to

  MO_64 | MO_ATMAX_SIZE | MO_ATOM_WITHIN16
  (64-bits, single-copy atomic within a 16 byte block)

The former may be implemented with two 4 byte loads, or
a single 8 byte load if that happens to be efficient on
the host.  The latter may not, and may also require a
helper when misaligned.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memop.h | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/exec/memop.h b/include/exec/memop.h
index 25d027434a..04e4048f0b 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -81,6 +81,42 @@ typedef enum MemOp {
     MO_ALIGN_32 = 5 << MO_ASHIFT,
     MO_ALIGN_64 = 6 << MO_ASHIFT,
 
+    /*
+     * MO_ATOM_* describes that atomicity requirements of the operation:
+     * MO_ATOM_IFALIGN: the operation must be single-copy atomic if and
+     *    only if it is aligned; if unaligned there is no atomicity.
+     * MO_ATOM_NONE: the operation has no atomicity requirements.
+     * MO_ATOM_SUBALIGN: the operation is single-copy atomic by parts
+     *    by the alignment.  E.g. if the address is 0 mod 4, then each
+     *    4-byte subobject is single-copy atomic.
+     *    This is the atomicity of IBM Power and S390X processors.
+     * MO_ATOM_WITHIN16: the operation is single-copy atomic, even if it
+     *    is unaligned, so long as it does not cross a 16-byte boundary;
+     *    if it crosses a 16-byte boundary there is no atomicity.
+     *    This is the atomicity of Arm FEAT_LSE2.
+     *
+     * MO_ATMAX_* describes the maximum atomicity unit required:
+     * MO_ATMAX_SIZE: the entire operation, i.e. MO_SIZE.
+     * MO_ATMAX_[248]: units of N bytes.
+     *
+     * Note the default (i.e. 0) values are single-copy atomic to the
+     * size of the operation, if aligned.  This retains the behaviour
+     * from before these were introduced.
+     */
+    MO_ATOM_SHIFT    = 8,
+    MO_ATOM_MASK     = 0x3 << MO_ATOM_SHIFT,
+    MO_ATOM_IFALIGN  = 0 << MO_ATOM_SHIFT,
+    MO_ATOM_NONE     = 1 << MO_ATOM_SHIFT,
+    MO_ATOM_SUBALIGN = 2 << MO_ATOM_SHIFT,
+    MO_ATOM_WITHIN16 = 3 << MO_ATOM_SHIFT,
+
+    MO_ATMAX_SHIFT = 10,
+    MO_ATMAX_MASK  = 0x3 << MO_ATMAX_SHIFT,
+    MO_ATMAX_SIZE  = 0 << MO_ATMAX_SHIFT,
+    MO_ATMAX_2     = 1 << MO_ATMAX_SHIFT,
+    MO_ATMAX_4     = 2 << MO_ATMAX_SHIFT,
+    MO_ATMAX_8     = 3 << MO_ATMAX_SHIFT,
+
     /* Combinations of the above, for ease of use.  */
     MO_UB    = MO_8,
     MO_UW    = MO_16,
-- 
2.34.1


