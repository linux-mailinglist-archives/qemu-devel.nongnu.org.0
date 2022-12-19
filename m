Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 272F06511A0
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 19:16:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7KeG-0004vu-8g; Mon, 19 Dec 2022 13:14:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel@holtmann.org>)
 id 1p7KKf-0005vb-UW
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:53:45 -0500
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcel@holtmann.org>) id 1p7KKd-0001ac-LE
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:53:45 -0500
Received: from fedora.. (p4fefcc21.dip0.t-ipconnect.de [79.239.204.33])
 by mail.holtmann.org (Postfix) with ESMTPSA id 1B76CCECF6;
 Mon, 19 Dec 2022 18:53:40 +0100 (CET)
From: Marcel Holtmann <marcel@holtmann.org>
To: qemu-devel@nongnu.org,
	mst@redhat.com
Cc: marcel@holtmann.org
Subject: [PATCH 0/7] Various compiler warning fixes for libvhost-user 
Date: Mon, 19 Dec 2022 18:53:30 +0100
Message-Id: <20221219175337.377435-1-marcel@holtmann.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=212.227.132.17; envelope-from=marcel@holtmann.org;
 helo=mail.holtmann.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 19 Dec 2022 13:13:57 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The libvhost-user library is also useful for external usage outside of
QEMU and thus it would be nice if the two files libvhost-user.[ch] could
be just copied and used. However due to different compiler settings, a
lot of manual fixups are needed. This is the first attempt at some
obvious fixes that can be done without any harm to the code and its
readabilty.

Marcel Holtmann (7):
  libvhost-user: Provide _GNU_SOURCE when compiling outside of QEMU
  libvhost-user: Replace typeof with __typeof__
  libvhost-user: Cast rc variable to avoid compiler warning
  libvhost-user: Use unsigned int i for some for-loop iterations
  libvhost-user: Declare uffdio_register early to make it C90 compliant
  libvhost-user: Change dev->postcopy_ufd assignment to make it C90 compliant
  libvhost-user: Switch to unsigned int for inuse field in struct VuVirtq

 subprojects/libvhost-user/libvhost-user.c | 31 ++++++++++++++---------
 subprojects/libvhost-user/libvhost-user.h |  2 +-
 2 files changed, 20 insertions(+), 13 deletions(-)

-- 
2.38.1


