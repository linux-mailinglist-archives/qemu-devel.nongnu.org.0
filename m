Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 788CB67FC7C
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 03:58:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLxtJ-0003iK-QX; Sat, 28 Jan 2023 21:58:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLxtG-0003iA-Ok
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 21:57:58 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLxtE-00085f-Ik
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 21:57:58 -0500
Received: by mail-pl1-x635.google.com with SMTP id e6so278374plg.12
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 18:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V9Oaobdxg46ZiJ1EiQl+l1P3/vVa0pkm5iB9l3ct6ME=;
 b=zW/y4lBvaeGMq09gYzdwu9xm14kGo7H6gGWQKn9iIUyQzMm29uOKEqPTsuTm0DulRK
 uxg+WS9AbxY7CpeNCoDRCKNYvkpfO4ox/Q/7G19cZRnVJhEyEvPz9fbOqll7mumm9qZ8
 Nd2nu5dXFYbaZ/2TZ0DeI/pGj0dF2Bgv5ICs+zqSx/41bmdAU2dyoeZN/BFtIMGFQ6MK
 QMM6+91qCrf0uqMQLmD9P7364BGoUPuqMGSERT+MdMtrnHdhY8+G/cIQlNmLObJo0iIR
 KopxFeLuLQFlOQWImFXUk69t5caBvm/UsYJ134GKhgTeMudXOCdAQLdP3Y/gs89szhD1
 SzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V9Oaobdxg46ZiJ1EiQl+l1P3/vVa0pkm5iB9l3ct6ME=;
 b=dug7MHTVIPBVBQ2wf/1n17m7HW73jxsLU1Jc1Vkp4ZaXcPhT/gCKAuEAVzgFXaLckx
 ERvclr9GuUV20yx/WejswO/1cLW2TpegPkPhbbkxqn1M9yldX9gUQGG1NcqBmRP9RRcs
 1obJaxItbEvJ/Y15fOpaAeyyXWEs00uFTzBdi7Y1Psa4yLimqbbXCeuWg2KW1YBIGeSO
 jMJThIr/U0RVa9vJB+TEyf0spOvVn7lMW3MTu62qn0ibg91pV0hlgR4/WaM7VA01DZgU
 kAIh0SR0atWZfqi8nmgfg0Wr7kEQFEAp4fYS3zX6TKfSRx5EyuNFkL7s7bAB5u6IgYyH
 /37Q==
X-Gm-Message-State: AO0yUKW1x7cs23/fHIHZWtCRLpX5EbgLZhWQYJBP0v1kA+tLzxqBFHW1
 tUHLzpolvKIeU7Ck1QNKsEGl4A==
X-Google-Smtp-Source: AK7set8wJppT6BVJd32yqeAZgxXvGPGA60wRwpiEez+wtmeiwSzp0oPLRONJqj5WDXz7swiVthwd2Q==
X-Received: by 2002:a17:902:ecc1:b0:196:3e2c:4741 with SMTP id
 a1-20020a170902ecc100b001963e2c4741mr14188874plh.12.1674961074588; 
 Sat, 28 Jan 2023 18:57:54 -0800 (PST)
Received: from always-pc.bytedance.net ([61.213.176.6])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a170902ea8400b00194c90ca320sm5167084plb.204.2023.01.28.18.57.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 18:57:53 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, mst@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com
Cc: armbru@redhat.com, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v4 00/12] Refactor cryptodev
Date: Sun, 29 Jan 2023 10:57:35 +0800
Message-Id: <20230129025747.682282-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x635.google.com
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
 backends/cryptodev-lkcf.c       |  19 +-
 backends/cryptodev-vhost-user.c |  13 +-
 backends/cryptodev-vhost.c      |   4 +-
 backends/cryptodev.c            | 419 ++++++++++++++++++++++++++++++--
 hmp-commands-info.hx            |  14 ++
 hw/virtio/virtio-crypto.c       |  48 +++-
 include/monitor/hmp.h           |   1 +
 include/sysemu/cryptodev.h      |  95 ++++----
 monitor/hmp-cmds.c              |  42 ++++
 monitor/qmp-cmds.c              |   2 +
 qapi/cryptodev.json             | 143 +++++++++++
 qapi/meson.build                |   1 +
 qapi/qapi-schema.json           |   1 +
 qapi/qom.json                   |   8 +-
 qapi/stats.json                 |  10 +-
 17 files changed, 744 insertions(+), 120 deletions(-)
 create mode 100644 qapi/cryptodev.json

-- 
2.34.1


