Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06146AED4F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:03:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbbI-0007EP-17; Tue, 07 Mar 2023 12:59:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbap-0006UX-Jr
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:19 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbam-0000F5-V2
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:19 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so12653146pjz.1
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211956;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nf7M4cMG97D8jV+U1nrBJYA2YIqsSQbUGEZIMmxooNE=;
 b=sAY30ksrXPil2mKUdpsUqKfIBK31lE6pTKeFYTbXpv0dZ1/LlBEruTu1CSXxc9UByb
 DHU//BMSIurbQoJxDrXPesOm7MzXotx3zPqVTTJcvT9YXuhh3saZqWawrLWEBjBvYeYg
 hOESRBzWtNfgHgHOdeQY8bpnsJsiYzmwbbxYVToKhd71zBe9WvUdYe3i6vMTZWkcI/MY
 pdpdtNCwUKmQWlTMQHxyrikfl6sWSYmpTM6ylL1mXmmcVTIpXaF9vAM2yWhj8xE3J/AR
 scudiRtxQN2QH6zaatufWeZbcd/2Ylr9MFdRILbxyo1x1i5fqmRqjj5vKWlTlYtE63Pw
 1zEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211956;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nf7M4cMG97D8jV+U1nrBJYA2YIqsSQbUGEZIMmxooNE=;
 b=pSTmWLAe0Lg2+ToUBcAFVruqOimcR+q2c8vjmVm8mQONAzcAf2cIj/7pzGWUZF7Fb4
 TW0balaVxFBFI8NB5qqvpgHLWb+Ak2SlTHBvb5iun4CvMkSXOROYY8OPzzgK5IT+ALkT
 4oAQxPVnDKNBtRNsQq1PHq+6aBouQ9iXJvXzi5o5bmVYampDXuQunBxo4YjUG+SDvnLY
 6fQ3cpPf87Q1Q7NqzmhGvUdFvXGQ4tQCauMRx+ZRfu3yZWZUVTtc6Meo2fCYjvROErGo
 VbfKx3m/2HTayFmQGB48RweFaC9W73O22IIjOI6hPVbXDY15EzDrw2R4K6cYWLtx0e5a
 /jYA==
X-Gm-Message-State: AO0yUKWiXLp3wnxuG2t6fWx7qfXdDr4Ukqs05Fk8u8pxF4kbKk38C+R4
 01PjBwbJj83HDBW79jsk///PX7FLPxjnl3uGieU=
X-Google-Smtp-Source: AK7set/BiNI3TN6Qrzy0KjNBurC8bICGtAswTOBA0zk6AYKRY2fp/ZJqWlROC+QsGJNYYoknKn//lA==
X-Received: by 2002:a17:902:d4c3:b0:19c:c184:d211 with SMTP id
 o3-20020a170902d4c300b0019cc184d211mr18290626plg.37.1678211956013; 
 Tue, 07 Mar 2023 09:59:16 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:59:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 33/67] target/s390x: Remove `NB_MMU_MODES` define
Date: Tue,  7 Mar 2023 09:58:14 -0800
Message-Id: <20230307175848.2508955-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

From: Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230306175230.7110-19-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/cpu-param.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/s390x/cpu-param.h b/target/s390x/cpu-param.h
index bf951a002e..84ca08626b 100644
--- a/target/s390x/cpu-param.h
+++ b/target/s390x/cpu-param.h
@@ -12,6 +12,5 @@
 #define TARGET_PAGE_BITS 12
 #define TARGET_PHYS_ADDR_SPACE_BITS 64
 #define TARGET_VIRT_ADDR_SPACE_BITS 64
-#define NB_MMU_MODES 4
 
 #endif
-- 
2.34.1


