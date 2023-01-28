Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1FC67F47E
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 04:58:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLcKp-0000Mx-4c; Fri, 27 Jan 2023 22:56:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLcKn-0000Mh-GY
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 22:56:57 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLcKl-0003mW-9Y
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 22:56:57 -0500
Received: by mail-pj1-x102c.google.com with SMTP id b10so6444602pjo.1
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 19:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oIh3XnzdtrEyV2zKgka0bh5YHJOsToaQul8vAIw0+CQ=;
 b=ybtYbNYC6d00bXeHC8M/Rr7keJhJZYAUzOfZYM7QKn3x9vxgvpOxuSqI/BCaxZLSye
 ZjkjPOwuBR5WHMw399wzFtUOHWIYTlyFmTDp16wn92al4tjcijjy+DvlPvNVLQFUkWlD
 admdr0z/oYgudnXilAnA1sXcoB1sj1BYu8JmNOV0n05+pDeJM9oq6WCfGsxO5TqbF4cq
 pUFcW5u2ewXkzQd3/2Eq6yMBrcTHF1STU2w8luF99SqPc3BF42Cx0KDNXwOfeV2JzYgn
 cMz9/YvLZMKmXrJvruWpa1mdPD6j+fDdzpp8PBqSpyKyqklJHftkhehkH/QaqaCpVq9q
 fLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oIh3XnzdtrEyV2zKgka0bh5YHJOsToaQul8vAIw0+CQ=;
 b=YGsTCdtjXQp8k2WzDUvgtTRR9zwF/6Hoatve+aDSPwXqLQehXI9Wzyu6wxe6iUTm7e
 JHwm1s/tDY0PMrA5+MKVO6DimE4/DLsn4h4A6bnuyAXQAXp4ob4wS7dIZt/Afw+2/NWX
 R5m4xxjsqcyLfssFEh2EBvaHLhiyltMeT+kCTyiAoXeJwVZ3BtBXqTjPE2a9A6HeKcx8
 yeXVhW8mfGOzxcaNvbsgDQ+HbOtkkEmVEGkodozruMDcG+ol8dZXSWg4EqtrpS7ey2Ad
 4FP4Q853c+DgIbI3v3S+MOg8pvSbpaCREbHGWJT4lyrf3aXmGBkcBY9HLZJC0UsOVvof
 ly+Q==
X-Gm-Message-State: AFqh2kp8xQlXP3IECQJg3B478wbsQhSlJoUy/tpY3eWLET+X6XZmVaa0
 nC8BJRuU5OzHn2fEGRs8jTad0A==
X-Google-Smtp-Source: AMrXdXtExmBSR33XQqgpJZCkG1lNspjseEEA1e5MN/be6k/C3aprdJ134fUPghLne79kOBWthiIOew==
X-Received: by 2002:a17:903:1cb:b0:194:d8b2:7a1b with SMTP id
 e11-20020a17090301cb00b00194d8b27a1bmr40779572plh.68.1674878205859; 
 Fri, 27 Jan 2023 19:56:45 -0800 (PST)
Received: from always-pc.bytedance.net ([61.213.176.6])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a170902ed4400b00186c3afb49esm3594662plb.209.2023.01.27.19.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 19:56:45 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Cc: dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v3 00/12] Refactor cryptodev
Date: Sat, 28 Jan 2023 11:56:21 +0800
Message-Id: <20230128035633.2548315-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102c.google.com
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

v3 -> v4:
- a small change in '0005-cryptodev-Introduce-query-cryptodev-QMP-command.patch':
  use 'uint32' instead of 'int' to describe CryptodevBackendClient:queue
- fix compling warning(gcc)/error(clang-11) on 32 bit platform in
  '0007-hmp-add-cryptodev-info-command.patch':
  use 'printf("%u", client->queue)' instead of 'printf("%ld", client->queue)'

v2 -> v3:
- rebase code against the lastest commist: fb7e7990342e59cf67d
- document the missing fields in qapi/cryptodev.json
- rework statistics part: use 'query-stats' command instead of
  'query-cryptodev'(cryptodev: Support query-stats QMP command)

v1 -> v2:
- fix coding style and use 'g_strjoin()' instead of 'char services[128]'
   (suggested by Dr. David Alan Gilbert)
- wrapper function 'cryptodev_backend_account' to record statistics, and
   allocate sym_stat/asym_stat in cryptodev base class. see patch:
   'cryptodev: Support statistics'.
- add more arguments into struct CryptoDevBackendOpInfo, then
   cryptodev_backend_crypto_operation() uses *op_info only.
- support cryptodev QoS settings(BPS&OPS), both QEMU command line and QMP
   command works fine.
- add myself as the maintainer for cryptodev.

v1:
- introduce cryptodev.json to describe the attributes of crypto device, then
   drop duplicated type declare, remove some virtio related dependence.
- add statistics: OPS and bandwidth.
- add QMP command: query-cryptodev
- add HMP info command: cryptodev
- misc fix: detect akcipher capability instead of exposing akcipher service
   unconditionally.

Zhenwei Pi (12):
  cryptodev: Introduce cryptodev.json
  cryptodev: Remove 'name' & 'model' fields
  cryptodev: Introduce cryptodev alg type in QAPI
  cryptodev: Introduce server type in QAPI
  cryptodev: Introduce 'query-cryptodev' QMP command
  cryptodev-builtin: Detect akcipher capability
  hmp: add cryptodev info command
  cryptodev: Use CryptoDevBackendOpInfo for operation
  cryptodev: Account statistics
  cryptodev: support QoS
  cryptodev: Support query-stats QMP command
  MAINTAINERS: add myself as the maintainer for cryptodev

 MAINTAINERS                     |   2 +
 backends/cryptodev-builtin.c    |  42 ++--
 backends/cryptodev-lkcf.c       |  19 +-
 backends/cryptodev-vhost-user.c |  13 +-
 backends/cryptodev-vhost.c      |   4 +-
 backends/cryptodev.c            | 419 ++++++++++++++++++++++++++++++--
 hmp-commands-info.hx            |  14 ++
 hw/virtio/virtio-crypto.c       |  48 +++-
 include/monitor/hmp.h           |   1 +
 include/sysemu/cryptodev.h      |  95 ++++----
 monitor/hmp-cmds.c              |  41 ++++
 monitor/qmp-cmds.c              |   2 +
 qapi/cryptodev.json             | 143 +++++++++++
 qapi/meson.build                |   1 +
 qapi/qapi-schema.json           |   1 +
 qapi/qom.json                   |   8 +-
 qapi/stats.json                 |  10 +-
 17 files changed, 743 insertions(+), 120 deletions(-)
 create mode 100644 qapi/cryptodev.json

-- 
2.34.1


