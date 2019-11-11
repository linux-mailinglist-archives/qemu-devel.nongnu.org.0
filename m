Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71349F7978
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Nov 2019 18:08:38 +0100 (CET)
Received: from localhost ([::1]:55600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUDB7-0003A3-7Q
	for lists+qemu-devel@lfdr.de; Mon, 11 Nov 2019 12:08:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48504)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <danielhb413@gmail.com>) id 1iUD4X-0006Cf-Qy
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 12:01:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <danielhb413@gmail.com>) id 1iUD4W-00069r-Gq
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 12:01:49 -0500
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:45327)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <danielhb413@gmail.com>)
 id 1iUD4W-00069e-9C
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 12:01:48 -0500
Received: by mail-qv1-xf36.google.com with SMTP id g12so5148712qvy.12
 for <qemu-devel@nongnu.org>; Mon, 11 Nov 2019 09:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cfnHGAT7BFUvJ4LVpXC2KbNpRwrirSY1IOs1ZSYp6Xg=;
 b=qIXYp87pccabh8YHwp4af+mY50Aq3IuEyIDZWqlvbKfvUrujifmksM+ChTKmVkcJ9a
 ax/NsUPysO30QEjx/uspqHhkmopbIZO+NC2W9PxJP1h7Zm9RwuW1vqNiiRuHHUQYEtxU
 aB54lucCljr1gbSNSpO67SRYd0aB2mLXfgwQaskHJg5fHZAuxpfs8CAaRlo2vAnJ4TiG
 EhpTAV3XZmu+fmXRzlAWrAtQJiux7fRuF5NkfFgY9W2oClYz2fAlhGOtvDKWks/+PATW
 nNXE/6jkgosvOFrmTyhTCmWTvLRanHqfJoOSx4esee0Rx3zIj2ZPKt5cXDRA8x/WVuqN
 FslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cfnHGAT7BFUvJ4LVpXC2KbNpRwrirSY1IOs1ZSYp6Xg=;
 b=XhemfeR8aTGV6/qQ5YjySr8pOwRx71d2GgieT31giimaeWGfVt0KogYW/vtyO/snN2
 X+6TyIOEdkZkFDU5OrpYsgPgiSj191y6u/iWM77fBp8EY4bXEnVLoEs8XPjIUjzI7GRY
 wOtYguFWEBO0KzLKyvTE4oTS4wy3CZp4hD4SQuOWOmVQewTnnqfCvQ+diCdSk1BySvQ0
 UAGRMxFA9eSQR7MReIG6npVOLtLMw/n+8a52ltVhFF6MjmzXsuHxE65LW0kbRZXOqodM
 UdmEXMfLw8lYjZZO8EguP+FHGODyT0lfpRNSlEn0DS1EJgTNvAqyo6BbzYxJSum69sBt
 fb2Q==
X-Gm-Message-State: APjAAAX2oPo7eYI+PZtbeZbV2yXfpcKnBkvfr0L3FnVVgDdHwrbgt55N
 whrYUKieriib8F5SGIaqQRVehfFp
X-Google-Smtp-Source: APXvYqzDVOjEKcDmKy56b39MDQsor4VqEMUppCt2xFIiV5iEVopYxlb9Wx1uLM9MzsoIjzyYdJyxgA==
X-Received: by 2002:ad4:408d:: with SMTP id l13mr11153505qvp.49.1573491706434; 
 Mon, 11 Nov 2019 09:01:46 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:980:1591:e29e:17a4:d484])
 by smtp.gmail.com with ESMTPSA id n20sm8572462qkn.118.2019.11.11.09.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 09:01:45 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 0/4] delete created files when
 block_crypto_co_create_opts_luks fails
Date: Mon, 11 Nov 2019 14:01:27 -0300
Message-Id: <20191111170131.13742-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::f36
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
Cc: kwolf@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

changes from previous version 7 [1], all suggested by Kevin Wolf:

- patch 1:
    * removed function comment of raw_co_delete_file;
    * removed 'done' label from raw_co_delete_file;
    * removed 'local' remark from bdrv_co_delete_file comment. The comment
      is now single-lined;
    * added missing space in the commit msg;
- patch 2:
    * ditched bdrv_delete_co_entry and bdrv_delete_file, now it's a single
      coroutine_fn bdrv_co_delete_file;
    * BlockDriverState != NULL dropped - the caller will need to ensure it
      is not null;
    * changed the error message of '!bs->drv' condition;
    * s/delete/deletion in the error message of !bs->drv->bdrv_co_delete_file;
    * 'out' label removed - function will return immediately on error;
- patch 3:
    * check for (ret && bs);
    * drop the ENOENT verification;
    * do not prepend the filename in the error message;
    * removed an extra blank line.


[1] https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg00282.html

Daniel Henrique Barboza (4):
  block: introducing 'bdrv_co_delete_file' interface
  block.c: adding bdrv_co_delete_file
  crypto.c: cleanup created file when block_crypto_co_create_opts_luks
    fails
  qemu-iotests: adding LUKS cleanup for non-UTF8 secret error

 block.c                    | 26 +++++++++++++++
 block/crypto.c             | 18 ++++++++++
 block/file-posix.c         | 23 +++++++++++++
 include/block/block.h      |  1 +
 include/block/block_int.h  |  4 +++
 tests/qemu-iotests/273     | 67 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/273.out | 11 +++++++
 tests/qemu-iotests/group   |  1 +
 8 files changed, 151 insertions(+)
 create mode 100755 tests/qemu-iotests/273
 create mode 100644 tests/qemu-iotests/273.out

-- 
2.21.0


