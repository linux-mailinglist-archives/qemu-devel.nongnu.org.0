Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A8D6A65C1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:51:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCZE-0007aG-8d; Tue, 28 Feb 2023 21:51:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXCZB-0007Zn-Kc
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:51:41 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXCZ8-0001ad-LZ
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:51:41 -0500
Received: by mail-pl1-x634.google.com with SMTP id i3so12555867plg.6
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677639092;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fR1wXsjA2cdbfPoLHhQKRpwyU5El49gHNi7HPqYhTLg=;
 b=UHuB5w+w/i4lkrJLrVt8dW5rIkP5yWCmg+rxAoKFVQ/jyPiNxFpxjOmfkz3o5Uvqn8
 JvJvCGKZmplQSbUvz0iRzbw/340nUUISZGIrs5vI59QCD37FMHvO6MTCC4zgBJPSp+I9
 B0SaMo8nwRygQ9xno/kPqFHie8j/OE8LAxJBbp3wLLGSbWHd/Vv4aHZldrfW4qO+u3EE
 kyPgaOwcf+xIF3BdXDYXXnyGIiPIoN/WSfdz3XOmhpFQ7EORb4n1EPhDcdiwzyPtv//U
 vv8UMSEayBcdo9TDwKk9Xy70wKYQsE5+JWVyTTzyiKIhQwaxp7SjxUe+5S9XVk4J0ONy
 f3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677639092;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fR1wXsjA2cdbfPoLHhQKRpwyU5El49gHNi7HPqYhTLg=;
 b=agT/DXIDgA0k+z8DSx6ruBnNONp0DmXFmqgzxZJm5MiLSH4GLu22KlKFGkKe6q6F8g
 XbrCsvI3DNeEQ871EhAXNzgoLL2tnwKUnQl23/BJ0W1d3v8HqPKkoN7pDbORUKaYlLiY
 Z/ihVzGU7U+JaRi8v0oUh+d7SkKCkyqOW96tkmrADzQ27GaY5CPsRF8MHSMoq+hN7g/A
 zR1dQ//9EFTv6u495rg6axN2qZBgvLLeo7OK0ppXP3BfcQ7u0yuzGA6mNKYHaSeVGRyK
 kbL/Yrt3CLCFl1Kb7RQ7LCcm9F2EXlxYvQB3Lc9L3lx5k2/eGoOfy4rFdvJWBdeqqfUH
 yxaA==
X-Gm-Message-State: AO0yUKWwhDuhknsZwIKAOV+y4RdSLfS9+Q8LPqoOlvlIzMVGfF2sK4MC
 tI4TDPloeE/zYqY9gLRn8ovdAGOtdjMxgekF
X-Google-Smtp-Source: AK7set8DfbdddzV6rNxpeOTtFOyl7zbF5fn2sFho5Ip4LMqvez1EFmaj4PFOOk72mmieJKjWQgyEWA==
X-Received: by 2002:a17:902:d506:b0:199:4d25:6a4d with SMTP id
 b6-20020a170902d50600b001994d256a4dmr15215861plg.10.1677639091864; 
 Tue, 28 Feb 2023 18:51:31 -0800 (PST)
Received: from libai.bytedance.net ([61.213.176.5])
 by smtp.gmail.com with ESMTPSA id
 ix1-20020a170902f80100b0019ab58f47a6sm7218743plb.105.2023.02.28.18.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:51:31 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com
Cc: dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, berrange@redhat.com,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v5 00/12] Refactor cryptodev
Date: Wed,  1 Mar 2023 10:51:12 +0800
Message-Id: <20230301025124.3605557-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x634.google.com
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
 include/sysemu/cryptodev.h      |  95 ++++---
 qapi/cryptodev.json             | 143 +++++++++++
 qapi/meson.build                |   1 +
 qapi/qapi-schema.json           |   1 +
 qapi/qom.json                   |   8 +-
 qapi/stats.json                 |  10 +-
 stats/stats-hmp-cmds.c          |   5 +
 stats/stats-qmp-cmds.c          |   2 +
 19 files changed, 776 insertions(+), 120 deletions(-)
 create mode 100644 backends/cryptodev-hmp-cmds.c
 create mode 100644 qapi/cryptodev.json

-- 
2.34.1


