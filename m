Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 610156A7D6A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 10:16:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXf1D-0006iP-PP; Thu, 02 Mar 2023 04:14:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pXf15-0006QW-Gb
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:14:23 -0500
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pXf12-0007Z9-E5
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:14:22 -0500
Received: by mail-ot1-x32e.google.com with SMTP id
 v1-20020a9d6041000000b0068d4a8a8d2dso9110196otj.12
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 01:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1677748453;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z5c2bQOwrWxvvs9nR+nbGDX2izdNRL4cC/XCJgSGPHg=;
 b=HfOJzupwH5OUPi/UpKiRKxV9aRq1h2vy3NNxS2ZuL88uRD5FaNv+y2hK0ABwwLiIAS
 hK3IXckU1iHrpioL3RvxmdtCkanU+oS/S03+rL2InPWixqmfW72sbDNn5SK9Cnyg3eUV
 ZlzmdTzHogrceAinRGmXZbku5wHuyPkcuKGwa9pqEZHV3/sswfxqNErj/naZzEQgrKC1
 DWQ9KHE8e3JmZlQ7OVvCQAIaFUwE5sEETkrUVRPgkdWXcd5ybnnGx1PzyRCQKe42FGeR
 HGk7XJw/b6pI3Sj4mrT6OW1SO9vsqOqh4u7/UMV7rJDhB9Rs9ejrILC7GjTNKv+27PKi
 mXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677748453;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z5c2bQOwrWxvvs9nR+nbGDX2izdNRL4cC/XCJgSGPHg=;
 b=CXGtj+Mie6IudfLTgnCEGl+loPyRs7+kbwjteq0KV1vW9RRST+wareU7XCuyA3eDdQ
 gqUxP5Xz4+ukQprx9dfDpeOJMlyuRDcj6x10f9V3HJ1Ju+m4Wg5yjSJxba0fbHFm198+
 Wuwo0gKUZJfmxyG78pa6N5J8EUdwUhGeOlJO7rqpb2pK88WTQJlvlWMbeeJL0fgI0Wvp
 0hGxOrwyhMN7VlCj4bV4+KeCNCfnTBcG0t9WbQCw55HnjgeWrjO2j1U7ZM/oXedKbJ2/
 mKAONHXFtQFaM2N+UXYtB44ri2NoqcdiEUXQ7//bFVGEMF8v0UixEhljYLYMCDmrT5o/
 3tIA==
X-Gm-Message-State: AO0yUKWeWa+SbEOlh+2/Qj3mUSIPNd1k54iaatKsQWK8ZNkKzfPlYI3v
 seZcOs41ica/l4JXiUP3L+dFa7uXNV53HQgS
X-Google-Smtp-Source: AK7set9MR82DqHps3T2KC+zZcy0HTf0dxChuaAmmOyg1DL4mezCga3ZI7Gt4bmQt4BLpyF+HsBGLzA==
X-Received: by 2002:a9d:684a:0:b0:693:c20e:5655 with SMTP id
 c10-20020a9d684a000000b00693c20e5655mr754602oto.4.1677748453143; 
 Thu, 02 Mar 2023 01:14:13 -0800 (PST)
Received: from grind.. ([177.189.53.31]) by smtp.gmail.com with ESMTPSA id
 v15-20020a9d7d0f000000b006864c8043e0sm5641793otn.61.2023.03.02.01.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 01:14:12 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH v2 0/1] hw/riscv/virt.c: add cbo[mz]-block-size fdt properties
Date: Thu,  2 Mar 2023 06:14:05 -0300
Message-Id: <20230302091406.407824-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32e.google.com
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

Based-on: 20230224132536.552293-1-dbarboza@ventanamicro.com
("[PATCH v8 0/4] riscv: Add support for Zicbo[m,z,p] instructions")

Hi,

This second version, which is still dependent on:

[PATCH v8 0/4] riscv: Add support for Zicbo[m,z,p] instructions

Is adding the cboz FDT property as well as requested by Ben Dooks. First
version refrain from adding it since it's still under review in the
kernel but, given that we have cboz_blocksize already available, it
makes sense to also expose it like we're already doing for
cbom-block-size.

Changes from v1:
- also add riscv,cboz-block-size for Zicboz
- v1 link: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg00368.html

Cc: Ben Dooks <ben.dooks@codethink.co.uk>

Anup Patel (1):
  hw/riscv/virt.c: add cbo[mz]-block-size fdt properties

 hw/riscv/virt.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

-- 
2.39.2


