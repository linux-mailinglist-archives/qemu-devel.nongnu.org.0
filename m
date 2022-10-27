Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7198961014A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:14:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7tD-0005is-K5; Thu, 27 Oct 2022 14:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7sI-0005UM-8R
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:45:07 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7sD-0004lY-SL
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:45:05 -0400
Received: by mail-wr1-x432.google.com with SMTP id w14so3703936wru.8
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XBKvcXH7eko7TPHV3oI1LuhtL6vJkLmpUuV3hPcT42o=;
 b=CkoQF7g6quPYh38UuSk7pk9dXlQLtVIMLdHILdg6ZG8gnFWLBtJRBkp0lNmcLtnedS
 C/+sslcZ20FgXLhwo2bd2npNjD1Oep9pERAueHmh5OpFqokvg3rz4eYH4ZxjefEaro/s
 +OaqraK6+7QmHu84z5SIViSnVc5PQ8usNO/AwC3vys0V/JJSS2ewuxH+X46BgeU6a5mW
 kXcvvpTtmL4Tv64TNa/FbSfcFjqw6zbE2M8i12w32C1RVQLV67zd7Bgin5yyROQd3vEo
 TNkrZCGEufIm/aDSuj+BETad0vMIZvu2iaU2PMmcemPpvkfMOQ9TSoROb+xhDgvYAz6S
 QuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XBKvcXH7eko7TPHV3oI1LuhtL6vJkLmpUuV3hPcT42o=;
 b=dCh+h/sN+mMAECOzmJgwgqsjA/45DXP4/k1VNzErMoVMa/y3I4Ifhx3N3WTzjqkODT
 ebqpMF3WgaP50ozoudpCVX4hZJ9AQvJbHQmVmXaFkT6cW19xIZGYr7lvNm/ldwCINSRj
 Oj19NpqB0T8ktPOkLF1tR9qKog2fhAqKnEgm9eRtOjQoiMch0QEJtzzz4tNt4d9CxWrk
 B6OIrFvJJ+R5lvGEuQWhz7LLoTLIfUqbajmruRLAUqWOKgnKnuWYhOUFCvI7VbBmDByv
 t2PvzhB+n5zfnsJVlqm8yIXQTs6TSPEbTfLDa+PL2yri+O/JVJ/or6H/vfu+1fRLOLNN
 Xk5g==
X-Gm-Message-State: ACrzQf1uMg1cVfpQFfhBMJXlviA7xsFeKwBXuyeq+N4zxjkKMPUv/lgd
 SZmgON7kS47UIKaGGY4gKdA+/Q==
X-Google-Smtp-Source: AMsMyM5WJ30YG4C/hrQPh6DHIMEDOQXhgFxLZfCLZUpG+V+5C0UpcxSHGcnNcUr2SN6D0tzeGVnadA==
X-Received: by 2002:a05:6000:2ae:b0:231:86ac:979a with SMTP id
 l14-20020a05600002ae00b0023186ac979amr32750342wry.611.1666896299626; 
 Thu, 27 Oct 2022 11:44:59 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a05600c154f00b003b4a68645e9sm6132496wmg.34.2022.10.27.11.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:44:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 796C21FFCD;
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
Subject: [PATCH  v4 23/30] target/s390x: don't use ld_code2 to probe next pc
Date: Thu, 27 Oct 2022 19:36:29 +0100
Message-Id: <20221027183637.2772968-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027183637.2772968-1-alex.bennee@linaro.org>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This isn't an translator picking up an instruction so we shouldn't use
the translator_lduw function which has side effects for plugins.

Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/s390x/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 5798928473..9df7f9e693 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6612,7 +6612,7 @@ static void s390x_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
 static target_ulong get_next_pc(CPUS390XState *env, DisasContext *s,
                                 uint64_t pc)
 {
-    uint64_t insn = ld_code2(env, s, pc);
+    uint64_t insn = cpu_lduw_code(env, pc);
 
     return pc + get_ilen((insn >> 8) & 0xff);
 }
-- 
2.34.1


