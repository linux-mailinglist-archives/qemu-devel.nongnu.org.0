Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 832D660FC6A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 17:53:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo5BO-0007ZT-UX; Thu, 27 Oct 2022 11:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oo5BI-0006ur-4X; Thu, 27 Oct 2022 11:52:32 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oo5BG-0002ID-Hn; Thu, 27 Oct 2022 11:52:31 -0400
Received: by mail-pl1-x635.google.com with SMTP id c24so1924639pls.9;
 Thu, 27 Oct 2022 08:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8g73c7n8Cem2dwKPJxbM5o1j72Yj3QGu26d+n50tL2g=;
 b=o5xJcDXJE7P1t07iembD4Gs88fsYxp+9Sk0jROJkQ7faUojFN4AGFzLlxPk+fiUBbK
 SqTupe8sbVuzl5AL35kO06AOEZjhqL0Oz2H8xhJ/V7aPUU/WHX/WYAH6prVN87g2K55N
 NkXdlQKTrys3hMZ1Rr84lQp7AdWnEKEkZ1W2GQUE4QscwGYdLuR7x5CoMz3aHOBzZdxX
 PNLMqLgA3S2kSR4ZDZPPEdrG+hdy56S+O5BqJsxxaBPKVW6dkSHViz8Xce4C0DhWmbPE
 TqMWmSZpDdQbX5yRFbjsAMtMWpDwS3K31USdGpnEE/NhodTFqBrJmRDuz30l5McqfqA4
 r1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8g73c7n8Cem2dwKPJxbM5o1j72Yj3QGu26d+n50tL2g=;
 b=he9+MLO3mEzk5+4XGk0G1mIftV5BVTqia6t7me6uAqTs4hyBPBQmiEdgy1+D9HR+I3
 ioiTexh+P5BsDJxZm1A//FbevxXfhd6T2KLBaY6/D9eIJR0ZtMOPkz2td0+CIWS8XIP3
 y42SlVWhQyPlAEf8OIE5IvMUx2wTsvmfR9Ei+AAoYStrIr0uoCHJey/ub1cCPvael8a2
 ORUUlTmT8Ue8OnK9oa3Ah45M+Q4XlT1nZrrNRkTt1y7Gs9ETlyctsx54rP73W3zOkT5k
 TXkZLPd0twY/0+OuFXZM9C+lOu+q9YF/fZGhGARwWHm/SAdp19K5a06n+tHv8qs2re7I
 gkJA==
X-Gm-Message-State: ACrzQf0weReVJuW9ktb7dmNiS4ixYwj3DMGgDJfkCDczjrh73HTnC14r
 VqNQ+sveMFq454u7D/CquPFtAP8sGRLkaiZA
X-Google-Smtp-Source: AMsMyM5HUkzvMqqYayGig9n2IV8fVfun3lk8CLcuex5IT5s4xeOBVgHIGGrsF8G3R1GoLPPLo9+lrA==
X-Received: by 2002:a17:90b:1c8d:b0:203:cc25:4eb5 with SMTP id
 oo13-20020a17090b1c8d00b00203cc254eb5mr10952175pjb.132.1666885947935; 
 Thu, 27 Oct 2022 08:52:27 -0700 (PDT)
Received: from roots.. ([112.44.202.248]) by smtp.gmail.com with ESMTPSA id
 f21-20020a623815000000b0056c058ab000sm1327744pfa.155.2022.10.27.08.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 08:52:27 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, Stefano Garzarella <sgarzare@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, dmitry.fomichev@wdc.com,
 qemu-block@nongnu.org, Julia Suvorova <jusual@redhat.com>, hare@suse.de,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v5 0/4] Add zone append write for zoned device
Date: Thu, 27 Oct 2022 23:52:11 +0800
Message-Id: <20221027155215.21374-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

v5:
- fix locking conditions and error handling
- drop some trival optimizations
- add tracing points for zone append

v4:
- fix lock related issues[Damien]
- drop all field in zone_mgmt op [Damien]
- fix state checks in zong_mgmt command [Damien]
- return start sector of wp when issuing zap req [Damien]

v3:
- only read wps when it is locked [Damien]
- allow last smaller zone case [Damien]
- add zone type and state checks in zone_mgmt command [Damien]
- fix RESET_ALL related problems

v2:
- split patch to two patches for better reviewing
- change BlockZoneWps's structure to an array of integers
- use only mutex lock on locking conditions of zone wps
- coding styles and clean-ups

v1:
- introduce zone append write

Sam Li (4):
  file-posix: add tracking of the zone write pointers
  block: introduce zone append write for zoned devices
  qemu-iotests: test zone append operation
  block: add some trace events for zone append

 block/block-backend.c              |  65 +++++++++
 block/file-posix.c                 | 212 ++++++++++++++++++++++++++++-
 block/io.c                         |  21 +++
 block/io_uring.c                   |   4 +
 block/linux-aio.c                  |   3 +
 block/raw-format.c                 |   8 ++
 block/trace-events                 |   2 +
 include/block/block-common.h       |  14 ++
 include/block/block-io.h           |   3 +
 include/block/block_int-common.h   |   8 ++
 include/block/raw-aio.h            |   4 +-
 include/sysemu/block-backend-io.h  |   9 ++
 qemu-io-cmds.c                     |  63 +++++++++
 tests/qemu-iotests/tests/zoned.out |   7 +
 tests/qemu-iotests/tests/zoned.sh  |   9 ++
 15 files changed, 424 insertions(+), 8 deletions(-)

-- 
2.38.1


