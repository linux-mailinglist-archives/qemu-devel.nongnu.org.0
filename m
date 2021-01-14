Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11302F5B3C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 08:25:41 +0100 (CET)
Received: from localhost ([::1]:49512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzx0m-0005wr-5W
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 02:25:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1kzwyI-0004ce-5T
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 02:23:06 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:35556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1kzwyD-0002JT-71
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 02:23:03 -0500
Received: by mail-pg1-x52a.google.com with SMTP id n7so3194497pgg.2
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 23:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZWtlekwNWiVW11r4B4rUEmrqK0/icouxwBqr03e96mw=;
 b=NJZeJ3midg+mP13O+IsRVIHy1UTZZ8Qd4EkqB8/8TXaBUyKGnYsh4IzIUxCRuyepFb
 TotKEyZrLx2qIn874WOV6ZdaHm0my0DxsB9ha7M0+VMQeBTJqVtFNWXcwdK0hqKc8idk
 zf1+5b87SqV+KrkWhHrIu8048IxGC3tnrr5npqS38753YjyIsefhREGciQCNM7vQMYW8
 3nuzt2pKrK05RpxpnTzaTMNjB56Bbu0dkKVN9suaBPvRcgAf81DWQBocT/t7ylRp92oC
 HWlDSfQP5QnGVPOOCWGzBb2ueYV7GAMNptDkYsnY0H1V0eljHLgWgq7JpXu2+T4EhHT6
 egnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZWtlekwNWiVW11r4B4rUEmrqK0/icouxwBqr03e96mw=;
 b=aTQThkpssr2HFUJcq0hT0LH+1HEjmOMWLzi0PFlBszqiZL8YGPMUc0LRkrZFr485GH
 23OqblYq/nerwSPRkfWWO0/CTGG2XZfstc4cZ3OgDIx7CbeprsHMuHwwWnjyr/ORCAF2
 MJYXJz1d57Q2OvzvIjWWLVOuS2paBoH+o3rCQL15/7sEvryOdGeSKMvvFgMaizdPg/WB
 nXbkJTS/pxjKJWsEcZdCI7i3ITzaa4WOlttuW7yCMu3hmhp0Bio/poIbwnjJr1+32EFM
 4aKT3knKvlOcdyJZ5Aq9d1kAqYN0cvSjjyIULJl/2K224XPCM70g/nRbM2jNPbuyDDkj
 j4DQ==
X-Gm-Message-State: AOAM533tZZZH/jRrxjj5OP53GBVNt212pFtUxB38EtgE32CiLaMhnNH+
 V3XDQp4E2l2DiFLn10jyFUoMaQ==
X-Google-Smtp-Source: ABdhPJzApe3k39bE1o/blUT562LBPN2Fcz+wsoazTHv0a915MwCyEh54Uu9RieXYONfHvzUMl+APsw==
X-Received: by 2002:a05:6a00:1716:b029:19e:11b0:7804 with SMTP id
 h22-20020a056a001716b029019e11b07804mr6136583pfc.57.1610608978705; 
 Wed, 13 Jan 2021 23:22:58 -0800 (PST)
Received: from always-libai.bytedance.net ([61.120.150.71])
 by smtp.gmail.com with ESMTPSA id i7sm4450323pfc.50.2021.01.13.23.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 23:22:58 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: kbusch@kernel.org, its@irrelevant.dk, kwolf@redhat.com, mreitz@redhat.com
Subject: [PATCH v3 0/4] support NVMe smart critial warning injection
Date: Thu, 14 Jan 2021 15:22:47 +0800
Message-Id: <20210114072251.334304-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: zhenwei pi <pizhenwei@bytedance.com>, philmd@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2 -> v3:
- Introduce "Persistent Memory Region has become read-only or
  unreliable"

- Fix overwritten bar.cap

- Check smart critical warning value from QOM.

- Trigger asynchronous event during smart warning injection.

v1 -> v2:
- Suggested by Philippe & Klaus, set/get smart_critical_warning by QMP.

v1:
- Add smart_critical_warning for nvme device which can be set by QEMU
  command line to emulate hardware error.

Zhenwei Pi (4):
  block/nvme: introduce bit 5 for critical warning
  hw/block/nvme: fix overwritten bar.cap
  hw/block/nvme: add smart_critical_warning property
  hw/blocl/nvme: trigger async event during injecting smart warning

 hw/block/nvme.c      | 86 ++++++++++++++++++++++++++++++++++++++++----
 hw/block/nvme.h      |  1 +
 include/block/nvme.h |  1 +
 3 files changed, 81 insertions(+), 7 deletions(-)

-- 
2.25.1


