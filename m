Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2E639BBC0
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 17:24:20 +0200 (CEST)
Received: from localhost ([::1]:45954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpBgJ-000855-K4
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 11:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lpBa6-0007oP-Su
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:17:54 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:43802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lpBa5-0008El-Dq
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:17:54 -0400
Received: by mail-ej1-x62d.google.com with SMTP id ci15so15031781ejc.10
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eiNYKdEymzNvK37Wm5/uHgaRQxlBgWOvTJMeH6EfWJI=;
 b=Mnfbe1FkriWov1Ka8xnjxJj5CwAJvdA3lMd4lk+RQZVjt427WzOWohp+93aQZVMjhG
 3ihVQXCpujK6FJtQLlpMuUoCV0DbHw7u1g3nIlXEQxbLgfDWFpOryzQg5Wuup4CmNDfz
 ZRDo4HU9sG/DYk06tcT5MGPcjjxr2PAJyr0RzxngL+oA3kWXNYqPwmaevl2yUSyciS+B
 tIcLAp+GYv4r16d0XdIpg6vDZxvbTk9QAsFRhOqkAd3cQnHELWA+qi1ekHWoaj/Sdte7
 ck8wZnyofH8Mt1r0E7zbpWBAI5C84XhtqOe8pzOHphzkJqqH1RILqtPMBcADXgIMpvjG
 U8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eiNYKdEymzNvK37Wm5/uHgaRQxlBgWOvTJMeH6EfWJI=;
 b=BrAuv/qwRRRYR/GXWgKJWNZAgDHj4iRImefjjmt7ayK6s9IZdbGog/6iQ9WlH/9Rfr
 82rqZowyQ1/rgyC6bFm8F0O3w7bpQjuxE1kas0oYonicZQBpV2P/9AeTqKHjmoFeOc5D
 pszZvKN+RYduIPRp1l1b9oOhkeKoax1acgLNDYNgxzgVvG5wTke4us1G84+yyhWfZo+Q
 ev0cQrLAmcAITQM7AmfWJOpO2CTBKQ/KpVn3XEzN3IHejII3d0QoIyHNu155yLCJu1Uk
 Nif3D+nrl9d5RgEkvEuXsHNadP9fHC4+1IAYo9418HttWJeppx3NXBx7iAK1qNVJK5i3
 1TRA==
X-Gm-Message-State: AOAM531GynYSUnElr+R5vDzExxXENprVNtkH6w+T3D9eGr5BTh+hxXAF
 TwcK2ao5y2hTTbjkK4rZUNEF4wjpHdX/jQ==
X-Google-Smtp-Source: ABdhPJzbbQyCpsNl2I5XmdeRjllnXXlSO+RxVoH0ka1Ott/ZWCINp7jPvJ/ctjPk46wp0UPFMChn1w==
X-Received: by 2002:a17:906:606:: with SMTP id
 s6mr4602330ejb.206.1622819871768; 
 Fri, 04 Jun 2021 08:17:51 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 w1sm2402451eds.37.2021.06.04.08.17.51 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:17:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/13] target/i386: tcg: fix switching from 16-bit to 32-bit
 tasks or vice versa
Date: Fri,  4 Jun 2021 17:17:38 +0200
Message-Id: <20210604151745.310318-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604151745.310318-1-pbonzini@redhat.com>
References: <20210604151745.310318-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The format of the task state segment is governed by bit 3 in the
descriptor type field.  On a task switch, the format for saving
is given by the current value of TR's type field, while the
format for loading is given by the new descriptor.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/seg_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index 2112c5fc51..3ed20ca31d 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -319,7 +319,7 @@ static void switch_tss_ra(CPUX86State *env, int tss_selector,
     }
 
     /* save the current state in the old TSS */
-    if (type & 8) {
+    if (old_type & 8) {
         /* 32 bit */
         cpu_stl_kernel_ra(env, env->tr.base + 0x20, next_eip, retaddr);
         cpu_stl_kernel_ra(env, env->tr.base + 0x24, old_eflags, retaddr);
-- 
2.31.1



