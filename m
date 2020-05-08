Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1953F1CAD12
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 14:59:43 +0200 (CEST)
Received: from localhost ([::1]:43600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jX2bN-0007mh-L5
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 08:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1jX2Wt-0007Fl-0L
 for qemu-devel@nongnu.org; Fri, 08 May 2020 08:55:03 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:33516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1jX2Wr-00038C-V4
 for qemu-devel@nongnu.org; Fri, 08 May 2020 08:55:02 -0400
Received: by mail-wm1-x342.google.com with SMTP id v8so9863928wma.0
 for <qemu-devel@nongnu.org>; Fri, 08 May 2020 05:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=vcmawNGolcSr0FlfA8Z05/mM0RwBuCRKaqBzUPxedkw=;
 b=L1Ij0jCZdJJBVY32xz9q3sR2Me8MsfdCw2TgV2K7rUnvQw4ZVABM6tuCHL32Staj9s
 hMY0C20fw4BYr1vsK6SiouryIZUNscKN972FF9AZXDtxC4p/mlo5VKKNfHFCpaqCGO7U
 AL0JSNN7aq3dxAml7y0JukSXVGgq9C1MW5Qj33nKRgvaKjq3RJzaI/eKciOuVfs9tBp+
 0lGMju4NwYZYlkNwZH7bIrMkPKHQtCnf78xOllpk32iVGcz1IybXWB5nVhiqeLY7JmL/
 sYJeYL6ggn5VuFCiAz/KVlVG5xiZjSqKBjp4clMjh9/FZc7RsNVirTZfo4adD9Y7wtaM
 XL+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=vcmawNGolcSr0FlfA8Z05/mM0RwBuCRKaqBzUPxedkw=;
 b=eHLkKkYw5mfJCgJjlhnR5Pj1SjoBzQsBJUVftb74RccHoi0Q0PmoRrJQZjKbHK4C/t
 6yrN6oR0hyeM35lOR4eUZiAIjb5tIL+J6raAmmtqczklxUNh3INz2vqU60up6wvZXtDP
 8VlMar+VVsoTIMlncuxsuTUfa0lcamt3yDt5E3V0xRBk5QMCSygwd/gcC/VhjhB6NGZI
 0mYoJJH+9hJuJQXvy91SasSg2G9E7JY8+8z81Ldd8K5S1HQNKytHDj3pDco/OHzm1Fp2
 OMdxYoAfV3jnHa/aCSBKyV9odknnSeZ7IGC3rBikooyU+tnWsOvrYtq0oyfoXH7xrifk
 mq/Q==
X-Gm-Message-State: AGi0PuYW+fDsCyKim5vHVqnxhCsi5FWTAqoLAcg4sW75qzmFHM7MYb3O
 esHjfeYRYG8LuREc/1/jcKZBFU/uS4oLKw==
X-Google-Smtp-Source: APiQypKbuATsiCAum132TU/EJVQtXU5CtWuBx/QhL413iIb9o7XWQ241pUSVt7H9Rb5tVNGUhFmqwA==
X-Received: by 2002:a1c:6a17:: with SMTP id f23mr15190455wmc.136.1588942499681; 
 Fri, 08 May 2020 05:54:59 -0700 (PDT)
Received: from f2.redhat.com (bzq-79-183-19-16.red.bezeqint.net.
 [79.183.19.16])
 by smtp.gmail.com with ESMTPSA id a8sm2852375wrg.85.2020.05.08.05.54.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 08 May 2020 05:54:58 -0700 (PDT)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: qemu-devel@nongnu.org, mst@redhat.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com
Subject: [PATCH 0/7] reference implementation of RSS and hash report
Date: Fri,  8 May 2020 15:54:45 +0300
Message-Id: <20200508125452.7802-1-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: none client-ip=2a00:1450:4864:20::342;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: yan@daynix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Support for VIRTIO_NET_F_RSS and VIRTIO_NET_F_HASH_REPORT
features in QEMU for reference purpose.
Implements Toeplitz hash calculation for incoming
packets according to configuration provided by driver.
Uses calculated hash for decision on receive virtqueue
and/or reports the hash in the virtio header

Changes from v7:
Patch 7.1: removed (RSS and hash report definitions)
Patch 7.2: delete configuration struct with RSS definitions
Patch 7.4: delete duplicated packet structure
Added patch 7 - adapt RSC definitions to updated header

Yuri Benditovich (7):
  virtio-net: implement RSS configuration command
  virtio-net: implement RX RSS processing
  tap: allow extended virtio header with hash info
  virtio-net: reference implementation of hash report
  vmstate.h: provide VMSTATE_VARRAY_UINT16_ALLOC macro
  virtio-net: add migration support for RSS and hash report
  virtio-net: align RSC fields with updated virtio-net header

 hw/net/trace-events            |   3 +
 hw/net/virtio-net.c            | 387 +++++++++++++++++++++++++++++----
 include/hw/virtio/virtio-net.h |  16 ++
 include/migration/vmstate.h    |  10 +
 net/tap.c                      |   3 +-
 5 files changed, 379 insertions(+), 40 deletions(-)

-- 
2.17.1


