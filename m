Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B767430157
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 10:57:11 +0200 (CEST)
Received: from localhost ([::1]:55540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbfV8-0005jk-DX
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 04:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbfSm-000420-5x
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 04:54:45 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:45797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbfSf-0005Dv-2M
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 04:54:43 -0400
Received: by mail-pf1-x432.google.com with SMTP id f11so6559622pfc.12
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 01:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mYiMqfk3rKHc2z5gbK/oT2ZLGMz+FR0fiZcCBwx5Le0=;
 b=MbwqkmN4zJB2hdMv7LL8aovJH55a9xMfpr+xSfnjHru35WBf8Cp3gbPuxYqdnUbfUk
 tnBYwlMX/eOKCMFjhPZO1b984apB31Op0bjThRF5OK4txUXXr5g/FFU1tKfjCqJ8GT9t
 O8Oc+63zKi5h2A7vaJ7KQjamkEeOfn/2sT9tro3HiO7zxrsmS+9RHHCD020N/UKxwezv
 Twi19W2IFr6FinhJ35Pm0fj6buNwkJ1lbADIvmUYhXE2QcKkzqGASJwGmVTs0IZDWLYC
 FPCkyGhkNC4B1wlS8McShS59euvljezMUFI76pSucgJdTPEU1DWstKkbyiPYflhK2vzI
 G80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mYiMqfk3rKHc2z5gbK/oT2ZLGMz+FR0fiZcCBwx5Le0=;
 b=xnRj0663/fq582ILteZqN5soBmDR30kc/yUiSoSgl0NoERfE1pgDq5WOHRbqEpesBN
 Y6ih5dNF2nAjDoKJRkpab9lcdukUwPg+p7JnK+xg6255WjQKiZVP1zehyU06jofgncqP
 DVc5YzT2zuZmRoGdr4UswPeVZvi0zj1vqfwkmPmBi1gcDiWCoFmOLyH7kJmpXkndDwD3
 EBOzpmAabtqWM7Ifi/Zx99yMA5vjpm+GjSRaS631RiZB4JS07Y/OSoKbF9QjJ9Zv/8tp
 EwVLLlq4NPB9HzYDbVqsZEtQ8wc5urj5sxFT9rm2ybnycDlaMHXHwDj5F0H6K7yTj1aF
 Y8hg==
X-Gm-Message-State: AOAM532ykadO0aPfMDhxQe10Io6B4gAsWk9+0xDkHMdwJcAU5+ZHs4PR
 OfHdZnclSMiN4PbMdzIKT9a2OhbDrF5+pk4i
X-Google-Smtp-Source: ABdhPJxrZJilAyzYppeXhP3/hMJv23Tx2A+3uQvQLNL+R/Gcxx+TZMxk0reaGo3Hz5CESgzpHUuw6Q==
X-Received: by 2002:a05:6a00:992:b0:44d:8981:37f6 with SMTP id
 u18-20020a056a00099200b0044d898137f6mr12066755pfg.76.1634374473351; 
 Sat, 16 Oct 2021 01:54:33 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:487:fa85:301f:cc98:b428:6b86])
 by smtp.gmail.com with ESMTPSA id p3sm7028691pfb.205.2021.10.16.01.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 01:54:33 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v4 0/2] add APIs to handle alternative sNaN propagation for
 fmax/fmin
Date: Sat, 16 Oct 2021 16:54:25 +0800
Message-Id: <20211016085428.3001501-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

In IEEE 754-2019, minNum, maxNum, minNumMag and maxNumMag are removed
and replaced with minimum, minimumNumber, maximum and maximumNumber.

minimumNumber/maximumNumber behavior for SNaN is changed to:
  * If both operands are NaNs, a QNaN is returned.
  * If either operand is a SNaN, an invalid operation exception is signaled,
    but unless both operands are NaNs, the SNaN is otherwise ignored and
    not converted to a QNaN.

This patchset add support of the above alternative sNaN propagation for
fmax/fmin, which is required by RISC-V floating-point v2.2.

Changelog:

v2:
  * Change API names from *_noprop() to *_maximum_number()
    and *_minimum_number().
  * Pick softfloat min/max APIs based on CPU privilege spec version.

Chih-Min Chao (2):
  softfloat: add APIs to handle alternative sNaN propagation for
    fmax/fmin
  target/riscv: change the api for RVF/RVD fmin/fmax

 fpu/softfloat-parts.c.inc | 25 +++++++++++++++++++++++--
 fpu/softfloat.c           | 19 +++++++++++++------
 include/fpu/softfloat.h   | 10 ++++++++++
 target/riscv/fpu_helper.c | 16 ++++++++++++----
 4 files changed, 58 insertions(+), 12 deletions(-)

--
2.25.1


