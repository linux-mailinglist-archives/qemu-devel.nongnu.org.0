Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 573F669D32C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:49:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUB8A-00063k-Lr; Mon, 20 Feb 2023 13:43:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6a-0004a3-Ez
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:47 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6P-00048v-HA
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:37 -0500
Received: by mail-pl1-x635.google.com with SMTP id q5so2501759plh.9
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CrQyJxQBvQOf9t0/3BNEJXqkIzID3QnXa0o6v2T4iMs=;
 b=q4DOhCpy6vzv+r7s6BaMAKqC5sK6hRrQd6pMy7yWD4FMOkDPSul7mBmVcmUksb6qOB
 5g8NYMwYPM5+VwV1R9s0MpbbgzG/Dt5H9JhQZvGjrUnuZyeGasUPfPRRcHBxojlZqrh5
 9fQ4YVHh0O8/LSGXyVYoQcHBQc6u/XceUqoiiI3R91+0ew3z4fCBodl+deYaqfT0784q
 WAF+rcsJAaZlm6fjxyjPOSGCWhBk2uxa3KDtGX1KkLlapTrpWHK7Co1Rk1+S8bx17Te3
 pEFrzKLqShb2KSucb9M89v8GyGl9ETouSKZjvwuhyPx4uszRDsWqumMFe6g6UIRvsF0r
 oa+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CrQyJxQBvQOf9t0/3BNEJXqkIzID3QnXa0o6v2T4iMs=;
 b=yCJZz0AEAOQ2Kfyo1IKi84bCzigFjYIw5MvyvZPNPXPLPn8krEIx4ir6Aihy44PZSW
 oDEso4HYpljQHMS7UrnsRPSwNPMSUA5HDLJ9FsCK1HsdK5XRrj2KV6B/PDx5ZRCRIYsg
 QJet4d/mJF59oeXFZiyhN2oyznmUYl9EPCSst2HRR+P2ARlzwPIwWlj3CXG2TqyazQEx
 Z6AI1AfWq2F5sLbNgvbVamoXWhdrhMmmaUMa+846+msAwHR79SORBRciequyMBcDPUlS
 O+5hey3tTxVJYCremPjzD67x5qGbv6SSYunmIfvUar1/KqjjWp/V0OdrycHdlVFvuP63
 mRsA==
X-Gm-Message-State: AO0yUKWSbwB719M++NJiySRkseLB9fWR0ryXbmFClqb0FwIw86DbcdCI
 Ueo8CNSXHvaK0GtmEeomSq1FOUCAA0NU9seB6ac=
X-Google-Smtp-Source: AK7set9GxL4ZqQFP+YR0S5VMBHAN/qfE9qRmfCRKMt6lY8/QRTMsGuB/PdOL1QNexs4VBaS8Q/YRXA==
X-Received: by 2002:a17:902:ce89:b0:19a:9434:af30 with SMTP id
 f9-20020a170902ce8900b0019a9434af30mr5025644plg.18.1676918485373; 
 Mon, 20 Feb 2023 10:41:25 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jk20-20020a170903331400b0019258bcf3ffsm1911676plb.56.2023.02.20.10.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 10:41:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 16/27] target/s390x: Don't set gbea for user-only
Date: Mon, 20 Feb 2023 08:40:41 -1000
Message-Id: <20230220184052.163465-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220184052.163465-1-richard.henderson@linaro.org>
References: <20230220184052.163465-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

The rest of the per_* functions have this ifdef;
this one seemed to be missing.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 160c5eef59..d8dad71814 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -396,7 +396,9 @@ static void per_branch_cond(DisasContext *s, TCGCond cond,
 
 static void per_breaking_event(DisasContext *s)
 {
+#ifndef CONFIG_USER_ONLY
     gen_psw_addr_disp(s, gbea, 0);
+#endif
 }
 
 static void update_cc_op(DisasContext *s)
-- 
2.34.1


