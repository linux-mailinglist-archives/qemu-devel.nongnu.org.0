Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 837AF633E64
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 15:05:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxTt7-0008Ql-FV; Tue, 22 Nov 2022 09:04:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oxTt2-0008Q8-QT
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:04:33 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oxTt0-00061E-BT
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:04:32 -0500
Received: by mail-pg1-x52f.google.com with SMTP id f9so9951572pgf.7
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 06:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R5dQBOhEa7u5Y86yx4ZZMB00yeXX6R92u9Y1NN/ndsY=;
 b=I8B4QQ4PcEoqiOP4BeMIcKFNiO0VkeZb+3p1jEmo8MZFVE1T86yq0ebS7k5P8AehDe
 6fHtzhPU66Pho+2kKl5CerkN+zeqMNxeyULj7yfrln4XyjO6YAHpr91buIRCKCv4wTwx
 /QJjr4vImRAL3WkL3yBM0hOn/HQxbh0PMsegQg/+bzceIepwqvWb2zteClCGIWjBJL58
 Su1EJqKHiIjs0x4qkstVnkHTcKvQhBvP8VdjA2VHPQ9+8SOPvpHkmZgyQuGJO2t5fHbs
 YfrEhoEMhz0rfdBftUvpohX8AlfaypIvaNi4ysfudh49MZ1uxMLsGuhOoB9LJge/WRkW
 DAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R5dQBOhEa7u5Y86yx4ZZMB00yeXX6R92u9Y1NN/ndsY=;
 b=intvE+CQwdmCJjN0YurSvJC7L9EkaaiXPoAGUX/eFHKQIYoV+CqOtMseAsTO7MSRFz
 tWyaTVdsYafXLMQOjgpwagx8DMTs85N5iWxI4tW4MKD4uXyw5bw9kMzExoVyheiIXknM
 BVl3rTlW82TbVGvzPQrOOGL9gSLlqrN/YQVzcNRouqCkijJ8PKg1kLkF3nvTNfnu8qSH
 vLwY5X98U09LG0T/SNdMQ3PnCnLE0oZUDyAM4BAHPeqK9R6xXLUzCdBCyDk+Ff1xeYYA
 doQcN4m6oOlZKazQM52/LKAfULBTZQq77v1P/wJWj9L0yZaDUWrKSvDHftZTBQcYtiya
 pM3A==
X-Gm-Message-State: ANoB5pl1G7tGdrG5rCKpy24AWcFIQ5KZBdgyEcnKlMS2a+2gvdgZIroC
 N/kyfkxraKYemJogl8j85SQdaw==
X-Google-Smtp-Source: AA0mqf6A1DPXNlbujPHQDqOECgwoof2JZ/uLfO7awaqlbIJSgFbXrb9FH4Er0xNAjkgyCPUnX9V6dA==
X-Received: by 2002:a63:4d61:0:b0:477:b1a8:531e with SMTP id
 n33-20020a634d61000000b00477b1a8531emr1100408pgl.158.1669125866474; 
 Tue, 22 Nov 2022 06:04:26 -0800 (PST)
Received: from always-T480.www.tendawifi.com ([139.177.225.252])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a170902e74100b00186b280a441sm12097410plf.239.2022.11.22.06.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 06:04:26 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, mst@redhat.com, dgilbert@redhat.com,
 eblake@redhat.com, armbru@redhat.com, michael.roth@amd.com,
 pbonzini@redhat.com
Cc: qemu-devel@nongnu.org,
	zhenwei pi <pizhenwei@bytedance.com>
Subject: [for-8.0 v2 00/11] Refactor cryptodev
Date: Tue, 22 Nov 2022 22:07:45 +0800
Message-Id: <20221122140756.686982-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pg1-x52f.google.com
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

Zhenwei Pi (11):
  cryptodev: Introduce cryptodev.json
  cryptodev: Remove 'name' & 'model' fields
  cryptodev: Introduce cryptodev alg type in QAPI
  cryptodev: Introduce server type in QAPI
  cryptodev: Introduce 'query-cryptodev' QMP command
  cryptodev: Support statistics
  cryptodev-builtin: Detect akcipher capability
  hmp: add cryptodev info command
  cryptodev: Use CryptoDevBackendOpInfo for operation
  cryptodev: support QoS
  MAINTAINERS: add myself as the maintainer for cryptodev

 MAINTAINERS                     |   2 +
 backends/cryptodev-builtin.c    |  42 +++--
 backends/cryptodev-lkcf.c       |  19 +-
 backends/cryptodev-vhost-user.c |  13 +-
 backends/cryptodev-vhost.c      |   4 +-
 backends/cryptodev.c            | 295 +++++++++++++++++++++++++++++---
 hmp-commands-info.hx            |  14 ++
 hw/virtio/virtio-crypto.c       |  48 ++++--
 include/monitor/hmp.h           |   1 +
 include/sysemu/cryptodev.h      |  94 +++++-----
 monitor/hmp-cmds.c              |  36 ++++
 qapi/cryptodev.json             | 144 ++++++++++++++++
 qapi/meson.build                |   1 +
 qapi/qapi-schema.json           |   1 +
 qapi/qom.json                   |   8 +-
 15 files changed, 604 insertions(+), 118 deletions(-)
 create mode 100644 qapi/cryptodev.json

-- 
2.20.1


