Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B701D5B69
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 23:26:39 +0200 (CEST)
Received: from localhost ([::1]:55100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZhqp-0007PH-0K
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 17:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joseph_myers@mentor.com>)
 id 1jZhjl-0007A2-IV
 for qemu-devel@nongnu.org; Fri, 15 May 2020 17:19:21 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:28715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joseph_myers@mentor.com>)
 id 1jZhjj-00076r-Ef
 for qemu-devel@nongnu.org; Fri, 15 May 2020 17:19:20 -0400
IronPort-SDR: EfO0fjNjDNVDamYcvxUw+LqYjCm9iqBjIVf/9hxpy/uiQN/TfzNnmhA2SRHxiPjoOEb7ys3Cke
 8koXGOC4AUZ3EtlUVjc8lK0U9PieWPiGRE/xDYhrewa9gAp+4i0wylkO5RgJwL7xPvCYSo9RPs
 o3h6OaWYkBW7X6p5VUfYrq4joSgd/ElJTEtg3ZOfBvNUBgJhttaVWvizV/nwPbDDr9MQWxMU3u
 4ib1HXeWLUhwMQs4xWqt7W8R0PwiW67Xdr9PdFakGaPUohI1pcycw4hH1VNhCdQJA0gHehhGoh
 W6o=
X-IronPort-AV: E=Sophos;i="5.73,396,1583222400"; d="scan'208";a="48956117"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa4.mentor.iphmx.com with ESMTP; 15 May 2020 13:19:15 -0800
IronPort-SDR: uR/D8u2foll+OvrxxBT8L7HRjXFyHujmtMdjFZypfY3asCn8A+GapwJJX4EUBaH6DZQT8t2JAs
 eVFIrVy5ZDwiYf1iCJU3VWvhKmWd5cB6N4/qdVlI1VWWHwX/0e7jWT9i6yugkFzQjtDXEtxuAM
 xTDFh3UDRJ0szK7Kt1bWIoMyIcxD3pp14ICL9KtAbfcOXPn2tStntOrjnzbRiaQ/ROp/W6+Rmg
 +dzDWDlDY1tduTk6d08MH40N+JhgQp7Z0pqGmw6D9JBT74l76ZZhWkfZUxv/bAmde63OnODraD
 y6g=
Date: Fri, 15 May 2020 21:19:09 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: <qemu-devel@nongnu.org>, <pbonzini@redhat.com>, <rth@twiddle.net>,
 <ehabkost@redhat.com>
Subject: [PATCH 0/2] target/i386: x87 exceptions fixes
Message-ID: <alpine.DEB.2.21.2005152117400.3469@digraph.polyomino.org.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-08.mgc.mentorg.com (139.181.222.8) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Received-SPF: pass client-ip=68.232.137.252;
 envelope-from=joseph_myers@mentor.com; helo=esa4.mentor.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 17:19:15
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

Following (and depending on) my three previous patch series for
problems found in the x87 floating-point emulation, this patch series
fixes some issues relating to floating-point exceptions.

Other issues in that area remain that I hope to address in future
patch series.  In particular, this patch series does not address the
"input denormal" exception (the generic softfloat code only raises
that in the flush-to-zero case; x87 has different logic for when to
raise it, generally raising it for all denormal and pseudo-denormal
operands but including a few instructions that don't raise it at all),
does not address issues with functions whose emulation currently goes
via host double (which need to be reimplemented to work properly with
the full floatx80 range and precision, probably reusing some of the
code from the m68k target), and does not address issues with the
handling of exceptions for which traps are enabled (where there are
many different bugs in the current implementation in QEMU).

Joseph Myers (2):
  target/i386: fix fisttpl, fisttpll handling of out-of-range values
  target/i386: fix IEEE x87 floating-point exception raising

 target/i386/fpu_helper.c                 | 130 +++-
 tests/tcg/i386/test-i386-fisttp.c        | 100 +++
 tests/tcg/i386/test-i386-fp-exceptions.c | 831 +++++++++++++++++++++++
 3 files changed, 1040 insertions(+), 21 deletions(-)
 create mode 100644 tests/tcg/i386/test-i386-fisttp.c
 create mode 100644 tests/tcg/i386/test-i386-fp-exceptions.c

-- 
2.17.1


-- 
Joseph S. Myers
joseph@codesourcery.com

