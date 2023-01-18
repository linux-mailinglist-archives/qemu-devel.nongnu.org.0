Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDF6671C70
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 13:45:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI7nM-0006F9-IH; Wed, 18 Jan 2023 07:44:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pI7nK-0006Eg-5I
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:43:58 -0500
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pI7nI-0006uo-MG
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:43:57 -0500
Received: by mail-ot1-x332.google.com with SMTP id
 r2-20020a9d7cc2000000b006718a7f7fbaso19591837otn.2
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 04:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V2qpvJuqPpPpTm1pzPJHiglM9YmAM6u2gDlEDU9G5yg=;
 b=naq6PdHkrq3iFeQd9pOm/NTmm5q6UITQPTDXH+geWq29pVltspGyWuG7XNucreNVqz
 /ps7XkYC0UzJLByuZ66n0zEuhrirQ2sWxnouY6vAcjAKCb/z98CKFp7h2G06xtTDEN+0
 Lxy0zeufuhjtsxTrjIh0YLFXGN2c/fZyEskYmqAA64xc+Cl3E3J8LAD/iagZq+pR3BjF
 iEJTeutXgWJfRpDpbJsx1MBSgQp66GLxPMzh3MU/uS3O+tnts5EaAMw9vmPslcEz0gOp
 oZpp65Y839E2eSsvP7Gbzb8HP4y2B/sYWutNk/lp1zAOFtafXhiMfmyJkslWTz3ddahS
 LMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V2qpvJuqPpPpTm1pzPJHiglM9YmAM6u2gDlEDU9G5yg=;
 b=eJ7F9ZgcFUkhVEjQOrF3BAED6llS4NqaGMj5Vrvdtuha2+NCpZ6DnPtkLyBsMrTmUM
 c9GW/pA9hKQZ1hk88BPZX6MRE3jUpT6n2kqh+HYy/OTmi4uHeTC9xjJ+3roKn9MLVkxC
 L8TdMz6HqPSbILyKwLWsumZ++OumsJpr6/t+1FSsU/lELXeuZb1YacjgGewJNrBaJztG
 2tJCgzZD55UrbaeLOtOjnHFzKl/IW0yXuW8E58ZWQMeBYePCUQ46K2KuQ3L5OADc9Ay9
 lYOR7yg0dbPvmlp3pDBXiEoy46976+doD1Pjk1hE/8rBbXzdo9PIoKUpPXwwUPlPnTnE
 1+eQ==
X-Gm-Message-State: AFqh2krR9c+wnh7erk1BQiHCARVhg7pyVhH8jPGtZfLLazdv55mfdq/W
 Z6AlW4wrdI5VBnrKWRNSYgJU7nF97M6a53yHsfM=
X-Google-Smtp-Source: AMrXdXsni4s3TSCijdX8rQZI7nB0cRmPpTKsEu52QcgggJxDbO3ykvu03JLfzrCFn7sI4HkKQysddQ==
X-Received: by 2002:a9d:62d0:0:b0:670:83e9:5b90 with SMTP id
 z16-20020a9d62d0000000b0067083e95b90mr3332985otk.37.1674045835056; 
 Wed, 18 Jan 2023 04:43:55 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 cb2-20020a056830618200b0068460566f4bsm18158432otb.30.2023.01.18.04.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 04:43:54 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 0/3] avocado_qemu: allow cross-arch tests 
Date: Wed, 18 Jan 2023 09:43:45 -0300
Message-Id: <20230118124348.364771-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x332.google.com
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

Hi,

In these changes I've introduced two new avocado env variables to allow
users to run 'check-avocado' with different archs and machines in tests
that doesn't set any arch/machine to run with.

This is useful for archs that doesn't have abundance of real hardware
available (e.g. RISC-V), meaning that we end up running 'check-avocado'
in non-RISCV hosts every time, and most tests ends up being cancelled
because the test always defaults to the host arch. For example, building
QEMU for riscv64 in a x86_64 host will cancel all tests:

$ make check-avocado
(...)
RESULTS    : PASS 0 | ERROR 0 | FAIL 0 | SKIP 1 | WARN 0 | INTERRUPT 0 | CANCEL 11

After the changes implemented here, one can use env variables to force
the tests to a default arch and machine. In the scenario mentioned
above:

$ AVOCADO_DEFAULT_ARCH=riscv64 AVOCADO_DEFAULT_MACHINE=virt make check-avocado
(...)
RESULTS    : PASS 11 | ERROR 0 | FAIL 0 | SKIP 1 | WARN 0 | INTERRUPT 0 | CANCEL 0

Note that test behavior changes only when the env vars are set. There is
no change made in the regular work of 'check-avocado'.

Cc: Cleber Rosa <crosa@redhat.com>
Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
Cc: Beraldo Leal <bleal@redhat.com>

Daniel Henrique Barboza (3):
  avocado_qemu: enhance CANCEL message in QemuBaseTest:setUp()
  avocado_qemu: add AVOCADO_DEFAULT_ARCH for cross-arch tests
  avocado_qemu: add AVOCADO_DEFAULT_MACHINE

 docs/devel/testing.rst                 | 15 ++++++++++++---
 tests/avocado/avocado_qemu/__init__.py | 22 +++++++++++++++-------
 2 files changed, 27 insertions(+), 10 deletions(-)

-- 
2.39.0


