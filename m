Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5892648F9A5
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 23:24:47 +0100 (CET)
Received: from localhost ([::1]:60272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8rTa-0002tI-6B
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 17:24:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n8rQx-0000Dm-BO; Sat, 15 Jan 2022 17:22:03 -0500
Received: from [2a00:1450:4864:20::334] (port=51834
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n8rQs-0000eq-Lc; Sat, 15 Jan 2022 17:22:03 -0500
Received: by mail-wm1-x334.google.com with SMTP id c2so7321582wml.1;
 Sat, 15 Jan 2022 14:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j9x33SKmuccOPBnIOni9qflM/+GMe9iP0bONb6a7cmM=;
 b=Rx4Kd6mHpxkOnn9JnrHDLhA1xznSvIbCvNJAXT3Ubwyeesym5lP11tqpSeO82xm5xN
 KP5KpibzBCDHGGlU3vr5btffvedLgOdjhQ2wLjScMyWJke9VnUd+g8m/K2CbwCtJBMcq
 cAbYd8OTf8PykPxjX83msgFpZs83Zrd0NRLKiprLZINPGakDj0G3rzoPBhyvN3m6nFzb
 ++IDfqFfkxCGnU9ilHGBI45s+OvaRhuS+JPMKG0ZZTKQIWUQFLHaMoR/Cve1NaDG8A6r
 cZd2ZGleh0mcc24IG776eJUMV3qLKZTzIZ9rCTBKg7h89X91ZTMwxpb1UR6lGaBOlbKy
 lWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=j9x33SKmuccOPBnIOni9qflM/+GMe9iP0bONb6a7cmM=;
 b=4XjYlTEeyN8SUxToz559xSEGpVx7SzZoRaWKMWHVjQl7Pe4dMM5AIPYigYcxqy8jQF
 dnKXhVrgY7NWJgQAL+fioSiHXRFgMLQS+vjGdUF5hnISaI5pILdlLriuJrk4Xb93JU//
 03/4nr46vYKj7dwlwyI4osD8CIF7fcDVObKTPEe1KMqmrZgIfWaoVCq3IlW+0ODY7iG2
 2yIYiUJWbDUUuwUT/zO56MRjgt3zFV85Ki/I1kHRnNOIjzgt02E1QPhvSX1F4LMqiKIr
 VOwNtdPQjjARBCRwfa6avrJw3mu7oDbG8pZ4YCcBoalOnI8xv//fhcWTUStP2HJisEYh
 FDUg==
X-Gm-Message-State: AOAM530iHhK2T7N7rkmSb5bFXWpFMV30XQ+J0KLu7u5YbhYUUY2XmmSO
 UVyqP+egPJBvqw1evP/7MNcKrSBt7Cc=
X-Google-Smtp-Source: ABdhPJzMISNQLpviphR0P9F90mrmID0iD2S7C4WEAHSNcBlXEsEOF3xZJFzdkwLgsbjURzYtiCDDyw==
X-Received: by 2002:a5d:6488:: with SMTP id o8mr13483275wri.576.1642285317050; 
 Sat, 15 Jan 2022 14:21:57 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id s1sm8929616wrv.38.2022.01.15.14.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 14:21:56 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] make check-block a meson test
Date: Sat, 15 Jan 2022 23:21:50 +0100
Message-Id: <20220115222154.341628-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x334.google.com
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
Cc: qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series makes "meson test" run the block layer tests, reporting
their outcome in the same way as the other TAP tests.

Based-on: <20211223183933.1497037-1-vsementsov@virtuozzo.com>

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


