Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4416A48B639
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 19:57:56 +0100 (CET)
Received: from localhost ([::1]:44836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7MLD-0005wl-Bs
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 13:57:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7M73-0003lO-Q8; Tue, 11 Jan 2022 13:43:19 -0500
Received: from [2a00:1450:4864:20::32b] (port=35828
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7M71-0005ta-Pi; Tue, 11 Jan 2022 13:43:17 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso1420797wmj.0; 
 Tue, 11 Jan 2022 10:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sVziQiEx4eawpan99s7Y7ghZv+rkd+xaVksCXYcNrkQ=;
 b=BGMYO10kiozYo1JVKA2MP+c9BtIuLCcUHsFnO0OlHF2fRbi5vPLqGdTw07iMf7e4ge
 imSIwNSaJ5kXHiXIwFVoT/9M45dqi0d2VP2aZUWP5iqcuopzoxeSoh10avfe1ygGxS8T
 DbnRHLk+cKQdWBowIzFzX7wwHXXQhYRCnkx9P5p/9h7b6ZZPUewGnAmC39pSE8RpN6BL
 m3pondv00N/Vi4Rv11EDVzAsCrIsnAKM9RX/4in8He3ZoAiUt0HHJpZgyMrDmYSl79OR
 TBxcqLftGJT6XoxQldrSmYRRfuGkSGjlIW4J1lmJC54yoCHcNrsI5oQfEJQ4JeqFB8Uc
 AEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=sVziQiEx4eawpan99s7Y7ghZv+rkd+xaVksCXYcNrkQ=;
 b=2g+7WDyT/d03xrKfL1ikUND7hs0RydKRBnCj93XI6Pnl46Vl/U/0Hkef25RZwNaOCp
 OS+RgfFwAgZevBr8Ooc1w4C0MhRFuyTqGmJH85tXhV9yGWz6Hg2qgRbWopGmyflGD6yk
 YoA/mlUgT4jvUJL21SRwCHULijmPicfpFjROt3TmuQMsyNtzkvsTk8q//CJjTQLVLajS
 gA7MGXU3L+DoVbsU6yfuh5DSBreGEvbX94zT1VmR6t1SuqSyBJ2BALizPKKbaU4v9gtz
 g8quvJTJatVa6V2ZErTM9kXh+rhQDXWAbd4+sUn08uQ/gxJkPSZ0HHcaS8Nd2hhuhTgD
 Hveg==
X-Gm-Message-State: AOAM53196GIP6HL4kavofZBJZcLt5AP4VVE7/iWxfpeaZNwxDi7/EL+l
 DO7o4oPUGxch2oJ3GBSSVeRgSfkOzw+Jgw==
X-Google-Smtp-Source: ABdhPJyCcilhi+/Ty3iVtMOkYjY8WbtQ+G3N3bc89cOGdsQ2kYtmxUIM3blHf5+J3Q/KcgiPcKkGzQ==
X-Received: by 2002:a05:600c:35d3:: with SMTP id
 r19mr3598486wmq.29.1641926591460; 
 Tue, 11 Jan 2022 10:43:11 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id n12sm11288510wrf.29.2022.01.11.10.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 10:43:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/10] hw/dma: Use dma_addr_t type definition when relevant
Date: Tue, 11 Jan 2022 19:42:59 +0100
Message-Id: <20220111184309.28637-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v2:=0D
- Split meson patch restricting fw_cfg (Richard)=0D
- Reorder pci_dma_map() docstring (Peter, Richard)=0D
- Move QEMUSGList in previous patch (David)=0D
- Have dma_buf_read/dma_buf_write return dma_addr_t (Peter)=0D
- Drop 'propagate MemTxResult' patch (David)=0D
- Added R-b tags=0D
=0D
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
Finally we replace misuses with dma_addr_t typedef.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
[*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg858825.html=0D
=0D
Philippe Mathieu-Daud=C3=A9 (10):=0D
  stubs: Restrict fw_cfg to system emulation=0D
  hw/nvram: Restrict fw_cfg QOM interface to sysemu and tools=0D
  hw/pci: Restrict pci-bus stub to sysemu=0D
  hw/pci: Document pci_dma_map()=0D
  hw/dma: Remove CONFIG_USER_ONLY check=0D
  hw/rdma/rdma_utils: Rename rdma_pci_dma_map 'len' argument=0D
  hw/scsi: Rename SCSIRequest::resid as 'residual'=0D
  hw/dma: Fix format string issues using dma_addr_t=0D
  hw/dma: Move ScatterGatherEntry / QEMUSGList declarations around=0D
  hw/dma: Use dma_addr_t type definition when relevant=0D
=0D
 hw/rdma/rdma_utils.h   |  2 +-=0D
 include/hw/pci/pci.h   | 12 ++++++++++++=0D
 include/hw/scsi/scsi.h |  4 ++--=0D
 include/sysemu/dma.h   | 31 +++++++++++++++----------------=0D
 hw/ide/ahci.c          |  2 +-=0D
 hw/nvme/ctrl.c         |  2 +-=0D
 hw/rdma/rdma_utils.c   | 14 +++++++-------=0D
 hw/scsi/megasas.c      | 42 +++++++++++++++++++++++++-----------------=0D
 hw/scsi/scsi-bus.c     | 10 +++++-----=0D
 hw/scsi/scsi-disk.c    |  4 ++--=0D
 softmmu/dma-helpers.c  | 34 ++++++++++++++++++----------------=0D
 hw/nvram/meson.build   |  6 ++++--=0D
 hw/rdma/trace-events   |  2 +-=0D
 stubs/meson.build      |  4 ++--=0D
 14 files changed, 96 insertions(+), 73 deletions(-)=0D
=0D
-- =0D
2.34.1=0D
=0D

