Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B168944F76D
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Nov 2021 11:37:21 +0100 (CET)
Received: from localhost ([::1]:52214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmCsy-0005Wx-SW
	for lists+qemu-devel@lfdr.de; Sun, 14 Nov 2021 05:37:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmCrg-00045C-3u
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 05:36:00 -0500
Received: from [2a00:1450:4864:20::331] (port=36453
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmCre-0000hN-Dz
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 05:35:59 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso13343348wml.1
 for <qemu-devel@nongnu.org>; Sun, 14 Nov 2021 02:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eGSHLpNAu9g6Np9tb4uVWnbjp2oiYs6nIhg97qpdgNI=;
 b=c5cx+mdkgENL6oiRjLGjcOir6Dn3CM6yGVBHa3Hm+muVdmQiwKQjnLw/GcMY0jFlwJ
 B0ZBAfg9l6lr5CpYZpKguULVYASkxiLw67gAU80TDugStnIBWDhVFcjnpmYhXirsVIZQ
 D0x3XHBWsydI18nJC6G0N0nu5fpCWYl+86oN3Hl21XRv4xzrE59TBwJzSbp2olzPogte
 x4Yvi8ssMtL3jEzkh2WE4yfwSF97hDdylUVzKu0t5mF7b04lb78HS7Uzr/kh1/piTEvO
 Kgsti14/NpQ5P9rbCd/L+tRVaF6DtPVKh0SZi5OW5nVNSHZzqMAm7Fo+CMeCSHsdgdL2
 N5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eGSHLpNAu9g6Np9tb4uVWnbjp2oiYs6nIhg97qpdgNI=;
 b=anTXaxd7ns7TC1WyDIay15Of1QTKyW7zwRVuJQj0woAct/vLAlslfjjkT/I743CZqG
 83ZgAxHeWmheL6nIe5l+6rCTIk6hnJxcZSr3pLUAhioBFqYQ5YYsfzdEV6JAg7fd7AhW
 IiZ7xXaUW5DayzmBWkg021bewD7INujbWc7BuF8YJQibfVGqzrGCOt8d8/AzhlhZnx7x
 urPoqkLqZZk7s8Cka0zPG1CH/sqZCNajbghEGQodZ1PGRbJnGFuC5HNqJ7dF2YFxAyyM
 tcmg9iIGd76Cy0t6q6YP93nT0ch6SOGTu+p6Wve9NKyu9XAKWJ1HHq7WEQUWuzA/0MAA
 o20g==
X-Gm-Message-State: AOAM533l645APMu4oM8FEIqFUXu+WZzy+7ukl/iI97E+QE08Muf7X+lq
 cxsUb9ZqMnBimbKQKysuxhBsveFgGuLQbhOzTYw=
X-Google-Smtp-Source: ABdhPJzRiSqKOiDA+4kUzY4SL0ozjz9k7DW/Iteb/T7aXrYYhphY/tQzxn8ri5iVwjh1EXVeQThjAQ==
X-Received: by 2002:a7b:ce8c:: with SMTP id q12mr32997166wmj.91.1636886156605; 
 Sun, 14 Nov 2021 02:35:56 -0800 (PST)
Received: from localhost.localdomain (60.red-95-126-179.staticip.rima-tde.net.
 [95.126.179.60])
 by smtp.gmail.com with ESMTPSA id x1sm10638852wmc.22.2021.11.14.02.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 02:35:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] linux-user: Fix member types of target_dirent64
Date: Sun, 14 Nov 2021 11:35:38 +0100
Message-Id: <20211114103539.298686-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211114103539.298686-1-richard.henderson@linaro.org>
References: <20211114103539.298686-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The host uint64_t (etc) does not have the correct
alignment constraint as the guest: use abi_* types.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall_defs.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 98b09ee6d6..41aaafbac1 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -437,9 +437,9 @@ struct target_dirent {
 };
 
 struct target_dirent64 {
-	uint64_t	d_ino;
-	int64_t		d_off;
-	unsigned short	d_reclen;
+	abi_ullong      d_ino;
+	abi_llong       d_off;
+	abi_ushort      d_reclen;
 	unsigned char	d_type;
 	char		d_name[];
 };
-- 
2.25.1


