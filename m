Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5280D2F7E18
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:25:55 +0100 (CET)
Received: from localhost ([::1]:44236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Q30-0004S8-3D
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:25:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l0PTI-0003cj-Dp; Fri, 15 Jan 2021 08:49:00 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:38468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l0PTF-000653-5G; Fri, 15 Jan 2021 08:49:00 -0500
Received: by mail-pl1-x633.google.com with SMTP id d4so4731163plh.5;
 Fri, 15 Jan 2021 05:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=vA/a153IptZwj1bNteMzKqG6aPM45bt5INr+t1xqaYk=;
 b=mZU3ZVAtsSoClAwyOu7Y+/1kqkwW89YPb29m+0seFVPnU5T33JyBTDfcsgyGo/OUJE
 8qm1AuyG7JJqKVWeD+24i+4qhZeyznFYQgKSNPaLtv5332LDxpg8pnBJk8h6gSUSbCWB
 h0IEM1sQNtaaHyYHp+EBT8NnyV9WCTDAD6c/eV+fmbkAcvKrZ5EQEDQveSaP1oDqZF/V
 KBcXHoUS7w+OJURiz8XCqO1QElm+xqRt69rA17WJhoaUyo2f4XMngdNcmf5O8VJ13fnd
 XFQxiFMoBeeCIFDxz38I+dtLXh5gctsC944ga1IfFpRlWHL+x3OQj8AuMKJEWfgKFv3H
 zugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=vA/a153IptZwj1bNteMzKqG6aPM45bt5INr+t1xqaYk=;
 b=keBdnKrz5J2ifenKkzacf6+vTurq8K/6W6gYgeI58q3QBea7aXqfvZyXzwjhfwjbTk
 KNNE8ICV4WjkQ/RvylZqUB1qFpb9O/m0mqnPqEdNovERQjuRiUIX1I4QrSCUN+YR7T0h
 V5t9XGY3aJ6Unr125T7r0Fnig2L6HFqbqzHL/DFNzNqI7kVljnjPk2X1TDNy67xInoBj
 dojJrpw90Fe9I30LusEAYk4a/FY5q8W3aiYw2v3uyTsaZ3XjnfwU/Cn8bEyn1IFJgVgs
 R/DSfhyov4geLMf+Kk8HuaGJ4kCRyGGKOCzCm9+ZExAUvC5p+9iH1W31HGgHVMNCStvs
 HiIw==
X-Gm-Message-State: AOAM533IR/IrWAehscAkule29uo5esmOOywGoavrEyW4ORZPuJCoBbFB
 SwBxT2+xv5w5Dr40K29ZzALhyREuIXZ9jg==
X-Google-Smtp-Source: ABdhPJx2waUEkCDfs6w7SLw3h9dQQVr09ZAHG8RLyQSHFvm8MAOs4hhBNbTCLtMFCYv8ccQGY7Ac4Q==
X-Received: by 2002:a17:90b:691:: with SMTP id
 m17mr10844555pjz.73.1610718535075; 
 Fri, 15 Jan 2021 05:48:55 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id k18sm8203939pjz.26.2021.01.15.05.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 05:48:54 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH] hw/block/nvme: add zoned I/O commands to nvme_io_opc_str()
Date: Fri, 15 Jan 2021 22:48:45 +0900
Message-Id: <20210115134845.17618-1-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, Zoned I/O commands are parsed as unknown:
  pci_nvme_io_cmd cid 768 nsid 1 sqid 4 opc 0x79 opname 'NVME_NVM_CMD_UNKNOWN'

Parse zoned I/O commands along with other I/O commands to print.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index b7fbcca39d9f..0c1cb6fd2549 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -66,6 +66,9 @@ static inline const char *nvme_io_opc_str(uint8_t opc)
     case NVME_CMD_READ:             return "NVME_NVM_CMD_READ";
     case NVME_CMD_WRITE_ZEROES:     return "NVME_NVM_CMD_WRITE_ZEROES";
     case NVME_CMD_DSM:              return "NVME_NVM_CMD_DSM";
+    case NVME_CMD_ZONE_MGMT_SEND:   return "NVME_NVM_CMD_ZONE_MGMT_SEND";
+    case NVME_CMD_ZONE_MGMT_RECV:   return "NVME_NVM_CMD_ZONE_MGMT_RECV";
+    case NVME_CMD_ZONE_APPEND:      return "NVME_NVM_CMD_ZONE_APPEND";
     default:                        return "NVME_NVM_CMD_UNKNOWN";
     }
 }
-- 
2.17.1


