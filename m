Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A596B54DD10
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 10:42:06 +0200 (CEST)
Received: from localhost ([::1]:34762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1l4n-0002A8-OK
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 04:42:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvL-0001a1-Mg
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvI-0002jo-Ar
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655368335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=q4snfMQmg9G/Y1psDnFgm/1ugVmvJfE5Y43xaWo6/P8=;
 b=DhuE+C6airQqyc0Lx8Y4RtT1uKP3ODg4nEJQnyVvgqAZkTLm/dolulu1ICERdyLOvqM0qZ
 i2SXFaEZlQDrYi7bu7V8spyLzcA/wi2n3x3kMS67YJ4MDBElRM0GMha9nh4rxCYzCb56XX
 EpnbK3ZozPzd5FSKr80AiO6cFd621rA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-k-tzWeG8P9ivuSFILTJfHA-1; Thu, 16 Jun 2022 04:32:13 -0400
X-MC-Unique: k-tzWeG8P9ivuSFILTJfHA-1
Received: by mail-ej1-f70.google.com with SMTP id
 kf3-20020a17090776c300b0070d149300e9so311469ejc.15
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 01:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q4snfMQmg9G/Y1psDnFgm/1ugVmvJfE5Y43xaWo6/P8=;
 b=aPiOghR2uEF1g1q4drqZSk8DNv7v5Bd35ULLiUWxd3LWPUZxrCuY+rOS9P/AEBA7Au
 uUZpgEDZkaCOpFcm4lLxPCOQuLp1ZBjyrnm45QVI/1CwKl6GQRFEUXYXb1Qlmc0hF9bn
 oHUEEKBAH1WyzYIan/FuStRGLG7oWqhAxqMiO1Pd6zNChpnrWC2jvF2K7PEKP5XZ2DQ1
 G6AohBU7+PXTtOjjZMlOXsp9Rs9whlpgw/+tu6Z1a7eqyfBFc/cmuA19tWWb+wDytwbg
 2AjwQsr/ffsM7SPVmo5EaXWautEqqIaf3AbNScCi11xE+nOUcW5voo56MZDvLczNAuGK
 WXew==
X-Gm-Message-State: AJIora92GzURfqmlDJ1yOqlHFe99cryUmVp+RO9aL9Lcqa1Udi7zQogb
 MpnRrBxhwU4VD9dCqkVgR7zlpOasJt9u22U4Z9HhMQaoby2AGmjxbk8UJuznTUBo9rPsbWyovLj
 /3vFKYis9JCzt3kvxbB4QU+l1kc3nvfCEv92s8p+feUOi1nejupFF9Zzs+lAaAY9iaKE=
X-Received: by 2002:a05:6402:228d:b0:42d:e319:7297 with SMTP id
 cw13-20020a056402228d00b0042de3197297mr4927653edb.79.1655368332268; 
 Thu, 16 Jun 2022 01:32:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u3gf2Ar0Gqwk/csAAlpwA3PbzVYrrdBtdDhKe2BlftHuAKHg0X1OPS94bXjFIjECTpaYzZnA==
X-Received: by 2002:a05:6402:228d:b0:42d:e319:7297 with SMTP id
 cw13-20020a056402228d00b0042de3197297mr4927620edb.79.1655368331909; 
 Thu, 16 Jun 2022 01:32:11 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b006fee7b5dff2sm477266ejo.143.2022.06.16.01.32.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 01:32:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/21] Statistics, preconfig and cleanup patches for 2022-06-16
Date: Thu, 16 Jun 2022 10:31:48 +0200
Message-Id: <20220616083209.117397-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

The following changes since commit debd0753663bc89c86f5462a53268f2e3f680f60:

  Merge tag 'pull-testing-next-140622-1' of https://github.com/stsquad/qemu into staging (2022-06-13 21:10:57 -0700)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 76ca98b0f85222601bd449252ac71df19e0dab29:

  build: include pc-bios/ part in the ROMS variable (2022-06-15 11:12:32 +0200)

----------------------------------------------------------------
* statistics subsystem
* virtio reset cleanups
* build system cleanups
* fix Cirrus CI

----------------------------------------------------------------
Alexander Bulekov (1):
      build: fix check for -fsanitize-coverage-allowlist

Mark Kanda (3):
      qmp: Support for querying stats
      kvm: Support for querying fd-based stats
      hmp: add basic "info stats" implementation

Paolo Bonzini (16):
      qmp: add filtering of statistics by target vCPU
      cutils: add functions for IEC and SI prefixes
      qmp: add filtering of statistics by provider
      hmp: add filtering of statistics by provider
      qmp: add filtering of statistics by name
      hmp: add filtering of statistics by name
      block: add more commands to preconfig mode
      s390x: simplify virtio_ccw_reset_virtio
      virtio-mmio: stop ioeventfd on legacy reset
      virtio: stop ioeventfd on reset
      virtio-mmio: cleanup reset
      configure: update list of preserved environment variables
      configure: cleanup -fno-pie detection
      tests/vm: allow running tests in an unconfigured source tree
      meson: put cross compiler info in a separate section
      build: include pc-bios/ part in the ROMS variable

Zhenzhong Duan (1):
      q35：Enable TSEG only when G_SMRAME and TSEG_EN both enabled

 Makefile                  |  12 +-
 accel/kvm/kvm-all.c       | 403 ++++++++++++++++++++++++++++++++++++++++++++++
 configure                 |  22 +--
 hmp-commands-info.hx      |  14 ++
 hmp-commands.hx           |  14 ++
 hw/pci-host/q35.c         |   3 +-
 hw/s390x/virtio-ccw.c     |  12 +-
 hw/virtio/virtio-bus.c    |   1 +
 hw/virtio/virtio-mmio.c   |  18 +--
 hw/virtio/virtio-pci.c    |   1 -
 include/monitor/hmp.h     |   1 +
 include/monitor/stats.h   |  45 ++++++
 include/qemu/cutils.h     |  18 +++
 meson.build               |  25 +--
 monitor/hmp-cmds.c        | 232 ++++++++++++++++++++++++++
 monitor/qmp-cmds.c        | 155 ++++++++++++++++++
 qapi/block-core.json      | 117 +++++++++-----
 qapi/block-export.json    |  21 ++-
 qapi/block.json           |   6 +-
 qapi/meson.build          |   1 +
 qapi/qapi-schema.json     |   1 +
 qapi/stats.json           | 249 ++++++++++++++++++++++++++++
 tests/unit/test-cutils.c  |  52 ++++++
 tests/vm/Makefile.include |  26 +--
 util/cutils.c             |  34 ++--
 25 files changed, 1368 insertions(+), 115 deletions(-)
 create mode 100644 include/monitor/stats.h
 create mode 100644 qapi/stats.json
-- 
2.36.1


