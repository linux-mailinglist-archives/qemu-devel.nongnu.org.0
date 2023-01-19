Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD8F673239
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 08:15:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIP8H-00063J-NM; Thu, 19 Jan 2023 02:14:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pIP8A-00060x-RE
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:14:39 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pIP87-0002FG-8u
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:14:38 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 z9-20020a17090a468900b00226b6e7aeeaso996982pjf.1
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 23:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qRJgYkO90HCPPt3394GxSYjhKtwBvRGifXScnH7U6Ns=;
 b=cnhRXAUUNoRpToP6V9YMnlDtcYFmO8MyMHUL02Oxbj7AS3shCW+VZcOof5eO0lZG7I
 hb87pxx0QyI3q1vWGXx1GidO+/vRtrtMY45jP2AsMGME1PQ70daVDNDf4I2Bt7Y9jfV8
 U60e4vYVE+NfWiqtblH+DHai9dIOMs9heGNxcu/ol7yj6QqMIutk3G+IVbrYG68zBY8v
 bDQc37S8YuOVBwDgFLTv1zqSqizRkJuP1DfQOiyCaq0DGDljxsJwiSEAFBUVj9fY/n0Y
 RABNM9ifG9H8yaOTZmB4HAZQrX7waFwRpb7O6j/17eHNVd2Cvyn33YlKlER5lTQmYADV
 16pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qRJgYkO90HCPPt3394GxSYjhKtwBvRGifXScnH7U6Ns=;
 b=62Nh7gF2mTe7G9N8G361u/i7l/0WPHcTE0AgVTYkrntFk24uet47iTcP9UcajnL4sC
 7Sjgu33wQ57ST+gnqUupmJyxARPJVlZSoH8AyhcvwTdGybL6yp5yoAZ8rqosITJOmHgI
 uW3vVZVltrbWTUhekZYITIpmYQM61U52PgiSvyacPFOQUJ3Uo3bt7rsLQAgX23K9hj5I
 ynuLe4UXNYEW5kKG7LsvEezjQr6XhNtPdXDMiIqIsd1wrKXndlv+4DXpdH7DpaqKmO8c
 nlbBmhzE5OE7CC7i8i+qJisP3OdG+QvnC3gGNjR8G6etvv2nXM5kufPFxdUPi0ln8kPD
 Ny+Q==
X-Gm-Message-State: AFqh2kpQplLcIsblUt9VvPgkQ1ZD94S2/TIyAhEbbhidDUHkPW79ONpF
 0JkMLMYn/9pZStpw+jC8ushaHA==
X-Google-Smtp-Source: AMrXdXtcFj0f1IyDMHCneMxSLTMkyK4bo/owIHNt2YpyBsZ2E5i1X+oHKuN2rvW6vqRk2iFDPg/4cw==
X-Received: by 2002:a17:902:d506:b0:194:8a27:f5c6 with SMTP id
 b6-20020a170902d50600b001948a27f5c6mr14944386plg.22.1674112466489; 
 Wed, 18 Jan 2023 23:14:26 -0800 (PST)
Received: from always-pc.bytedance.net ([61.213.176.6])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a170902ef4400b0016d72804664sm24266631plx.205.2023.01.18.23.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 23:14:25 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, mst@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com
Cc: armbru@redhat.com, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v3 00/12] Refactor cryptodev
Date: Thu, 19 Jan 2023 15:14:07 +0800
Message-Id: <20230119071419.3585771-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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


