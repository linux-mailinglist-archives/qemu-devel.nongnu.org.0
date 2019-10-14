Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C49E5D667D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 17:50:23 +0200 (CEST)
Received: from localhost ([::1]:51834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iK2c2-0007fy-A4
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 11:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33725)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
 id 1iK2YP-00056Z-Vt
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 11:46:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
 id 1iK2YO-0007uk-WA
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 11:46:37 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:22930)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71)
 (envelope-from <bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
 id 1iK2YK-0007ma-VX
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 11:46:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
 s=pic; 
 t=1571067985; h=Content-Transfer-Encoding: MIME-Version: Message-Id:
 Date: Subject: To: From: Sender;
 bh=Bi3YMZz2MEYyGeBYXwW6EEIw98GgauVCfCNzTFTBtOo=;
 b=LW7qcjZdhv/LiHaxZ8/VSKNR/7kQ09NwER3zet9TxFKh6UMyu5LbEvieemKRC3zW8YlTj2Zq
 2PZpUDeiLkKFHXBWWwSZt9SbOjMfP8a/5XoSTsYAIvehs79f6pLcQINj33qwXGiSXkWvEZVs
 jzZ2F6+cMeRVE7/Ek5QFz+xkVW+TAcnqf0E+mKhI6DNV4YgPqvT/rkODN7bM0GiZU7AZ0OZB
 ahjRnbIm72datRVbibMgEhZaCuMocHyj6rfTokUqGW9Yr9JzNW/IhZiBX8Scxx2aBat6zxix
 ajreLzyO33nGIPjISVtOw7DBrq/IZ37i5gzNCCJk4/Ld4og1DUc5gw==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJlMGM5NSIsICJxZW11LWRldmVsQG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Received: from jonathan-ThinkPad-X1-Carbon.pdos.lcs.mit.edu
 (26-5-211.dynamic.csail.mit.edu [18.26.5.211])
 by mxa.mailgun.org with ESMTP id 5da4984b.7f705dace450-smtp-out-n01;
 Mon, 14 Oct 2019 15:46:19 -0000 (UTC)
From: Jonathan Behrens <jonathan@fintelia.io>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v4 0/3] target/riscv: Expose "priv" register for GDB
Date: Mon, 14 Oct 2019 11:45:26 -0400
Message-Id: <20191014154529.287048-1-jonathan@fintelia.io>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.61.151.224
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


This series adds a new "priv" virtual register that reports the current
privilege mode. This is helpful for debugging purposes because that information
is not actually available in any of the real CSRs.

The third patch in this series makes the priv virtual register writitable. I'm
not entirely sure this is a good idea, so I split it out into its own patch. In
particular, this change will conflict with the hypervisor extension work which
assumes that the privilege mode does not change in unexpected cases.

As pointed out in a previous version of this series, GDB actually contains some
support already for the accessing the privilege mode via a virtual "priv"
register, including to convert the values into human readable forms:

(gdb) info reg priv
priv           0x3      prv:3 [Machine]

Changlog V4:
- Fix typo in filename

Changlog V3:
- Break patch into series
- Make priv a virtual register

Changelog V2:
- Use PRV_H and PRV_S instead of integer literals

Jonathan Behrens (3)
  target/riscv: Tell gdbstub the correct number of CSRs
  target/riscv: Expose priv register for GDB for reads
  target/riscv: Make the priv register writable by GDB

 configure                       |  4 ++--
 gdb-xml/riscv-32bit-virtual.xml | 11 +++++++++++
 gdb-xml/riscv-64bit-virtual.xml | 11 +++++++++++
 target/riscv/gdbstub.c          | 36 ++++++++++++++++++++++++++++++++++--
 4 files changed, 58 insertions(+), 4 deletions(-)



