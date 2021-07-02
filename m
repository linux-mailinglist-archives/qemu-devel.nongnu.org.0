Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DE93BA39E
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 19:26:55 +0200 (CEST)
Received: from localhost ([::1]:42126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzMwI-0003BY-0n
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 13:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lzMuD-0000No-IW; Fri, 02 Jul 2021 13:24:45 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:38699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lzMu9-0005lq-MN; Fri, 02 Jul 2021 13:24:45 -0400
Received: by mail-ej1-x62b.google.com with SMTP id gb6so646573ejc.5;
 Fri, 02 Jul 2021 10:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nAKjjyoCU8zkDj/ZRcym+tYs/ZsnewTALevBfBNaMQY=;
 b=ebFomY7mDamNK3lDusEA8hhPGN4jBQ3c2Ce5kRcNtplVOORTipmAmm1XtBVJNWkrCY
 MJl8aQDczmUInUoOGJkdzxaQ2Ef/R4EcbxPgxVV4ulBFrEUiQ0R3qlqz4YdnjleQY38t
 O7SykiluEgkWv5ZtocI0y94l9uA7j7XNfHDlmtneya0YrUtWRyusVkekg4QA0S+sOVq+
 PpTBKBnN3L1aHesxTzHBiMyjGu0LmQJq5er0+KAtGhxpFbH30t2P+dojhAMMNpn/2VwC
 68ZgUSJfuJk90oKNo9RIL+lt5A2eHXNsfj3UyOJyDbEmlUWxhKC8TlYH48tKbR3YVBxo
 BqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nAKjjyoCU8zkDj/ZRcym+tYs/ZsnewTALevBfBNaMQY=;
 b=Gc9mW1y76vWUssaXbOemt0U/ogQcij7zMnbFGP/tnec79Du+pPPligJJO6cIfOeZrp
 hwIRPQp7jYnmi2hM9EGScvCeNUPkYh2J8SaWbCBGJuizkbsLl0zMJg9Rk7R9pk+/5og1
 oJ+Bvd+49+EBqAlYyUseGYRxSJwyw2y3xUPThsa/5aGpt9Lpq2Rte4Ky3WX7K3Zr3xnp
 xwXmuh3rEgyINgTrg9ILzMsT90NtENxPTKQJxA9PLB+6QVWnzc/Zi/W5jshbuR3RHWWb
 lVpAK1UR5qvCANaKMNiiGaPH9eKg/wb7B6baoNFYgCcFHdemx6rE9Zh7N61nYA9JfZe2
 paSQ==
X-Gm-Message-State: AOAM532UBqrl33mlwJNEEebZoWYQmkzqDteuIFB3rYvCQXqr0Fey8x8R
 RHJlnyw42ZvBxwvbvuXFmNf8sbOjcNQIRA==
X-Google-Smtp-Source: ABdhPJyuzZz7QcYcELk419UX7g3uA7BxOAK5nWXZ8ZLjZ/hAUrSIbdlzQ7qFOM5+QlllSiA4WcPdRQ==
X-Received: by 2002:a17:906:4c91:: with SMTP id
 q17mr375059eju.122.1625246679652; 
 Fri, 02 Jul 2021 10:24:39 -0700 (PDT)
Received: from kwango.redhat.com (ip-94-112-132-16.net.upcbroadband.cz.
 [94.112.132.16])
 by smtp.gmail.com with ESMTPSA id ar27sm1242229ejc.100.2021.07.02.10.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 10:24:39 -0700 (PDT)
From: Ilya Dryomov <idryomov@gmail.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 0/6] block/rbd: migrate to coroutines and add write zeroes
 support
Date: Fri,  2 Jul 2021 19:23:50 +0200
Message-Id: <20210702172356.11574-1-idryomov@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=idryomov@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 ct@flyingcircus.io, Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series migrates the qemu rbd driver from the old aio emulation
to native coroutines and adds write zeroes support which is important
for block operations.

To achieve this we first bump the librbd requirement to the already
outdated luminous release of ceph to get rid of some wrappers and
ifdef'ry in the code.

V4->V5:
 - rebase on Kevin's block branch (https://repo.or.cz/qemu/kevin.git block)
   to resolve conflicts with "block/rbd: Add support for rbd image encryption"
   patch

V3->V4:
 - this patch is now rebased on top of current master
 - Patch 1: just mention librbd, tweak version numbers [Ilya]
 - Patch 3: use rbd_get_size instead of rbd_stat [Ilya]
 - Patch 4: retain comment about using a BH in the callback [Ilya]
 - Patch 5: set BDRV_REQ_NO_FALLBACK and silently ignore BDRV_REQ_MAY_UNMAP [Ilya]

V2->V3:
 - this patch is now rebased on top of current master
 - Patch 1: only use cc.links and not cc.run to not break
   cross-compiling. [Kevin]
   Since Qemu 6.1 its okay to rely on librbd >= 12.x since RHEL-7
   support was dropped [Daniel]
 - Patch 4: dropped
 - Patch 5: store BDS in RBDTask and use bdrv_get_aio_context() [Kevin]

V1->V2:
 - this patch is now rebased on top of current master with Paolos
   upcoming fixes for the meson.build script included:
    - meson: accept either shared or static libraries if --disable-static
    - meson: honor --enable-rbd if cc.links test fails
 - Patch 1: adjusted to meson.build script
 - Patch 2: unchanged
 - Patch 3: new patch
 - Patch 4: do not implement empty detach_aio_context callback [Jason]
 - Patch 5: - fix aio completion cleanup in error case [Jason]
            - return error codes from librbd
 - Patch 6: - add support for thick provisioning [Jason]
            - do not set write zeroes alignment
 - Patch 7: new patch

Peter Lieven (6):
  block/rbd: bump librbd requirement to luminous release
  block/rbd: store object_size in BDRVRBDState
  block/rbd: update s->image_size in qemu_rbd_getlength
  block/rbd: migrate from aio to coroutines
  block/rbd: add write zeroes support
  block/rbd: drop qemu_rbd_refresh_limits

 block/rbd.c | 406 ++++++++++++++++------------------------------------
 meson.build |   7 +-
 2 files changed, 128 insertions(+), 285 deletions(-)

-- 
2.19.2


