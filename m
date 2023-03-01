Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D151A6A6B41
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 12:01:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXKB0-0004Wn-Lh; Wed, 01 Mar 2023 05:59:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXKAt-0004WN-PU
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:59:11 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXKAr-0006At-Of
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:59:07 -0500
Received: by mail-pl1-x635.google.com with SMTP id i3so13559920plg.6
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 02:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677668343;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nw/Nte8hvsUVjDmUp9gil9mss95Yr0iOSAn3UtYdJgY=;
 b=llGHmIgU0PV1uTuvvHdL3SStxZAxvD1E4bL0ZbQ9KUVRQIw5Pwwh6bHLsGXipxboSU
 nO8ATN2b+u08zLLZNTXDnWgDuPw/dmLpZdZ/vaIWZ7R3G0Ct91mbdzGjOsTfBWtj49h/
 DfD0XoA1X9Y658uxgkcKeGzO9vf08r5tqnFCuPHm3GTXGK6VvGIFsMeVvKpH57cQtQ8m
 /mG6xa4MODI6JfqLPeEzRJzpDsQfrH/Mp+uF+DICD51cEHHfstVEPgvjBjM0HVKUqeIW
 V/U39pbRejLM9dVdB+oBsUVPHylPjheGYii4A92vOha6rWbNHZC1o65cikRXSxzEyasD
 5vFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677668343;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nw/Nte8hvsUVjDmUp9gil9mss95Yr0iOSAn3UtYdJgY=;
 b=NdH6rZPcZwz00d0cDXR58NRgxR3siNMZBpTySDH8bC3+5HnXOQIVVp4lk8a9lrq+2S
 WK5YPg9VoW08HU+l59oM7dyXJ2pzxcg9dZAOOcQ/x9CZV4FEFXcucDDsvrA0pb6Jw29u
 cyLBKwrXIoK6vq1h9MSUl2S71c7iyO7B+21sJ5yQ6ZSkeIK2OmE52CDuuNVP1oNZisOE
 O/Ybv6gf8Hk47CkRR9iYALnQ09UBjaB6p+ZCIDSh+i3Ub2A5pRRBGWPffPZN8jsUUqg7
 2P5RmexOSthgJgtwHhYKfZdmBd5Z73T+c696+QiEueDNhzU87lAdrQs+Y82RN3V0Em4s
 gp3A==
X-Gm-Message-State: AO0yUKWMwixfJ8Sw9gGSpLbqs1jAR4JAB2T8dveVjOhAEqboTfTRSMtR
 Dt5cVIOSifLbfZtRMqH6W8slCw==
X-Google-Smtp-Source: AK7set8XEHpDwPOIPMnjlIdbCfA/dLonHtkFfarp/dDRLrq8BbEsmiOeQ2/qMhttwkVv6BegCIxaDQ==
X-Received: by 2002:a17:90b:1c88:b0:233:ebd4:301c with SMTP id
 oo8-20020a17090b1c8800b00233ebd4301cmr6721519pjb.1.1677668343468; 
 Wed, 01 Mar 2023 02:59:03 -0800 (PST)
Received: from libai.bytedance.net ([61.213.176.5])
 by smtp.gmail.com with ESMTPSA id
 mj9-20020a17090b368900b002342ccc8280sm7829149pjb.6.2023.03.01.02.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 02:59:03 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Cc: dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v6 00/12] Refactor cryptodev
Date: Wed,  1 Mar 2023 18:58:35 +0800
Message-Id: <20230301105847.253084-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

v6 -> v7:
- Suggested by Daniel, Drop 'QCryptodevBackendSymStat' and 'QCryptodevBackendAsymStat'
  from QAPI, declare a normal C struct directly instead.
- Other minor changes. (QCryptodevBackendSymStat -> CryptodevBackendSymStat)

v5 -> v6:
- Rebase code against the latest version: 627634031092e1514f363fd8659a579398de0f0e
- Markus has already separated HMP commands from monitor/* into subsystems, so
  rework patch '0007-hmp-add-cryptodev-info-command.patch', move cryptodev HMP
  command implements into backends/cryptodev-hmp-cmds.c.
- Suggested by Daniel, use constant strings for query-stats. Changes in
  '0011-cryptodev-Support-query-stats-QMP-command.patch'.

v4 -> v5:
- suggested by MST, use 'PRIu32' instead of '%u' to print a uint32_t value
- correct *QCryptodevBackendClient* and *QCryptodevInfo* in qapi/cryptodev.json

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
 backends/cryptodev-hmp-cmds.c   |  54 ++++
 backends/cryptodev-lkcf.c       |  19 +-
 backends/cryptodev-vhost-user.c |  13 +-
 backends/cryptodev-vhost.c      |   4 +-
 backends/cryptodev.c            | 433 ++++++++++++++++++++++++++++++--
 backends/meson.build            |   1 +
 hmp-commands-info.hx            |  14 ++
 hw/virtio/virtio-crypto.c       |  48 +++-
 include/monitor/hmp.h           |   1 +
 include/sysemu/cryptodev.h      | 113 ++++++---
 qapi/cryptodev.json             |  89 +++++++
 qapi/meson.build                |   1 +
 qapi/qapi-schema.json           |   1 +
 qapi/qom.json                   |   8 +-
 qapi/stats.json                 |  10 +-
 stats/stats-hmp-cmds.c          |   5 +
 stats/stats-qmp-cmds.c          |   2 +
 19 files changed, 740 insertions(+), 120 deletions(-)
 create mode 100644 backends/cryptodev-hmp-cmds.c
 create mode 100644 qapi/cryptodev.json

-- 
2.34.1


