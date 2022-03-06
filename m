Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 760D94CEE95
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 00:41:56 +0100 (CET)
Received: from localhost ([::1]:39642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR0Vf-0006zi-Is
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 18:41:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR0Tz-0004vU-Fi
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 18:40:11 -0500
Received: from [2a00:1450:4864:20::42b] (port=43668
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR0Tx-0002Ku-T2
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 18:40:11 -0500
Received: by mail-wr1-x42b.google.com with SMTP id e24so7714511wrc.10
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 15:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=278XxVdDItx9lDoPACVHM51HaXbkoHjGK/HlkedyY4M=;
 b=A7boqQkPIWxqv/WE18M6kO+zclL/JTX1EP4gr8ms9pVivBePuQ67EKNqXDya3AH4au
 Yt4t20v77yJTYswnVnTlOk6lMz7tjARruNGVLRDYp5JQN1vbPsgRjeYiilyrBLB4ZPcC
 oIdl3OO3FtC5u06IyoyK5M+aUC0m71KfuO5nPo+HNB2AHGESDOVC2gBFJJ7zcr8nF884
 5N8UTN9ke7wMKjrxMsSJcflppNSv0pXp+yaoqpORGeOQ9F4+ySCbbAHofWRuROktXuuv
 r1CYJJoHWy83cbttPPb7vsSjNjetFrwu/b1zrOu10BZLsmUYMmAl/2TczUwtQ2jJcjIe
 YlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=278XxVdDItx9lDoPACVHM51HaXbkoHjGK/HlkedyY4M=;
 b=wlMXCmMEFco5/Dt787rrCIzAKHp3gUNezgXoThLWhBug5aXp9Fo/+nnhvCUSEzN1Jz
 ZuQqZHjdL7AvGgIwMjjhwikhihSy/+RLav3M158nMmIUpKHyBhuwbLVeTNS2gD/axWCU
 fkhvO/Ls3i6NSKNcT9U/giJ7lOTsgWFIjd28sdTZ/1lXzFiClcV8WpxrVMfQokd1UeQ3
 l+ax3+W0LrwYPut9aSB405axzGI260de8F6PfKZKD3XfUh11gw6pyAX4T4DER85YH72/
 WKOmsxvw0YnOgAT86Ojv+mFWfasJDfb2U63C8jx/TX+oSokq5lg2zQJnR5Y7t6Txrcc3
 I8DQ==
X-Gm-Message-State: AOAM53205g3gqBU2pML/csMLxkejiR9bpSUtBfeOHtQXF69riG58wYgi
 GApFcWkeL7AxIQZ8EAX3YIhXJmSEoYA=
X-Google-Smtp-Source: ABdhPJzntT6p4oyxc24IjQaLDtJSQXgd9mmkR6JW6Ux06Pd4IB1iS1Woad2BuvQBvNy9NXhLoSTYug==
X-Received: by 2002:a5d:47c3:0:b0:1f1:fad5:c332 with SMTP id
 o3-20020a5d47c3000000b001f1fad5c332mr517777wrc.360.1646610007734; 
 Sun, 06 Mar 2022 15:40:07 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a1c741a000000b00389ab9a53c8sm341468wmc.36.2022.03.06.15.40.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Mar 2022 15:40:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] linux-user: Use CPUArchState* instead of void* when
 possible
Date: Mon,  7 Mar 2022 00:40:02 +0100
Message-Id: <20220306234005.52511-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Based-on: <20220306232750.41671-1-philippe.mathieu.daude@gmail.com>
"Abstract ArchCPU" pull request v2

Philippe Mathieu-Daudé (3):
  linux-user/elfload: Remove pointless CPUArchState cast
  linux-user: Have do_syscall() use CPUArchState* instead of void*
  linux-user: Remove pointless CPU{ARCH}State casts

 linux-user/elfload.c        |   2 +-
 linux-user/strace.c         | 202 ++++++++++++++++++------------------
 linux-user/strace.h         |   4 +-
 linux-user/syscall.c        |  81 +++++++--------
 linux-user/uname.c          |   4 +-
 linux-user/uname.h          |   2 +-
 linux-user/user-internals.h |  18 ++--
 7 files changed, 155 insertions(+), 158 deletions(-)

-- 
2.34.1


