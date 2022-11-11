Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 832AB625422
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 07:55:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otNp2-0006XK-SX; Fri, 11 Nov 2022 01:47:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1otNon-0006Ul-4w
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 01:47:16 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1otNok-0008DH-2B
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 01:47:12 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 z5-20020a17090a8b8500b00210a3a2364fso7294122pjn.0
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 22:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N4Eh9TfIUOhkuP9CW5EHN8uYtBnC3gxdOYeEv4PLs3s=;
 b=cZESoiauqmam8uigAORA7qP9Ht8+ljZQ9F5CgRDl38+5ap+WaA6F83Z45J8hv8RSz3
 fSltjKzttPSKtZhaLfAmJJjE90iFqXNpb3/BFO3Sa0i1FceA7uQEDHcIuxeTj1KddKQc
 mxuSYN4CkNXrugfrHCGes2tIs+mfqluH38iCZ+Lh6w8pliLZMjiCjPxHNBbqefp5mUqd
 HYhI0suXU6L2FIBhO4VfbWvbibPXh0do5NVJ9vIV+5IR1QLCKbWONYL75PZJntxMmRab
 kuCN3VQ985VwUb4wPYVdJIe2pQZ+5BpLa9NkXL5VkZ31fgXGNKK1TriAcfiggCMyC68T
 bOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N4Eh9TfIUOhkuP9CW5EHN8uYtBnC3gxdOYeEv4PLs3s=;
 b=4v6iuUlGA1sypJ4U3xQNP7YwHUCWZ89Zu9fbmc76huyJkbogXOl183Z/jSfhzYiAYt
 UBJr8L7nVZWeor/kUfewVLLUM9N3mO57fJVjXPIXxY6O+enl2HZ2sjR+fGxdepgz0EC1
 jD9Ivq2QhHyMbc1iI/4pH4oC0lJ65pTrLSqkcC5X4f0YJ6zLlJ0xzZ5Ptn2TYqvaQRbo
 tW3OE2GPscL6fep9+RHkHvG0QRayWhsVm4tB3aTB5l19Z/wwSN2YznMXBK1pU5kJKx8o
 c25Fi2bAo2k+u4v6vmGmDbZuTrOUaz7JjrpLtSVd8/rKHVlIeGs+o5pe++UakNzGGs2X
 Wr7A==
X-Gm-Message-State: ANoB5pkyJsbRP9llpPg03qaZQgJ393LdFk9eBMHJGC0kN87UDEsfBWPB
 jxfo6XCEtOcBo7P9GAahvmTPNg==
X-Google-Smtp-Source: AA0mqf55axjA+wlWBz52rWSFYtaiTQCGOrrowXBdEL/+oXhO97Ex7IAptA8IJtavOtOsiIHlgQ+4aw==
X-Received: by 2002:a17:90b:3709:b0:205:e1af:68d1 with SMTP id
 mg9-20020a17090b370900b00205e1af68d1mr435178pjb.121.1668149225577; 
 Thu, 10 Nov 2022 22:47:05 -0800 (PST)
Received: from always-x1.bytedance.net ([63.216.146.186])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a170902e5ca00b0017f64ab80e5sm841022plf.179.2022.11.10.22.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 22:47:05 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, dgilbert@redhat.com, mst@redhat.com,
 eblake@redhat.com, armbru@redhat.com, michael.roth@amd.com
Cc: qemu-devel@nongnu.org,
	zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH for 8.0 0/8] Refactor cryptodev
Date: Fri, 11 Nov 2022 14:45:45 +0800
Message-Id: <20221111064553.246932-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The main changes in this series:
- introduce cryptodev.json to describe the attributes of crypto device, then
  drop duplicated type declare, remove some virtio related dependence.
- add statistics: OPS and bandwidth.
- add QMP command: query-cryptodev
- add HMP info command: cryptodev
- misc fix: detect akcipher capability instead of exposing akcipher service
  unconditionally.

Zhenwei Pi (8):
  cryptodev: Introduce cryptodev.json
  cryptodev: Remove 'name' & 'model' fields
  cryptodev: Introduce cryptodev alg type in QAPI
  cryptodev: Introduce server type in QAPI
  cryptodev: Introduce 'query-cryptodev' QMP command
  cryptodev: Support statistics
  cryptodev-builtin: Detect akcipher capability
  hmp: add cryptodev info command

 MAINTAINERS                     |   1 +
 backends/cryptodev-builtin.c    |  46 +++++++---
 backends/cryptodev-lkcf.c       |  11 +--
 backends/cryptodev-vhost-user.c |  13 ++-
 backends/cryptodev-vhost.c      |   4 +-
 backends/cryptodev.c            | 101 ++++++++++++++++++----
 hmp-commands-info.hx            |  14 ++++
 hw/virtio/virtio-crypto.c       |  41 +++++++--
 include/monitor/hmp.h           |   1 +
 include/sysemu/cryptodev.h      |  61 ++++++++------
 monitor/hmp-cmds.c              |  36 ++++++++
 qapi/cryptodev.json             | 144 ++++++++++++++++++++++++++++++++
 qapi/meson.build                |   1 +
 qapi/qapi-schema.json           |   1 +
 14 files changed, 401 insertions(+), 74 deletions(-)
 create mode 100644 qapi/cryptodev.json

-- 
2.20.1


