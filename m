Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DB35E7C54
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 15:53:04 +0200 (CEST)
Received: from localhost ([::1]:56980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obj71-0002d2-Uo
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 09:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1obiyK-0003J5-RD
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 09:44:05 -0400
Received: from madras.collabora.co.uk ([46.235.227.172]:51286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1obiyH-0001ZD-Md
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 09:44:04 -0400
Received: from dellino.fritz.box (host-79-27-165-192.retail.telecomitalia.it
 [79.27.165.192])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: fahien)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 133486602247;
 Fri, 23 Sep 2022 14:43:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663940638;
 bh=Akt6aIFPpSO01QtykwwGZCFDyBhBwtwqjY95nymNDiQ=;
 h=From:To:Cc:Subject:Date:From;
 b=NptBgLSianDAdzFR11ThWmnsW4N+6ZROsU6xyCQXHeMtBJgnaAARJZIDD3XrfUJ34
 heM252ssi07dU8De/p/SGcM0f0woM+OUT1k0YCuUh/yZdmKA91B6A22JL1MdAyrycj
 zYCnznWhgXHIOZ2kw4VYpc4IrNMTZ9iuOLP5osuA4HPExNCbSYft7KKvtgtYvOpOfV
 5/i69w1mbTQHXrsa/r3KX+lHJInDrGv6LqzzFCnnlhm9T1Eem8ZQ93qsXZjNazdAAI
 /qLmgz0pOqZmY5vQeYLjS6lXBxR5sWwm+41rJ/qYzdtOQ4W06DXr7fMK+A145YijgA
 QQSzmDhOTT1Kg==
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Cc: gert.wollny@collabora.com,
	dmitry.osipenko@collabora.com
Subject: [PATCH v2 0/2] virtio-gpu: Resource UUID
Date: Fri, 23 Sep 2022 15:43:48 +0200
Message-Id: <20220923134350.324402-1-antonio.caggiano@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=46.235.227.172;
 envelope-from=antonio.caggiano@collabora.com; helo=madras.collabora.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable resource UUID feature and implement command resource assign UUID.

Antonio Caggiano (2):
  virtio-gpu: Unrealize
  virtio-gpu: Resource UUID

 hw/display/trace-events        |  1 +
 hw/display/virtio-gpu-base.c   |  2 ++
 hw/display/virtio-gpu-virgl.c  | 11 ++++++++
 hw/display/virtio-gpu.c        | 51 ++++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-gpu.h |  4 +++
 5 files changed, 69 insertions(+)

-- 
2.34.1


