Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0B23BE04C
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 02:36:14 +0200 (CEST)
Received: from localhost ([::1]:60790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0vXx-0006VZ-0n
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 20:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m0vVV-0004nA-JM; Tue, 06 Jul 2021 20:33:41 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:34764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m0vVS-0001P8-OA; Tue, 06 Jul 2021 20:33:41 -0400
Received: by mail-pg1-x531.google.com with SMTP id 62so500020pgf.1;
 Tue, 06 Jul 2021 17:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ELDptiJbap95CytabNK9t7d2J4Ru+ibLPzeUOcT+pkU=;
 b=B1RmHgr4eq3SzCaEGTOqFIV2yTejnIb9u2WeD/7UbrD350j3Ee0MRq8Pd2ljrPMdKo
 3OFoKTm7rgdTJlsVZSSIu3ssQIFc59jeaXj6LtEkZbC2BVKZtZdzcLt/gjU3CDBGrHKU
 XxCTkiuquTvSi1tY6Jl8M28qGaK2I+ZSUKAnPnwZyBeQksW4lwuANT1WcOsBnceQ0OOK
 XOdL93n91S7pInLEuJBw4LPMtGvpbKAaN9Eonx5+bDqfcPzwgDq2qRR+Lx+OlSgNbwsi
 FWllYknlkXimUlv86cR8p2wkz8fUB23ibZzuopNhvDj44llnWtLNccMzbyz66pt9BGrX
 Ihdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ELDptiJbap95CytabNK9t7d2J4Ru+ibLPzeUOcT+pkU=;
 b=WlDNPH/Oq4IITNS1JXs7504YcpDR+/O46MGqGlzWvzv90+r65GCpRqZopuVVKCNAD/
 TtERX3aSA5NCCEtpy5cWBDE15g6EMehkGeduIci20E3ezp8GgxfZ39+FtlfGjveDGzQr
 9RyeaTlkd1tMQ5T5NHXTG5nGYISPLHL8Yb9pgA+AIU5tb72vqxaSmm0Rc6qC/0T32AQT
 rROEFyxOR18EV4tDRPqwLg72Hd2DLsI5vDjxaJ/2y6+hWZAPwcygWaD7eH30WYWOmfUq
 ebemZ7Suc9cD+YV9xJkZrzvDjHXUjQNMY/RsIPwablblzyOOgHcP3ZVWjcSU/YBYAUbL
 hNDg==
X-Gm-Message-State: AOAM532o+q0QdVWA+fUcN69lm0AR6jsBh6mqDK+bh+o9NBah40wfnjBj
 44GthoMh4gH/WShpS+l3y1oOtWtQcCKHlw==
X-Google-Smtp-Source: ABdhPJwotDMoqPkfK+y60MGbqn+lFqNhLckgWWLb61mZKDqULiESlxAXHNWmb2AI7+HrtNKgKKeQBg==
X-Received: by 2002:aa7:9586:0:b029:30f:a816:a5ef with SMTP id
 z6-20020aa795860000b029030fa816a5efmr22417886pfj.27.1625618012966; 
 Tue, 06 Jul 2021 17:33:32 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:7611:b123:7cbc:3065:30b1])
 by smtp.gmail.com with ESMTPSA id co12sm4004871pjb.33.2021.07.06.17.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 17:33:32 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/3] DEVICE_UNPLUG_ERROR QAPI event
Date: Tue,  6 Jul 2021 21:33:11 -0300
Message-Id: <20210707003314.37110-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=danielhb413@gmail.com; helo=mail-pg1-x531.google.com
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

This new version is rebased with current master (9aef0954195cc),
hopefully an adequate format of patch 1, and David's R-b on all
patches.

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

*** BLURB HERE ***

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


