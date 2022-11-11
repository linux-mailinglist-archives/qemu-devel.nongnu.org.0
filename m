Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53946625491
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 08:46:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOfp-0006Xk-OO; Fri, 11 Nov 2022 02:42:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfa-0006DC-6n
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:48 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfY-00087A-Nt
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:45 -0500
Received: by mail-pf1-x430.google.com with SMTP id q9so4236664pfg.5
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5vQArXkcT1RDMZRTO1vvTA3LiXCIJpRLbh9UK0Nx/ps=;
 b=qT8XAxGGZFuHOzauYRmYlZffWUsLQ5NRlyolO/qhkXeQoyg0S8iy18NMeUUyBz0W+o
 GrIKUCWxY2FCmeaUSfl+UZVoxJsubX6uPqCkzVtHVMQTC91obvBHLiXj88KL2jl70Q+C
 R/A1Ed0Wb1yy1zVQt7DER8ANkzD5LVr92sNSNxQgsk4LFK80kvcdyPacdJean2khW+7z
 ymVqv4wYK2gFngOFxMfhFDDZpLBNKWILaRR6Ke4UpEA2rNECXm82mwbIncobRxS2C7eA
 cAfkVt/q3R6IBrB0zSjSs8ISvvtch5nwTjK+9obmuYEZ60Tu7spfZyUy+nsHH3/RpKhn
 frxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5vQArXkcT1RDMZRTO1vvTA3LiXCIJpRLbh9UK0Nx/ps=;
 b=chgtmBBr7PsPcn7oEyCOP9Fso30bagh4btEKFfj/Ykofosmyu5tb51JBaJ6OKww7+D
 NiUIwhjGh/tFWK5Yq4ngvZUcoUfFSqgC9gAFf48Lcf6Qrw2BTiu1tVHFNm4rUaZmicy+
 MJfsYW1Lp3B1e73kyXGL51WCZLBRx6TuShCHwC9lfDFR3mUXk2nsn4F7qP1tC2knxTo9
 PhBF4TToEI3QXA/7j/dVdNozQBrY5/UAvvkC/s3EUL6mi2Tp2EvdoYXtJJAZl3HMOoAL
 DpTV7Vw/u0ex6J8wVuN4hQakJonAAcQL21MEsR2qvUEtjj6zQkBRloOQEGYvr5Q/okD4
 aQ+g==
X-Gm-Message-State: ANoB5pkFi3udG4BSsSWIU3f9rf+9GM2VfpeqCSl+hCr34m0MXtPW1LEl
 jjoLb5gNAf3MOt502vh93oYyAF8uWoY1M4HO
X-Google-Smtp-Source: AA0mqf7f7PEp6wYs6w5/mctiNKcQPZsPZt/qWfVGvf+zlzO/0oTpnxIfzhq43OMaWSDr9PmoGbeTow==
X-Received: by 2002:a63:4f50:0:b0:46f:cbcb:761a with SMTP id
 p16-20020a634f50000000b0046fcbcb761amr652075pgl.82.1668152503003; 
 Thu, 10 Nov 2022 23:41:43 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001754fa42065sm976069plg.143.2022.11.10.23.41.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:41:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 v3 15/45] tcg: Introduce TCGCallReturnKind and
 TCGCallArgumentKind
Date: Fri, 11 Nov 2022 17:40:31 +1000
Message-Id: <20221111074101.2069454-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Prepare to replace a bunch of separate ifdefs with a
consistent way to describe the abi of a function call.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-internal.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index 2c06b5116a..f574743ff8 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -27,6 +27,21 @@
 
 #define TCG_HIGHWATER 1024
 
+/*
+ * Describe the calling convention of a given argument type.
+ */
+typedef enum {
+    TCG_CALL_RET_NORMAL,         /* by registers */
+} TCGCallReturnKind;
+
+typedef enum {
+    TCG_CALL_ARG_NORMAL,         /* by registers (continuing onto stack) */
+    TCG_CALL_ARG_EVEN,           /* like normal, but skipping odd slots */
+    TCG_CALL_ARG_EXTEND,         /* for i32, as a sign/zero-extended i64 */
+    TCG_CALL_ARG_EXTEND_U,       /*      ... as a zero-extended i64 */
+    TCG_CALL_ARG_EXTEND_S,       /*      ... as a sign-extended i64 */
+} TCGCallArgumentKind;
+
 typedef struct TCGHelperInfo {
     void *func;
     const char *name;
-- 
2.34.1


