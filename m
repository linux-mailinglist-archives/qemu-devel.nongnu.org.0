Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8414E3541
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 01:08:20 +0100 (CET)
Received: from localhost ([::1]:45138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWS4Q-0002yg-Vg
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 20:08:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nWS1R-0007r2-2P; Mon, 21 Mar 2022 20:05:14 -0400
Received: from [2607:f8b0:4864:20::836] (port=45843
 helo=mail-qt1-x836.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nWS1M-0007TD-LK; Mon, 21 Mar 2022 20:05:12 -0400
Received: by mail-qt1-x836.google.com with SMTP id a11so9388535qtb.12;
 Mon, 21 Mar 2022 17:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jr6FBxrLKQUy/lKQ2PBSchzr+Vj1K463klE6EbOiyGk=;
 b=NLzwWjTGN1N3Weob5IC8YaMioCi9WGL6UYG3rj9cRg8oFUQLy97rCc7xitlTOx0nTB
 iWYc1/dI7DLaTwpBx2Rfgsb3xCIXAYgvjnjM6Pe1bLY4TV/ZswGdr57Y9LGcgdJi2Zcp
 6V7fv+dGpDRjaTO5URdvBXNNW5SXEywi05s7cJG4+hAnxeKmT/VeKYTyOVBS6Yh4j2kZ
 Tx/+2/MlG5KMrbwLXLla2UOSxhO0Zm55Wov15/mS0S/Y06CP4RZkN4PSAUi993XW5vtr
 rdQkbe22f9kX5J7SkgX/5EwjTuEI4y7ddUDHIx3GPc1VKnOpk8GhZ98NeQ/f7B/BaG7H
 PVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jr6FBxrLKQUy/lKQ2PBSchzr+Vj1K463klE6EbOiyGk=;
 b=jpsq3coU9fyuEYqjtjdGtHISY7TKAvB+8eLikLjmA8NPadTYHsIrm94UlNycXAJbaY
 wLYu8e8pL3j7XGYqh8b0Lv3Z6VeY0N8JXAXHjLN4fGq2Uq+0oMZoL3iLCjy99bqyX5mR
 Yrakll5Tg/FbRLKC3MZ9wC4Huj+mHW3OzFehtAYOjxjNTCj9j9Go8QEQ53OJOr6OvE5k
 2sgMBgTjEmKrGk1C/NAIc1SHaQTzlqQj+lBmOjOGMqzRHhd9E/rr5iPuHxDMb8He2kWA
 +b/m7DTnDSxJ3qSLwRL5e5IIGAgRxU3ByZiVYsHT+uqz6Zs1IpidzuTR4QMFErcgrVzb
 kDNg==
X-Gm-Message-State: AOAM532p8ok9RT9MSQeSQxmJvkHxNCSCF9r8qouyQxwXtKk51SlMMTXb
 ecfeEjhttoaNLIFuQs9NltmNQ/Oclv/qhw==
X-Google-Smtp-Source: ABdhPJwv9ECaQPWSrgZf6t2Qga1liee1HD9FDOGnU6M0RU08dZa8pAOWlJtea/mGJHG4LLjcvBNhRw==
X-Received: by 2002:ac8:5a43:0:b0:2e1:c68a:6fa0 with SMTP id
 o3-20020ac85a43000000b002e1c68a6fa0mr17916600qta.481.1647907503704; 
 Mon, 21 Mar 2022 17:05:03 -0700 (PDT)
Received: from localhost.localdomain (mont-dyn-146-104.pwrtc.com.
 [205.174.146.104]) by smtp.gmail.com with ESMTPSA id
 a129-20020a376687000000b0067d186d953bsm8214038qkc.121.2022.03.21.17.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 17:05:03 -0700 (PDT)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v4 11/11] target/s390x: Fix writeback to v1 in helper_vstl
Date: Mon, 21 Mar 2022 20:04:41 -0400
Message-Id: <20220322000441.26495-12-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220322000441.26495-1-dmiller423@gmail.com>
References: <20220322000441.26495-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::836
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=dmiller423@gmail.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, farman@linux.ibm.com,
 David Miller <dmiller423@gmail.com>, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Miller <dmiller423@gmail.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/tcg/vec_helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/s390x/tcg/vec_helper.c b/target/s390x/tcg/vec_helper.c
index ededf13cf0..48d86722b2 100644
--- a/target/s390x/tcg/vec_helper.c
+++ b/target/s390x/tcg/vec_helper.c
@@ -200,7 +200,6 @@ void HELPER(vstl)(CPUS390XState *env, const void *v1, uint64_t addr,
         addr = wrap_address(env, addr + 8);
         cpu_stq_data_ra(env, addr, s390_vec_read_element64(v1, 1), GETPC());
     } else {
-        S390Vector tmp = {};
         int i;
 
         for (i = 0; i < bytes; i++) {
@@ -209,6 +208,5 @@ void HELPER(vstl)(CPUS390XState *env, const void *v1, uint64_t addr,
             cpu_stb_data_ra(env, addr, byte, GETPC());
             addr = wrap_address(env, addr + 1);
         }
-        *(S390Vector *)v1 = tmp;
     }
 }
-- 
2.34.1


