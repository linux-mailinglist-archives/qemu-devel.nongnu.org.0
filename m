Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D14D165476E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 21:43:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8SJQ-0004sj-VH; Thu, 22 Dec 2022 15:37:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel@holtmann.org>)
 id 1p8SJN-0004qF-Fg
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 15:37:05 -0500
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcel@holtmann.org>) id 1p8SJK-0002KV-G5
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 15:37:05 -0500
Received: from fedora.. (p4fefcc21.dip0.t-ipconnect.de [79.239.204.33])
 by mail.holtmann.org (Postfix) with ESMTPSA id 3A0A2CED22;
 Thu, 22 Dec 2022 21:36:56 +0100 (CET)
From: Marcel Holtmann <marcel@holtmann.org>
To: qemu-devel@nongnu.org, mst@redhat.com, xieyongji@bytedance.com,
 pbonzini@redhat.com
Cc: marcel@holtmann.org
Subject: [PATCH v4 00/12] Compiler warning fixes for libvhost-user,libvduse
Date: Thu, 22 Dec 2022 21:36:39 +0100
Message-Id: <cover.1671741278.git.marcel@holtmann.org>
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

The libvhost-user and libvduse libraries are also useful for external
usage outside of QEMU and thus it would be nice if their files could
be just copied and used. However due to different compiler settings, a
lot of manual fixups are needed. This is the first attempt at some
obvious fixes that can be done without any harm to the code and its
readability.

Marcel Holtmann (12):
  libvhost-user: Provide _GNU_SOURCE when compiling outside of QEMU
  libvhost-user: Replace typeof with __typeof__
  libvhost-user: Cast rc variable to avoid compiler warning
  libvhost-user: Use unsigned int i for some for-loop iterations
  libvhost-user: Declare uffdio_register early to make it C90 compliant
  libvhost-user: Change dev->postcopy_ufd assignment to make it C90 compliant
  libvduse: Provide _GNU_SOURCE when compiling outside of QEMU
  libvduse: Switch to unsigned int for inuse field in struct VduseVirtq
  libvduse: Fix assignment in vring_set_avail_event
  libvhost-user: Fix assignment in vring_set_avail_event
  libvhost-user: Add extra compiler warnings
  libvduse: Add extra compiler warnings

 subprojects/libvduse/libvduse.c           |  9 ++++--
 subprojects/libvduse/meson.build          |  8 ++++-
 subprojects/libvhost-user/libvhost-user.c | 36 +++++++++++++----------
 subprojects/libvhost-user/meson.build     |  8 ++++-
 4 files changed, 42 insertions(+), 19 deletions(-)

-- 
2.38.1


