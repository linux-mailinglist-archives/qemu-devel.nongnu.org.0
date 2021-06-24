Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E233B2443
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 02:29:01 +0200 (CEST)
Received: from localhost ([::1]:55582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwDEq-0000vD-F3
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 20:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1lwDDn-0008BC-15
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 20:27:55 -0400
Received: from pv34p98im-ztdg02162201.me.com ([17.143.234.141]:43657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1lwDDl-0003cT-BF
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 20:27:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1624494471; bh=9jpKOx0100f+GNnZN/P+VBmp52Y7xoSnsvbI/jDSYbI=;
 h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To;
 b=dHu3UJ/PgjMcKlChRShWxF5m6SWzooF6RZZCYXzrz/PWO4kZZkYmgDjFq8gwQ4EhZ
 VzHBfOPS/HLy3I2MJJDoDeaExo80gsVd3eeemOZdggs+bsRFJyAre8J3xGzCxGpxIE
 83tqkPAbIk+mb3xQrKqciEcZJs9w8Y4IpF0t7+rWmvNYxsMpJg2/4rxrwMRFjGF1Sa
 fBvTcylKgryR/qyZYrAyPka/7rJ8cJWvScP2b6hLxW6W88Qyu7Qf2/auMCSJ+exsqL
 Y/MN1j+RCu5npu5Y+EWg3ETWL5Q9TXK9l9rYTaHZ5c4h40lPlPbx7bOQoJURo1CS3H
 OnlOrMPtDZq2g==
Received: from smtpclient.apple (unknown [17.11.62.76])
 by pv34p98im-ztdg02162201.me.com (Postfix) with ESMTPSA id 830F31C01DC
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 00:27:51 +0000 (UTC)
From: Jason Thorpe <thorpej@me.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Guidance on emulating "sparse" address spaces
Message-Id: <B588EDAA-3A97-44A9-8CAF-B2858CBE0A93@me.com>
Date: Wed, 23 Jun 2021 17:27:48 -0700
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3654.80.0.2.43)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-23_14:2021-06-23,
 2021-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=457 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2106240000
Received-SPF: pass client-ip=17.143.234.141; envelope-from=thorpej@me.com;
 helo=pv34p98im-ztdg02162201.me.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

As a "learn the internals of Qemu a little better" exercise, I am =
planning to write models for some older Alpha systems, initially for one =
based on the LCA45.  One of the quirks of these old systems, though, is =
lack of byte/word load/store.  So, to support 8- and 16-bit accesses to =
I/O devices, the PCI interfaces on these systems implement "sparse" I/O =
and memory spaces (some also implement a "dense" space that can be used =
for e.g. frame buffers; more on that another time).

The way the sparse spaces work is that the address space is exploded =
out, and the CPU-visible address used to perform the access is computed =
using the desired bus address along with a field to specify the =
byte-enables.

Using the 21066's IOC as an example, PCI I/O addresses 0000.0000 - =
00ff.ffff are mapped to 1.c000.0000 - 0x1.dfff.fff.  The offset into the =
I/O space is shifted left 5 bits, and the byte-enables code is shifted =
left 3 bits, and both are added to the base address of PCI I/O space in =
the system memory map (1.c000.0000) resulting in the system physical =
address to use in a 32-bit load/store.  Software then does e.g. a 32-bit =
read to that location, and extracts the value out the relevant field.

Further complicating things ... it's possible for the bus region that's =
mapped into the system address space to not begin at 0.  As a =
hypothetical example you might have a PCI sparse memory space that maps =
PCI memory addresses 1000.0000 - 1fff.ffff.  The 2117x chipsets used on =
EV5/EV56 is a concrete example of a PCI interface that implements =
multiple windows for each space type.

I'm trying to wrap my head around how to achieve this in Qemu.  I don't =
see an obvious way from my initial study of how the PCI code and memory =
regions work.  Some guidance would be appreciated!

Thx.

-- thorpej


