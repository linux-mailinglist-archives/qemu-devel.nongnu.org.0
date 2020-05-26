Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C74A1A4F2B
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Apr 2020 11:33:23 +0200 (CEST)
Received: from localhost ([::1]:50236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jNCVu-0007kq-5Y
	for lists+qemu-devel@lfdr.de; Sat, 11 Apr 2020 05:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39529)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cfontana@suse.de>) id 1jNCUZ-0006rf-7g
 for qemu-devel@nongnu.org; Sat, 11 Apr 2020 05:32:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cfontana@suse.de>) id 1jNCUY-0005nc-3V
 for qemu-devel@nongnu.org; Sat, 11 Apr 2020 05:31:59 -0400
Received: from mx2.suse.de ([195.135.220.15]:41714)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cfontana@suse.de>) id 1jNCUX-0005my-Uf
 for qemu-devel@nongnu.org; Sat, 11 Apr 2020 05:31:58 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 64476AD76;
 Sat, 11 Apr 2020 09:31:55 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Philippe Mathieu-Daude <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH RESEND v3 0/2] Makefile: libfdt: build only the strict
 necessary
Date: Sat, 11 Apr 2020 11:31:48 +0200
Message-Id: <20200411093150.4741-1-cfontana@suse.de>
X-Mailer: git-send-email 2.16.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic]
X-Received-From: 195.135.220.15
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
Cc: Claudio Fontana <cfontana@suse.de>, Alex Bennee <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2 -> v3:

* changed into a 2 patch series; in the second patch we remove the old
  compatibility gunks that were meant for removal some time after 4.1.

* renamed the libfdt PHONY rule to dtc/all, with the intent to make
  existing working trees forward and backward compatible across the change.

v1 -> v2:

* fix error generated when running UNCHECKED_GOALS without prior configure,
  for example during make docker-image-fedora. Without configure, DSOSUF is
  empty, and the module pattern rule in rules.mak that uses this variable
  can match too much; provide a default in the Makefile to avoid it.

* only attempt to build the archive when there is a non-empty list of objects.
  This could be done in general for the %.a: pattern in rules.mak, but maybe
  there are valid reasons to build an empty .a?

* removed some intermediate variables that did not add much value
  (LIBFDT_srcdir, LIBFDT_archive)

Tested locally with 3 VPATH configurations (no-, VPATH, VPATH in src subdir),
and with docker-image-fedora, docker-test-debug@fedora that failed before.

Claudio Fontana (2):
  Makefile: libfdt: build only the strict necessary
  Makefile: remove old compatibility gunks

 Makefile  | 32 ++++++++++++++++----------------
 configure |  6 +-----
 rules.mak |  2 ++
 3 files changed, 19 insertions(+), 21 deletions(-)

-- 
2.16.4


