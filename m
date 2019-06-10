Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA823AD70
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 05:10:39 +0200 (CEST)
Received: from localhost ([::1]:40150 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haAhi-0005Dn-Kw
	for lists+qemu-devel@lfdr.de; Sun, 09 Jun 2019 23:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39006)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1haAgt-0004a9-HB
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 23:09:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1haAgs-0005s2-ND
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 23:09:47 -0400
Received: from mga05.intel.com ([192.55.52.43]:45605)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1haAgs-0005r9-FL
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 23:09:46 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jun 2019 20:09:43 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga005.fm.intel.com with ESMTP; 09 Jun 2019 20:09:42 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon, 10 Jun 2019 11:08:50 +0800
Message-Id: <20190610030852.16039-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.43
Subject: [Qemu-devel] [PATCH 0/2] migration/xbzrle: make
 xbzrle_encode_buffer little easier
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
Cc: Wei Yang <richardw.yang@linux.intel.com>, dgilbert@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Current xbzrle_encode_buffer() do everything in a big loop, which is a little
difficult for audience to catch the logic.

We can refine the logic with:

  * get the length of a run
  * encode it

At the same time, I found the encoding and decoding function has some extra
pointer operation. Removing this could save some code space.

Wei Yang (2):
  cutils: remove one unnecessary pointer operation
  migration/xbzrle: make xbzrle_encode_buffer little easier to read

 migration/xbzrle.c | 153 +++++++++++++++++++++------------------------
 util/cutils.c      |   8 +--
 2 files changed, 77 insertions(+), 84 deletions(-)

-- 
2.19.1


