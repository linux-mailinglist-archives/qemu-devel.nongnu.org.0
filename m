Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C2A495850
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 03:32:36 +0100 (CET)
Received: from localhost ([::1]:54822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAjj9-0007q3-7S
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 21:32:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nAjf1-0005C3-Dl
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 21:28:19 -0500
Received: from [2607:f8b0:4864:20::102e] (port=50930
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nAjew-0002As-SV
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 21:28:17 -0500
Received: by mail-pj1-x102e.google.com with SMTP id pf13so8131922pjb.0
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 18:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wCjPxRn3fHoWfz/m/BnyYjG6XbQIS4YMEsA+jJCQ6mU=;
 b=EZxDNT6EnDXujgc8AsKXXHti9YlTcXskLkosxNbJ8XJ3JRYy3aoReRCj8MoHDEuf47
 9IawY6RQBRYXIhx887Uv3cuSpcuBsVCFVVJsGDugZWryYCKvPA5axwDkKUYUa04UBD5J
 d+0xvqKuR+jon1hGNV2qyyQim3/kv8GKTdidFFXEz2Yb+ua7FMIxoijqDd11q4eSqOJ9
 8o1RNNKAeWaO6Cb7sY5hdd0KZc3S8+dadNamsq/6Ty7IJGhkmmYwXMZtgmFFF/KhC4v8
 z2eXWVsB8br3Jrr5UszGjgxEh9UvvjgQqk3UDE9zHw4Q4nYOAOrw6bsRIA55X0myE/Gl
 nimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wCjPxRn3fHoWfz/m/BnyYjG6XbQIS4YMEsA+jJCQ6mU=;
 b=0XSEvK30jUhqjx/274I1V7fIAGK1OdnqzyP+cX+WQseMDMyvAMQ/EDDoVZQjk7eP+w
 LVfD0tU4ITyKXVRm8EHydkqTQ52YOBOQIvhpYpjx+uXwIwpYR7EsE0S/bqQu3MfaP/gk
 z5bjz2k52MzvaRAxmyvBSraBFn+mTMrElZ+QrznhHpFEk/ocYikv1Fd+6j0k37/U5LIF
 Y0pbTyXq4Ut+w0QN22vvNxMUvVnPqOs05x98iw72eA3A5oF/qKbEtJwhMilDI7Fhcuu9
 bC32ibfX7dtgMT4s9atl1TIclZtbIsx96pAuJgEPzUyjves1SSCgBQh6iFDA+ytxZm+V
 NqAQ==
X-Gm-Message-State: AOAM533vk6zRGUcMyRNB2ksOHYZLDisKRDEwmFgCO7pSFmzeDXkw4lts
 mKEWzF/37gIjovFOB3tVzPahMg==
X-Google-Smtp-Source: ABdhPJwKtlF24ZY6oQKPmoZJY/5g7HsYvVA1+Ve6eXrsuc+xE0UAMhyHZgjYn48sgyTtgz4jt47EAg==
X-Received: by 2002:a17:902:f545:b0:14a:725f:74a5 with SMTP id
 h5-20020a170902f54500b0014a725f74a5mr1744893plf.2.1642732091862; 
 Thu, 20 Jan 2022 18:28:11 -0800 (PST)
Received: from libai.bytedance.net ([61.120.150.72])
 by smtp.gmail.com with ESMTPSA id d1sm4825404pfj.179.2022.01.20.18.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 18:28:11 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com,
	mst@redhat.com,
	berrange@redhat.com
Subject: [PATCH 0/3] Support akcipher for virtio-crypto
Date: Fri, 21 Jan 2022 10:26:57 +0800
Message-Id: <20220121022700.1042649-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>,
 helei.sig11@bytedance.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

- Support akcipher for virtio-crypto.
- Introduce akcipher class.
- Introduce ASN1 decoder into QEMU.
- Implement RSA backend by nettle/hogweed.

Lei He (1):
  crypto: Introduce RSA algorithm

Zhenwei Pi (2):
  virtio-crypto: header update
  virtio_crypto: Support virtio crypto asym operation

 backends/cryptodev-builtin.c                  | 201 ++++++--
 backends/cryptodev-vhost-user.c               |  34 +-
 backends/cryptodev.c                          |  32 +-
 crypto/akcipher-nettle.c                      | 486 ++++++++++++++++++
 crypto/akcipher.c                             |  91 ++++
 crypto/asn1_decoder.c                         | 185 +++++++
 crypto/asn1_decoder.h                         |  42 ++
 crypto/meson.build                            |   4 +
 hw/virtio/virtio-crypto.c                     | 328 +++++++++---
 include/crypto/akcipher.h                     |  77 +++
 include/hw/virtio/virtio-crypto.h             |   5 +-
 .../standard-headers/linux/virtio_crypto.h    |  98 +++-
 include/sysemu/cryptodev.h                    |  88 +++-
 meson.build                                   |  11 +
 14 files changed, 1526 insertions(+), 156 deletions(-)
 create mode 100644 crypto/akcipher-nettle.c
 create mode 100644 crypto/akcipher.c
 create mode 100644 crypto/asn1_decoder.c
 create mode 100644 crypto/asn1_decoder.h
 create mode 100644 include/crypto/akcipher.h

-- 
2.25.1


