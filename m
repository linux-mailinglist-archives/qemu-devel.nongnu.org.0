Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B44BA11B84F
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Dec 2019 17:15:51 +0100 (CET)
Received: from localhost ([::1]:45284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1if4eU-0000If-4f
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 11:15:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42480)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1if4UQ-0002wR-Hi
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 11:05:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1if4UP-0003wl-Ag
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 11:05:26 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:49342)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1if4UO-0003uC-Nx
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 11:05:25 -0500
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id 9510096EF0;
 Wed, 11 Dec 2019 16:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1576080322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7ZbBjtI4dr6fjhdNdYGM+WXuaoVgIRl6Ax5D6XSQADc=;
 b=uuyk14+PBQQF54KDIehtjdPAEVAhzLefQIvK+0OwynIWtFtfO55cv/cCz9IzlH0+8QZLcC
 yVt1PbudVx1LkjCnQU+35QCt4i+kXrPszA11fKL/CbE11tdtWSkMSr3CGQec2kgcPE0LGo
 elrIoSddy6dkxjZAyVA0O1ezCjFg+e0=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] gdbstub: allow sending packet of arbitrary length
Date: Wed, 11 Dec 2019 17:05:12 +0100
Message-Id: <20191211160514.58373-1-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1576080322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7ZbBjtI4dr6fjhdNdYGM+WXuaoVgIRl6Ax5D6XSQADc=;
 b=M0YQVGFpjMdkuK1ZLPL0HVk/LN+A9afpjO+aVzY9VY1ZXzngAcrBTxLL/+0Uk/foOyZKWV
 ew08S73y+LHMF3XOVxqtAvRk0ap03tFQ6KysuQGxwjkqesMxiEi2eB3CsNjWP1Jz56H14O
 YDM5qDdT+g4LKq6399Mggrvid91QSwI=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1576080322; a=rsa-sha256; cv=none;
 b=HjtCvj9FlJokZBsCiOYul7BSGDr9DVI1tHSW8P6zy30Ffco7133XMiJq/tj+iOfaSdFFRj
 uEMPl+435q6yWCBuT65uGWUJ7/ydQLe81/ko+Y5bh5GY7+uGC+xKeP0Unu2+VuasVX5oWw
 dCwTBU5nAR2C/s6npheLZba9FxlYULY=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.135.226.135
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, philmd@redhat.com,
 alex.bennee@linaro.org, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi All,

This series is a follow-up of Alex's series about sve registers
which introduces some GbyteArray/Gstring in the gdbstub.

It removes the remaining barrier to send big packets.

In consequence, we can slso simply gdb_monitor_write().

Based-on <20191130084602.10818-1-alex.bennee@linaro.org>

v2:
+ patch 1: fix gdb_monitor_write() max_sz error (Luc)
+ patch 2: new patch (Luc)

--
Damien

Damien Hedde (2):
  gdbstub: change GDBState.last_packet to GByteArray
  gdbstub: do not split gdb_monitor_write payload

 gdbstub.c | 60 +++++++++++++++++++++----------------------------------
 1 file changed, 23 insertions(+), 37 deletions(-)

--=20
2.24.0


