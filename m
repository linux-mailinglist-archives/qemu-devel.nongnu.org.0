Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE7B4F8097
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 15:31:57 +0200 (CEST)
Received: from localhost ([::1]:44438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncSEs-0001Fi-Gs
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 09:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncSAo-00075v-5w
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:27:42 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:41566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncSAl-0007sc-Vq
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:27:41 -0400
Received: by mail-lf1-x130.google.com with SMTP id p15so9617926lfk.8
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 06:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XMhh7f0M1FdfBJpoxg6yx4Qo7S+uNwIMiBE13CuIS7w=;
 b=fzy3ccWUtq7N/RO2GHcofgRQzNRFhTQmVM2MUiRvkUcLtfnEmS6rQA58VtZWp6UlaG
 2B0nDSlAXqLjOfYOPwmE7pv4IxQPlGVp2Z0an1V0dyj/jQeN2u5cF1h9tf3qtLdjGLkE
 BtuvrFJlHmcGRblV9ZvMGWC9vJrdw1vzdv2p8fPuK6qVv2xLcvdpptcebWV2rqv++X85
 FLOO4wrD//dN0JYDdCUPoo2euOokUhVLIz99mrLlB+wlpINn3ja9TKhIWICr27ffN7ma
 FcbJscSE9ZB2hkIXT9XzU3YCrhwRHuVh7kfjDpGZpiGjFbtJP/rlAUwQTYTrrveIEeVJ
 EF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XMhh7f0M1FdfBJpoxg6yx4Qo7S+uNwIMiBE13CuIS7w=;
 b=5Ksu4Bp/goyOexjYZzQ98ywwCSQnmYRBVqmJciaN++S7kox8mG/cRD+JKrDmLWoplu
 55P4hbivnMf6vtuyTIzt1oPOBiar61uNRMlhwehFT6d3FS/DAUXMDv4mAf9Pa4r1aIOc
 BJzei9njsKVnQafgeWNLZZzrPzpaIyPopUvXEx9m5dPduhQhVQjiy4Pwi/dAb03/IMYw
 mh0klDW06K8y4ExyOxpPIXiGdn1wgsIm7SIGITSySJZhoxKeeYvJUOuk70PW5ccTl9YC
 vwREU2MG2r/tZ05c7RqpLlxi4ja38kix4eC/dWNz0YUSA7itpswLKoUwICl3nmkbkv67
 apsQ==
X-Gm-Message-State: AOAM531oDu1taSG5Vjj4igWTPGOv0EPX0yn9ZRCqyxNy/zeM/RFMQV/G
 f4Yy9I47jpb0j834vyp0tU/JUA==
X-Google-Smtp-Source: ABdhPJycdBq86fMAdbJMLrgQpu7DJ8lPc+bL/BDw2SSY2ELOgRuD7gaeLz17cBEfpTxI8aAViLH1bQ==
X-Received: by 2002:a05:6512:1585:b0:445:908b:ad71 with SMTP id
 bp5-20020a056512158500b00445908bad71mr9318324lfb.200.1649338057504; 
 Thu, 07 Apr 2022 06:27:37 -0700 (PDT)
Received: from fedora.. ([185.215.60.161]) by smtp.gmail.com with ESMTPSA id
 o15-20020a2e90cf000000b0024b0437ed8asm1929271ljg.7.2022.04.07.06.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 06:27:36 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v4 0/7] copy-before-write: on-cbw-error and cbw-timeout
Date: Thu,  7 Apr 2022 16:27:19 +0300
Message-Id: <20220407132726.85114-1-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x130.google.com
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

v4: Now based on master
01: add assertion and r-b
02: s/7.0/7.1/ and r-b
03: switch to QEMUMachine, touch-up pylintrc,  drop r-b
04,05,06: add r-b
07: switch to QEMUMachine


Here are two new options for copy-before-write filter:

on-cbw-error allows to alter the behavior on copy-before-write operation
failure: not break guest write but break the snapshot (and therefore
backup process)

cbw-timeout allows to limit cbw operation by some timeout.

So, for example, using cbw-timeout=60 and on-cbw-error=break-snapshot
you can be sure that guest write will not stuck for more than 60
seconds and will never fail due to backup problems.

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
 block/copy-before-write.c                     | 111 ++++++---
 util/qemu-co-timeout.c                        |  89 ++++++++
 tests/qemu-iotests/pylintrc                   |   5 +
 tests/qemu-iotests/tests/copy-before-write    | 213 ++++++++++++++++++
 .../qemu-iotests/tests/copy-before-write.out  |   5 +
 util/meson.build                              |   1 +
 10 files changed, 466 insertions(+), 39 deletions(-)
 create mode 100644 util/qemu-co-timeout.c
 create mode 100755 tests/qemu-iotests/tests/copy-before-write
 create mode 100644 tests/qemu-iotests/tests/copy-before-write.out

-- 
2.35.1


