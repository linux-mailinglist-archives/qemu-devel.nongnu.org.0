Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEECB57124E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 08:38:44 +0200 (CEST)
Received: from localhost ([::1]:39178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB9Xe-0007ok-Ro
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 02:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB9G9-00044L-4Q
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 02:20:37 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:38569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB9G7-0002Iw-Dx
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 02:20:36 -0400
Received: by mail-pg1-x52b.google.com with SMTP id e132so6706336pgc.5
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 23:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NKgbO3syVPPBCsmhbVDzMpoOrW9wAuvKeglhNug4je8=;
 b=ug9oUTbB+WFA4/J0VCeH2DW3Th273vTRyh52yPW+O7DQZhB6jRwQ1uRhITEEePFd9d
 L0UZKZvHdSGSoZLdwyWIHk8vdT85gPtkAhV1C2LJWVwGnIZCOFkYE3vCBJMU5SAP/6FD
 aD0kPNV7TvWw2D89w/q76d9Mj83uHvMnNFniXoOHWVBVEYs7Lda6YeQyjWkiqKSmONA9
 2gNu96FBFtvmiB0aA6u4J+8UzAIU2CRp6WwI2XczfvJQybLcCc5dNKMgIN5mdNxKTp+I
 ztJ4Wdh+OVrrlseVRYOpyH79X/llegPCh7ekSzwrQCEA+o7JBAKtzOjBCbGVJ3QhJbYb
 u0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NKgbO3syVPPBCsmhbVDzMpoOrW9wAuvKeglhNug4je8=;
 b=OxUaCptumk2vaZnHqSqeaFaHKPuFyMxWDD3JBcwzYacqRutcMVMgGoPK/q/kzSGV1x
 2oxQURmAYYd6J3Bb9UF8qEL2wefHIKyuZQ34vtkpf7kW+EfIN39dLFJKIoBTPvHEB+8e
 F/Od2ZTVHOqyBpqceYc0f+E3kAxB7h0tZdbc2+msX9nuvu/M+H/Dw4EqXpVl5fkyrkRK
 1W+HL9Ir67aWQITAPBZpirzDGrAmPiXBHQGN7oFHgIY/4U5MhgTeqb4glHpTMOS+NjZ3
 clVbag0US7nqC8RrZVzu0G1v5nIskH0GhHcD+j2fX/AlCDFYqR+mfwQ6zWl39wz/CaX8
 5vCg==
X-Gm-Message-State: AJIora/F3qNc18iwy/dHiZ3cPOpZ/Ocsq3Y1iEt5pcidl1DkJFsWW2Z7
 8F3uVKIbdRNkrjYqJSqN2DquQFHeRLbEJ7rT
X-Google-Smtp-Source: AGRyM1uOjaTtlrnc7a9nJlXQ8N9kpQxZug9LzbPQaWLP7JIUePmHQ1PJRet+J/Oc8iGUF3yvfhKHag==
X-Received: by 2002:a05:6a00:2487:b0:525:7c72:ee73 with SMTP id
 c7-20020a056a00248700b005257c72ee73mr21986951pfv.47.1657606833999; 
 Mon, 11 Jul 2022 23:20:33 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 f2-20020aa79682000000b0052ab7144de8sm6040776pfk.10.2022.07.11.23.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 23:20:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Shaobo Song <shnusongshaobo@gmail.com>, qemu-stable@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 1/2] tcg: Fix returned type in
 alloc_code_gen_buffer_splitwx_memfd()
Date: Tue, 12 Jul 2022 11:50:24 +0530
Message-Id: <20220712062025.197634-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220712062025.197634-1-richard.henderson@linaro.org>
References: <20220712062025.197634-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Shaobo Song <shnusongshaobo@gmail.com>

This fixes a bug in POSIX-compliant environments. Since we had allocated
a buffer named 'tcg-jit' with read-write access protections we need a int
type to combine these access flags and return it, whereas we had inexplicably
return a bool type. It may cause an unnecessary protection change in
tcg_region_init().

Cc: qemu-stable@nongnu.org
Fixes: 7be9ebcf924c ("tcg: Return the map protection from alloc_code_gen_buffer")
Signed-off-by: Shaobo Song <shnusongshaobo@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220624150216.3627-1-shnusongshaobo@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/region.c b/tcg/region.c
index 71ea81d671..88d6bb273f 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -548,7 +548,7 @@ static int alloc_code_gen_buffer_anon(size_t size, int prot,
 #ifdef CONFIG_POSIX
 #include "qemu/memfd.h"
 
-static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
+static int alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
 {
     void *buf_rw = NULL, *buf_rx = MAP_FAILED;
     int fd = -1;
-- 
2.34.1


