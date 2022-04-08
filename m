Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7164F9B5C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 19:11:33 +0200 (CEST)
Received: from localhost ([::1]:44284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncs8y-0005Pj-Rh
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 13:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncs0D-0001Gc-Ts
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 13:02:29 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:43633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncs0B-0005CN-U0
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 13:02:29 -0400
Received: by mail-lf1-x131.google.com with SMTP id x17so6996283lfa.10
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 10:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8qn1FmyaWCETIQm7ph/efzySK5Z5Non3V6EXxZ7Fk1o=;
 b=rlzDxQeOr8yDlgtU2ZsJ8lvvQP1+6UcIk5pT7v68HhEYZ7Xz7nC5iQjq3fHbKOun9J
 PY1W/iwz7AQS1MNpRWPUiYyq1C/XqJ9YpURigxXQ1mLw+4+JFt8fZgtwjOoQ7MUTPa1U
 o3Ae/OODSWY1ZJg6Y+w2al2nmuNbrnLMq7u9aIX/HbvKsOq0m4U4+8PphRudP/6PW7au
 4LPuk0Kb2tkV39Roll+BHvkjgov+tcmZyBJc4bvkPzOtGgqlhAXRKuT+pO/CRgNgrSDd
 EwHzqpGP9xZvaabvK2scmBAfIIAeoBQVo0avFU4tNd0Zrvv/ELV3Vs3rDKeSLo3xU+A7
 r+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8qn1FmyaWCETIQm7ph/efzySK5Z5Non3V6EXxZ7Fk1o=;
 b=4kOIr6Biz0IaOJCFLHm6KiK96vqUvAehUPBwmj/a/PplIDLmuPzsDVF2y6Gj6Bl4wi
 GQNrKbRVJKgcbgJBKoKXrIbBicpUa+9jla6Y88X31FfkJ8O3IxApq8+QQRrYOcdunBIM
 FV5gqCoaQ/z2Sl1FHWXkI6/UmZ5ZvUt1vqHmOK3kd7tjZJ6zfPB7DjCGMD8ZCA5ZyrWn
 OiPvjlzQ0RU7CnG8LLO+O/jtVd9TknUjlnL4FQzGdSYca5PCuBYUG689bJt469aVSGm0
 ypFpuMffJCqZTq15/ITpu8BR5qGemsnwitNbexFaHNhTJSfKNghd1LF9VwGJckYgMJ1C
 FLig==
X-Gm-Message-State: AOAM533Re7EpWmiIpr3/80pWBiFq6+u38OvL24wqFyzjuofry8u2yaBT
 su5dAv1UTqOBxy21NJQpuc6s/w==
X-Google-Smtp-Source: ABdhPJw3lvt52pdD+vp579nunLtisiIz+gHoaZrYn5ko8ATY0YwHos7jNp1LYlWgAu0hr4Y3wrTMsQ==
X-Received: by 2002:a05:6512:c25:b0:464:f8e1:f9fa with SMTP id
 z37-20020a0565120c2500b00464f8e1f9famr5005352lfu.33.1649437344973; 
 Fri, 08 Apr 2022 10:02:24 -0700 (PDT)
Received: from fedora.. ([185.215.60.161]) by smtp.gmail.com with ESMTPSA id
 g36-20020a0565123ba400b0044a2a1ccd99sm2505687lfv.20.2022.04.08.10.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 10:02:24 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [RFC 0/2] introduce QEMUMachind.cmd()
Date: Fri,  8 Apr 2022 20:02:12 +0300
Message-Id: <20220408170214.45585-1-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x131.google.com
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
Cc: kwolf@redhat.com, bleal@redhat.com, qemu-devel@nongnu.org,
 hreitz@redhat.com, vsementsov@openvz.org, crosa@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

I always dreamed about getting rid of pattern

    result = self.vm.qmp(...)
    self.assert_qmp(result, 'return', {})

Here is a suggestion to switch to

    self.vm.cmd(...)

pattern instead.

I'm not sure we really want to update so many tests. May be just commit
patch 01, and use new interface for new code. On the other hand, old
code always used as an example to write the new one.

The series is based on John's python branch.

Vladimir Sementsov-Ogievskiy (2):
  python/machine.py: upgrade vm.command() method
  iotests: use vm.cmd() instead of vm.qmp() where appropriate

 python/qemu/machine/machine.py                |  16 +-
 tests/qemu-iotests/030                        | 168 +++----
 tests/qemu-iotests/040                        | 167 +++---
 tests/qemu-iotests/041                        | 474 ++++++++----------
 tests/qemu-iotests/045                        |  15 +-
 tests/qemu-iotests/055                        |  61 +--
 tests/qemu-iotests/056                        |  23 +-
 tests/qemu-iotests/093                        |  41 +-
 tests/qemu-iotests/118                        | 221 ++++----
 tests/qemu-iotests/124                        |  69 ++-
 tests/qemu-iotests/129                        |  13 +-
 tests/qemu-iotests/132                        |   5 +-
 tests/qemu-iotests/139                        |  43 +-
 tests/qemu-iotests/147                        |  30 +-
 tests/qemu-iotests/151                        |  40 +-
 tests/qemu-iotests/155                        |  53 +-
 tests/qemu-iotests/165                        |   7 +-
 tests/qemu-iotests/196                        |   3 +-
 tests/qemu-iotests/205                        |   6 +-
 tests/qemu-iotests/245                        | 245 ++++-----
 tests/qemu-iotests/256                        |  34 +-
 tests/qemu-iotests/257                        |  36 +-
 tests/qemu-iotests/264                        |  31 +-
 tests/qemu-iotests/281                        |  21 +-
 tests/qemu-iotests/295                        |  27 +-
 tests/qemu-iotests/296                        |  14 +-
 tests/qemu-iotests/298                        |  13 +-
 tests/qemu-iotests/300                        |  50 +-
 tests/qemu-iotests/iotests.py                 |   6 +-
 .../tests/migrate-bitmaps-postcopy-test       |  31 +-
 tests/qemu-iotests/tests/migrate-bitmaps-test |  37 +-
 .../qemu-iotests/tests/migrate-during-backup  |  40 +-
 .../qemu-iotests/tests/migration-permissions  |   9 +-
 tests/qemu-iotests/tests/mirror-top-perms     |  15 +-
 34 files changed, 821 insertions(+), 1243 deletions(-)

-- 
2.35.1


