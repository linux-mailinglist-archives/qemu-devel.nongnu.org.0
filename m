Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B34D74021B2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 02:52:40 +0200 (CEST)
Received: from localhost ([::1]:58436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNPLq-0005Wy-Tc
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 20:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mNPHY-0002TZ-6y; Mon, 06 Sep 2021 20:48:12 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:42982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mNPHW-0003lM-N5; Mon, 06 Sep 2021 20:48:11 -0400
Received: by mail-qk1-x731.google.com with SMTP id t4so8441792qkb.9;
 Mon, 06 Sep 2021 17:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=egwjgNP/S15p6OKs/iTt8slTdQsaL8jVwEg2txuAgpM=;
 b=kMr5wnyyW+oQ3Qrpr+xqrakXjYzW91DZ/P1SM1tMtnwQ7ktZiX7gtTENb0o7OK4vYe
 2nITPgX89LmWmsUTOyXg8nSZDbM7b14FCdNJGcqPS7UMtHmPM1bntvS9baJmTlQ8KjhJ
 ls/KlHpFCdtOq4XyC4U03W18iB6ZYxY2O8qXmK6fJm/qG/kG2z+zdNoWe/luOgviE40D
 Ln5bIUVUG34Wkw4UgNlL366cwkayq2t1U5kaKO1l1R1vv65hHpywJaLWswLVOv2QwtrA
 L8L+IWsEP2FPYisMMNwarcJm9OCuXuH9XcuuHL3vZ7Rfq5vFn0GMlCW6toforky+lE/u
 Gfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=egwjgNP/S15p6OKs/iTt8slTdQsaL8jVwEg2txuAgpM=;
 b=CEgB+sAO5l+Tv24aIefgfMEHbuJndMFuxuyiQrknhD0DeEqPfoNsYt691EX0dQgFTi
 ny3Qr4W3arZSQLI/xoK5gAii4B2j8fACH97JcDChPdQunVcnOr7OeXKU/HRPE9gUIqSX
 aMiAIF3/03nqnuhXAz/K6WJ0o6fx7z8p/djANTIQfZR1pSz0stn5tdu9rOAthQmD/BDw
 klLpRli2U33EQMikNOTz0ZrepZ0IZ3VDnq/jq9P9NnZMF1XhSiivVLHRBrUQrQDOF38w
 239Z1ktHPyXI61OeVgr8yKXcWzi8czLKBpd/OeAoKAEMAoX4QUkod0uLcmSJLTTxwVhP
 jKtw==
X-Gm-Message-State: AOAM533h3OfLfOPO1Lygnm6/ST5mX2LgWxPoce4FG3xjqyEcCuJW4RqD
 dQ5ZidNmuRBJ3alKnouJaRbbzulo/8s=
X-Google-Smtp-Source: ABdhPJwRR+L/Zal0cAhlvFHhBqhvCqbmag3ac3J+V/uQCMSamezcTDkbosvngfQWncoU/sfnkS1ZsQ==
X-Received: by 2002:ae9:e502:: with SMTP id w2mr13260737qkf.200.1630975689181; 
 Mon, 06 Sep 2021 17:48:09 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.136.122])
 by smtp.gmail.com with ESMTPSA id x83sm7799538qkb.118.2021.09.06.17.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 17:48:08 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 0/7] DEVICE_UNPLUG_GUEST_ERROR QAPI event
Date: Mon,  6 Sep 2021 21:47:48 -0300
Message-Id: <20210907004755.424931-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x731.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This new version amends the QAPI doc in patch 5, as suggested
by David and Markus, and added all reviewed-by and acked-by
tags.

changes from v7:
- patch 5:
  * s/internal guest/guest reported/
- v7 link: https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg04115.html

Daniel Henrique Barboza (7):
  memory_hotplug.c: handle dev->id = NULL in acpi_memory_hotplug_write()
  spapr.c: handle dev->id in spapr_memory_unplug_rollback()
  spapr_drc.c: do not error_report() when drc->dev->id == NULL
  qapi/qdev.json: fix DEVICE_DELETED parameters doc
  qapi/qdev.json: add DEVICE_UNPLUG_GUEST_ERROR QAPI event
  spapr: use DEVICE_UNPLUG_GUEST_ERROR to report unplug errors
  memory_hotplug.c: send DEVICE_UNPLUG_GUEST_ERROR in
    acpi_memory_hotplug_write()

 docs/about/deprecated.rst | 10 ++++++++++
 hw/acpi/memory_hotplug.c  | 11 ++++++++++-
 hw/ppc/spapr.c            | 12 ++++++++++--
 hw/ppc/spapr_drc.c        | 16 ++++++++++------
 qapi/machine.json         |  7 ++++++-
 qapi/qdev.json            | 31 ++++++++++++++++++++++++++++---
 stubs/qdev.c              |  7 +++++++
 7 files changed, 81 insertions(+), 13 deletions(-)

-- 
2.31.1


