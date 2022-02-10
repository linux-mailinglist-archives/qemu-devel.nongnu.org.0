Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF984B0643
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 07:26:38 +0100 (CET)
Received: from localhost ([::1]:55502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI2uc-0007MI-0U
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 01:26:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nI2m4-0003WV-2p
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 01:17:48 -0500
Received: from [2607:f8b0:4864:20::635] (port=43607
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nI2lz-0001PS-Ew
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 01:17:47 -0500
Received: by mail-pl1-x635.google.com with SMTP id p6so781608plf.10
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 22:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2ZmZIjF7hDJXu/YS3yMdoKolgpMhM7EuubXRK9cd+L0=;
 b=m33rCHResF0FmnQeiixFLlGNpkpE84aIVAuGwKzPddx7YnUKlec0xUBEZcF2fcLaXX
 lXlZAvTFUbJyJ3c1jW7UwMle4vgzPFvSeSFkzdvp4eOneh485dH7fmJED1d9YSiNJceM
 xPQzCP3FXGpocWa6B7RwWHCml6UM/JA2jo+0DzGwQ/BC0A/xuqFG45Okic3fKsjK5/gu
 d8jGmF2OYFAvmxsLGbhEThkpE4LYD9SddG/x2G+X3qEwkvPGIvJCL5JWtj4E0t2wNcrM
 HIYyvrw2XyeFnC9tTB9ORprkwjYsIbHQ7ns2rOevch9PcGWbjCqKoZbJDVAf9QvDruHZ
 hMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2ZmZIjF7hDJXu/YS3yMdoKolgpMhM7EuubXRK9cd+L0=;
 b=2o4xbGkswma07q9pAsmKd6UY8DEV5gPBsRTo57UyNfjGQ8U8BJ8QW9gnoxmn+T3LNN
 QG1MDcYiv/P0181IvGraOhsiozW6xL1HC/GJ+3mOWXU0H2R0I76fLQbWJQhhBMAVDTQZ
 J0QI+45KSUkTUNrc6WZVB9gWvbxfthff/lqal0Uu0kjC3J5mCizuyWd+7NZcIsPSOs/J
 DXEySpmYwtAu633gPF5/0CQKz7+N94jm4JIZ2uP/I25HN+ESG7jg5OlrlQABK7HTWr+A
 Bl+dXySEDiJqYNUqimCweOSeRgXTNfAaFoEfz1oF4cMINIx93gKIYUhwy1+OdTaD8AkN
 6zyw==
X-Gm-Message-State: AOAM5309HkL8nRtJpvW0ymvGz/MSR7WCtf0OEyayXYhMw1j/yzQyqE4k
 8OD8j67qJYcruZUx+bphEJLFI8dS1MgcR1NZ
X-Google-Smtp-Source: ABdhPJzmC9bBQK+I95XW/QbMscfULLvHUdD/gDAyomxfDw1WrFL4pBGzHaa1+2wks7lstTrfjITepw==
X-Received: by 2002:a17:902:bd93:: with SMTP id
 q19mr6122760pls.140.1644473861334; 
 Wed, 09 Feb 2022 22:17:41 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id q2sm23110266pfj.94.2022.02.09.22.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 22:17:40 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 0/3] Support ACLINT 32/64-bit mtimecmp/mtime read/write
 accesses
Date: Thu, 10 Feb 2022 14:17:32 +0800
Message-Id: <20220210061737.1171-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

This patchset makes ACLINT mtime to be writable as RISC-V privilege
spec defines that mtime is exposed as a memory-mapped machine-mode
read-write register. Also, mtimecmp and mtime should be 32/64-bit memory
accessible registers.

This patchset is the updated verion of:
https://patchew.org/QEMU/20220126095448.2964-1-frank.chang@sifive.com/

Changelog:

v2:
  * Support 32/64-bit mtimecmp/mtime memory accesses.
  * Add .impl.[min|max]_access_size declaration.

Frank Chang (3):
  hw/intc: Add .impl.[min|max]_access_size declaration in RISC-V ACLINT
  hw/intc: Support 32/64-bit mtimecmp and mtime accesses in RISC-V
    ACLINT
  hw/intc: Make RISC-V ACLINT mtime MMIO register writable

 hw/intc/riscv_aclint.c         | 87 +++++++++++++++++++++++-----------
 include/hw/intc/riscv_aclint.h |  1 +
 target/riscv/cpu.h             |  8 ++--
 target/riscv/cpu_helper.c      |  4 +-
 4 files changed, 66 insertions(+), 34 deletions(-)

--
2.31.1


