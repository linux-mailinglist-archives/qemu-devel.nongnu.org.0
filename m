Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E0E68F44D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 18:21:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPo7G-00045H-46; Wed, 08 Feb 2023 12:20:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPo71-0003hP-0N
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:20:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPo6y-0000r1-Vz
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:20:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675876800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eErj71CMpZpTAVb4OGeJIVbpHzfh0RDDmrrDw4l1jN4=;
 b=QbogTepW2P9mGqtVI+0N856t0odCYCApesl6StzjvxW71Z7ibBd3nADkQDrVid7GzGvdL8
 V/7hNbr0yXTzn/9KIF+p6jXcV6prq7N03Wy7w3VhV+C+Er8EhpnlCSc2UDqaT7QKVSXdOC
 gYiahbOKYftQvJHcvemW0LhlY6IvAQU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-364-c2tV45HONFG7h8r8jiecUQ-1; Wed, 08 Feb 2023 12:19:59 -0500
X-MC-Unique: c2tV45HONFG7h8r8jiecUQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 fd23-20020a056402389700b004aaa054d189so8303165edb.11
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 09:19:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eErj71CMpZpTAVb4OGeJIVbpHzfh0RDDmrrDw4l1jN4=;
 b=b9WUQrKQChdYmgRCcWPW+B61YIjZ/S7Bi1j+OQFAIhyey/Z3uG3KfBrmNMjeRR560O
 /UlHW7JlfX7HYBbF7X8d8cV8UAnetX+QttidgkKMUr8K/i5vot85FNs4cNbK3NKq5QuL
 CKJVCO8h96BIsLcCw/+DyRTcAbjCFq/b6kCFlgw7FfEgFJurhpUDZFjpAs1I/Nujbf9I
 mwz7Xm+RhXVl3zh4VvkNLBbzERRSaPu9wk1JmN5RGRXr2nUDb0MU26ufi/FvdZWgTZc0
 I6wxppyJD/Zat4Zk8P+ZwtelMF/3YkFXYNuB3OSNRrA9Nhtu7G2/VOD+WTR/uayXwDjp
 nFAg==
X-Gm-Message-State: AO0yUKXtaGlIsl6AA+Sr9pAJp3HMoKDIHNSDKs+TVGcga3HbtNKS0c5E
 eLvMHa1IZmLxEzrDuJoUWQAiYybaOOioLLPfHoUW2U/z6/gs1umZZOdC/7PFNcO0vTJreWIfKTt
 IlFg/6v3S4+i0XCV6xlTRefCK1I6CGie8qnY+16+B5y3O+Wom92puhR1/4lGnTG7CgLQufn8e
X-Received: by 2002:a17:906:2603:b0:862:11f6:a082 with SMTP id
 h3-20020a170906260300b0086211f6a082mr8107916ejc.17.1675876796945; 
 Wed, 08 Feb 2023 09:19:56 -0800 (PST)
X-Google-Smtp-Source: AK7set/xRA15pD0vGoUlxjQMcLufpKErwtsjY3rrOvY1FtKlqgVZXZ49n3w2h/Vl3NB94zp++uffKw==
X-Received: by 2002:a17:906:2603:b0:862:11f6:a082 with SMTP id
 h3-20020a170906260300b0086211f6a082mr8107901ejc.17.1675876796750; 
 Wed, 08 Feb 2023 09:19:56 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a170906158700b0088385cd6166sm8578995ejd.195.2023.02.08.09.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 09:19:56 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	qemu-stable@nongnu.org
Subject: [PULL 10/11] target/i386: Fix C flag for BLSI, BLSMSK, BLSR
Date: Wed,  8 Feb 2023 18:19:21 +0100
Message-Id: <20230208171922.95048-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208171922.95048-1-pbonzini@redhat.com>
References: <20230208171922.95048-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Richard Henderson <richard.henderson@linaro.org>

We forgot to set cc_src, which is used for computing C.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1370
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230114180601.2993644-1-richard.henderson@linaro.org>
Cc: qemu-stable@nongnu.org
Fixes: 1d0b926150e5 ("target/i386: move scalar 0F 38 and 0F 3A instruction to new decoder", 2022-10-18)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/emit.c.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 99f6ba6e19a2..4d7702c106bf 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -1111,6 +1111,7 @@ static void gen_BLSI(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[0].ot;
 
+    tcg_gen_mov_tl(cpu_cc_src, s->T0);
     tcg_gen_neg_tl(s->T1, s->T0);
     tcg_gen_and_tl(s->T0, s->T0, s->T1);
     tcg_gen_mov_tl(cpu_cc_dst, s->T0);
@@ -1121,6 +1122,7 @@ static void gen_BLSMSK(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode
 {
     MemOp ot = decode->op[0].ot;
 
+    tcg_gen_mov_tl(cpu_cc_src, s->T0);
     tcg_gen_subi_tl(s->T1, s->T0, 1);
     tcg_gen_xor_tl(s->T0, s->T0, s->T1);
     tcg_gen_mov_tl(cpu_cc_dst, s->T0);
@@ -1131,6 +1133,7 @@ static void gen_BLSR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[0].ot;
 
+    tcg_gen_mov_tl(cpu_cc_src, s->T0);
     tcg_gen_subi_tl(s->T1, s->T0, 1);
     tcg_gen_and_tl(s->T0, s->T0, s->T1);
     tcg_gen_mov_tl(cpu_cc_dst, s->T0);
-- 
2.39.1


