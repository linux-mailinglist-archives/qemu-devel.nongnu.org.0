Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAD35481FC
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 10:49:53 +0200 (CEST)
Received: from localhost ([::1]:46362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0flg-0008Fu-Uh
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 04:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1o0fhw-0005fE-4d
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 04:46:00 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:44790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1o0fhq-0001Ep-A3
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 04:45:56 -0400
Received: by mail-pg1-x531.google.com with SMTP id 31so3318359pgv.11
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 01:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aEMCPeac0iKeoAHoV45ETawlMjAgiNZoLkg/dQsN13c=;
 b=EX+EsPlziZBrrJX6CSJZEbyrgXUs/4R/6B1NXXj5o3er+rnZtUsyyf7aBGVSUPecpt
 ImV4Fm9vQ2omwKwANjjqq1JOJAx0TwSHoL4leK9Ob9ZpHi+4hDpakecjFzT/WBQhx8W1
 PmjU3693DSvoY4vNLg4frdtkVIsQHV8kYni+bCS4XtdW5Vokd4P74diq/355kctBkNEy
 xxrsiUNk/uRJREK4sQUpAvs1qdnYOtj/BHVzSWql6OyKnutm8aFl9Q6ME4ZLxPgR8LIx
 tlhWZXcTuzHc1tT4HvpY7CYAEIPRovKZOA7sQpiOBj2Pn39YLn9FIfI0U+LnYj4kXL7b
 pMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aEMCPeac0iKeoAHoV45ETawlMjAgiNZoLkg/dQsN13c=;
 b=S6C00utcSXL77+XLL2MnWVijCN8hY0i78XdBfKFE0mPVjSRAqa+uECCnCpx331U4s9
 fiu19CInmUXa9HDFJjRY3MVjZnICuf+jOFXOZPtG3IM4s2obp6MXDdyHpxnVu0czHB56
 bHKde3hex94QUv3kcu1k8yArajN8J3jv6pOY1MTZB4HMqjg1ppK/RY/TP6PnCfZhMg0O
 5ewd2AhOV3Q5hPpIZsy4ydHKA2XFO51pgJDmwMezW6q18D+iunIFT2Tn5hlWGwSv5xpp
 50eC1pH5XEuIpn1wXj/vpzVPyb3Lvfm3KYT57VbrlTfC3XWwpNigpWch7JPib9clv+VT
 vDbw==
X-Gm-Message-State: AOAM530QIxwrLC1sm02ZSjPKB7MDlDBYHlLHWOByc/oz2gofFj8RHPee
 S5Zp1Ty9d2qlYPuwAT0Iue9Srw==
X-Google-Smtp-Source: ABdhPJwFCUD/kYZlGntmOJAWKUoYIvFLkOdEt8+fF1NlZ/e/VoSNl/oUtyjWsgZ6zroyn+HUVQKozA==
X-Received: by 2002:a63:fd58:0:b0:405:1ff7:3ffe with SMTP id
 m24-20020a63fd58000000b004051ff73ffemr8238565pgj.156.1655109951829; 
 Mon, 13 Jun 2022 01:45:51 -0700 (PDT)
Received: from FVFDK26JP3YV.usts.net ([139.177.225.251])
 by smtp.gmail.com with ESMTPSA id
 f27-20020aa79d9b000000b0050dc762814fsm4729196pfq.41.2022.06.13.01.45.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Jun 2022 01:45:51 -0700 (PDT)
From: Lei He <helei.sig11@bytedance.com>
To: mst@redhat.com, arei.gonglei@huawei.com, berrange@redhat.com,
 qemu-devel@nongnu.org
Cc: helei.sig11@bytedance.com,
	pizhenwei@bytedance.com,
	jasowang@redhat.com
Subject: [PATCH 0/7] crypto: Introduce ECDSA algorithm
Date: Mon, 13 Jun 2022 16:45:24 +0800
Message-Id: <20220613084531.8086-1-helei.sig11@bytedance.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=helei.sig11@bytedance.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

This patch introduced ECDSA algorithm for crypto:
1. make the built-in ASN.1 decoder support more ASN.1 types.
2. support ECDSA key and signature parsing.
3. implement the ECDSA algorithm using nettle and gcrypt respectively.

Lei He (7):
  crypto: Introduce ECDSA algorithm API
  crypto: Support more ASN.1 types
  crypto: remove "qemu/osdep.h" in rsakey.h
  crypto: Add ECDSA key parser
  crypto: Implement ECDSA algorithm by hogweed
  crypto: Implement ECDSA algorithm by gcrypt
  crypto: Add test suite for ECDSA algorithm

 crypto/akcipher-gcrypt.c.inc      | 400 ++++++++++++++++++++++++++++++++++++++
 crypto/akcipher-nettle.c.inc      | 268 +++++++++++++++++++++++++
 crypto/der.c                      | 174 +++++++++++++++--
 crypto/der.h                      | 128 +++++++++++-
 crypto/ecdsakey-builtin.c.inc     | 248 +++++++++++++++++++++++
 crypto/ecdsakey.c                 | 118 +++++++++++
 crypto/ecdsakey.h                 |  66 +++++++
 crypto/meson.build                |   1 +
 crypto/rsakey.c                   |   1 +
 crypto/rsakey.h                   |   1 -
 qapi/crypto.json                  |  28 ++-
 tests/unit/test-crypto-akcipher.c | 227 +++++++++++++++++++--
 tests/unit/test-crypto-der.c      | 126 +++++++++---
 13 files changed, 1722 insertions(+), 64 deletions(-)
 create mode 100644 crypto/ecdsakey-builtin.c.inc
 create mode 100644 crypto/ecdsakey.c
 create mode 100644 crypto/ecdsakey.h

-- 
2.11.0


