Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 418BA5355D6
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 23:51:05 +0200 (CEST)
Received: from localhost ([::1]:59742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLNn-0000cs-8S
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 17:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCP-0001rk-4I; Thu, 26 May 2022 17:39:18 -0400
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32]:40947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCL-00089E-Tn; Thu, 26 May 2022 17:39:16 -0400
Received: by mail-oo1-xc32.google.com with SMTP id
 s11-20020a4ab54b000000b0035f0178dfcfso506402ooo.7; 
 Thu, 26 May 2022 14:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t1QR62rZfVR+ZIJYCbSorjt2bN524zb9I6F5uFQ8+tw=;
 b=GSZBUFO3yMdSoWOKVBmo+lRV3lVtF5GnMaHJ+syR90pmQEGBDpV3GpsdFi+dYhf+KB
 NQ5iqiHhcxHGiwF3QimHLM6PBihKXjwsS3ixycvgB4pMe7u9Wd6eWUr05dsEv9WZZmEd
 dp8AkbBWFCPh7cp/0aI5j2DTq2BbQAHaEt04hyVPkCja23foRI+UjhK7cBs9iBexHsak
 7JCy0XggEtmnLUSkMx0gPnXNgkVXGqmT87WEsX6yLzDTERgdplpMmDZ7KWL+N9k7Vhfq
 dhPrCJh9dpdFnwIYMilOsgvXnETbBJ5y2ZOhX3NROYkdnW720HqTYXlSp0Xc6UF653sK
 Lepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t1QR62rZfVR+ZIJYCbSorjt2bN524zb9I6F5uFQ8+tw=;
 b=c1PYcTTY7p6XMx0cAGXU5KCduxxEglz6PsdzKEWfThaze9oj1s+CGhO0vRyLHUuxTN
 jy/lrqLHgn60BcS44ev75M2RJFj2+XUJM18Vk/LQOYlDLC6MnSIsR8kGTW+Mryw+wXd9
 0as+b2JBl4oWfqCkXvo5EWTtqOi4qry9tSwT8mw9JK2XuYjKO2dxiwUt8OdLbSDgG74R
 iFznAbqA0FNpIVdIB7ZP8o3VFLYXCZ9E+6dsLuMfJSyTyLytH3bCjTsh8pYJSvrGWI7M
 ECCzKYwghkeuQ3cdc8KWzU2qh/vh6m3SX+DNDj+8O+aWyxwYex+kHqmEnAzGVNwf7co1
 O4RA==
X-Gm-Message-State: AOAM533+FGjqei4ZizB1Py2g+XQp6X6WmTXK+cRDPG0WbLA4I1I5fc7R
 hgeVROmdR6ihdiShJa45kq6pZx2xH3I=
X-Google-Smtp-Source: ABdhPJyrsk4pt2+im5gtayKnRPCLeIfwo6n7VOAvg7XttKrJfj6VTk1PIfz0CgtT10cns9LUwD2wfg==
X-Received: by 2002:a05:6820:1794:b0:40e:5e86:1dd4 with SMTP id
 bs20-20020a056820179400b0040e5e861dd4mr13400222oob.19.1653601151891; 
 Thu, 26 May 2022 14:39:11 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:39:11 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PULL 13/34] target/ppc: use TCG_CALL_NO_RWG in BCD helpers
Date: Thu, 26 May 2022 18:37:54 -0300
Message-Id: <20220526213815.92701-14-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Helpers of BCD instructions only access the VSRs supplied by the
TCGv_ptr arguments, no globals are accessed.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220517123929.284511-4-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index da740ad9af..a02c4be906 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -327,21 +327,21 @@ DEF_HELPER_FLAGS_3(vshasigmaw, TCG_CALL_NO_RWG, void, avr, avr, i32)
 DEF_HELPER_FLAGS_3(vshasigmad, TCG_CALL_NO_RWG, void, avr, avr, i32)
 DEF_HELPER_FLAGS_4(vpermxor, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 
-DEF_HELPER_4(bcdadd, i32, avr, avr, avr, i32)
-DEF_HELPER_4(bcdsub, i32, avr, avr, avr, i32)
-DEF_HELPER_3(bcdcfn, i32, avr, avr, i32)
-DEF_HELPER_3(bcdctn, i32, avr, avr, i32)
-DEF_HELPER_3(bcdcfz, i32, avr, avr, i32)
-DEF_HELPER_3(bcdctz, i32, avr, avr, i32)
-DEF_HELPER_3(bcdcfsq, i32, avr, avr, i32)
-DEF_HELPER_3(bcdctsq, i32, avr, avr, i32)
-DEF_HELPER_4(bcdcpsgn, i32, avr, avr, avr, i32)
-DEF_HELPER_3(bcdsetsgn, i32, avr, avr, i32)
-DEF_HELPER_4(bcds, i32, avr, avr, avr, i32)
-DEF_HELPER_4(bcdus, i32, avr, avr, avr, i32)
-DEF_HELPER_4(bcdsr, i32, avr, avr, avr, i32)
-DEF_HELPER_4(bcdtrunc, i32, avr, avr, avr, i32)
-DEF_HELPER_4(bcdutrunc, i32, avr, avr, avr, i32)
+DEF_HELPER_FLAGS_4(bcdadd, TCG_CALL_NO_RWG, i32, avr, avr, avr, i32)
+DEF_HELPER_FLAGS_4(bcdsub, TCG_CALL_NO_RWG, i32, avr, avr, avr, i32)
+DEF_HELPER_FLAGS_3(bcdcfn, TCG_CALL_NO_RWG, i32, avr, avr, i32)
+DEF_HELPER_FLAGS_3(bcdctn, TCG_CALL_NO_RWG, i32, avr, avr, i32)
+DEF_HELPER_FLAGS_3(bcdcfz, TCG_CALL_NO_RWG, i32, avr, avr, i32)
+DEF_HELPER_FLAGS_3(bcdctz, TCG_CALL_NO_RWG, i32, avr, avr, i32)
+DEF_HELPER_FLAGS_3(bcdcfsq, TCG_CALL_NO_RWG, i32, avr, avr, i32)
+DEF_HELPER_FLAGS_3(bcdctsq, TCG_CALL_NO_RWG, i32, avr, avr, i32)
+DEF_HELPER_FLAGS_4(bcdcpsgn, TCG_CALL_NO_RWG, i32, avr, avr, avr, i32)
+DEF_HELPER_FLAGS_3(bcdsetsgn, TCG_CALL_NO_RWG, i32, avr, avr, i32)
+DEF_HELPER_FLAGS_4(bcds, TCG_CALL_NO_RWG, i32, avr, avr, avr, i32)
+DEF_HELPER_FLAGS_4(bcdus, TCG_CALL_NO_RWG, i32, avr, avr, avr, i32)
+DEF_HELPER_FLAGS_4(bcdsr, TCG_CALL_NO_RWG, i32, avr, avr, avr, i32)
+DEF_HELPER_FLAGS_4(bcdtrunc, TCG_CALL_NO_RWG, i32, avr, avr, avr, i32)
+DEF_HELPER_FLAGS_4(bcdutrunc, TCG_CALL_NO_RWG, i32, avr, avr, avr, i32)
 
 DEF_HELPER_4(xsadddp, void, env, vsr, vsr, vsr)
 DEF_HELPER_5(xsaddqp, void, env, i32, vsr, vsr, vsr)
-- 
2.36.1


