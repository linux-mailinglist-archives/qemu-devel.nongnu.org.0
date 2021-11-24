Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB9945B790
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 10:34:18 +0100 (CET)
Received: from localhost ([::1]:52204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpofR-0002cm-R8
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 04:34:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mpobM-0000Dt-32; Wed, 24 Nov 2021 04:30:04 -0500
Received: from [2607:f8b0:4864:20::92f] (port=33580
 helo=mail-ua1-x92f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mpobH-0006gi-5k; Wed, 24 Nov 2021 04:30:03 -0500
Received: by mail-ua1-x92f.google.com with SMTP id a14so3842033uak.0;
 Wed, 24 Nov 2021 01:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sJs4I3htJkxHOVTBverQr6ho5EG3Q5K0eis/iQn5AbQ=;
 b=Kboo8Dbo6d+NHBWVo9BO1M+IOVLJt5f5NpDFbE864pADxZVzwBKaCDkU78jwH7c/Tn
 EgR5GoUo7zX8MeDZX3fxozKCt/FxIaBfOO/GTNFmkZoaMVXA664PmGYSR9FMT4GeGNqJ
 i1X+EyJJE7/kZHlM1dOWatM3lw593zZbxh60v0xRV8T6pULRNzWa44xdXjuzG5YWcA7z
 a9lno2YPwFnqcnaSRC86aVgJ3TxkYKTHnyaihgSqupS2gCT/PjJoak/B1Y7ljfOn4PCK
 +VTGj1uQSl5plJvCYn7SUbNeAOJOCZKBOu3ClcjJ1T67oXeapyEIpSJoWLddqBOAF4U1
 Duyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sJs4I3htJkxHOVTBverQr6ho5EG3Q5K0eis/iQn5AbQ=;
 b=iGZDGRDBFMULDtqG+8bQ1FvzUino4BLRCcdX8ms/AXc5WzbaT03+dCh6GMjAApN3NV
 xBI1j/GgdrEh0+NhnTqw3AGNQ3670jLcAGJzOm8Dx9h88GZ9/pGeRxfWyZ0ZIcT3rjNF
 bkAkbdBQeqCzwXvWD9eKiHIjpphHTe1PgbrRu6m/qEdfD9oeY7XpdE6yOoxrZxVoENN4
 6/ezYFXGIsyouRelv+oTg9oPtv4ujpDOwuZWz6i5jf2zqJBglNdEwuqUvEiUxPqqitdK
 0rln2BTHSXEp7xwTtSpzxFS9vH1OAUxqoSc6ecYk+GTai+FsT2dcWA9WSw50ye+Kaavr
 2eKA==
X-Gm-Message-State: AOAM530PRWgv1zOHWr0NvciZTiqVpeBciIVWFFyT+qPZfSEceqWexZOa
 acxvjayfRuegdWEhGZ+hJZ9S7JauQ90=
X-Google-Smtp-Source: ABdhPJyyyVl0cAXsuInLApscGTLjkC0ZZCXhNu4tjqZXAUumbIvPbPLpL0g84YW+tjDbwMcBslhpTg==
X-Received: by 2002:ab0:6f0a:: with SMTP id r10mr8149462uah.106.1637746197678; 
 Wed, 24 Nov 2021 01:29:57 -0800 (PST)
Received: from rekt.ibmuc.com ([191.19.215.188])
 by smtp.gmail.com with ESMTPSA id m15sm7682583vkl.40.2021.11.24.01.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 01:29:57 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.0 v2 0/2] change ivshmem endianness to LITTLE_ENDIAN
Date: Wed, 24 Nov 2021 06:29:46 -0300
Message-Id: <20211124092948.335389-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This small series fixes an issue reported in Gitlab [1] that
affects PowerPC big-endian and little-endian and probably all
other big-endians in the wild that might use 'ivshmem'.

It's not clear to me who is the maintainer/responsible for this device
(MAINTAINERS doesn't seem to have any 'ivhshmem' entries nor someone
that looks upon all hw/misc/* files) so I didn't add any CC in that
regard. 'qemu-ppc' is being copied for awareness since they are the
folks that are most likely being impacted by the bug.

[1] https://gitlab.com/qemu-project/qemu/-/issues/168

Changes in v2:
- fixed 'endianess' occurrences to 'endianness' in patch 1
- fixed spell errors and added Thomas' ack in patch 2
- added a "for-7.0" marker in the subject
- v1 link: https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg04716.html


Daniel Henrique Barboza (2):
  ivshmem.c: change endianness to LITTLE_ENDIAN
  ivshmem-test.c: enable test_ivshmem_server for ppc64 arch

 hw/misc/ivshmem.c          | 2 +-
 tests/qtest/ivshmem-test.c | 5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

-- 
2.31.1


