Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AED1C0B4B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 May 2020 02:37:37 +0200 (CEST)
Received: from localhost ([::1]:49424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUJgO-0005DJ-Dt
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 20:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56812)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joseph_myers@mentor.com>) id 1jUJfG-00045Z-2Z
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 20:36:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <joseph_myers@mentor.com>) id 1jUJfD-0003Do-MA
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 20:36:25 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:63244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joseph_myers@mentor.com>)
 id 1jUJf9-0002sZ-RA
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 20:36:21 -0400
IronPort-SDR: Ny9ojTdia6oGzrbsyzl8Q2x3q/kN9foZ3FzzJzeO3COS3HkF3/zTuu/4I8KAtWcqv4b2eqQtmd
 ao4hfUUJp43+dntINt+UgShBIpWjtt1AJFDO/xNBRBvtMW0wQO69M84iIGlqMaQrmx2eLa0JJ0
 8UUxfERR7J3w8MscAXrTgx/4ib5rfOU+Kx/p2SxboP4Tuq7tOZwBf9oqInkOh18NiZKfgVY/2p
 hri2LCJ/H9AeNr7bMLcKWqkLz0ImGKMlID2o+ulbT/oY5g4HLIObdiPWw+AfIHJgakreqNFxlL
 1jQ=
X-IronPort-AV: E=Sophos;i="5.73,337,1583222400"; d="scan'208";a="48354795"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa2.mentor.iphmx.com with ESMTP; 30 Apr 2020 16:36:13 -0800
IronPort-SDR: yILkSbiStnWAGwuhCTQ0dWdoIuDcKs+kvJer15PBFOjKIYR/+uwb5RQb/BC/XwV92/JyrQk+0o
 mGe6ML/7IcZAbhHwuGkvKEY0doxptjzPLE6NqQzollLgyoO++G3poUh6aw6hzoWmuQyke3r8mS
 2rH3ZEyVRG9Mt/Z8i4Q2VDCty0IVksrg3FHon8Q0RLlEM32zHa4l16/OyXa4INn0LAevFqVLZt
 0osjcYuyVsJoqUNN5Z2c3Rz86L89PJQUEbS0f0mvy+EnAUBbrfatoQ3th+qZydHtcf33DKnZwv
 7IQ=
Date: Fri, 1 May 2020 00:36:08 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: <qemu-devel@nongnu.org>
Subject: [PATCH 0/4] softfloat: fix floatx80 emulation bugs
Message-ID: <alpine.DEB.2.21.2005010034560.30535@digraph.polyomino.org.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Received-SPF: pass client-ip=68.232.141.98;
 envelope-from=joseph_myers@mentor.com; helo=esa2.mentor.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/30 20:36:13
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Received-From: 68.232.141.98
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

Attempting to run the GCC and glibc testsuites for i686 under QEMU
shows up a range of bugs in the x87 floating-point emulation.  This
series fixes some bugs (found both through those testsuites and
through subsequent code inspection) that appear to be in the softfloat
code itself rather than in the target/i386 code; I intend to address
such bugs in target/i386 separately.

Note that the floatx80 code is used for both i386 and m68k emulation,
but the two variants of the floatx80 format are not entirely
compatible.  Where the code should do different things for i386 and
m68k, it consistently only does the thing that is right for i386, not
the thing that is right for m68k, and my patches (specifically, the
second and third patches) continue this, doing the things that are
right for i386 but not for m68k.

Specifically, the formats have the following differences (based on
documentation; I don't have m68k hardware to test):

* For m68k, the explicit integer bit of the significand may be either
  0 or 1 for infinities and NaNs, but for i386 it must be 1 and having
  0 there makes it an invalid encoding.

* For i386, when the biased exponent is 0, this is interpreted the
  same way as a biased exponent of 0 in an IEEE format; an explicit
  integer bit 0 means a subnormal value while an explicit integer bit
  1 means a pseudo-denormal; the integer bit has value 2^-16382, as
  for a biased exponent of 1.  For m68k, a biased exponent of 0
  results in the integer bit having value 2^-16383, so values with
  integer bit 1 are normal and those with integer bit 0 are
  subnormal.  So the least subnormal value is 2^-16445 for i386 and
  2^-16446 for m68k.  (This means that the i386 floatx80 format meets
  the IEEE definition of an extended format, which requires a certain
  relation between the largest and smallest exponents, but the m68k
  floatx80 format does not meet that definition.)

  Patches 2 and 3 in this series deal with pseudo-denormals in a way
  that is correct for i386 but not for m68k; to support the m68k
  format properly, the new code in patch 3 could simply be disabled
  for m68k, but addition / subtraction would need more complicated
  changes to be correct for m68k and just disabling the new code would
  not make it correct (likewise, various changes elsewhere in the
  softfloat code would be needed to handle the m68k semantics for
  biased exponent 0).

Joseph Myers (4):
  softfloat: silence sNaN for conversions to/from floatx80
  softfloat: fix floatx80 pseudo-denormal addition / subtraction
  softfloat: fix floatx80 pseudo-denormal comparisons
  softfloat: fix floatx80 pseudo-denormal round to integer

 fpu/softfloat.c | 37 ++++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

-- 
2.17.1


-- 
Joseph S. Myers
joseph@codesourcery.com

