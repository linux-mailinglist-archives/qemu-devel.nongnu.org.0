Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF166137BD
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:20:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUi8-00044Q-VJ; Mon, 31 Oct 2022 09:20:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUhr-0002tq-Rm
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:20:01 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUhn-0005Pb-NR
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:19:59 -0400
Received: by mail-wr1-x42f.google.com with SMTP id z14so15924866wrn.7
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0EBDvZ+RnJ5HvMeb/y4i+e3DUIkgxVD1VYY/3oYu2EI=;
 b=vuzkvuW2f8JNqWUeSfHoM7clI/Me281dTiTGmF+nRRiNycyB1KFYY48JXVebarvp6w
 rJg91NPtAw4LBhfcGFxkyXTn2lSsVF64o7ztfE4QcXAJRACoRZj+TmVRjQQn/cf9j6Sq
 EjWyjxakBFwZMlcdPN7wHvu7XKic4HrN0h4RcSElowjBC8dPmhv6Iofme1okmb86MGpU
 46ejZqirg8UmyAMzovkYFn82CZ+z/RG7KXLbmXXCWtjRcUSu0cOx65IrlEMCv8VyyuTW
 drYNAswOmdVLrin0nHU6Koc11/sZtFCjcCOA8EKT6AdSZLSrbb2Cj7+Ywlw3gCcI4swB
 EPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0EBDvZ+RnJ5HvMeb/y4i+e3DUIkgxVD1VYY/3oYu2EI=;
 b=VCQnEE/J6TbpqgdzkIwvCY1qWj87pQIEnX9xYZ0i7+A2jIIhOYX3DKAOLso94b0fSG
 beiUdOnVMgvsX124vdd7l+0vfCfxGdNk1VnvlbEtyKcEulgUYwQD5KbOmIll1ODD8Vd/
 hzRT3ssY0RaJgl6r+qNdH5TgwdSQp//oLEVkVRTPiUUMvBMOf5lvSYlhczIW8Ul2GzCp
 BtL9VrzY/jyEJGKfSO1fA1Dum9yJObB2uNqFi2G8hrVrgwOBATzCnKQT2layzU6oraDu
 Wodc5e7jE6D/2+YxZ7TX6FJMtiT2W8eHdnWZEPotyztVF5nqlFwI7LIOyFUVbaXHF5dl
 WW9w==
X-Gm-Message-State: ACrzQf0WuRi1EQ7q8ryJ3+l7ovPC9FErdh+60S4pLpKZ+udDSMRIk/CM
 VG2SZ8YBZLgpxIcURMzJ1Kb6evne3nPcnA==
X-Google-Smtp-Source: AMsMyM4VLphtS78lWechbCSh0QSjl9JSkTtMdpjnZWAZ/ABizKEwL7TZsijyBZUvvJzca5pojrp0dA==
X-Received: by 2002:adf:e5c3:0:b0:236:5092:7cfc with SMTP id
 a3-20020adfe5c3000000b0023650927cfcmr7910815wrn.285.1667222393111; 
 Mon, 31 Oct 2022 06:19:53 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a7bc5c2000000b003c6c5a5a651sm7169997wmk.28.2022.10.31.06.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:19:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 502311FFBB;
 Mon, 31 Oct 2022 13:10:13 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs)
Subject: [PULL 25/31] target/s390x: don't probe next pc for EXecuted insns
Date: Mon, 31 Oct 2022 13:10:04 +0000
Message-Id: <20221031131010.682984-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
References: <20221031131010.682984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

We have finished the TB anyway so we can shortcut the other tests by
checking dc->ex_value first.

Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221027183637.2772968-25-alex.bennee@linaro.org>

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


