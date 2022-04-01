Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B62F14EEA73
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 11:32:05 +0200 (CEST)
Received: from localhost ([::1]:60362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naDdU-0004NY-PV
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 05:32:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naDRV-0000GH-Ez
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 05:19:42 -0400
Received: from [2a00:1450:4864:20::12f] (port=34799
 helo=mail-lf1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naDRQ-0006sY-OC
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 05:19:38 -0400
Received: by mail-lf1-x12f.google.com with SMTP id 5so3799945lfp.1
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 02:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BvaFLpB9Qxdj63+E8QSxgo2K5UB1eFL9k2Jwsg42K0M=;
 b=FUdpCMeVIy4oqLOJdgdBCl0hguuq/CEDVkyY3uZEyW82QMlbiaSYZnWSlfEM85RCUl
 QVj4B15pLijDNLxVTe82O4FDT6CxIYAqJjR56RnBUcGAuZwqfoL/iD0WilUTeVQCJnqC
 RLXvSlKfOapviTuyHqhRRTTneAPil2Cn9AOW5ubxIU2NKRjeeXA8aZyLsABWsWerJT/6
 e9mBvmhs4eFHBwhCE5h55snkpZtzitJhMxvJznMkBSEblw/Fz37etuSDHrU/kWBfrg7T
 3gJLnzKQBPfuLNNHKKwKzrTqkeNh+sNKSswEmmA1GZdJFHfOEE8bsvQ7KhbaugykcZaq
 CqRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BvaFLpB9Qxdj63+E8QSxgo2K5UB1eFL9k2Jwsg42K0M=;
 b=bAbkHAS4SLblvyU3X9/JPWs7YdRFehbH/dLVX/Yk6tQKOOEPzoku6a78yn6+gHcFO7
 YfcPF4TUv8sgmj8vWTlSwW418DeVSCglmeqUT71z8rY1DOudjoGdVrTKtt77Ap9WBItx
 ZEvxq8KcIA1zxg/KtRMvgnL9CByRYow28nUqc+Z8fkPRf49QM/GIe6rBAuvt6vrY8UMB
 UDsgh6M9Zk0rN4j/P6FsmMa94LQjWXGRmSOkrkHXr6any1xEciNVbiddYvC3mmuC2cq7
 TYxzwAX1UH4sGnh6zwWg69sGFQ7o4awgbtEPvl2vsH8n1ctzIrqUtC+Wr1gPb02iUo4+
 iWSg==
X-Gm-Message-State: AOAM530MtLgj+Te3cWU1Z6D+7qem+OLCxO7weKswHfE8rE6I31ubwToS
 s6/Ll0FFZPlGNIuJixr6mc2H9Q==
X-Google-Smtp-Source: ABdhPJxMDyaSL0h+fSebkFffFaJmcEr9i7zzr7mZ4OrguCCvw7O24uVzg+7EH7KgnlalaO+owZ9kfA==
X-Received: by 2002:a05:6512:32c8:b0:44a:27fd:cd06 with SMTP id
 f8-20020a05651232c800b0044a27fdcd06mr13829824lfg.239.1648804774176; 
 Fri, 01 Apr 2022 02:19:34 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 d16-20020a2eb050000000b002461d8f365bsm155135ljl.38.2022.04.01.02.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 02:19:33 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/7] copy-before-write: on-cbw-error and cbw-timeout
Date: Fri,  1 Apr 2022 12:19:13 +0300
Message-Id: <20220401091920.287612-1-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x12f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Here are two new options for copy-before-write filter:

on-cbw-error allows to alter the behavior on copy-before-write operation
failure: not break guest write but break the snapshot (and therefore
backup process)

cbw-timeout allows to limit cbw operation by some timeout.

So, for example, using cbw-timeout=60 and on-cbw-error=break-snapshot
you can be sure that guest write will not stuck for more than 60
seconds and will never fail due to backup problems.

This series unites and fixes my
"[PATCH 0/3] block: copy-before-write: on-cbw-error behavior" and
"[PATCH 0/4] block: copy-before-write: cbw-timeout"

Supersedes: <20220301205929.2006041-1-vsementsov@openvz.org>
Supersedes: <20220302162442.2052461-1-vsementsov@openvz.org>

Vladimir Sementsov-Ogievskiy (7):
  block/copy-before-write: refactor option parsing
  block/copy-before-write: add on-cbw-error open parameter
  iotests: add copy-before-write: on-cbw-error tests
  util: add qemu-co-timeout
  block/block-copy: block_copy(): add timeout_ns parameter
  block/copy-before-write: implement cbw-timeout option
  iotests: copy-before-write: add cases for cbw-timeout option

 block/block-copy.c                            |  26 ++-
 block/copy-before-write.c                     | 136 +++++++++---
 include/block/block-copy.h                    |   2 +-
 include/qemu/coroutine.h                      |  13 ++
 qapi/block-core.json                          |  30 ++-
 tests/qemu-iotests/tests/copy-before-write    | 206 ++++++++++++++++++
 .../qemu-iotests/tests/copy-before-write.out  |   5 +
 util/meson.build                              |   1 +
 util/qemu-co-timeout.c                        |  89 ++++++++
 9 files changed, 464 insertions(+), 44 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/copy-before-write
 create mode 100644 tests/qemu-iotests/tests/copy-before-write.out
 create mode 100644 util/qemu-co-timeout.c

-- 
2.35.1


