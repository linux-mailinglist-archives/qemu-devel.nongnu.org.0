Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25779483E8A
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 09:57:42 +0100 (CET)
Received: from localhost ([::1]:37366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4fdV-0001tV-9E
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 03:57:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4faW-0007ZN-SV; Tue, 04 Jan 2022 03:54:36 -0500
Received: from [2a00:1450:4864:20::429] (port=39447
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4faV-0007nI-6q; Tue, 04 Jan 2022 03:54:36 -0500
Received: by mail-wr1-x429.google.com with SMTP id s1so74689328wra.6;
 Tue, 04 Jan 2022 00:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6b+AzP7QtPC4iYk44vVICIt8IMgGta8unOAFiOt1PK8=;
 b=c57EwDbL1aq4UfIaTJ5g2cnJEpifhScHxIqhPgYX2r97Zbt6Q//b0MoX0+mwiK+agH
 OebGr8KGNed8LbrKBnZpgJkg6GeC6kyNerdOr9xS8raQLZzwzr5SXbTV7O7ZXpPnNawN
 C5aX0WKne3ar8OzQSZLze2Y5CNGGDMmuXm44i2nw4okH20wQhqGTK8vVpkmurbOm92Ca
 qcimJkL+D4ayJavAFKUdO9vJLmI/95fh2lRXknJXkU4ivsvCy5vviCOUttOps3isyZqH
 EtpWpCtDLb+LBC9HIPDvYUnSUIkLkYSxYD+urPEEgFc72536gMxkNONalUnZWZuLudsI
 Meqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=6b+AzP7QtPC4iYk44vVICIt8IMgGta8unOAFiOt1PK8=;
 b=Qqu5hlxXLMezT0qGqpeU92/bXcgBW1OSMWwPXEjnR0GrMDSWtcv2P4LgW3PJICZ+ij
 O2+3KQauV/ARTRCUS6jjcLlMeKWJEcp5znHoHBsBsq1lLvuRJIIEj0egEZgIAeQYVodp
 bFf3bvOPTbu5bm2qJL3qTe4XI9JEIkJNFmkqucxlx5M3MP2exMPhQvOF2ldujcjNaUAy
 wm3hdlnAKtCWge4WmZbKOZ5vNO6qek+Oab/8+4ZIpNe/89SRdMU9Vnnbmdis7Yb2cglN
 WfGOAg2NgYQjQYh1hDbLltInvtbenPQcMRyh/JC5VXuvXksXh39QodsdROEuldXLJK4e
 OaiQ==
X-Gm-Message-State: AOAM533snFT+N1YV3PQ8yGUJ8ibc7Us1PemXa95NmnnF5rSy9P4h52Io
 qEWG83g16sgazC2Lz8kb/bOK6QzBZosKTw==
X-Google-Smtp-Source: ABdhPJxTJmC6bWam5S+efkthT2v/gu0qRx69monBJhttFhexNt/TXmYOHd9fUrxPfCjWM2h1S+9cHQ==
X-Received: by 2002:a5d:6e8a:: with SMTP id k10mr34621994wrz.113.1641286473209; 
 Tue, 04 Jan 2022 00:54:33 -0800 (PST)
Received: from x1w.. (26.red-83-50-86.dynamicip.rima-tde.net. [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id b14sm35520421wri.112.2022.01.04.00.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 00:54:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/9] hw/dma: Use dma_addr_t type definition when relevant
Date: Tue,  4 Jan 2022 09:54:22 +0100
Message-Id: <20220104085431.2122999-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v1:=0D
- Addressed David review comment (stick to dma_addr_t type)=0D
- Addressed Peter review comment (incorrect doc string)=0D
=0D
Hi,=0D
=0D
This series aims to clarify a bit the DMA API, in particular the=0D
'size' argument which is not clear enough (as we use multiple types=0D
for it). This helps avoiding build failures on 32-bit host [*] (and=0D
likely overflows calculation too IMO).=0D
=0D
Some units using the DMA API are first removed from user-mode=0D
emulation to avoid build failure (they shouldn't be there in=0D
the first place).=0D
=0D
Then some variables are renamed for clarity (no functional change).=0D
=0D
Finally we replace misuses with dma_addr_t typedef. The previous=0D
patch which failed on 32-bit host applied on top (not failing anymore).=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
[*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg858825.html=0D
=0D
Supersedes: <20211231114901.976937-1-philmd@redhat.com>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (9):=0D
  hw/nvram: Restrict stub to sysemu and tools=0D
  hw/pci: Restrict pci-bus stub to sysemu=0D
  hw/pci: Document pci_dma_map()=0D
  hw/dma: Remove CONFIG_USER_ONLY check=0D
  hw/rdma/rdma_utils: Rename rdma_pci_dma_map 'len' argument=0D
  hw/scsi: Rename SCSIRequest::resid as 'residual'=0D
  hw/dma: Fix format string issues using dma_addr_t=0D
  hw/dma: Use dma_addr_t type definition when relevant=0D
  hw/dma: Let dma_buf_read() / dma_buf_write() propagate MemTxResult=0D
=0D
 hw/rdma/rdma_utils.h   |  2 +-=0D
 include/hw/pci/pci.h   | 12 ++++++=0D
 include/hw/scsi/scsi.h |  4 +-=0D
 include/sysemu/dma.h   | 31 ++++++++-------=0D
 hw/ide/ahci.c          | 10 ++---=0D
 hw/nvme/ctrl.c         |  6 +--=0D
 hw/rdma/rdma_utils.c   | 14 +++----=0D
 hw/scsi/megasas.c      | 85 +++++++++++++++++++++++++++++-------------=0D
 hw/scsi/scsi-bus.c     | 12 +++---=0D
 hw/scsi/scsi-disk.c    |  4 +-=0D
 softmmu/dma-helpers.c  | 34 +++++++----------=0D
 hw/nvram/meson.build   |  6 ++-=0D
 hw/rdma/trace-events   |  2 +-=0D
 stubs/meson.build      |  4 +-=0D
 14 files changed, 134 insertions(+), 92 deletions(-)=0D
=0D
-- =0D
2.33.1=0D
=0D

