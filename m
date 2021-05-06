Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86908375502
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 15:43:31 +0200 (CEST)
Received: from localhost ([::1]:34618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leeHq-0004bN-Kg
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 09:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leeD0-0007UE-9T
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:38:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leeCy-0007rr-BP
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:38:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620308307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B3vDcPc2Lwo5z0s8ItWutJUQDssHj4SCpM1PcCRAn5U=;
 b=QRau2uHS6G+HWVTwmcDOgVnRuVh3MkMaP2cYoeOnezZG8xw6K5TwSN4n4uLMsAtuWe7x6y
 OVbGWnk3NbBR+1aompcBchjeJ8nAtI25UpR/fYlEPHXwIhxad7WuoUfIf5Vd77yV+gJce6
 CkEnqrYkWeCNuMJBzkDSftPQ5JazNS8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-kIkI6PSPNHaNMZEx6gGWaA-1; Thu, 06 May 2021 09:38:26 -0400
X-MC-Unique: kIkI6PSPNHaNMZEx6gGWaA-1
Received: by mail-wr1-f69.google.com with SMTP id
 i102-20020adf90ef0000b029010dfcfc46c0so2232385wri.1
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 06:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B3vDcPc2Lwo5z0s8ItWutJUQDssHj4SCpM1PcCRAn5U=;
 b=Z1wKnOFRGUt+ER6Xef32NCakep9b1xAknPXnHpGVCrw+RHNj+0rRYIOwumJkwpTUZU
 76GMy6xfxhe79xInvAxOulX/mBdbCbLUyj6yICXj3EcyhVRpVzgO8jcJW9mXzheYvSXb
 6r8ATvfIMIeHyzkZusIHyXUd4Rx/LWUS1y9mQPgdrcTBUNHK3X3mu8csrFw14Me2qcm+
 UYnxblQzNqPrfYlEeh6omE6w1GlMgVyZLpuhtIKIt31gHr0itAB/4agXY/4cVjPLl47g
 yTbhjLrUqV0aDWQbwrtkrlVZLOp3Ql8OPVVQosxsap86dQSjBnLij8U6xpe6/tDKFTvB
 ExCQ==
X-Gm-Message-State: AOAM532+60jUwMR1+ElB321CtuunO6pQGnHfkeO3VBQYRd8DiDNdGYky
 Lc8wSMk/oe7Xy6aB1RZZveYVICh5YEBbmzxcMjOLTNEnTejYWpBPnu0giL+mV7b+eoWu/HgnEeW
 EarcUYiCmC41Z+fHFIWt8BTe9eJdGltPNUIwhTy+fd7Zc+AFu7JDX0FkHSUoyZPEt
X-Received: by 2002:a5d:48c3:: with SMTP id p3mr4659230wrs.150.1620308304670; 
 Thu, 06 May 2021 06:38:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwECKu/BlFqjZgy5iMIlrOtoOiBjrMgG2/qWWwpALxiW11/+mDQsXIqidjTaJhIgu3oXy9nPg==
X-Received: by 2002:a5d:48c3:: with SMTP id p3mr4659202wrs.150.1620308304482; 
 Thu, 06 May 2021 06:38:24 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id c15sm4424312wrr.3.2021.05.06.06.38.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 06:38:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/9] gdbstub: Constify GdbCmdParseEntry
Date: Thu,  6 May 2021 15:37:54 +0200
Message-Id: <20210506133758.1749233-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210506133758.1749233-1-philmd@redhat.com>
References: <20210506133758.1749233-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 gdbstub.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 9103ffc9028..83d47c67325 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1981,7 +1981,7 @@ static void handle_v_kill(GdbCmdContext *gdb_ctx, void *user_ctx)
     exit(0);
 }
 
-static GdbCmdParseEntry gdb_v_commands_table[] = {
+static const GdbCmdParseEntry gdb_v_commands_table[] = {
     /* Order is important if has same prefix */
     {
         .handler = handle_v_cont_query,
@@ -2324,7 +2324,7 @@ static void handle_set_qemu_phy_mem_mode(GdbCmdContext *gdb_ctx, void *user_ctx)
 }
 #endif
 
-static GdbCmdParseEntry gdb_gen_query_set_common_table[] = {
+static const GdbCmdParseEntry gdb_gen_query_set_common_table[] = {
     /* Order is important if has same prefix */
     {
         .handler = handle_query_qemu_sstepbits,
@@ -2342,7 +2342,7 @@ static GdbCmdParseEntry gdb_gen_query_set_common_table[] = {
     },
 };
 
-static GdbCmdParseEntry gdb_gen_query_table[] = {
+static const GdbCmdParseEntry gdb_gen_query_table[] = {
     {
         .handler = handle_query_curr_tid,
         .cmd = "C",
@@ -2420,7 +2420,7 @@ static GdbCmdParseEntry gdb_gen_query_table[] = {
 #endif
 };
 
-static GdbCmdParseEntry gdb_gen_set_table[] = {
+static const GdbCmdParseEntry gdb_gen_set_table[] = {
     /* Order is important if has same prefix */
     {
         .handler = handle_set_qemu_sstep,
-- 
2.26.3


