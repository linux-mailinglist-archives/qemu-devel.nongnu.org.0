Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E22A351739
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 19:35:25 +0200 (CEST)
Received: from localhost ([::1]:57966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS1E3-0004bd-JZ
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 13:35:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1lS1Cp-0004Ad-7e
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 13:34:07 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:6957
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1lS1Cm-0006Fc-Et
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 13:34:07 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4FB9MV70J2z8PbN;
 Thu,  1 Apr 2021 13:36:06 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=date:from
 :to:cc:subject:message-id:mime-version:content-type; s=default;
 bh=luW5SqZvlYZFrKRGgpznOT0cpEk=; b=OqdFuT0aZamOvGkgHEgeeD+BPHvv
 dUg7DC62LikH/UFTuxRI/cjJtgQS9d4oHdT6q85YMAqVN/1nIX79XqwiVm6AwU6m
 Frc4v8geguVdBSh1PkN7FP8jzbPD9mdRXRSTjPwRFaSEn3kl5h5mkKkAFvlvhiU2
 IW907te9oae2QXw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=date:from:to
 :cc:subject:message-id:mime-version:content-type; q=dns; s=
 default; b=hxU0YRXMFmdcu/Uo/rxNhmuVs+VCsuSaMVgTFVqRwZ5z9qE3l6yRt
 WF1noPEdNT5cjQ8gZHzohHHicvdcEQP+8Eob5Y28EMATq/a2J8sC7jsXFHGUhnL/
 ksAiF53tfB/oKvAl/1OQD2qx8nodgj2e/+XTC8JmT49gBhnBrhmp6Y=
Received: from humpty.home.comstyle.com
 (bras-base-toroon2719w-grc-39-142-114-123-227.dsl.bell.ca [142.114.123.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4FB9MV63PWz8PbK;
 Thu,  1 Apr 2021 13:36:06 -0400 (EDT)
Date: Thu, 1 Apr 2021 13:34:00 -0400
From: Brad Smith <brad@comstyle.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] oslib-posix: Remove OpenBSD workaround for
 fcntl("/dev/null", F_SETFL, O_NONBLOCK) failure
Message-ID: <YGYECGXQhdamEJgC@humpty.home.comstyle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

OpenBSD prior to 6.3 required a workaround to utilize fcntl(F_SETFL) on memory
devices.

Since modern verions of OpenBSD that are only officialy supported and buildable
on do not have this issue I am garbage collecting this workaround.


Signed-off-by: Brad Smith <brad@comstyle.com>

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 36820fec16..7b4bec1402 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -273,17 +273,6 @@ int qemu_try_set_nonblock(int fd)
         return -errno;
     }
     if (fcntl(fd, F_SETFL, f | O_NONBLOCK) == -1) {
-#ifdef __OpenBSD__
-        /*
-         * Previous to OpenBSD 6.3, fcntl(F_SETFL) is not permitted on
-         * memory devices and sets errno to ENODEV.
-         * It's OK if we fail to set O_NONBLOCK on devices like /dev/null,
-         * because they will never block anyway.
-         */
-        if (errno == ENODEV) {
-            return 0;
-        }
-#endif
         return -errno;
     }
     return 0;

