Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE363C640C
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 21:47:07 +0200 (CEST)
Received: from localhost ([::1]:45794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m31tR-0003Y4-MW
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 15:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m31qO-0001Tw-E3; Mon, 12 Jul 2021 15:43:56 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:35353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m31qM-0002ag-DY; Mon, 12 Jul 2021 15:43:56 -0400
Received: by mail-pg1-x52f.google.com with SMTP id v7so19406761pgl.2;
 Mon, 12 Jul 2021 12:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/XvhIBIm5mjNMJI1CkvOuqhK/UfLznuuMFrfwE8aIr8=;
 b=Sj9Wx5JCENtQvaOJ40eL4HhtO3bpFJrg5z0E3CCO78Y5XMXwcWU2qGoIpZ5ym2AdSZ
 kQT6wqIvl/ULMwwcHBCaLKwlxLjjJRj3O4/0sixP6QljqpxNgJxSkk7jrjtMFbgZI1Wl
 3TX7AhmEZ2ZqLNxbkgZgVlSAYhxuZTKuywQwk1E7FCZqcPiQTNDwITmwhEcLyCiB1cgf
 btcgBi9fdBSP7VUrIoPDAEuOJzYzzAdt/b42CAYOeiBa6ATKAyYbTPdzmIR6k6TzIuFU
 wYpMbUXxfacheRzaeX7NgCvKVfdnnqUJooH0Z8LLxMb7KnTv5lvRxQRmzs7tpgn3RObq
 hKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/XvhIBIm5mjNMJI1CkvOuqhK/UfLznuuMFrfwE8aIr8=;
 b=jS92OUD3dO86BuH94J70JFtoO9pKPEhwDJ0oivPKIhrnIV9sxzwhzoanAmvaPB/dQY
 BpmQiFc9qQT5w57ztkvPgf7Ts/K0or+qSwV0CDPAzWBXeLv10WEVSyUn++lYcevykAhw
 AbZA0ntnsRZRQNukcmKr/7w1GAkn+pHd51Q+E6Z9jPg2VKiKO3TeoZ+mUh2vdKfHVsGe
 E9a29zVexh01xvscXzoHJH+EIbmB6YQQ8i1IOlXheyZbi5Cnhi1xWO/FxpEPZ/GPIZLk
 IjAS5WhYHgsSchxPDbCE9BvE7sHQwFOGtwXVIdd4Kcwdsh6pQCRg2tJ6hFtBTnZelLzm
 sizg==
X-Gm-Message-State: AOAM531wpTCAhF+7kqdrRR+F4SFn4T48LXIIjCjhcLOgJR9Bh6O8b9Zq
 LMDaYcL9Y8NqOt1ff+CeR1l/YrHHJoA=
X-Google-Smtp-Source: ABdhPJwLkM7mYJBraLlGFNB0Rmvi4BIxFNInnwBwScRZMRdF2buc+WsabhQq491LIInR5Gcc2jmT6A==
X-Received: by 2002:a63:ff4f:: with SMTP id s15mr683713pgk.193.1626119031803; 
 Mon, 12 Jul 2021 12:43:51 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:a7d9:90df:d3f0:78a8:2eb9])
 by smtp.gmail.com with ESMTPSA id e21sm17075088pfc.172.2021.07.12.12.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 12:43:51 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/7] DEVICE_UNPLUG_ERROR QAPI event
Date: Mon, 12 Jul 2021 16:43:32 -0300
Message-Id: <20210712194339.813152-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=danielhb413@gmail.com; helo=mail-pg1-x52f.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, armbru@redhat.com,
 groug@kaod.org, qemu-ppc@nongnu.org, eblake@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

In this version the most notable changes are additional cleanups/fixes
patches that precedes the introduction of the new DEVICE_UNPLUG_ERROR
API, and the change of DEVICE_UNPLUG_ERROR to behave more in line
with DEVICE_DELETED, as suggested by Markus.

This is how the new event looks like:

{"execute": "device_del", "arguments": {"id": "core1"} }
{"return": {}}
{"timestamp": {"seconds": 1626117386, "microseconds": 182215},
 "event": "DEVICE_UNPLUG_ERROR",
 "data": {"device": "core1",
          "msg": "Device hotunplug rejected by the guest for device core1",
          "path": "/machine/peripheral/core1"}}  

I kept the 'msg' element since both MEM_UNPLUG_ERROR callers provides a
reason for the failed unplug. This element works like 'device' and it's
provided if available.


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

 docs/system/deprecated.rst | 10 ++++++++++
 hw/acpi/memory_hotplug.c   | 19 +++++++++++++++++--
 hw/ppc/spapr.c             | 17 +++++++++++++----
 hw/ppc/spapr_drc.c         | 20 ++++++++++++++------
 qapi/machine.json          |  6 +++++-
 qapi/qdev.json             | 34 +++++++++++++++++++++++++++++++---
 stubs/qdev.c               |  7 +++++++
 7 files changed, 97 insertions(+), 16 deletions(-)

-- 
2.31.1


