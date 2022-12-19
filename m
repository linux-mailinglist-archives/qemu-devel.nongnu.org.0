Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D13651196
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 19:15:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7KeH-0004z3-Ty; Mon, 19 Dec 2022 13:14:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel@holtmann.org>)
 id 1p7KKh-0005wR-5O
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:53:47 -0500
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcel@holtmann.org>) id 1p7KKe-0001bA-C3
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:53:46 -0500
Received: from fedora.. (p4fefcc21.dip0.t-ipconnect.de [79.239.204.33])
 by mail.holtmann.org (Postfix) with ESMTPSA id EBE52CECFC;
 Mon, 19 Dec 2022 18:53:40 +0100 (CET)
From: Marcel Holtmann <marcel@holtmann.org>
To: qemu-devel@nongnu.org,
	mst@redhat.com
Cc: marcel@holtmann.org
Subject: [PATCH 4/7] libvhost-user: Use unsigned int i for some for-loop
 iterations
Date: Mon, 19 Dec 2022 18:53:34 +0100
Message-Id: <20221219175337.377435-5-marcel@holtmann.org>
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
X-Mailman-Approved-At: Mon, 19 Dec 2022 13:14:00 -0500
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

The sign-compare warning also hits some of the for-loops, but it easy
fixed by just making the iterator variable unsigned int.

  CC       libvhost-user.o
libvhost-user.c: In function ‘vu_gpa_to_va’:
libvhost-user.c:223:19: error: comparison of integer expressions of different signedness: ‘int’ and ‘uint32_t’ {aka ‘unsigned int’} [-Werror=sign-compare]
  223 |     for (i = 0; i < dev->nregions; i++) {
      |                   ^

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 subprojects/libvhost-user/libvhost-user.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index bcdf32a24f60..211d31a4cc88 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -192,7 +192,7 @@ vu_panic(VuDev *dev, const char *msg, ...)
 void *
 vu_gpa_to_va(VuDev *dev, uint64_t *plen, uint64_t guest_addr)
 {
-    int i;
+    unsigned int i;
 
     if (*plen == 0) {
         return NULL;
@@ -218,7 +218,7 @@ vu_gpa_to_va(VuDev *dev, uint64_t *plen, uint64_t guest_addr)
 static void *
 qva_to_va(VuDev *dev, uint64_t qemu_addr)
 {
-    int i;
+    unsigned int i;
 
     /* Find matching memory region.  */
     for (i = 0; i < dev->nregions; i++) {
@@ -621,7 +621,7 @@ map_ring(VuDev *dev, VuVirtq *vq)
 
 static bool
 generate_faults(VuDev *dev) {
-    int i;
+    unsigned int i;
     for (i = 0; i < dev->nregions; i++) {
         VuDevRegion *dev_region = &dev->regions[i];
         int ret;
@@ -829,7 +829,7 @@ static inline bool reg_equal(VuDevRegion *vudev_reg,
 static bool
 vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
     VhostUserMemoryRegion m = vmsg->payload.memreg.region, *msg_region = &m;
-    int i;
+    unsigned int i;
     bool found = false;
 
     if (vmsg->fd_num > 1) {
@@ -895,7 +895,7 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
 static bool
 vu_set_mem_table_exec_postcopy(VuDev *dev, VhostUserMsg *vmsg)
 {
-    int i;
+    unsigned int i;
     VhostUserMemory m = vmsg->payload.memory, *memory = &m;
     dev->nregions = memory->nregions;
 
@@ -972,7 +972,7 @@ vu_set_mem_table_exec_postcopy(VuDev *dev, VhostUserMsg *vmsg)
 static bool
 vu_set_mem_table_exec(VuDev *dev, VhostUserMsg *vmsg)
 {
-    int i;
+    unsigned int i;
     VhostUserMemory m = vmsg->payload.memory, *memory = &m;
 
     for (i = 0; i < dev->nregions; i++) {
@@ -1980,7 +1980,7 @@ end:
 void
 vu_deinit(VuDev *dev)
 {
-    int i;
+    unsigned int i;
 
     for (i = 0; i < dev->nregions; i++) {
         VuDevRegion *r = &dev->regions[i];
-- 
2.38.1


