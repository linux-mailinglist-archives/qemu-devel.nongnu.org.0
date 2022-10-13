Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D605FDE0A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 18:14:32 +0200 (CEST)
Received: from localhost ([::1]:39978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj0qt-000392-Hk
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 12:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oj0jB-0001wv-7I
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 12:06:34 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:35331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oj0j7-0001cg-SK
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 12:06:31 -0400
Received: by mail-wr1-x42b.google.com with SMTP id u10so3594719wrq.2
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 09:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Zv+bKMgvsxIo1fDsjMTryCcHqvv+FI35a0k6LkQpHp0=;
 b=FUrCxapuMkEUio5uj9iNr1nYph6DBHaHb0FPQfAuqJOeMxCgQE/TnQOj9gWNSKyHFx
 cdUV+v7zdpI1qZYEeAsHTATos1dj1lN7tp3EyoaCgHmJ/PLM6+kqypcsJcBb2Cs/BUwH
 ZbTnhMIavitTLBff5Ggr3+0+/MZm6Fi4mr9/0xKH4DdUIIuFhYy04hOWXjw9fXaY5ENI
 ThMrQM645Tgn4rdHHSzAc48gobS/3z/xgn12p93G2K+BB0GJ+ulUFRcs8nw5u4LLOe6A
 6SzvxDGOd5RT0iOmNmr8Fk8/rgZhP1VOf43ZnRC+4bniZj3DGztVDqxtVExm+/X5XsEA
 14LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zv+bKMgvsxIo1fDsjMTryCcHqvv+FI35a0k6LkQpHp0=;
 b=bLLNYgLyXwPi92V9Wv4tUuc0a3V9KdPTkMTgTrLVSz7jPrcWtmjY5YAG2NoA/LmVFY
 ukf5leYuN1cYc3CvyH4z99wHndsWraUgTt2453QDb9agEENOfZkywmukdj1KPMuMIfSM
 P1Bl2fLLZCg+g4jy03S4UKYNuTx1PIuDVhq63OsMA8N6smP1akPanwFERpk6EFVt38bJ
 g7bjX9PvMz1l62MU4FlpAthZnxruF+sjuNi73sBJvWzW97Ji6qKmd1Z/iPaEh5AN16K9
 Mi8hyBJQ+HYIR99VWRprYecWHYBT0eELD+L2QXIvOvSo7Vlb912jZ/aP1UHBm+8p7QNW
 C+1g==
X-Gm-Message-State: ACrzQf1WNhiCZDDIePp9ejLRUdtxxJ3vdpCkVfUKQW57QVlApW8JMdL9
 9NrWyy6dFOTe6vXv4rWe/w6xGrsZQscRCA==
X-Google-Smtp-Source: AMsMyM4ZnNeWEbW1qSyq8qAV6ON18yzAkMAvKWm3HhI4+V2X2+25btLg3A6Xr/ftTjkt8yetoSg5aQ==
X-Received: by 2002:a05:6000:a11:b0:22e:3dab:537c with SMTP id
 co17-20020a0560000a1100b0022e3dab537cmr492785wrb.638.1665677186797; 
 Thu, 13 Oct 2022 09:06:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a05600c4fce00b003c6b67426b0sm5125617wmq.12.2022.10.13.09.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 09:06:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Hannes Reinecke <hare@suse.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Greg Kurz <groug@kaod.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 0/2] scsi: Switch to bus_cold_reset() and device_cold_reset()
Date: Thu, 13 Oct 2022 17:06:21 +0100
Message-Id: <20221013160623.1296109-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Back in 2020 we introduced a new set of reset APIs (the "3-phase
reset" system, as documented in docs/devel/reset.rst), but we left a
lot of the existing uses of older reset functions alone.

This patchset converts the SCSI subsystem to use the newer
device_cold_reset() and bus_cold_reset() instead of the old and
now-deprecated qdev_reset_all() and qbus_reset_all().

The semantics of qdev_reset_all() are that it recursively resets all
the devices on the qbus tree starting from the device you pass in,
resetting the child buses first and the device itself last. 
qbus_reset_all() is similar, except it starts with a qbus rather than
a qdev.  In both cases, the bus is reset by calling the
BusClass::reset method, and the device by calling DeviceClass::reset.

device_cold_reset() and bus_cold_reset() have identical "recursive
reset, children first" semantics, except that they are
three-phase-reset aware (and can handle both a newer device that
implements the 3 phases, and also older devices that only implement
the DeviceState::reset method).

I think we should be able to change to these new functions
mechanically across the whole codebase without any change in
behaviour, but my experience with reset is that it's not uncommon for
there to be lurking unforeseen consequences.  So I've opted to start
by just changing the SCSI subsystem, which has about half of the uses
of these deprecated functions.  Assuming this works out OK I'll
proceed to the rest of the tree.

Patch 1 does the qdev_reset_all() -> device_cold_reset() and
qbus_reset_all() -> bus_cold_reset() change (mechanically
generated using sed).

Patch 2 tidies up a loose end where one SCSI controller was using
device_legacy_reset() to do the "reset a device" action (harmlessly,
as no SCSI devices have further child buses, so the behaviour
was the same as qdev_reset_all() and device_cold_reset().

NB: tested only with 'make check' and 'make check-avocado'.

thanks
-- PMM

Peter Maydell (2):
  scsi: Use device_cold_reset() and bus_cold_reset()
  hw/scsi/vmw_pvscsi.c: Use device_cold_reset() to reset SCSI devices

 hw/scsi/esp.c         | 2 +-
 hw/scsi/lsi53c895a.c  | 4 ++--
 hw/scsi/megasas.c     | 2 +-
 hw/scsi/mptsas.c      | 8 ++++----
 hw/scsi/spapr_vscsi.c | 2 +-
 hw/scsi/virtio-scsi.c | 6 +++---
 hw/scsi/vmw_pvscsi.c  | 6 +++---
 7 files changed, 15 insertions(+), 15 deletions(-)

-- 
2.25.1


