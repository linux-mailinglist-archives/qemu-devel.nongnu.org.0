Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAB04117C0
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 17:05:11 +0200 (CEST)
Received: from localhost ([::1]:54230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKr0-00078g-Kc
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 11:05:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9q-0002uk-PH
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:42 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9U-0000zZ-3h
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:34 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d6so30067616wrc.11
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PNDmDu+RPJM3tZRuKDTq3viSs87Ynb/Gdsx0iNShQxk=;
 b=E+kGMDNan9MJoW9YVki2w2V86xLq3CDhrbL+fG2TvIrlPiwHzAPBVz6om6vIKXWg+K
 jue4GnSh62UmODcohDMfmsG5j0QMWa4BlrLE8Svx28kk54zn5f4XvovLVLACivFhnz4Q
 8Yc+38ZuX78eeWe5YNsvHf08EzYK2dcNsl9amvuYzubc8TG2prKyTmkctgWzyeZZIicg
 yCWtY6o3uoWH6MoRezHHYgyySEECV2eEk5u7XIYrVI2gzRkzAn0CcM3pdud3zFHgHgui
 nX62v7RTB5eCNmV47m906qunkN7DcpSNn19HzjbvSd3MiFfn6jqXJvFMTyGKtCZ/wKKL
 EB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PNDmDu+RPJM3tZRuKDTq3viSs87Ynb/Gdsx0iNShQxk=;
 b=4FwC2qn12TdbsD0ElZ36oXrxDkGGH7hvqgZU/RkfsUhqaHUm7XAVfuJ748x/CgDxJR
 uWZcczEMf39OKrvszIBeYma1b+zNzpaNc+nW159okjNkotGiqGWjDYXqrt0hLT7iMen8
 Bd8IU/74AbfV7x1RGM85xTNx1pgWDIvhX84jir0UiTD3AeK1hG8gkXcYAQJqZBw2Aenw
 TeOvCyqYBMyl7c1EqOBY+1G17Zzc7ett6H4UuDWSP0Cous4kOTe+9dxXvu6a0KsJzHhL
 uF7ow6TiVXkMaK3BsZpFTt6aoFnTdGLPK1U4Tl3tCKviqqdHvuODzVrk4Eiwi0tKHUDO
 TQSA==
X-Gm-Message-State: AOAM533QhVJF5QOf3SUigr4/0aFJke95zi6xVFpk9wUBJbSre7Y5MqWw
 KwqL1Ff5ldQiyE9JmOPClHXQ/s+moYWukw==
X-Google-Smtp-Source: ABdhPJxLcB6sQvK7gdgHB3BjxPTVcO82AZmEUqU8ioTmuYzpZ4rroplQ9YVGuzFQfL+1NY0SrJWPtg==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr12572452wrz.29.1632147608836; 
 Mon, 20 Sep 2021 07:20:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n17sm16229693wrp.17.2021.09.20.07.20.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:20:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/27] target/arm: Optimize MVE VSLI and VSRI
Date: Mon, 20 Sep 2021 15:19:46 +0100
Message-Id: <20210920141947.5537-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920141947.5537-1-peter.maydell@linaro.org>
References: <20210920141947.5537-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Optimize the MVE shift-and-insert insns by using TCG
vector ops when possible.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210913095440.13462-12-peter.maydell@linaro.org
---
 target/arm/translate-mve.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 5d66f70657e..1fd71c9a1ee 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -1668,8 +1668,8 @@ DO_2SHIFT_VEC(VSHRI_U, vshli_u, true, do_gvec_shri_u)
 DO_2SHIFT(VRSHRI_S, vrshli_s, true)
 DO_2SHIFT(VRSHRI_U, vrshli_u, true)
 
-DO_2SHIFT(VSRI, vsri, false)
-DO_2SHIFT(VSLI, vsli, false)
+DO_2SHIFT_VEC(VSRI, vsri, false, gen_gvec_sri)
+DO_2SHIFT_VEC(VSLI, vsli, false, gen_gvec_sli)
 
 #define DO_2SHIFT_FP(INSN, FN)                                  \
     static bool trans_##INSN(DisasContext *s, arg_2shift *a)    \
-- 
2.20.1


