Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62198CEFD9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 02:17:05 +0200 (CEST)
Received: from localhost ([::1]:50236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHdBX-0003ZP-SQ
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 20:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37122)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
 id 1iHd90-0002SI-Ce
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 20:14:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
 id 1iHd8y-0005JB-An
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 20:14:26 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:21472)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71)
 (envelope-from <bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
 id 1iHd8y-0005Gw-74
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 20:14:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
 s=pic; 
 t=1570493662; h=Content-Transfer-Encoding: MIME-Version: Message-Id:
 Date: Subject: To: From: Sender;
 bh=gP0eQg3wg3/BRnD4OucGfDqnuNj/+RvsVg+lwRViW68=;
 b=O05iFRcem2zg31cFFB95xdQrqWa9AROsMrkC9t0Ox5bST6FhiuiQUVXcxaG4+5sd0HNdkIzj
 iP0ZP1qeqKHFLNSn7wh0nZWRzcr49kNmCgNxSNVyK++O8I7AmVyGkjbjDAb8cqQ0RB5kY3lM
 YvafLNLKwwdh/zX8D/wmhBcVqpzs3EZj20Az3outAnbZYdbcpCs9naQia+seYISvdTRF6CPA
 2hmsBRo1BZ1o6PPEKzhI519AAKmCD6IvaebV0gjtnUf0HcXM54r6r1j85avNno07SJi8N/Ky
 B5HvQWNhagwlXiYB4r3Ti00XsynsW+vHuSRQqrhCG8OeWhf2z/akyA==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJlMGM5NSIsICJxZW11LWRldmVsQG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Received: from jonathan-ThinkPad-X1-Carbon.pdos.lcs.mit.edu
 (26-5-211.dynamic.csail.mit.edu [18.26.5.211])
 by mxa.mailgun.org with ESMTP id 5d9bd4d8.7f51c380ba28-smtp-out-n01;
 Tue, 08 Oct 2019 00:14:16 -0000 (UTC)
From: Jonathan Behrens <jonathan@fintelia.io>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v3 0/3] target/riscv: Expose "priv" register for GDB
Date: Mon,  7 Oct 2019 20:13:15 -0400
Message-Id: <20191008001318.219367-1-jonathan@fintelia.io>
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

The third patch in this series makes the priv virtual register writitable. I'm
not entirely sure this is a good idea, so I split it out into its own patch. In
particular, this change will conflict with the hypervisor extension work which
assumes that the privilege mode does not change in unexpected cases.

As pointed out in a previous version of this series, GDB actually contains some
support already for the accessing the privilege mode via a virtual "priv"
register, including to convert the values into human readable forms:

(gdb) info reg priv
priv           0x3	prv:3 [Machine]

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


