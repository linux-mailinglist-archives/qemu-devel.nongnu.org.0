Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF153B3548
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 20:08:54 +0200 (CEST)
Received: from localhost ([::1]:51584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwTmX-0005yn-NQ
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 14:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwTiI-0007z5-93; Thu, 24 Jun 2021 14:04:30 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:43731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwTiG-0001PU-0O; Thu, 24 Jun 2021 14:04:29 -0400
Received: by mail-ej1-x62c.google.com with SMTP id nb6so10866410ejc.10;
 Thu, 24 Jun 2021 11:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g2RMNK+zMZypglwrQ73yQqoNLEmDt2vAmPh0aEvsBLw=;
 b=HK0sPhKl4/otOYNsh0U00huh7Gvb535OiEua6DtJHfS5RoSkN4yjuLDatIPDTzL8an
 Yf0dTAhTEtC06XkGff7x4Q6GQasad/QBaroV/ryb9oKB3RaAv+FigQJFZa8lYLBPkl79
 p3exxnZjXQLpWV54FaLM3HICBM1dMXL35UfHbh/gUnvbFIGSgi+B1cfTXm7k8txnoHWi
 YH/K7RRc/qVdodHlCWDhVWDFTCQQXWB1O/hLjkOd9MZZ0BqiyJlYKBjf92/KMedqt6wR
 8aZx6MEKDTq5BM1GSN8iE6vYUGJ95siIod4b4vTcG1c9bwgSDGebCa/WxZm56ukiYX58
 Ni8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=g2RMNK+zMZypglwrQ73yQqoNLEmDt2vAmPh0aEvsBLw=;
 b=EHTL5OvP0lHPPBUqF5zTS8tHfqY+MNDPPndyDXAF2WYZ3sOiDOeVZr2DcnKigqZTxE
 5QW/DYv1GmwCN25E5t/NXP0mmtc+Y2nbSdYFMEL11z+GPuPAkzdxv4Qb0HYf2oCOzm0N
 5OY5FkckP8FRSIkgNELmhkiKFTQllM7h2tcFIZqg2ymIWIPdGKrmJYMVIyfB5GP3E2Vq
 97jC6puGMYpNdeix91+juL07XS7eQfh/MO/j48htbwqHhi8K2+QbnnZHsq0QjVbogajW
 OkH6s69NDg7hRffvpNw0hy+SPMJVHrGMqaaCkX0yolJwPrNc0zMBE9o3BujKmAxZzdh+
 fxmg==
X-Gm-Message-State: AOAM531h63+uBGw9lXaIqAKPaoa2mTvYBM9IBggZuVfsPFfBTad0Pkux
 fomqPnDOybiD+rM/b5wSCisd3t/tU0o=
X-Google-Smtp-Source: ABdhPJxOMw6fknEZSFjA8kfWVuvZw508a5pJ0Te88jooH1auKX5Bmjl2p7utForoRrOwDaxMacHRFQ==
X-Received: by 2002:a17:907:2651:: with SMTP id
 ar17mr6477683ejc.135.1624557865447; 
 Thu, 24 Jun 2021 11:04:25 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a1sm2436466edt.16.2021.06.24.11.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 11:04:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/11] block: file-posix queue
Date: Thu, 24 Jun 2021 20:04:12 +0200
Message-Id: <20210624180423.1322165-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: mreitz@redhat.com, qemu-block@nongnu.org, mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

New patches:
- 3/4 (for review comments),
- 9 (split for ease of review),
- 11 (new bugfix)

v1->v2: add missing patch

v2->v3: add max_hw_transfer to BlockLimits

v3->v4: fix compilation after patch 1, tweak commit messages according
        to Vladimir's review

v4->v5: round down max_transfer and max_hw_transfer to request alignment
        checkpatch fixes
        return -ENOTSUP, -not -EIO if block limits ioctls fail
        handle host_cdrom like host_device in QAPI
        split "block: try BSD disk size ioctls one after another"
        new bugfix patch "file-posix: handle EINTR during ioctl"

Joelle van Dyne (3):
  block: feature detection for host block support
  block: check for sys/disk.h
  block: detect DKIOCGETBLOCKCOUNT/SIZE before use

Paolo Bonzini (8):
  file-posix: fix max_iov for /dev/sg devices
  scsi-generic: pass max_segments via max_iov field in BlockLimits
  osdep: provide ROUND_DOWN macro
  block-backend: align max_transfer to request alignment
  block: add max_hw_transfer to BlockLimits
  file-posix: try BLKSECTGET on block devices too, do not round to power of 2
  block: try BSD disk size ioctls one after another
  file-posix: handle EINTR during ioctl

 block.c                        |   2 +-
 block/block-backend.c          |  19 ++++-
 block/file-posix.c             | 144 ++++++++++++++++++++-------------
 block/io.c                     |   2 +
 hw/scsi/scsi-generic.c         |   6 +-
 include/block/block_int.h      |   7 ++
 include/qemu/osdep.h           |  28 +++++--
 include/sysemu/block-backend.h |   1 +
 meson.build                    |   7 +-
 qapi/block-core.json           |  14 +++-
 10 files changed, 156 insertions(+), 74 deletions(-)

-- 
2.31.1


