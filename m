Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CDA6FC24D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 11:06:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwJHQ-0005E9-Fb; Tue, 09 May 2023 05:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHP-0005E0-32
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHN-0004tZ-BF
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683623104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2AXNk+ndwJjysIemRlvuC+YOxR25apRxDcvjMuMZg/k=;
 b=X9yC+E26zlozM/+EJRPxPR4MaenMcV1vubD86zGZRAk7bFP3VXC16/DMIfsPlOT1INMSPf
 jAY4kOf44hDE8u8GFabFi/iOn0mBRlFpd9BPXio5EotxtHdNlq8S8QT1kUHucc7Y4ZJi0Z
 z1AaWT8lliw31q+T0Ln9PvJD6STFZRQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-KxSB7CSOPmu67gB9uvxGeQ-1; Tue, 09 May 2023 05:05:03 -0400
X-MC-Unique: KxSB7CSOPmu67gB9uvxGeQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-94a348facbbso691896066b.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 02:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683623101; x=1686215101;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2AXNk+ndwJjysIemRlvuC+YOxR25apRxDcvjMuMZg/k=;
 b=LJ40nZYbE1k8c2HVT449JTdaY3SKIDzU6LDsYMBylrxcI8vIh+viHCxU3M6/cIzR2g
 MMn6uOKOAd7kO3LGBt8BzNnAYraeVzhbJ6/r7gIxrQk7zxQCIxywmDUvzfLxnGQHc2xR
 W7Y8JBtrzD38jSvaCNbEcRLDrqjL7S/CCj8pZdN8o3xrOh+KYT10FwiY1yeje8hAUHy7
 5iW9CUVxUIaqpg8C5hoGIaxbZ3DsU6KZYZCsIjXoPkue3m6LYeuvvOvCtdB0BQHyozcy
 +y++273Mkdt4wiI6gUaM0bda75dppQ7RZojVC/RA+Ff7gvTnh6XpB2kUkqV7NbpepkWj
 nWtA==
X-Gm-Message-State: AC+VfDzZKvC7dIvs6Lb4sW+2g2DKrgxMP2WTaAPZ2MDvDFKd7bV1SXCC
 F1yNIXGtr80xu0VnOe2fMYygKSMc5v3OyLYLHd790ycYK4QiJ180oP8A8Yzp5WP/sRlJau4uAjV
 +/CsXXbPbS4rPIFNRnlLPb29yICeIEj+FCDTCHbI7FPNTj39cVd5K3V6925/tNlt5kC+roMb/Vs
 Y=
X-Received: by 2002:a17:907:d91:b0:933:4d37:82b2 with SMTP id
 go17-20020a1709070d9100b009334d3782b2mr11763681ejc.57.1683623101695; 
 Tue, 09 May 2023 02:05:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5QxyHyTj3d0VhcgPnV6Ga4cbJ3JMigAgHDfztaQJjsipwsvbRkLkw1qZlhkXTKqafYXc9BHQ==
X-Received: by 2002:a17:907:d91:b0:933:4d37:82b2 with SMTP id
 go17-20020a1709070d9100b009334d3782b2mr11763668ejc.57.1683623101433; 
 Tue, 09 May 2023 02:05:01 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a170906055500b009584c5bcbc7sm1048636eja.49.2023.05.09.02.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 02:05:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 02/16] test-aio-multithread: do not use mb_read/mb_set for
 simple flags
Date: Tue,  9 May 2023 11:04:39 +0200
Message-Id: <20230509090453.37884-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509090453.37884-1-pbonzini@redhat.com>
References: <20230509090453.37884-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The remaining use of mb_read/mb_set is just to force a thread to exit
eventually.  It does not order two memory accesses and therefore can be
just read/set.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/test-aio-multithread.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/unit/test-aio-multithread.c b/tests/unit/test-aio-multithread.c
index a555cc883505..3c61526a0b46 100644
--- a/tests/unit/test-aio-multithread.c
+++ b/tests/unit/test-aio-multithread.c
@@ -202,7 +202,7 @@ static CoMutex comutex;
 
 static void coroutine_fn test_multi_co_mutex_entry(void *opaque)
 {
-    while (!qatomic_mb_read(&now_stopping)) {
+    while (!qatomic_read(&now_stopping)) {
         qemu_co_mutex_lock(&comutex);
         counter++;
         qemu_co_mutex_unlock(&comutex);
@@ -236,7 +236,7 @@ static void test_multi_co_mutex(int threads, int seconds)
 
     g_usleep(seconds * 1000000);
 
-    qatomic_mb_set(&now_stopping, true);
+    qatomic_set(&now_stopping, true);
     while (running > 0) {
         g_usleep(100000);
     }
@@ -327,7 +327,7 @@ static void mcs_mutex_unlock(void)
 
 static void test_multi_fair_mutex_entry(void *opaque)
 {
-    while (!qatomic_mb_read(&now_stopping)) {
+    while (!qatomic_read(&now_stopping)) {
         mcs_mutex_lock();
         counter++;
         mcs_mutex_unlock();
@@ -355,7 +355,7 @@ static void test_multi_fair_mutex(int threads, int seconds)
 
     g_usleep(seconds * 1000000);
 
-    qatomic_mb_set(&now_stopping, true);
+    qatomic_set(&now_stopping, true);
     while (running > 0) {
         g_usleep(100000);
     }
@@ -383,7 +383,7 @@ static QemuMutex mutex;
 
 static void test_multi_mutex_entry(void *opaque)
 {
-    while (!qatomic_mb_read(&now_stopping)) {
+    while (!qatomic_read(&now_stopping)) {
         qemu_mutex_lock(&mutex);
         counter++;
         qemu_mutex_unlock(&mutex);
@@ -411,7 +411,7 @@ static void test_multi_mutex(int threads, int seconds)
 
     g_usleep(seconds * 1000000);
 
-    qatomic_mb_set(&now_stopping, true);
+    qatomic_set(&now_stopping, true);
     while (running > 0) {
         g_usleep(100000);
     }
-- 
2.40.1


