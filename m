Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B375A262C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 12:54:01 +0200 (CEST)
Received: from localhost ([::1]:33692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRWyN-0008DQ-Jw
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 06:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1oRWst-0002mY-A4
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 06:48:23 -0400
Received: from madras.collabora.co.uk
 ([2a00:1098:0:82:1000:25:2eeb:e5ab]:58822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1oRWsm-0007ht-7m
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 06:48:14 -0400
Received: from dellino.fritz.box (host-95-235-60-93.retail.telecomitalia.it
 [95.235.60.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: fahien)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D1EAA6601EBC;
 Fri, 26 Aug 2022 11:48:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1661510890;
 bh=Tmf4a51G1LFR9pab2kzOyWb3iQq7jEzyPdyTNh6cRjo=;
 h=From:To:Cc:Subject:Date:From;
 b=j3NlKDKDcALsN84h1LDe2/P4e+iGlDuwVON0snrkgit7B21eTCZn2mIOyGFVvXF+U
 xuWO56RaEH+mjPNbjazDfw4H0Lx+8RmLPDpF2+fSUz0S2OYyTUqc0iNcBjiNJHwI9H
 hMrGoCqwARQ/0fXW2+41ZezGrwPxYz7JW70cwMbINuMqnWC0VEgYumE4yw7QhkWnKE
 WyX2EqqFlojqB8+t/lKfer8qNLvh7yYry3lLCiTtMK6Duvrjv/p9ORPKnw/89cight
 ae6jIhl+g95AuC9UrWMuRADiBfHerb2J19N2L5gV1PBnhcneUUNgbcX+eMNnW/4hdO
 YkiMrMZtZPVdw==
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Cc: gert.wollny@collabora.com,
	dmitry.osipenko@collabora.com
Subject: [PATCH v4 0/1] virtio-gpu: CONTEXT_INIT feature
Date: Fri, 26 Aug 2022 12:47:58 +0200
Message-Id: <20220826104759.422925-1-antonio.caggiano@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1098:0:82:1000:25:2eeb:e5ab;
 envelope-from=antonio.caggiano@collabora.com; helo=madras.collabora.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This is a different attempt at upstreaming the work I have been doing to
enable support for the Venus Virtio-GPU Vulkan driver.

I believe the previous one [0] was a bit too much stuff in one place,
therefore with this I would like to try a more fine-grained approach.

I will just start by the CONTEXT_INIT feature as it was the first commit
of the series aforementioned and the virtio-spec has been updated
recently on that regard [1]. Hopefully this would also answer Gerd's
comment on the previous patch [2].

[0] https://www.mail-archive.com/qemu-devel@nongnu.org/msg826897.html
[1] https://github.com/oasis-tcs/virtio-spec/commit/aad2b6f3620ec0c9d16aaf046db8c282c24cce3e
[2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg827304.html

Antonio Caggiano (1):
  virtio-gpu: CONTEXT_INIT feature

 hw/display/virtio-gpu-base.c   |  3 +++
 hw/display/virtio-gpu-virgl.c  | 16 ++++++++++++++--
 hw/display/virtio-gpu.c        |  2 ++
 include/hw/virtio/virtio-gpu.h |  3 +++
 meson.build                    |  5 +++++
 5 files changed, 27 insertions(+), 2 deletions(-)

-- 
2.34.1


