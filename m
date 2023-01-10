Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9227C66471A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 18:15:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFH6b-0003Yk-Ai; Tue, 10 Jan 2023 11:04:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH63-0003Et-1o
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH61-000547-F3
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673366608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FGj8IQlWpv2y2riqIaJ8PdXei8fcGgNZRSbE0ZwjN10=;
 b=esbhnjkuO5Jh0oMtQOnCapMLUys+Q6hbqfA/ALZ4Kxl2o6pyaQGBEYJK1Xk5w+Agd2+r0k
 HN5C3erCe62rFsv/JaGKUouRxt2UHwnVYnJm/SX0DBYJlJR5WR2WGco3CC/VLLeDRhFcg9
 /uuxsSlnBHyn/AgMBZeC97CW6ollQB0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-146-wYvUS1b5MEiABeBcirTl9A-1; Tue, 10 Jan 2023 11:03:27 -0500
X-MC-Unique: wYvUS1b5MEiABeBcirTl9A-1
Received: by mail-wm1-f69.google.com with SMTP id
 q21-20020a7bce95000000b003d236c91639so2673333wmj.8
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:03:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FGj8IQlWpv2y2riqIaJ8PdXei8fcGgNZRSbE0ZwjN10=;
 b=l6s6WG9CgdsAtxCVTudfvUNLZl3usVzOJjjCX1o22CP8tgpK1xkjuvNuwWl6heTAEs
 SIbmKpFDdvZF5fIX92nLVfbJ7qrZVieN9MH+OrS3KCSeQaWnTdUTZdYOkST5qb5/joxr
 8yJEjCnSYvZk3HIh5unSigHY4H5HDFNbM0dTtINyrqEUSxh2z0HtyxZL0VZOCvhclddZ
 ZaBezmbDswQvyQGNaxR0F9fFWgLLMbMPNbkU/ypmt68/RPZa6Qs77jMSMdOxIUMeGqHz
 W2HEqwNZ+rO/7z9LPbUkV4zjFDQr/l/YuiOxZ6K6ZxORTvhXcquHcq3gciibBK2rq+nO
 vYGQ==
X-Gm-Message-State: AFqh2kr7+t0xH3LN5u9llzcneDfzSMebEwjUPTIziKbm2SUxpCnjtz+d
 wYYXLTu7DEuIag/jF3edIfBgXVeUwry7A/74gSD5klNWySwPxdaSBsVWLsI4hmqb9fjDEAYScpt
 Qp+sawA/dmpado+XtbkwqMm59XQG7De6bMmJ7h+6r+hul+ZqOiw7tesLx8ezrYoca5To=
X-Received: by 2002:a05:600c:3592:b0:3d1:ebdf:d58b with SMTP id
 p18-20020a05600c359200b003d1ebdfd58bmr49756979wmq.5.1673366605656; 
 Tue, 10 Jan 2023 08:03:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsKA3h3yds65bpQNNOB6GKVjGPvXJTALDWMcFuNzNteJfobHtk6rW7ADD3A1Lw9O1Ss0e2Zxw==
X-Received: by 2002:a05:600c:3592:b0:3d1:ebdf:d58b with SMTP id
 p18-20020a05600c359200b003d1ebdfd58bmr49756946wmq.5.1673366605355; 
 Tue, 10 Jan 2023 08:03:25 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a1ce901000000b003b3307fb98fsm14870344wmc.24.2023.01.10.08.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:03:24 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Holtmann <marcel@holtmann.org>
Subject: [PULL 19/29] libvhost-user: Use unsigned int i for some for-loop
 iterations
Date: Tue, 10 Jan 2023 17:02:23 +0100
Message-Id: <20230110160233.339771-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110160233.339771-1-pbonzini@redhat.com>
References: <20230110160233.339771-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Marcel Holtmann <marcel@holtmann.org>

The sign-compare warning also hits some of the for-loops, but it easy
fixed by just making the iterator variable unsigned int.

  CC       libvhost-user.o
libvhost-user.c: In function ‘vu_gpa_to_va’:
libvhost-user.c:223:19: error: comparison of integer expressions of different signedness: ‘int’ and ‘uint32_t’ {aka ‘unsigned int’} [-Werror=sign-compare]
  223 |     for (i = 0; i < dev->nregions; i++) {
      |                   ^

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Message-Id: <decb925e1a6fb9538738d2570bda2804f888fa15.1671741278.git.marcel@holtmann.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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


