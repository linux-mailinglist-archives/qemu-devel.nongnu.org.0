Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A797DC8F3B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Oct 2019 19:04:34 +0200 (CEST)
Received: from localhost ([::1]:57792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFi3F-0001JE-GK
	for lists+qemu-devel@lfdr.de; Wed, 02 Oct 2019 13:04:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35334)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iFhrD-0005Fz-WC
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 12:52:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iFhrC-0003FH-NU
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 12:52:07 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42860)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1iFhrC-0003EI-HF
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 12:52:06 -0400
Received: by mail-wr1-x42f.google.com with SMTP id n14so20460673wrw.9
 for <qemu-devel@nongnu.org>; Wed, 02 Oct 2019 09:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ifll5/5eB1MFcZ8TJk9YOAaxcs7m4U1lLr0Xs3jZVn4=;
 b=Ivjd6S5ZbLU3+swwis40VbqGcr2s6pDAyw/5dsLawnrhEC5vpj4fKtssAK0brJ0lsx
 3shE//wx+ottfA53kVDulbZBDuT/j/ilx+OFaO1bOOBV2e3ECzQX2wRyuM0IonZAvOrf
 +dFPyNo+9jQPAniLEWjy0amchDi/h90smjM/Vxt7266Raw9AXtaaw5XQEub8uPo6rB7f
 rKiEvj2dpB0LcPsiT4GtcrO+52IUoYRGTFSGXE1Wj6iyjSMHYb8bJ8U7sAIpLJzdASdC
 9t7IZCtZ3MH7zaFjLjPbD8PSkhdDmqbD/BY09FINNGjGmhrdiILnG2DjZuQGYrjb00np
 +KBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=ifll5/5eB1MFcZ8TJk9YOAaxcs7m4U1lLr0Xs3jZVn4=;
 b=Xuh1tPXy13mWGxq8cJpKMK6HRb+A3NBxTMMk419iIuaSzpFjWbh6Oftsg4WmlcVQm1
 yFTA/PIg29NZwN+2bmYKmhUislJsOCdlkZs1B/zj+WP33CHD4+d0jJgNIFyHaawu59PA
 41C5mGMW2xa8g2p7zPcnYs9gh9w6pj8l/8XHZGI9eCJmsqHpbkAPszbfjUQyGJ7PWD6h
 Q4zbJDlcaOoqJgP36NSkrkmLyeCVMQPuT5UchHU4azj9b4SnYR495lP13Zea1GAu9HBH
 sMOf0vjDpgypMqaDpwtjDg2CrE9PVaQ0v4EvpA0PZqnj3NFzweiYJU4bMk5oG+oKnYh6
 7oEw==
X-Gm-Message-State: APjAAAXG/bgAJcnhM6xMLphWeC/HBzzPoPFV5pmibkUi+JLXrfED2nH/
 mnQPgXCsZ7tPM9lnVEt68POttPF8
X-Google-Smtp-Source: APXvYqymOtbiG/o5NYEYtBgOXdi31vTSX9OG376Hg9XUGr+HUr5G/wnRKIef7yt3IEd23lZ+nV0yuA==
X-Received: by 2002:a5d:60c8:: with SMTP id x8mr1089931wrt.107.1570035125178; 
 Wed, 02 Oct 2019 09:52:05 -0700 (PDT)
Received: from 640k.localdomain ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id g4sm27303990wrw.9.2019.10.02.09.52.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Oct 2019 09:52:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/30] qemu-pr-helper: fix crash in mpath_reconstruct_sense
Date: Wed,  2 Oct 2019 18:51:33 +0200
Message-Id: <1570035113-56848-11-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1570035113-56848-1-git-send-email-pbonzini@redhat.com>
References: <1570035113-56848-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42f
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
Cc: Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxim Levitsky <mlevitsk@redhat.com>

The 'r' variable was accidently shadowed, and because of this
we were always passing 0 to mpath_generic_sense, instead of original
return value, which triggers an abort()

This is an attempt to fix the
https://bugzilla.redhat.com/show_bug.cgi?id=1720047
although there might be other places in the code
that trigger qemu-pr-helper crash, and this fix might
not be the root cause.

The crash was reproduced by creating an iscsi target on a test machine,
and passing it twice to the guest like that:

-blockdev node-name=idisk0,driver=iscsi,transport=...,target=...
-device scsi-block,drive=idisk0,bus=scsi0.0,bootindex=-1,scsi-id=1,lun=0,share-rw=on
-device scsi-block,drive=idisk0,bus=scsi0.0,bootindex=-1,scsi-id=1,lun=1,share-rw=on

Then in the guest, both /dev/sda and /dev/sdb were aggregated by multipath to /dev/mpatha,
which was passed to a nested guest like that

-object pr-manager-helper,id=qemu_pr_helper,path=/root/work/vm/testvm/.run/pr_helper.socket
-blockdev node-name=test,driver=host_device,filename=/dev/mapper/mpatha,pr-manager=qemu_pr_helper
-device scsi-block,drive=test,bus=scsi0.0,bootindex=-1,scsi-id=0,lun=0

The nested guest run:

sg_persist --no-inquiry  -v --out --register --param-sark 0x1234 /dev/sda

Strictly speaking this is wrong configuration since qemu is where
the multipath was split, and thus the iscsi target was not aware of
multipath, and thus when libmpathpersist code rightfully tried to register
the PR key on all paths, it failed to do so.

However qemu-pr-helper should not crash in this case.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scsi/qemu-pr-helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
index a8a74d1..debb18f 100644
--- a/scsi/qemu-pr-helper.c
+++ b/scsi/qemu-pr-helper.c
@@ -323,10 +323,10 @@ static int mpath_reconstruct_sense(int fd, int r, uint8_t *sense)
              */
             uint8_t cdb[6] = { TEST_UNIT_READY };
             int sz = 0;
-            int r = do_sgio(fd, cdb, sense, NULL, &sz, SG_DXFER_NONE);
+            int ret = do_sgio(fd, cdb, sense, NULL, &sz, SG_DXFER_NONE);
 
-            if (r != GOOD) {
-                return r;
+            if (ret != GOOD) {
+                return ret;
             }
             scsi_build_sense(sense, mpath_generic_sense(r));
             return CHECK_CONDITION;
-- 
1.8.3.1



