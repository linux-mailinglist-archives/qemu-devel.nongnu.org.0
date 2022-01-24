Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5362499376
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 21:36:04 +0100 (CET)
Received: from localhost ([::1]:58466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC64J-0000hu-Qu
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 15:36:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5lF-0006aE-E0
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:16:25 -0500
Received: from [2a00:1450:4864:20::636] (port=42802
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5lC-0003D7-DT
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:16:19 -0500
Received: by mail-ej1-x636.google.com with SMTP id m4so24688073ejb.9
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 12:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I/xPZzl3lG2SLk3MNBHiq/8rUf4c4cSH6c408EKlwY8=;
 b=NJ2OD4uNJxrnsOwuridk/CJhhGtOmiDyDIOK5CrQIXNNzFHqi5gPqXhWvTsRxgSVPq
 5MNJSXRHgAT6jU1XbKHJr/HMfErWrf6+v0xCrXXeoPOGhRimWeMIHvOzbf+RVYjP5E5R
 dRlQlkra3CPmyUc7ZHgLoPxb61kMh+cKS61C9JpEkbyCwl8YrROuvKVNhadoLkhe8qMt
 F6IIzf/pIHtovbBVVOa4wKbPDkiuQY6oPiaKqRnv6IDzGs4AwBquVNxGiJq+fyYpjbOQ
 SdMcP1SVfNW+gOBYqLLkXNwVDdho/OOzeT6nQG/bWVi7EelZ3nKBYm/d5FXyFClMQ7sw
 S5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I/xPZzl3lG2SLk3MNBHiq/8rUf4c4cSH6c408EKlwY8=;
 b=oYJHE/PLOBuZq2kafvGlmjVWaOLbzV8VGZaqyzMLSPivCtmUBi5wzIYkPgWtjQADMk
 4Rwdsj0nTbx6C7Os52kHWx/WfK5WJkCyYYQMN1l6ZVsCIVE6arj0q9jaoUgwcyNUGeHL
 vw/U1mweyi6FcGFfcAmd2NtjIkRGR0mBXlGaAjkjE8LxRdgK2JBTQUrzyPuXrE9bo/Zi
 arz+UpFBf+EXFmLXcFgPv9+9rSxG2Ql2mEs5vw8oYa1phGWwrNhNf+k6oGDCcxuLkhkU
 ynPdCcXiNTRga0hjFTiYkpwLyUtJ+kfHBfXosp7IPLB1ueJIurw9f5r2I2nWetygX1Gv
 N/nA==
X-Gm-Message-State: AOAM53350J1RBbN42+dsJ5yjAgKIfPfRUvbsSIZkj2aue4AtHYXyWR5V
 KfUHHl1Z/PPtitZJKkcTAtf1gg==
X-Google-Smtp-Source: ABdhPJzWMUbn/E2Mg0RJoCmp3DY/33WoNxLrTu+VsgZjlwxtjLir/6P1RvD/wx7X94Z5TCmoTuqh8A==
X-Received: by 2002:a17:907:9804:: with SMTP id
 ji4mr3298008ejc.409.1643055377128; 
 Mon, 24 Jan 2022 12:16:17 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id lc27sm5410458ejc.142.2022.01.24.12.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 12:16:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C36981FFBC;
 Mon, 24 Jan 2022 20:16:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 04/22] .gitignore: add .gcov pattern
Date: Mon, 24 Jan 2022 20:15:50 +0000
Message-Id: <20220124201608.604599-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124201608.604599-1-alex.bennee@linaro.org>
References: <20220124201608.604599-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: aaron@os.amperecomputing.com, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Luke.Craig@ll.mit.edu, kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The gcovr tool is very messy and can leave a lot of crap in the source
tree even when using build directories.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index eb2553026c..9726a778b3 100644
--- a/.gitignore
+++ b/.gitignore
@@ -15,3 +15,4 @@ GTAGS
 *.depend_raw
 *.swp
 *.patch
+*.gcov
-- 
2.30.2


