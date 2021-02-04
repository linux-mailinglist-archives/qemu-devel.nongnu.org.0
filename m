Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EA030FCD7
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:33:01 +0100 (CET)
Received: from localhost ([::1]:33896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7kNA-0002xC-KE
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:33:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7jyJ-0003Ns-79
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:07:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7jyF-0001Am-LD
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:07:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612465634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=H48CZ+BHgsKc3z0Gpn9zJgvUwGlaVWx/1tMDFmHJrYQ=;
 b=RwGPnmlm80KzoX2CzZBScrRN0kQQ5sQom7gPk5X5TcDVawbZNolBwKnEwibNStPdNcFeP/
 3LnhXSjdY0sFvHeJIlds9o2Rn2f1W7aDlJTfmN9RJf0gbht1fQZ1GoG5ywKwXUmWjU3s1j
 Q3orzS8Rh9stIaqpBQBAiYFRJjKxShg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-S3E5Sv9tONKgwbO-LAvxew-1; Thu, 04 Feb 2021 14:07:10 -0500
X-MC-Unique: S3E5Sv9tONKgwbO-LAvxew-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B886C1934116;
 Thu,  4 Feb 2021 19:07:09 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1834B6C927;
 Thu,  4 Feb 2021 19:07:08 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] Improve do_strtosz precision
Date: Thu,  4 Feb 2021 13:07:05 -0600
Message-Id: <20210204190708.1306296-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: vsementsov@virtuozzo.com, berrange@redhat.com, qemu-block@nongnu.org,
 tao3.xu@intel.com, rjones@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Recently, commit 8b1170012b tweaked the maximum size the block layer
will allow, which in turn affects nbdkit's testsuite of edge-case
behaviors, where Rich noted [1] that our use of double meant rounding
errors that cause spurious failures in qemu-io (among other places).
So I decided to fix that.  In the process, I was reminded that we have
attempted this before, most recently in Dec 2019 [2], where Markus
(rightly, IMHO) said that any approach that tries to reimplement
strtoull() or which compares the amount of data consumed between
strtod() and strtoull() adds more complexity than it solves.

So first, our analysis of what we absolutely need:
- Existing clients expect decimal scaling to work (1M is a lot easier
  to type than 1048576)
- Existing clients expect hex to work (my initial attempt disabled it,
  and promptly hung in iotests when things like 0x10000 got parsed as
  zero rather than their intended byte value) (although our existing
  testsuite coverage was only via iotests, rather than unit tests)
- Existing clients expect sane decimal fractions to work (1.5k is
  easier to type than 1536), although our testsuite coverage of this
  was less apparant
- Existing clients are surprised when something that looks like a byte
  value is truncated or rounded due to an intermediate pass through
  double (hence Rich's bug report)

[1] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg00812.html
[2] https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg00852.html

My solution, instead of parsing twice and picking the longest, is to
always parse the integral portion with strtoull(), then special case
on what is left: if it is 'x' or 'X', the user wanted hex (and does
NOT want a fraction, and in fact we can optionally warn about the use
of scaling suffixes in this case); if it is '.', the user wanted the
convenience of a floating point adjustment which we can do via
strtod() on the suffix (and where we can optionally warn about
fractions that are not evenly divisible into bytes).  I also enhanced
the testsuite (our coverage for hex constants was implicit via
iotests, and now explicit in the unit test; and our testsuite did not
flag the fact that we were previously accepting nonsense like '0x1.8k'
for 1536, or '1.5e1M' for 53477376).

We may decide that one or both of patch 2 and 3 goes too far, which is
why I split them out from the main enhancement.

Eric Blake (3):
  utils: Improve qemu_strtosz() to have 64 bits of precision
  utils: Deprecate hex-with-suffix sizes
  utils: Deprecate inexact fractional suffix sizes

 docs/system/deprecated.rst |  8 ++++
 tests/test-cutils.c        | 83 ++++++++++++++++++++++++++++---------
 tests/test-keyval.c        | 28 +++++++++----
 tests/test-qemu-opts.c     | 24 +++++++----
 util/cutils.c              | 85 +++++++++++++++++++++++++++++---------
 tests/qemu-iotests/049.out |  7 +++-
 6 files changed, 178 insertions(+), 57 deletions(-)

-- 
2.30.0


