Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A27E750E33E
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:33:57 +0200 (CEST)
Received: from localhost ([::1]:47652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nizmm-0006h4-Nv
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nizgL-0006OW-IJ
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:27:17 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:47014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nizgJ-0004hM-Qr
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:27:17 -0400
Received: by mail-pg1-x529.google.com with SMTP id q12so13543397pgj.13
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 07:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=raH7bbqlvr9IGWHmqpVzD1SfptpB24bmxwg3rFEToUs=;
 b=KeGGuaOUA3nEJwswgJvayHY8MyZv1+Qz02887ZAfUjUyxBDhQyrxphmUqn6wGcm7LD
 KifZuGiodje4V6dLzMam6m6TUlgLoy/PFr6DkWTQrsVUn8+jTnFe0EL1VCet/PpThRzR
 on6CebahIJ/k/wB+UzIVsqFSeo5RdgZragDwRgKFwIqteBod87qVCIQUbn5ztE9uZgIA
 0j6W1R3jWWwx4eDrtPCvPYAv/rvNRmBcrJQqT/HnPerS5Y9dEsyMyCGcVljE2Gcdxscm
 /OVfirVkIfYxeXOzjalufosdiqtXxcmnUlo7aIkY3O+koBoD/HJeUp45ofkDo2senDVd
 FZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=raH7bbqlvr9IGWHmqpVzD1SfptpB24bmxwg3rFEToUs=;
 b=3R+4dewvPBu9pS+Ma+F9H13rsOZjKjOs/FCDOJQFbSST5ePzjDNWfCaGiGsCNI2TBY
 8DP8gujGqz1edwqWDPb0GvPQgNWKLh4qIh39omyoRnB6hiVcyfC6BBzUI4a3eNorEWAv
 /53bilaYBVK+csmiimnUJYpQum/NF5phvu+UUGLJH41D4ROZQ4McQQLND6gJEWc6dIZQ
 J+obPV14ObbbgsloG2YRHlLLKy6xJRex/NFCkl13gKglt9tHR4RHRD1oipMgt81Hlpb0
 BGZdsEMpmegXvTNRt+fZ/BK9WAX9Si69gcYB02Gb6s4YINy96QkiCNbvJC6upBSLsoxB
 jplw==
X-Gm-Message-State: AOAM5323HSjZnLKMOEznA92r03/Kw7stBClwzGn8FEvLP8HX4A6jvOe1
 HyCrJYam1O5i8DGVXqf4oKA=
X-Google-Smtp-Source: ABdhPJyFhz9XJDiQb8flfO5s1+q4adCTuDlTKJkXQW8DUOeDcPSFpp3yMLneZseKKPPDDx7n85IJjA==
X-Received: by 2002:a65:6149:0:b0:3a9:7e8f:6429 with SMTP id
 o9-20020a656149000000b003a97e8f6429mr15355057pgv.613.1650896833894; 
 Mon, 25 Apr 2022 07:27:13 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 t1-20020a628101000000b0050d47199857sm2437968pfd.73.2022.04.25.07.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 07:27:13 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Subject: [PATCH 0/9] 9pfs: Add 9pfs support for Windows host
Date: Mon, 25 Apr 2022 22:26:56 +0800
Message-Id: <20220425142705.2099270-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At present there is no Windows support for 9p file system.
This series adds initial Windows support for 9p file system.

'local' file system backend driver is supported on Windows,
including open, read, write, close, rename, remove, etc.
All security models are supported. The mapped (mapped-xattr)
security model is implemented using NTFS Alternate Data Stream
(ADS) so the 9p export path shall be on an NTFS partition.

'synth' backend driver is updated only to build sucessuflly
in a Windows build. Funtionalities are not tested as test
cases do not run on Windows at present.

Example command line to test:

  "-fsdev local,path=c:\msys64,security_model=mapped,id=p9 -device virtio-9p-pci,fsdev=p9,mount_tag=p9fs"


Bin Meng (2):
  hw/9pfs: Compile 9p-local.c and 9p-proxy.c for Linux and macOS
  qemu/xatth.h: Update for Windows build

Guohuai Shi (7):
  hw/9pfs: Extract common stuff to 9p-local.h
  fsdev: Add missing definitions for Windows in file-op-9p.h
  hw/9pfs: Add a 'local' file system backend driver for Windows
  hw/9pfs: Update 9p-synth.c for Windows build
  fsdev: Enable 'local' file system driver backend for Windows
  meson.build: Turn on virtfs for Windows host
  hw/9p: win32: Translate Windows error number to Linux value

 meson.build              |   10 +-
 fsdev/file-op-9p.h       |   33 +
 hw/9pfs/9p-linux-errno.h |  151 +++++
 hw/9pfs/9p-local.h       |   20 +
 hw/9pfs/9p-util.h        |   41 ++
 hw/9pfs/9p.h             |   27 +
 include/qemu/xattr.h     |    4 +-
 fsdev/qemu-fsdev.c       |    2 +
 hw/9pfs/9p-local-win32.c | 1242 ++++++++++++++++++++++++++++++++++++++
 hw/9pfs/9p-local.c       |   14 -
 hw/9pfs/9p-synth.c       |    5 +-
 hw/9pfs/9p-util-win32.c  |  341 +++++++++++
 hw/9pfs/9p-xattr.c       |  113 ++++
 hw/9pfs/9p.c             |   98 ++-
 hw/9pfs/codir.c          |   15 +
 fsdev/meson.build        |    1 +
 hw/9pfs/meson.build      |   12 +-
 17 files changed, 2103 insertions(+), 26 deletions(-)
 create mode 100644 hw/9pfs/9p-linux-errno.h
 create mode 100644 hw/9pfs/9p-local-win32.c
 create mode 100644 hw/9pfs/9p-util-win32.c

-- 
2.25.1


