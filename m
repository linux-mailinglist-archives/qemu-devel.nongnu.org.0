Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 391144F6897
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 20:11:00 +0200 (CEST)
Received: from localhost ([::1]:34416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncA7M-00037x-I8
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 14:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncA59-0000Mi-E2
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 14:08:39 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:44773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncA57-0001vM-CE
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 14:08:38 -0400
Received: by mail-lf1-x134.google.com with SMTP id f16so655565lfe.11
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 11:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G9jCk9yseiV8QcmkgGlKTeZs8UR698uFLz0H472CaE4=;
 b=ynteRAu7iceF7i0nUL2mysLXixK/lMOBPPDxyLWFu7Cd6DcJs4eodInCwDcnuT2lYr
 irQeF/PGGPzKLhGe/1/Su6XzeEdKgl4W40Jh2pkDXfTErzuaYXF2KdGcNfA5xQJLqWWX
 QDjFliuLMDhK8KjsKN/ZXHxCxlcsq95xT7dMt6/Nxh6HaRx1vdFcxw4kPAzn7lZA6QQs
 idZVv2FdrQM8c6od3RIcgXUcb9ujAqpiH2XYszJf0DvYqxew4tN3bbQNdkkVpgQghfL/
 9eX1QOjvRQUWMakN2PvBbGEoIv05yn4+Pq7c97cPVIPV/rgHmtIawjGw+B0WBxiYXXV0
 sP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G9jCk9yseiV8QcmkgGlKTeZs8UR698uFLz0H472CaE4=;
 b=3FUxIZzuL1EIvFJl/HsSIZxQKfn9uxZ7tEmQQ6bUxusLL9i5ckserRU/FQ58PCwr4Z
 8mP+68+Us0N5bt2bOlboiqS8f1Kuc8x42WM4PLGmFYxpYjXt/QwkhQwI2i06pFP9bnrm
 SSpBTIA/k6jPTx53ptk2MBSYAuKzEK565BbxaGKoOonPqLa4kmF0m7b5LmzkAnyRpXCR
 CAOZ9ebjOf0waJiAQ5sRZNb0z0kCyk6JEsckxZSchpe+syJF9M0Wyhon9yMc1MS3rE/+
 w1dnR9tXiJvroONIa0rZWMv/aI7hNn1/UH1G2n3crpZFFTOjp4nvXLbXl2656haCHqeP
 TutA==
X-Gm-Message-State: AOAM531qN8vgarYAqAUS4npmg53nl2XUOkDB0Aly/ABG8bG4kcSd0ckN
 LC/K6iD356vwZmYBF3ZO1jQ+cQ==
X-Google-Smtp-Source: ABdhPJwRhS2dxdvIbKuqcDmIOP2gq9HW3KtCGTfesiIog0KfyJyg77c1ZuneD3SYHp0D6Hqh3C4Vgw==
X-Received: by 2002:ac2:4d8b:0:b0:44a:2aec:669f with SMTP id
 g11-20020ac24d8b000000b0044a2aec669fmr6751724lfe.49.1649268514689; 
 Wed, 06 Apr 2022 11:08:34 -0700 (PDT)
Received: from fedora.. ([185.215.60.161]) by smtp.gmail.com with ESMTPSA id
 a20-20020a194f54000000b0044a9afab7e7sm1904321lfk.290.2022.04.06.11.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 11:08:33 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v3 0/7] copy-before-write: on-cbw-error and cbw-timeout
Date: Wed,  6 Apr 2022 21:07:54 +0300
Message-Id: <20220406180801.374844-1-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x134.google.com
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 vsementsov@openvz.org, stefanha@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

v3:
01: refactor options parsing
02: - wording, grammar
    - early return from cbw_do_copy_before_write() when snapshot_error is set
    - drop premature optimization around waiting for in-flight requests when
      we set snapshot_error
03: Hanna's r-b
05: - add callback to block_copy() interface
    - add forgotten g_free(call_state)
    - do cancel block-copy call on timeout
06: - wording
    - increase in_flight for block_copy(), to handle timed-out block_copy()
      on drain
07: - less strict limit for bps-write, as now we honestly wait for cancelled
      block-copy call on final drain


Here are two new options for copy-before-write filter:

on-cbw-error allows to alter the behavior on copy-before-write operation
failure: not break guest write but break the snapshot (and therefore
backup process)

cbw-timeout allows to limit cbw operation by some timeout.

So, for example, using cbw-timeout=60 and on-cbw-error=break-snapshot
you can be sure that guest write will not stuck for more than 60
seconds and will never fail due to backup problems.

Based-on: <20220406153202.332186-1-vsementsov@openvz.org>
  ( [PATCH for-7.1 0/2] throttle-groups: use QEMU_CLOCK_REALTIME )

Vladimir Sementsov-Ogievskiy (7):
  block/copy-before-write: refactor option parsing
  block/copy-before-write: add on-cbw-error open parameter
  iotests: add copy-before-write: on-cbw-error tests
  util: add qemu-co-timeout
  block/block-copy: block_copy(): add timeout_ns parameter
  block/copy-before-write: implement cbw-timeout option
  iotests: copy-before-write: add cases for cbw-timeout option

 qapi/block-core.json                          |  31 ++-
 include/block/block-copy.h                    |   4 +-
 include/qemu/coroutine.h                      |  13 ++
 block/block-copy.c                            |  33 ++-
 block/copy-before-write.c                     | 110 +++++++---
 util/qemu-co-timeout.c                        |  89 ++++++++
 tests/qemu-iotests/tests/copy-before-write    | 206 ++++++++++++++++++
 .../qemu-iotests/tests/copy-before-write.out  |   5 +
 util/meson.build                              |   1 +
 9 files changed, 453 insertions(+), 39 deletions(-)
 create mode 100644 util/qemu-co-timeout.c
 create mode 100755 tests/qemu-iotests/tests/copy-before-write
 create mode 100644 tests/qemu-iotests/tests/copy-before-write.out

-- 
2.35.1


