Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CDD3CECB2
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:24:16 +0200 (CEST)
Received: from localhost ([::1]:55104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ZoA-0001a2-0R
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m5ZZB-0002x5-59; Mon, 19 Jul 2021 16:08:41 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:45789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m5ZZ9-00023Z-CY; Mon, 19 Jul 2021 16:08:40 -0400
Received: by mail-pf1-x429.google.com with SMTP id q10so17539791pfj.12;
 Mon, 19 Jul 2021 13:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nS7dIQs0lsFzus9f+d/HMfgh/oL86TwTD0Ip2uU/6SM=;
 b=Ne0kaX+LksvQiSrijt4Z2mLleWY9vGx6s6ocY5vKwl6TPtJCIVOzTz+FzhP7dcj812
 nGb/T9RUqvX33HqQg6RBAWVTuVt0O7/hpSN0toUBH0WQMITdNy45znbHPb5torggywEs
 vMg2FZjL5afl62WScQerIyB7mU/qKE4fIcc+PHMTDzl4xlYf9SKLakDIwrA1aFVYA9hx
 yFAfdl7ha4gkNIaH2LauwNL5IerX4N+b4obzLKi8TyGwueuxgjSCYM7d23UDnlwYy/+Y
 WE4uYfxhrkPIm/MVajNSXmN1eQgQV/WChGWEjFJ+UiXTuAQ6ObE4qZEv66r+EXVOYomF
 nJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nS7dIQs0lsFzus9f+d/HMfgh/oL86TwTD0Ip2uU/6SM=;
 b=IkbKmgfbLSb2IE/oGrVHdzPgACAL1f8Wtz481vWUBQPRG53GtbdGlB0tXJBYfWRpo9
 UHB2aG0r9NLckmMtorCOtGkkJ1qHyai1C8XndReaS7eDh9eucdXzLz4AIXHCwb0v89S/
 Z7XeeEXGUPf7/OcCSK4mmTnC9aaARZnetpd/MOD3WRTIkVrXzXBpJ4upB0FDoicTyNYm
 j7ChM1k23ghdphvk55iT8JZAN9EtlB7Szf/aPWAZZWg5nDV7pka3TF7qt61b6Y/ECjL2
 dtYnMrRjDuFk/jtE2aAlR+/dQlxK0JLRQ42Nns/Ijg3DaPVTK0/fuXhoRW69Pg0647Pe
 wxmA==
X-Gm-Message-State: AOAM532Qi06jEpiTXnHAQw7s6HPjVXt2Tx13eQZcugVo9vuAq9xVqnc9
 lJ1kVi5ieEyfufJjZsEqeHWQFe7yDKwftA==
X-Google-Smtp-Source: ABdhPJwtILAOdmeCV1JzwXI9jRA4hngwL66H6Z3cjtAN27cLdydtGTKbDP6bQpwREJOujYvm9FtgPA==
X-Received: by 2002:a63:ae48:: with SMTP id e8mr6068400pgp.0.1626725316632;
 Mon, 19 Jul 2021 13:08:36 -0700 (PDT)
Received: from rekt.ihost.com ([191.193.148.134])
 by smtp.gmail.com with ESMTPSA id e18sm21048805pfc.85.2021.07.19.13.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 13:08:36 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 v6 0/7] DEVICE_UNPLUG_ERROR QAPI event
Date: Mon, 19 Jul 2021 17:08:20 -0300
Message-Id: <20210719200827.1507276-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=danielhb413@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: armbru@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This version was rebased with QEMU master @ 7457b407edd6e8555e4b4 and
has a few simple changes based on Greg's review.

changes from v5:
- patch 1:
  * fixed function name in commit msg
-patch 6:
  * kept error message in a single line
- all patches:
  * added Greg's R-b
- v5 link: https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg03239.html

changes from v4:
- patch 1 (new):
  * avoid emitting MEM_UNPLUG_ERROR when dev->id == NULL in
memory_hotplug.c
- patch 2 (new):
  * avoid emitting MEM_UNPLUG_ERROR when dev->id == NULL in
spapr.c
- patch 3 (new):
  * do not error_report() when drc->dev->id == NULL
- patch 4 (new):
  * update DEVICE_DELETED API docs
- patch 5 (former 1):
  * added 2 spaces after each sentence
  * appended "Some errors cannot be detected." in DEVICE_UNPLUG_ERROR
docs
  * changed release from 6.1 to 6.2 in docs
  * changed DEVICE_UNPLUG_ERROR API to behave more like device_deleted
- patches 6 and 7:
  * changed to use the new DEVICE_UNPLUG_ERROR API
- v4 link: https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg01355.html

changes from v3:
- patch 1:
  * fixed format
- all patches:
  * rebased with master
  * added David's R-b
- v3 link: https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg05842.html

changes from v2:
- patch 1:
  * moved DEVICE_UNPLUG_ERROR declaration to qapi/qdev.json
  * updated 'device_del' description
  * added 'deprecated' notice on MEM_UNPLUG_ERROR
  * added MEM_UNPLUG_ERROR 'deprecated' info in docs/system/deprecated.rst
- patch 2:
  * send both MEM_UNPLUG_ERROR and DEVICE_UNPLUG_ERROR
- patch 3 (new):
  * send DEVICE_UNPLUG_ERROR in acpi/memory_hotplug.c
- v2 link: https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg01304.html

changes from v1:
- former patches 1 and 2: dropped
- patch 1 (former 3): changed the version to '6.1'
- patch 2 (former 4): add a DEVICE_UNPLUG_ERROR event in the device
  unplug error path of CPUs and DIMMs
- v1 link: https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg04682.html


Daniel Henrique Barboza (7):
  hw/acpi/memory_hotplug.c: avoid sending MEM_UNPLUG_ERROR if dev->id is
    NULL
  spapr.c: avoid sending MEM_UNPLUG_ERROR if dev->id is NULL
  spapr_drc.c: do not error_report() when drc->dev->id == NULL
  qapi/qdev.json: fix DEVICE_DELETED parameters doc
  qapi/qdev.json: add DEVICE_UNPLUG_ERROR QAPI event
  spapr: use DEVICE_UNPLUG_ERROR to report unplug errors
  memory_hotplug.c: send DEVICE_UNPLUG_ERROR in
    acpi_memory_hotplug_write()

 docs/about/deprecated.rst | 10 ++++++++++
 hw/acpi/memory_hotplug.c  | 19 +++++++++++++++++--
 hw/ppc/spapr.c            | 17 +++++++++++++----
 hw/ppc/spapr_drc.c        | 21 +++++++++++++++------
 qapi/machine.json         |  6 +++++-
 qapi/qdev.json            | 34 +++++++++++++++++++++++++++++++---
 stubs/qdev.c              |  7 +++++++
 7 files changed, 98 insertions(+), 16 deletions(-)

-- 
2.31.1


