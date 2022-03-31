Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 275AE4EE22F
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 21:58:24 +0200 (CEST)
Received: from localhost ([::1]:38260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na0w3-0000FE-6n
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 15:58:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1na0uz-00071c-KE
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 15:57:17 -0400
Received: from [2a00:1450:4864:20::12a] (port=39517
 helo=mail-lf1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1na0ux-0005Vr-8x
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 15:57:17 -0400
Received: by mail-lf1-x12a.google.com with SMTP id w7so1071741lfd.6
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 12:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tN7VGmWVurVjkAHWOU3qhk3eSiQOVp2DvPQN9S0rN04=;
 b=ATeB9P4j3/0QgEOGFYClOwwYqV4926FnQhutU6rshsoTXDJlccBmIjnfFC5lyWbVX9
 Q4FvXxQLEimmbxJXvNs4jlofmghBXmT1WkaF8iU7Au5dSkjO1VmJhLa+pfl9K6m1GxRi
 z8RywIk/8byIQ6S96ZuSrO+g9rmqMAbavLZD9LpVKDO7UA3KYdhlgr6FU8/aNIBhcbPo
 2bB2TYhMsdXWdu/SnaC1u10YIx9ntuw6wmXj/9iyfrHqgr7NltIJrnC6n94YE/SR2PJD
 eCnSNNnYtkp2WcW80ecA4cCjqkHOu5Jmevy3eD0/1z47wfz9TyMJaU19Hgf7hav5wq45
 ZweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tN7VGmWVurVjkAHWOU3qhk3eSiQOVp2DvPQN9S0rN04=;
 b=lBLYI66a3tp2xfERPakcwGRNvSLwTYkHjnjLh/CdN167j/Q6u3HqWJghfVd032IB2T
 KWSqRRVNoPoms+SZREWCizwqB7jaSjvZrkmbLAlZ3L72lh7A46aVWYur5QdfDLeriu4T
 n2Mf2ChtI/RS0kxtZvP7rDG6YghXk0WrJ5b5NYi2i1RgmLMuVSS1YeTYReg6WwOP0YeQ
 oYZPCTPnLW7dFNw9NHnwCbgWA0lbtGJ11wb5nPLbMboN5fufgmxJOs7rDK1Nj6UXogrj
 JS2F+LViXtv/ZNZ4FqzuhjVwgHu5yKQG5c42WUQOKPhzfd0ezXvv+/OGOdIlrxOMM4HX
 KOcQ==
X-Gm-Message-State: AOAM532yrXezRtVndczc9YRrSImExlTaU8Rzz8kpiL4W0JvgwsL7w5vr
 eOhQDVZzXGVKk8DwXuvFwo7uLw==
X-Google-Smtp-Source: ABdhPJxFK+r+t+ojOZVfnkzLPOZvmTBPIaNv0PtcEJyYTyOfxGseJ/cwwdyZNsmJUafDUAkRy7yYcg==
X-Received: by 2002:a05:6512:1112:b0:44a:4096:39b0 with SMTP id
 l18-20020a056512111200b0044a409639b0mr11734872lfg.35.1648756633152; 
 Thu, 31 Mar 2022 12:57:13 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 z26-20020ac2419a000000b004484bf6d1e6sm30539lfh.233.2022.03.31.12.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 12:57:12 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH 0/3] backup: discard-source parameter
Date: Thu, 31 Mar 2022 22:56:58 +0300
Message-Id: <20220331195701.220690-1-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x12a.google.com
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, hreitz@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

Here is a new option for backup, that brings two things into
push-backup-with-fleecing scheme:

 - discard copied region in temporary image to save disk space
 - avoid extra copy-before-write operation in the region that is already
   copied

This is based on
"[PATCH v5 00/45] Transactional block-graph modifying API"
Based-on: <20220330212902.590099-1-vsementsov@openvz.org>

Vladimir Sementsov-Ogievskiy (3):
  block/copy-before-write: create block_copy bitmap in filter node
  qapi: blockdev-backup: add discard-source parameter
  iotests: add backup-discard-source

 block/backup.c                                |   5 +-
 block/block-copy.c                            |  13 +-
 block/copy-before-write.c                     |   4 +-
 block/replication.c                           |   4 +-
 blockdev.c                                    |   2 +-
 include/block/block-copy.h                    |   3 +-
 include/block/block_int-global-state.h        |   2 +-
 qapi/block-core.json                          |   4 +
 tests/qemu-iotests/257.out                    | 112 ++++++-------
 .../qemu-iotests/tests/backup-discard-source  | 154 ++++++++++++++++++
 .../tests/backup-discard-source.out           |   5 +
 11 files changed, 240 insertions(+), 68 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/backup-discard-source
 create mode 100644 tests/qemu-iotests/tests/backup-discard-source.out

-- 
2.35.1


