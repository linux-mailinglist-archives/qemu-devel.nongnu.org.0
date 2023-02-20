Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 717A069D31E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:48:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUB8f-0008HS-53; Mon, 20 Feb 2023 13:43:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6b-0004d0-K9
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:47 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6R-0004BE-Rs
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:38 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 i1-20020a17090ad34100b00234463de251so2214007pjx.3
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WCjjPlh2Wg57tPbIo2qksXSfr4SotDLh83V8udd4S54=;
 b=jI7oWeaJbeSTa9/qxMhgY52PL15v4f2JA58VUNez8w3p0TumAfvpqK8oX2UiwUEl0b
 Yi691zWRjvSri9ITEkwgIzqDNo9OyN0aXMbrtV8KPEje3aS84gZGKZjRr0uujms2Wf+i
 NvW46xXBqusPluBLf+RX43ZlfyihQN0IYyKQcH4wQmX3BzKPrFNX7CLktwGMRl8pYaze
 0/CjGJFJpcLN9aqtwpISJ207BeyYrpgDWOWBLIuroy3+qJKgzN5reXI112eFmA5hgtjA
 MeO5j4NxdhrqXox0PaF/0/qbEx9tnvzmJTk9ob/IMtCvlax14DM5fyo8Q79aqFcIeBie
 mPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WCjjPlh2Wg57tPbIo2qksXSfr4SotDLh83V8udd4S54=;
 b=d4SImgjiFNLC7FQpwFMcew326MUNd80SisuVSpwlssCruK450Ms/R25y2yEU1Vc0e6
 5K0OjjwJFgXc+W3mit2ZCCbvF5zdI6tYDxF/Wvjw+lwzXZ4gZnEhxTskDJtQyQgTfoYS
 2YsjXEiefTHNfkCUx6rrJIcY8T7fS9p1i7RMIxidU2T78Q1Mh8HQsVfL8GIn2daD5CWX
 SHPZOXiHxxbdGFt5yCSgHsc804so1rM6FyTsAc1zSLmeUzkbhdaiZpM1/CKzLzQ7hck0
 5GCfdCacOJzeQTquA3/VGdm8BmRezIVsCfg5SP0o2tlYoXzWxEsQos5l5WSTmCdtl8PI
 vl7g==
X-Gm-Message-State: AO0yUKUyXEHGKHpwWSxKI4eLSki2mQXoHM4HdKYE6cySorBS6HrAwZTj
 35Y2tH7KcIl8s7Lx1n3HGr28yduKbfvifc4LHlQ=
X-Google-Smtp-Source: AK7set87ZP0LRQqKxYE1NCsWXmmSqvCZ4DMfcTM9/4kK64XkxO3tbbwLEqptrywb/y3O6UjWDWzcAA==
X-Received: by 2002:a17:903:283:b0:19a:a2e7:64c3 with SMTP id
 j3-20020a170903028300b0019aa2e764c3mr3816882plr.68.1676918488720; 
 Mon, 20 Feb 2023 10:41:28 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jk20-20020a170903331400b0019258bcf3ffsm1911676plb.56.2023.02.20.10.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 10:41:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 18/27] target/s390x: Disable conditional branch-to-next for
 PER
Date: Mon, 20 Feb 2023 08:40:43 -1000
Message-Id: <20230220184052.163465-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220184052.163465-1-richard.henderson@linaro.org>
References: <20230220184052.163465-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

For PER, we require a conditional call to helper_per_branch
for the conditional branch.  Fold the remaining optimization
into a call to helper_goto_direct, which will take care of
the remaining gbea adjustment.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 433703b4c9..6757a0f44f 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1219,13 +1219,12 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
         goto egress;
     }
     if (is_imm) {
-        if (disp == s->ilen) {
-            /* Branch to next.  */
-            per_branch(s, true);
-            ret = DISAS_NEXT;
-            goto egress;
-        }
-        if (c->cond == TCG_COND_ALWAYS) {
+        /*
+         * Do not optimize a conditional branch if PER enabled, because we
+         * still need a conditional call to helper_per_branch.
+         */
+        if (c->cond == TCG_COND_ALWAYS
+            || (disp == s->ilen && !per_enabled(s))) {
             ret = help_goto_direct(s, disp);
             goto egress;
         }
-- 
2.34.1


