Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCF641E1D8
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 20:57:19 +0200 (CEST)
Received: from localhost ([::1]:50460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mW1F8-0005o1-KC
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 14:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mW1AU-0001A2-5K
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 14:52:30 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:40697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mW1AS-0004Ig-HT
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 14:52:29 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 t16-20020a1c7710000000b003049690d882so9229488wmi.5
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 11:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oG6TVt+wB88HQe8ymLyRe+a+mn+8WXfFfSxHmdkgTdU=;
 b=yPMM7GTT5lCViQrqJNMiTpDdICwf4nX6pbP34KHZY8qTtn2egF/FkmY+OAkl5VklgB
 afeO0C3ZwpWS83J5IwHcF4PMEhtRxqtlOtmboCokdMZVjtkQC0snv6LmBnJNNq99OjVY
 3xQLiQtMxqs/5QWSeBCZdSB248KjxDwX+evTvXHjWk1XcUX3TXQ9oqY8p5fgxiJ3JB9u
 pOs09IqfNZkHsCARBO0YV0w68eVCJi+va/WlXLEH5NwAXMHoeYo8E5AxdqEsnOq8Bn4A
 RXEEZgptaSqRxpCxKT5WfLT49f4vp5PYhDFOlR8C7p8BRemyuCqdA5Q2JawVP3LkpVD7
 QeIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oG6TVt+wB88HQe8ymLyRe+a+mn+8WXfFfSxHmdkgTdU=;
 b=E3aHi232SQa+mPRm53162YshR45TqItH8QoJhINy5zqwo4TdMjmKFhUofvsmA1BBwp
 ExoWd7Hnm2dhse+WfaiWBheKcVbTNZrolPm4/FEHfT5JMltrPjNPZEfeQRWIMkXoWI8F
 Y4j8dfGwB2eBWn7TQADw4WGkLAd16sU/OAezFcSjsV2MwFoeyhs20hBnAeU56NCQ5ZES
 KW+LCztEfsIji25R5t1D4r28EUq53V79MrfdPFjDs4ER/eOViyTXEeb5uYFBk5lXrdbl
 SfFhLwXTPRxKhqtDjGmSR+/9e9p7do93hpmV16b1ID/piBr/BYAhAGXlBgOqSLPz41v0
 KX7g==
X-Gm-Message-State: AOAM531wIMLEXRg/2Xpw2Xop9y9d7FevVFlaxNottqd6qRl/g2K10xyR
 EYxdLWaFzpDHc+U00F/5cFp9Cg==
X-Google-Smtp-Source: ABdhPJw6WJyoc3Ex5W8OoqUqjqPXoGEGndN91bj9avwjzNNfEpZ1FBLC4lwb+wW7eHqZc6Ry4Me0hw==
X-Received: by 2002:a7b:c74d:: with SMTP id w13mr794513wmk.11.1633027946061;
 Thu, 30 Sep 2021 11:52:26 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id l124sm5487151wml.8.2021.09.30.11.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 11:52:25 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH 0/3] virtio-iommu: Support VIRTIO_IOMMU_F_BYPASS_CONFIG
Date: Thu, 30 Sep 2021 19:50:48 +0100
Message-Id: <20210930185050.262759-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace the VIRTIO_IOMMU_F_BYPASS feature with
VIRTIO_IOMMU_F_BYPASS_CONFIG, which enables a config space bit to switch
global bypass on and off.

Add a boot-bypass option, which defaults to 'on' to be in line with
other vIOMMUs and to allow running firmware/bootloader that are unaware
of the IOMMU.

See the spec change for more rationale
https://lists.oasis-open.org/archives/virtio-dev/202109/msg00137.html

Jean-Philippe Brucker (3):
  NOMERGE: virtio-iommu: Add definitions for
    VIRTIO_IOMMU_F_BYPASS_CONFIG
  virtio-iommu: Default to bypass during boot
  virtio-iommu: Support bypass domain

 include/hw/virtio/virtio-iommu.h              |  1 +
 include/standard-headers/linux/virtio_iommu.h | 10 +++-
 hw/virtio/virtio-iommu.c                      | 60 ++++++++++++++++---
 hw/virtio/trace-events                        |  4 +-
 4 files changed, 64 insertions(+), 11 deletions(-)

-- 
2.33.0


