Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 695036137BF
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:20:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUiQ-0004nb-Sp; Mon, 31 Oct 2022 09:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUhx-00034L-QX
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:20:07 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUhn-0005Pv-Ml
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:20:03 -0400
Received: by mail-wr1-x429.google.com with SMTP id l14so15972092wrw.2
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VU5VTL8pBDhAlFZZ+ljlcQ9WYows6GqqoHE20CLByr8=;
 b=HWuCWI5mXe76Fyu4Rr0X24j8lszhBcR7qc7r6PRr8nEYpRTHqKORvXiTALV7Z7mttB
 eTuo/i/jRA2jrE+2Jkb4vxPH7FXY5zQlC/zTdWqNXUVKcMXFyVCWqDHVz/21FMghFpCx
 EFSJQmnipOz+9dX56TzsivKD725GLBCcdTN1Ba4t/sRxKBEYBXSivZsBWBhh9CiZCLXO
 +2ZWIroiYRxAFe/lHkohzaU+KLiScAjNjNeOiJjQ2p9wGp1tG57+A9ewVwTcPB4PZCQ4
 QjOsM5dfelETNczB6xExKcsinRRlb4i3DOEJDcxKPaf36yx9V4mwgVJ+ueDvxYOBMFr5
 62Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VU5VTL8pBDhAlFZZ+ljlcQ9WYows6GqqoHE20CLByr8=;
 b=6xLb6Ve/lJE46eA8+uhB1s5ypALlrP0YsKQDtxKMxjBoJVZUAmR7PrKKd2ZF1Rf1Jp
 RgHsAjHZpAEYeG0FTrE+WEYw1BdMhJi9qkQgcshGhzJzX11gonPTMRKT60nlRFTH093y
 QGUH6Wxq/rlURluFzPwxqAQJy71EqTwDPWMPjrLBPcQwtepMypybIjAWmIw1vm+RYCCy
 x8UZrWv3YCmhPxzlQW0zUT3y335HiK74BbMdwG7sBbMy5sPPcR8+4XEVESKS6tUzlH23
 Zi8HmEGQmhGS5Rm3K/cr5N5AWiR9+2IWOH7Epirfsr8VblHHCduJktDILFDlVNWZKlPg
 wBLQ==
X-Gm-Message-State: ACrzQf2vV9g08DmY0mHL33APITN2iioTu1tuEd9dYnb7Xhxme1Ia72c7
 RJ7M06gi5MjbJ2/II3BY3hIzPA==
X-Google-Smtp-Source: AMsMyM6upuhsZDropkmNWMfiNk7G/lWNFwmnvewCChVP8VZMwswQJelVp0aiMNXi7BtxNK2voqKSow==
X-Received: by 2002:a05:6000:1b0e:b0:236:5c9e:7110 with SMTP id
 f14-20020a0560001b0e00b002365c9e7110mr8326452wrz.650.1667222393497; 
 Mon, 31 Oct 2022 06:19:53 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bd26-20020a05600c1f1a00b003c6b70a4d69sm7247840wmb.42.2022.10.31.06.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:19:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 31FC11FFCE;
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
Subject: [PULL 24/31] target/s390x: don't use ld_code2 to probe next pc
Date: Mon, 31 Oct 2022 13:10:03 +0000
Message-Id: <20221031131010.682984-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
References: <20221031131010.682984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

This isn't an translator picking up an instruction so we shouldn't use
the translator_lduw function which has side effects for plugins.

Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221027183637.2772968-24-alex.bennee@linaro.org>

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


