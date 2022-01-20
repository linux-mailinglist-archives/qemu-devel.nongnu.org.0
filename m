Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CE5495149
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 16:21:57 +0100 (CET)
Received: from localhost ([::1]:54974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAZG8-0002Uc-VX
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 10:21:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nAVjq-0007MI-S7; Thu, 20 Jan 2022 06:36:24 -0500
Received: from [2a00:1450:4864:20::330] (port=55212
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nAVjo-0001pT-4W; Thu, 20 Jan 2022 06:36:22 -0500
Received: by mail-wm1-x330.google.com with SMTP id p18so11404878wmg.4;
 Thu, 20 Jan 2022 03:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zv1lhOCKXyzc4kd1C1K+BkNsbC/ontSjAPSzGoTmLW8=;
 b=PA6SRyifsLdSrhwUgf+lRyOTdFCKiSUiwwPETKyBi/4y4Gtj/IAsocqsxqU0JMUwzW
 nnZKTFWWEitLzh443XJFwc5b7OPKuIwkRM4xSdnzp7KoC5CBmJnnEqZ3dVtIaKqgXF+n
 z0aGosfqQINRTfffumELr1WXX1dqG6uQ9OU9WecLH3JRWto9meH1Kzzqteeh+9311o76
 ZIsdnPDiwzVJgXN7rnRzJsaWwtdZf6hcYJzw22WzEfNS6yGVsqStammIqNiN07CExx6e
 vUgDXSJLCA1OokOlpnt0Eq2zapiOIwBIVCqXX3KOYab0A/OulaZHfqy1anp4iqXnV67J
 rHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=zv1lhOCKXyzc4kd1C1K+BkNsbC/ontSjAPSzGoTmLW8=;
 b=q0OBL2hFZpRhOBM676LSp8BqCGiRA2LrtNFf/CIdnjKbGSlvLFyPAK0gtLWOOX7upR
 8/2Gn231/52BO5uqdtC5iMsdm2QgyKLrYwyuKs3IX8oDjqPmjfQnSl1FcCEzR2zWsp0O
 99q5f+kilLOWhecYtqIYBv7kpMEEjZLILGhZW9mDllkLdg6/T6c6LtH0EOCttCCplJHJ
 WGRl6si/i/GwxHdOjd4A4/FKbg7/8Pj5c22X0kjoxGk8A2xHwM0pnZcc9CSt82LO6isi
 LurvXgV9leYE1NXpZyjogZqRnvjFDZWdVG/cBWonE+xbVVn830SAwGR7KO11wYRsI0cC
 j0Cw==
X-Gm-Message-State: AOAM533Gjot37bA7mmYEJobAoGF+r5Rm81WPHueYVHcWPVfDhQDGcyyo
 jMWFs4JZ/J7NZRhRmsG7XvpEB1mGbIQ=
X-Google-Smtp-Source: ABdhPJz3cDQCTsw9SniLfHsQ/x6yt3u6o44ApBK9Bc5ZPIVPM9mQ77p/0mvJ1bpgZM/0qre1VAyQhg==
X-Received: by 2002:adf:e445:: with SMTP id t5mr5384020wrm.537.1642678565268; 
 Thu, 20 Jan 2022 03:36:05 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w8sm2653423wrq.3.2022.01.20.03.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 03:36:04 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] make check-block a meson test
Date: Thu, 20 Jan 2022 12:35:59 +0100
Message-Id: <20220120113603.276144-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series makes "meson test" run the block layer tests, reporting
their outcome in the same way as the other TAP tests.

Based-on: <20211223183933.1497037-1-vsementsov@virtuozzo.com>

v1->v2: make qcow2 the "quick" test, skip on Windows

Paolo Bonzini (4):
  scripts/mtest2make: add support for SPEED=thorough
  build: make check-block a meson test
  qemu-iotests: require at least an argument to check-block.sh
  check-block: replace -makecheck with TAP output

 meson.build                      |  5 ++--
 scripts/mtest2make.py            | 20 ++++++++++---
 tests/Makefile.include           | 16 ++---------
 tests/check-block.sh             | 45 +++++++++++++----------------
 tests/meson.build                |  1 +
 tests/qemu-iotests/check         |  6 ++--
 tests/qemu-iotests/meson.build   | 30 +++++++++++++++++++
 tests/qemu-iotests/testenv.py    | 30 +++++++++----------
 tests/qemu-iotests/testrunner.py | 49 +++++++++++++++++---------------
 9 files changed, 117 insertions(+), 85 deletions(-)
 create mode 100644 tests/qemu-iotests/meson.build

-- 
2.33.1


