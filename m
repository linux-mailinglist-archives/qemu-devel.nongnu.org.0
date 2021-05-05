Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD2E37434E
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 19:06:16 +0200 (CEST)
Received: from localhost ([::1]:44314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leKyV-00013R-BS
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 13:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leKtj-00065F-Kh
 for qemu-devel@nongnu.org; Wed, 05 May 2021 13:01:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leKte-0002OK-S6
 for qemu-devel@nongnu.org; Wed, 05 May 2021 13:01:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620234070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KVr/YKk8ykCSG/NDL+d/fpooQDX6C5X50bcflqdu8o0=;
 b=Js74FL7moJ3MgDx64Foxtsir6C15xGCN67AnLtuRhbMUSwVYmRE0PhOnKbjDZ2YInTS8Cr
 gPgQcp7fRp9ojLV2QYj41LroZ0v6/QDznGoNtsCSwVtUdoV5vZ56uiYeGew8X68sWwJiZj
 WvPzKaUr1bOZ/CCXWC9T/oQdKc7px/Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-Z_j6NUYIO2yehnZim26aYQ-1; Wed, 05 May 2021 13:01:08 -0400
X-MC-Unique: Z_j6NUYIO2yehnZim26aYQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 n24-20020a7bcbd80000b029014287841063so526933wmi.3
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 10:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KVr/YKk8ykCSG/NDL+d/fpooQDX6C5X50bcflqdu8o0=;
 b=Mwlj797q29Cy/rU3OVWFkVAC97feXUMhvnICEHQAWodO1Du3DiDliz6Uwr4DLDEg3r
 /VqnRIM9thqESycrdGdxTEa0BILzdVlMxvXE/4D/2yn/DEL0C2hqrUBi3YKg/hJwAMV6
 cFQ7B3GUeH4Ot4xjiR4K4Z21fnuCe/melzzTtUP35/GrWknslNrGVl6NzALrDVR6Z/R4
 rmTV/J+RxOcBkU6TDMdTidioUMJ3BlWAerW5dmt9rYRiRTDusVdcLuUrMvJGobVFsSh9
 KB7ktZrPy2E3DfRSqPUc+50hNx2PRV8VDwc01TI+CzrjKbbz4UDVqGEdXwBXqlEeREOZ
 Nd9Q==
X-Gm-Message-State: AOAM53378FZFVJbYW81f2ncE7Q3JhYoSvFYOHUsI8uVpGTIFaVD0b2mC
 d6ibyTp6299QjgvQaoAj4zNyM6a6nymZXR2vN9lt46PO0mk0tU8PDgOOvuUj1HmLMHkuWRLZ7kO
 jxXOrHgSjfK3S4x5OcQsZbUDacu9Sn2doGyHjNT3HmpoFTJaQq2OlA0L+cBAroNzn
X-Received: by 2002:a7b:c4c9:: with SMTP id g9mr10881028wmk.90.1620234067014; 
 Wed, 05 May 2021 10:01:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMNW3ne0tCY2PAFqneUiO3IIV1h5h3tf9MgcewGFxLZtCnjm1YBJggkTc+aanCQig7UykaUg==
X-Received: by 2002:a7b:c4c9:: with SMTP id g9mr10880998wmk.90.1620234066819; 
 Wed, 05 May 2021 10:01:06 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id l12sm20040231wrm.76.2021.05.05.10.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 10:01:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] gdbstub: Constify GdbCmdParseEntry
Date: Wed,  5 May 2021 19:00:52 +0200
Message-Id: <20210505170055.1415360-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505170055.1415360-1-philmd@redhat.com>
References: <20210505170055.1415360-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Warner Losh <imp@bsdimp.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 gdbstub.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 054665e93ea..6f663cbd8dd 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1982,7 +1982,7 @@ static void handle_v_kill(GdbCmdContext *gdb_ctx, void *user_ctx)
     exit(0);
 }
 
-static GdbCmdParseEntry gdb_v_commands_table[] = {
+static const GdbCmdParseEntry gdb_v_commands_table[] = {
     /* Order is important if has same prefix */
     {
         .handler = handle_v_cont_query,
@@ -2325,7 +2325,7 @@ static void handle_set_qemu_phy_mem_mode(GdbCmdContext *gdb_ctx, void *user_ctx)
 }
 #endif
 
-static GdbCmdParseEntry gdb_gen_query_set_common_table[] = {
+static const GdbCmdParseEntry gdb_gen_query_set_common_table[] = {
     /* Order is important if has same prefix */
     {
         .handler = handle_query_qemu_sstepbits,
@@ -2343,7 +2343,7 @@ static GdbCmdParseEntry gdb_gen_query_set_common_table[] = {
     },
 };
 
-static GdbCmdParseEntry gdb_gen_query_table[] = {
+static const GdbCmdParseEntry gdb_gen_query_table[] = {
     {
         .handler = handle_query_curr_tid,
         .cmd = "C",
@@ -2421,7 +2421,7 @@ static GdbCmdParseEntry gdb_gen_query_table[] = {
 #endif
 };
 
-static GdbCmdParseEntry gdb_gen_set_table[] = {
+static const GdbCmdParseEntry gdb_gen_set_table[] = {
     /* Order is important if has same prefix */
     {
         .handler = handle_set_qemu_sstep,
-- 
2.26.3


