Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF726027F5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 11:08:54 +0200 (CEST)
Received: from localhost ([::1]:49596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okiaj-0002da-A1
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 05:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1okiCv-0005Zw-CX
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 04:44:18 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:44974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1okiCb-0004bU-QR
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 04:44:13 -0400
Received: by mail-lf1-x12d.google.com with SMTP id s20so21366990lfi.11
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 01:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudlinux.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u0SrO5gHZIbFEGlPg6M5p2y/vlecvKKUpJszJjJ3l0g=;
 b=QrqFmm+sK/aH08oN/eJL9QiQOEBe2lDx6tWcyuc+qoQbQN0d5oySMXGzmN+l2AliLt
 f9nRrnmp6nbiZ2SxUmXCEYPJVZ6qB+8UcoFok+CNAgc4sFEHn+MeQlbEO7yGppw3Zctq
 t6wawmFfsfc34vekfQY2AcCgyM4tTW2u5JRCJjPvHzePmcfNPVd+oqE5qNFR8qExwMAj
 z/pOWF8M0IGy3+elnxHlH7fQSVJFjTqPGyL+/4J2kvkDt8igjvcRFSa5K7b8Op84AcKC
 wmz3BoEO/9veswGeZFsZjyZly5cmmeyzsff3q9lb1lM3i+VGLbUasx2KNOZEfh+mk8zy
 pzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u0SrO5gHZIbFEGlPg6M5p2y/vlecvKKUpJszJjJ3l0g=;
 b=vKWSowJz16xxuIZrh32UAWEOnWKNtyzKeDXuCECOd+AaUTODQmYhbGUt6Vcy7oueQ4
 wsS9HDdqNBsRo/2ADEz6jJT7ru1nXQebx9KvabZ3qU1rsQ3scC1j1sj09+eyInXTAxQU
 n/ziM905lndQwYfJKaX7Ntuyw8HKF6wtQ8S9h/ew3yzShZGrzEtJkuF7UnLBe1N1ibA7
 MrTFIVLVh5uUdjm010kS7Q2J41prp+ZE9WO1rPi4YsDS1wCQ71vO8/Im752ncSoTM3dy
 cmlA14vGXptw0XbjayyybKbJDFCrLOlP4mo98HucPWyM0yZ062h9FG0AOkIxntF/HpG+
 Yf+Q==
X-Gm-Message-State: ACrzQf1/rd0F57qOU3k8htEFIeBYXClpjzQIjbQkk/zJtTcO2p4G4pB+
 VL69nPih4VhNuQnYjSH6okyKsNWqDstEag==
X-Google-Smtp-Source: AMsMyM5ufqn/TPYeLGgoVOUQf2ilIpyCG5A/kTCEnEO4lTucxhrjdAYwHpwQTKwaPHyATyJL4QllpQ==
X-Received: by 2002:a05:6512:2621:b0:47f:d228:bdeb with SMTP id
 bt33-20020a056512262100b0047fd228bdebmr589096lfb.121.1666082627684; 
 Tue, 18 Oct 2022 01:43:47 -0700 (PDT)
Received: from fedora.. (vist.dozen.mephi.ru. [85.143.113.73])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a05651c03c700b0026e04cc88cfsm1874523ljp.124.2022.10.18.01.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 01:43:47 -0700 (PDT)
From: Nikita Ivanov <nivanov@cloudlinux.com>
To: qemu-devel@nongnu.org
Cc: Nikita Ivanov <nivanov@cloudlinux.com>
Subject: [PATCH v3 0/2] Refactoring: expand usage of TFR() macro
Date: Tue, 18 Oct 2022 11:43:39 +0300
Message-Id: <20221018084341.16270-1-nivanov@cloudlinux.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=nivanov@cloudlinux.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

At the moment, TFR() macro has a vague name and is not used
where it possibly could be. In order to make it more transparent
and useful, it was decided to refactor it to make it closer to
the similar one in glibc: TEMP_FAILURE_RETRY(). Now, macro
evaluates into an expression and is named RETRY_ON_EINTR(). All the
places where RETRY_ON_EINTR() macro code be applied were covered.

Nikita Ivanov (2):
  Refactoring: refactor TFR() macro to RETRY_ON_EINTR()
  error handling: Use RETRY_ON_EINTR() macro where applicable

 block/file-posix.c        | 37 ++++++++++++++++---------------------
 chardev/char-fd.c         |  2 +-
 chardev/char-pipe.c       |  8 +++++---
 chardev/char-pty.c        |  4 +---
 hw/9pfs/9p-local.c        |  8 ++------
 include/qemu/osdep.h      |  8 +++++++-
 net/l2tpv3.c              | 17 +++++------------
 net/socket.c              | 16 +++++++---------
 net/tap-bsd.c             |  6 +++---
 net/tap-linux.c           |  2 +-
 net/tap-solaris.c         |  8 ++++----
 net/tap.c                 | 10 +++-------
 os-posix.c                |  2 +-
 qga/commands-posix.c      |  4 +---
 semihosting/syscalls.c    |  4 +---
 tests/qtest/libqtest.c    | 14 ++++++--------
 tests/vhost-user-bridge.c |  4 +---
 util/main-loop.c          |  4 +---
 util/osdep.c              |  4 +---
 util/vfio-helpers.c       | 12 ++++++------
 20 files changed, 73 insertions(+), 101 deletions(-)

-- 
2.37.3


