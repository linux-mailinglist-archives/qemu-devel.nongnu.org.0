Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BD13AF728
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 23:03:55 +0200 (CEST)
Received: from localhost ([::1]:60256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvR5G-0000gB-GU
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 17:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lvR3v-0007uj-4p; Mon, 21 Jun 2021 17:02:32 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:38800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lvR3q-0002vK-C7; Mon, 21 Jun 2021 17:02:30 -0400
Received: by mail-qt1-x831.google.com with SMTP id o19so14534094qtp.5;
 Mon, 21 Jun 2021 14:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ewV4P0AJZUD2bW4Vlvy6InljdrIYpXH0tqJiSV2iYR0=;
 b=ifZceFitRhmiE8Dn8N/l/wmDqa8CJbkuLWkeBhauruNi/x/ZGtkl63DWqJNCIc3q0O
 mI55UBp4gh8vx+5ZWm2tAKBv+BXm8doYnQchBYYskGy65jy3XKRJg7TcmFQzwQ8P2bwN
 vWzyb4CnRZjPY5VJk/QgHUrqMnZXoxWqqSskLBlhNENMnBzhG2uoYx1blBOnWSiaE8ld
 z2KT9iUq2MgHRJZ8f7VVXt5y8LkW4EdmCZ4ES2X0iTmQ3OvEky0Wc5DRopA/SSpSWnjY
 3kXRg+jLGghh2KWp2wGo4d03wiMP6eSiCYz9lCP+t9klKv8Xf3QOznP9WTqbr6NTpz70
 vqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ewV4P0AJZUD2bW4Vlvy6InljdrIYpXH0tqJiSV2iYR0=;
 b=luoxEFQyp+cTdi18H0IhNG30tRdlvViTyrfLLttAbmb/XBmBctrv9JfKSDB9Hvjdk7
 7qViMhtTD5JKi5n8t2L507jMBqVxvjxN4Md1u8/EeuZzKH2KOeaPY7EtC00hpQvv+Epq
 MhCiWRecehiHqCjOewPtyBtYNHytkpqT0yYvehgO8u9JimAF/WIWYln/BMGejjE0QOMj
 iOLXDBcnb2OFzaVi+7mFeCZCm1HP036BV7kdpDJQYuQzGV2D04mmLHPd4VlSAa3dXd3Z
 vG4JudRMqCNy6V6CTvgUMFjH/8n8wUwSIKigNrETvEmwje9LQah7nk3xdIGZKzDQUmMI
 Xfmg==
X-Gm-Message-State: AOAM530LMxS6NfkyUSP142uZ5tbW86OkpKZ+icgPvtSu7WqVWlqSZiVv
 cVvOOlRPvy6I7sO/5f3k0FWkIxNDafM=
X-Google-Smtp-Source: ABdhPJzOWeomM8CQ2F76XnhJQ4jpXXRtYILMbrGrpsz0Be25I8bd/GCWTP4cNhqh8/FKthUph7Dubg==
X-Received: by 2002:ac8:570a:: with SMTP id 10mr464316qtw.179.1624309343848;
 Mon, 21 Jun 2021 14:02:23 -0700 (PDT)
Received: from localhost.localdomain ([191.19.29.157])
 by smtp.gmail.com with ESMTPSA id b8sm187035qtr.77.2021.06.21.14.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 14:02:23 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] DEVICE_UNPLUG_ERROR QAPI event
Date: Mon, 21 Jun 2021 17:59:04 -0300
Message-Id: <20210621205907.244841-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x831.google.com
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

In this new version we're now sending both MEM_UNPLUG_ERROR and
the new DEVICE_UNPLUG_ERROR events to avoid breaking existing
listeners of MEM_UNPLUG_ERROR, which is now marked as deprecated.

All emitters of MEM_UNPLUG_ERROR are now emitting DEVICE_UNPLUG_ERROR
as well. 



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


Daniel Henrique Barboza (3):
  qapi/qdev.json: add DEVICE_UNPLUG_ERROR QAPI event
  spapr: use DEVICE_UNPLUG_ERROR to report unplug errors
  memory_hotplug.c: send DEVICE_UNPLUG_ERROR in
    acpi_memory_hotplug_write()

 docs/system/deprecated.rst | 10 ++++++++++
 hw/acpi/memory_hotplug.c   | 13 +++++++++++--
 hw/ppc/spapr.c             |  8 ++++++++
 hw/ppc/spapr_drc.c         | 15 +++++++++------
 qapi/machine.json          |  6 +++++-
 qapi/qdev.json             | 27 ++++++++++++++++++++++++++-
 6 files changed, 69 insertions(+), 10 deletions(-)

-- 
2.31.1


