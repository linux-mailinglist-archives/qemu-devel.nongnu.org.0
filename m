Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F2A3905CB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:46:02 +0200 (CEST)
Received: from localhost ([::1]:41928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZFp-0000RO-9y
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbu-00043T-8W
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:46 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbk-0004i6-PT
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:45 -0400
Received: by mail-wr1-x42a.google.com with SMTP id p7so28891920wru.10
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NubKq8M0KvXlnOC04LMkbA9LQLcN3/1FylxUyolKBho=;
 b=EWIOE+vpN3pmTA/hlsu2iR/8l2fKXxGExNyNKR5tcbngcSdUOXi+KhxUyv7sp7uMZb
 CdLfLt9SVJTdhkRPeBEnvV8eMTZ37OpK+GiIUbet73IAk7fmrOs6lKg2CsLgyYcRKr4M
 p/iZWcJcPLIg9CelWnEocusoF/ys/9d6pS984rfmZVxM1VLRwfE2P0so/QzPsApi0+1z
 IQYL2T+ZuShOVhF/d6FBFGTjTErOXyaGImRd2os6uKdlTz3z6bbkeQjIeVs/uFqNQAm8
 TACE/tLceBnDezssQdqRuorEzRiZT6egi1oWQHrZ2KhxHWib4mlTsXQ0flXvsvTUlPAG
 DnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NubKq8M0KvXlnOC04LMkbA9LQLcN3/1FylxUyolKBho=;
 b=sOcF9C6NIDeZdNhIJnyzKZ3ymhKX4Nn1E7HH8UKzkFFzYXKmqkYpCDCx+uPrOucHFf
 QspRe8SFOwS0pdmZCefm4E+2FAIo6GVY5B7AWUHp8UO/8pJqz6oR1lCoHB7xFTyl9MbW
 E5Te6MupFVu0XTFKOu0GfnhgwxbfEK5zOYx3bDv2QfZSyEjDy5VEHa+yJD6qTqsefKVq
 U6UhA9UEXJaBeNDbMfEhiC5h1RU6X0OPbCSXfVlsbj1v6H58h4wKxwHEgGBcs2yWad0N
 iufj8mfgEGgLG7ppPckVzNXEvSFvdKyQQlMIEwfin/27Pc6/jpUzSDyGGy/3ULFDF50i
 decw==
X-Gm-Message-State: AOAM532sP/JKnKR9lvwr61I7aWwg29NIRVv4eD96NFV+3YX5FcMP2XCb
 B1OKcQ4c/I12ZwypVUxzh+FnRMNZgrNSVfgx
X-Google-Smtp-Source: ABdhPJxIUo697aAzr2H8lI7QXicGtu29SrImWfFYuqja3JfslQmhMeNsfaeTBHHfPRtOv9gyJ1wOfw==
X-Received: by 2002:a5d:64a6:: with SMTP id m6mr28140428wrp.425.1621955075519; 
 Tue, 25 May 2021 08:04:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 070/114] target/arm: Use correct output type for gvec_sdot_*_b
Date: Tue, 25 May 2021 16:02:40 +0100
Message-Id: <20210525150324.32370-71-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

The signed dot product routines produce a signed result.
Since we use -fwrapv, there is no functional change.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-49-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vec_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index a3d80ecad05..48e3addd814 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -378,7 +378,7 @@ void HELPER(sve2_sqrdmlsh_d)(void *vd, void *vn, void *vm,
 void HELPER(gvec_sdot_b)(void *vd, void *vn, void *vm, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
-    uint32_t *d = vd;
+    int32_t *d = vd;
     int8_t *n = vn, *m = vm;
 
     for (i = 0; i < opr_sz / 4; ++i) {
@@ -408,7 +408,7 @@ void HELPER(gvec_udot_b)(void *vd, void *vn, void *vm, uint32_t desc)
 void HELPER(gvec_sdot_h)(void *vd, void *vn, void *vm, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
-    uint64_t *d = vd;
+    int64_t *d = vd;
     int16_t *n = vn, *m = vm;
 
     for (i = 0; i < opr_sz / 8; ++i) {
@@ -439,7 +439,7 @@ void HELPER(gvec_sdot_idx_b)(void *vd, void *vn, void *vm, uint32_t desc)
 {
     intptr_t i, segend, opr_sz = simd_oprsz(desc), opr_sz_4 = opr_sz / 4;
     intptr_t index = simd_data(desc);
-    uint32_t *d = vd;
+    int32_t *d = vd;
     int8_t *n = vn;
     int8_t *m_indexed = (int8_t *)vm + H4(index) * 4;
 
@@ -501,7 +501,7 @@ void HELPER(gvec_sdot_idx_h)(void *vd, void *vn, void *vm, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc), opr_sz_8 = opr_sz / 8;
     intptr_t index = simd_data(desc);
-    uint64_t *d = vd;
+    int64_t *d = vd;
     int16_t *n = vn;
     int16_t *m_indexed = (int16_t *)vm + index * 4;
 
-- 
2.20.1


