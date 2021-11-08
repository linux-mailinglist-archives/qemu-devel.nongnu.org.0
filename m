Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A60447904
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 04:59:09 +0100 (CET)
Received: from [::1] (port=54112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjvoK-0003CK-Vn
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 22:59:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvhl-0006Fw-66
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:21 -0500
Received: from [2607:f8b0:4864:20::d31] (port=46695
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvhi-0002pd-Dc
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:20 -0500
Received: by mail-io1-xd31.google.com with SMTP id k22so4065379iol.13
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 19:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wZvh57AWzS8inwSMVn1OaBIlb06mOlklnUcQyFDbg60=;
 b=6WpU9QwjmkXfZxOST/jDl4a+upyfk5sH+yrWsqSbb92f229vKOMjy39Y+rmSxlyru/
 Ixo4mjKwt/zJtatMgLmbyvsIVYDru/itWh856mSo9gbu3mGnIiCFfv6uaNEWzxzRnfwu
 dxYxAulgwydpRgAPOLCWl7574xyP3sWD6YZ3577up4PsW+5L0mBqe9Ro+6cX9K8tzzDO
 DkpJlLZfB3T0hT7cC/GBO3Y3mbJZKTyU87lPnZ+TYqpOZhMYz+kjWEBEtAoZ8RA4gjdw
 Hm4R0XcwL0PE0hiuZcIWFIG2s1M3AIBxHdgDW++G80Y3VY5aDD7PqmvWap42cHfx0frz
 ZUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wZvh57AWzS8inwSMVn1OaBIlb06mOlklnUcQyFDbg60=;
 b=kcS9zG3XPIr5Exa43BHggknfLKZBfKXHKAeNxXn0fAHGtBMBpkvYiDNWcQgLsQ12fY
 er9fTZLE4y7O8H2OSjAF+2HFfbkfoaJ0PyiOgmZelOZizhRBljC5AgsKGSKBnwbDWe3o
 rv8q83yNcUny/FL43XzZPG9/Y6xcbDS4NV7ampokuNQ3YezOI0gL0K2fYugBRtVqu/vE
 K3za8AgJF+33sNK7T/yM7F+kDXJJCZm/LEWrAxyUVWXmAkjxJq45bRl+FNoVSWxR76fG
 n7OKSB+IFiLr+g3cpvUn/pTUJW7Htp6dZh7TRlAymfT6m7zKZfjr9EvM9ygh/OZkJSBT
 4TZA==
X-Gm-Message-State: AOAM533ThDjJ/VMOtCcL+soMdvdcAWDr3gnSQlstZU/fI9P5G1v33SkG
 /LtrNdLrM+7D/w3Lz4qY5HHqLmlYv89fbQ==
X-Google-Smtp-Source: ABdhPJwa5WM/P+QpaX1KMqunIruOe9udsn/0/lXa7TbZtM4DDLxW9+qMFP07tG06tXQEcIYyY57Rng==
X-Received: by 2002:a05:6602:2cce:: with SMTP id
 j14mr10796549iow.23.1636343537261; 
 Sun, 07 Nov 2021 19:52:17 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:16 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/37] bsd-user/x86_64/target_arch_signal.h: Remove
 target_sigcontext
Date: Sun,  7 Nov 2021 20:51:07 -0700
Message-Id: <20211108035136.43687-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In FreeBSD, sigcontext was retired in favor of ucontext/mcontext.
Remove vestigial target_sigcontext.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/x86_64/target_arch_signal.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/bsd-user/x86_64/target_arch_signal.h b/bsd-user/x86_64/target_arch_signal.h
index 4bb753b08b..55f742b0a8 100644
--- a/bsd-user/x86_64/target_arch_signal.h
+++ b/bsd-user/x86_64/target_arch_signal.h
@@ -27,10 +27,6 @@
 #define TARGET_MINSIGSTKSZ  (512 * 4)               /* min sig stack size */
 #define TARGET_SIGSTKSZ     (MINSIGSTKSZ + 32768)   /* recommended size */
 
-struct target_sigcontext {
-    /* to be added */
-};
-
 typedef struct target_mcontext {
 } target_mcontext_t;
 
-- 
2.33.0


