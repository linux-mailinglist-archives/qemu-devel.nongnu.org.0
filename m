Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DB625DFC7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 18:27:39 +0200 (CEST)
Received: from localhost ([::1]:57816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEEYs-0007dN-SX
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 12:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kEEXn-0006Sr-KA
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 12:26:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kEEXl-00068k-9F
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 12:26:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599236787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E8mjG1HrTwrcvE6403rsSjCK8Iq8ANZAvTrhqrdvTHg=;
 b=GU8acv5ll5rOzD8zPjcfHrPEb9EJxmOx12DIZUFPLx6G28KuDrFlp9cW6kkddE1GYkcU0J
 YFxiLjEsIOCqGc2UmK3aogE38+YDc3zGj1H0V28J5gCu3l3N2PFm2w1q0vdEstMKK0nHMp
 U++Nbm3ILXhd8HgIq1MqOkJWfBm4TOo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-7lD-apu_PkC5W0YkXPFLEw-1; Fri, 04 Sep 2020 12:26:24 -0400
X-MC-Unique: 7lD-apu_PkC5W0YkXPFLEw-1
Received: by mail-wm1-f69.google.com with SMTP id c186so2357761wmd.9
 for <qemu-devel@nongnu.org>; Fri, 04 Sep 2020 09:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E8mjG1HrTwrcvE6403rsSjCK8Iq8ANZAvTrhqrdvTHg=;
 b=R8Vvx9glvP6W1erLgPpwv+4aEfewQkbw8GTooRPYydcPt/nvtcakIYjAXD90CkuClr
 FHABN9WMtixep3lB1Gf9dhIpsSkPjJmdsnrppJE5ok4YjbpzgLuFpE/YaC1po30QHckT
 z2KJ5Sz67kxy8KMEYV1AdwsMOUp7KNmdohwffm7APD9VSaD2/uj/a/Era3QPWb+BQJIP
 5udPGBJGH1OMGaJAtM/bzJ+R6/TS2lIFpOgfC9P0AP7mxJLDIicXNaImuUQDR1U9Kn9r
 wIp6mb3pDfEBeWb49k+BiCYEn0z0X0FiXi60NaX6YYxUF5gqOHT2f0pHgVjjwu4MAF/2
 5nAg==
X-Gm-Message-State: AOAM533njAS5u5bkW9H+XjP0jLGXlWqAzhnzEScOAm5XzOdAPDxJwzPC
 hUyLuUxHylRFq5Z0CVodKhoQHFvt0bVLTHBXMz8zsIytSv7F7iIRtc37AsDaA8SqtKhN/QaN9s7
 fuXCki7djYxB5NS4=
X-Received: by 2002:a5d:444b:: with SMTP id x11mr8355831wrr.402.1599236782687; 
 Fri, 04 Sep 2020 09:26:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYXyTiF8d8Z1l/grgttU+3j9a9brmAII6ixGpSYzsIKE+uE2eGZNXyvmwCxM1MmUNUDsmtSA==
X-Received: by 2002:a5d:444b:: with SMTP id x11mr8355816wrr.402.1599236782441; 
 Fri, 04 Sep 2020 09:26:22 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id v7sm12322369wmj.28.2020.09.04.09.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 09:26:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] pci: Let PCI DMA API functions propagate a MemTxResult
Date: Fri,  4 Sep 2020 18:26:17 +0200
Message-Id: <20200904162620.657726-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 11:45:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The DMA API propagates MemTxResult:
- MEMTX_OK,
- MEMTX_device_ERROR,
- MEMTX_DECODE_ERROR.

Let the PCI DMA API propagate them, as they are
clearer than an undocumented 'int'.

Based-on: <20200904154439.643272-1-philmd@redhat.com>
https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg02048.html

Philippe Mathieu-Daudé (3):
  pci: Let pci_dma_rw() propagate MemTxResult
  pci: Let pci_dma_read() propagate MemTxResult
  pci: Let pci_dma_write() propagate MemTxResult

 include/hw/pci/pci.h | 50 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 44 insertions(+), 6 deletions(-)

-- 
2.26.2


