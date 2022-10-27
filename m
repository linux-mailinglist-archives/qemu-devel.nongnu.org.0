Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E7A610180
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:20:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo82d-0008WR-FG; Thu, 27 Oct 2022 14:55:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo823-0008VB-81
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:55:11 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo81m-0006A3-D8
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:55:10 -0400
Received: by mail-wr1-x42a.google.com with SMTP id w14so3741077wru.8
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Q3YCOQ/uatq/vj7coPL1TuVcy0GWDngH2i5ai2OFfY=;
 b=I7hlB2IZcpJRTrfOvVziq6StBilTSYSLefTTGh/FztEd539tyd/hbZQ8QjPEOAdA1W
 +ZYQhTqjsax/w4napLZr9C10nwBTtex0Ljo7b9PgVCXHXOA/4Er2MUzFB4YM9098UwOR
 kfugyxQwhGc76311DwKO3SJWbFdhvcP1pLMYRqgRPLg0aZ18IDtY2xFzFzE+px9Emvp3
 XobIL6UCIFgtmy7wS5VQEIaafBZeFyLOjcfb/V3Z/cAcPbxUWH5r/AeAqwwoSjliDn4o
 mhW/sFcmFJlEL8Gi8+5ng5MdF6YKFT19fpdikS8ygF7md4KcE7NLSNY70R1bMesDbFVo
 6e2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Q3YCOQ/uatq/vj7coPL1TuVcy0GWDngH2i5ai2OFfY=;
 b=siGfF7CinPm2CypMTXpKYSsgthkmlSk93JUTZpoCE0l2em3bWlQuMVWiCI6w9oJjqo
 T5WpIcnzZzzdphSjMj37E8yPAph8CXWrtJPyH58rBHPblbb9tjQkjBBGHzDKGM4cnMVT
 1oDPYRsaSUtkW8LEMEnoKiAYFHzlmR1InnYEcn6s45NHL9XPzv0vyjcTPFzoKVoThD+Y
 kG0PdCyQZVE11slzhS1/D2Z13hlQEndX+on+7j6ZWfB6KQDLC4Qo72ePgG8Cz36ggVPS
 a50iGCDCZCVVDBmxSbYrrVCQ098sZo5TLz6hVFlcdqQsf+rPTGDVo/jbOFO5Wrj4Ggp6
 zP3g==
X-Gm-Message-State: ACrzQf3kGoD6z4gdVfMp4GIWDk3nixpvpjQQ3Q7Ydtfk5SuCawENDBzE
 484pBl2Zo5B+lUAVA/VtxY9u5g==
X-Google-Smtp-Source: AMsMyM6UY1ytxjrjeMt+yDlMWAHtajSj6jNZDTAeapz+SVJlLjtyc0n7Ej4G6kpCRW9z2R+G50ijmg==
X-Received: by 2002:a5d:4e0d:0:b0:230:4e21:cb1e with SMTP id
 p13-20020a5d4e0d000000b002304e21cb1emr32325877wrt.232.1666896891804; 
 Thu, 27 Oct 2022 11:54:51 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a05600c418600b003c6b874a0dfsm2479446wmh.14.2022.10.27.11.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:54:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8F4481FFCE;
 Thu, 27 Oct 2022 19:36:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs)
Subject: [PATCH v4 24/30] target/s390x: don't probe next pc for EXecuted insns
Date: Thu, 27 Oct 2022 19:36:30 +0100
Message-Id: <20221027183637.2772968-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027183637.2772968-1-alex.bennee@linaro.org>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We have finished the TB anyway so we can shortcut the other tests by
checking dc->ex_value first.

Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/s390x/tcg/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 9df7f9e693..f4122db434 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6624,9 +6624,9 @@ static void s390x_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 
     dc->base.is_jmp = translate_one(env, dc);
     if (dc->base.is_jmp == DISAS_NEXT) {
-        if (!is_same_page(dcbase, dc->base.pc_next) ||
-            !is_same_page(dcbase, get_next_pc(env, dc, dc->base.pc_next)) ||
-            dc->ex_value) {
+        if (dc->ex_value ||
+            !is_same_page(dcbase, dc->base.pc_next) ||
+            !is_same_page(dcbase, get_next_pc(env, dc, dc->base.pc_next))) {
             dc->base.is_jmp = DISAS_TOO_MANY;
         }
     }
-- 
2.34.1


