Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 418A76B2E23
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:08:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWz-0004hr-6e; Thu, 09 Mar 2023 15:06:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWw-0004Ym-6R
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:26 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWu-0000oM-HM
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:25 -0500
Received: by mail-pj1-x1031.google.com with SMTP id x34so3192874pjj.0
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392383;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VQ3DvbGAh7DCbzoCet0Y8Bkk313Ld+trduJ+RxPO9xk=;
 b=iQOJ9oZSJfQbXGAFbpeluKxUqUKVyFAn0LwtA4ivL2w0yFf/+Zp8rLYBxPgF9Uiz8+
 A09LJNiP04wY5Z8EZoG2aFHRh8P2W8H+EiGmnOxw+KNMrnbMtpQYl7ztpkLBXrusxbSF
 t8tnROj3oZxbq87SXdd4KvHEQZvAzmz2K/gUaHbbY8BP8w6BvKE3erpuuKXKDME+uhsP
 t0ynCUXuhBJJH0s5ZJuwfAHKNm+a5P07TS5iRyjgN2jwjEsm9Z1cI9l8Qchr7I9Pf/Ut
 9wMTAKmrLE1UkFDkeL/WIqpbNzZipS6dkZCvOWoWNFz2Esuzzm9EVEFXfzOtQZrrVgmc
 WLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392383;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VQ3DvbGAh7DCbzoCet0Y8Bkk313Ld+trduJ+RxPO9xk=;
 b=mTYhWcsc1G3etPYmFCRjEyZa8S+EBz3/8WmN7UeZJ78J6aEfXna0YrkemfYdFXTFgW
 sAo+Ss/c/qvUlwHA7ey+G9x5caj09wEmJoubcd0jrSNeVoumSfMr0Y65wnaMs7wSo+Ki
 E9dWqUlLz3fN8utLr0097vMgpzpFh+VzESR1iLI3Fh0nAWkkjd43y5GFD1eHJQPh76eu
 rvPMRezAtJiZf7Mf5Ylgn7h9eZOjns2Z+rn/EL0aONZfSFi5K7ZmeNCwAhOoDvvOs9kl
 HA5YZ0FgyQKfee9U9lYeaOTOFVJzRarV+cXIOMe2ZkR7WQ2g8tXfsxxyqZj8mY3EeSJQ
 J9eQ==
X-Gm-Message-State: AO0yUKXWxyy6+4ZVirLn7jD9hVn7hh/tRXMNhnqQjrazk2YDyS4nCyxr
 wMTxm6Tadb5E9u0mWNUSRl6nAXbKocZ/cO3+MP0=
X-Google-Smtp-Source: AK7set/loNFmn1RdQmxCA0U1csBmzITHZVWKbxqyCH4rX9V1Dr5Nf6G8SpEPalbGqEMER4VP9t+IKA==
X-Received: by 2002:a17:90b:1d90:b0:233:cd29:f168 with SMTP id
 pf16-20020a17090b1d9000b00233cd29f168mr23671024pjb.24.1678392383015; 
 Thu, 09 Mar 2023 12:06:23 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:06:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 35/91] target/sparc: Remove `NB_MMU_MODES` define
Date: Thu,  9 Mar 2023 12:04:54 -0800
Message-Id: <20230309200550.3878088-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

From: Anton Johansson <anjo@rev.ng>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230306175230.7110-21-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/cpu-param.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/sparc/cpu-param.h b/target/sparc/cpu-param.h
index 72ddc4a34f..cb11980404 100644
--- a/target/sparc/cpu-param.h
+++ b/target/sparc/cpu-param.h
@@ -16,13 +16,11 @@
 # else
 #  define TARGET_VIRT_ADDR_SPACE_BITS 44
 # endif
-# define NB_MMU_MODES 6
 #else
 # define TARGET_LONG_BITS 32
 # define TARGET_PAGE_BITS 12 /* 4k */
 # define TARGET_PHYS_ADDR_SPACE_BITS 36
 # define TARGET_VIRT_ADDR_SPACE_BITS 32
-# define NB_MMU_MODES 3
 #endif
 
 #endif
-- 
2.34.1


