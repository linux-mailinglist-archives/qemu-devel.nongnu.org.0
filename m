Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9419C445EA3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 04:33:03 +0100 (CET)
Received: from localhost ([::1]:54006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mipyQ-0007uP-DR
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 23:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplk-0004Gr-BG
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:19:56 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:46872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipli-000458-Rx
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:19:56 -0400
Received: by mail-il1-x133.google.com with SMTP id w10so8225941ilc.13
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 20:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wZvh57AWzS8inwSMVn1OaBIlb06mOlklnUcQyFDbg60=;
 b=5aexJ+o/VItz8FeK7eHwx5APZdqxmqLLl+Hjs87Ai47PgrN+qKs/zwd1nJohu8dqTK
 m63BcsaRYG2w6D4qJgAushkRS7L5IXXXOM2f2INj985OZJH6Q8PunATELIk8CzDa+XTD
 881jn71tQZLAmtEID/KhnlHSmhAFiQ0MFkM0pY4gthCPTUuEYQkpvIMAK5LhGglRFBk4
 QUP+zhGLj3Y++jbFGmvU5ePszw85V+O6o4Uaprwd+3GiYX2TzBEnt/1bZbNb9a+rtgCP
 FHFxqgaQ0Hu6IoikrIAlQMVXynD0drplCZ+wkEIRdhrcA3QcMdGNqK3pxG3xkyGpkpeA
 HRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wZvh57AWzS8inwSMVn1OaBIlb06mOlklnUcQyFDbg60=;
 b=1SjOKQov/GCxzEp92OBeZPi02xwF7FMHNGQJcXuhWR/4lROEcERDFeehfTMhQnba1H
 SCXE6QNOZTicdNL2WfKiBoo0/Q7JCYIAguyFhrrwwDqRCYH4dXVQCmmOCEBvGBMscTnE
 WsttjyxFCFZkpsyQoYukiuLP0Q42a7jeC9uFa3XDCHuuQqpXzlaZIdzPu5sppa6azfCN
 WHjVmw6E/2FtpgwioA24SYry0i/1Xn1kKCpFTWOthG/wgmQh+RVtO2EZU2Pq9ll9QOZ/
 OxHfanp0n8t/87RaDX9sR5FG0KKNneMVL0svYCUHsypvgrzVgzy/u/fQuFSAWIWEcnbx
 ZDEQ==
X-Gm-Message-State: AOAM530A1dOs/TDjTXvWPSTUpeHAZgutDCjThYTIcfgc/oe65dhV+4ej
 sW1GPyw5XgrHGkIDy2EI4ZuXtgKy+VsypQ==
X-Google-Smtp-Source: ABdhPJzZAqgytSnO5QI0vvY4aagc/iecK29jO+8jNmDZ+yO3Y04d6P7QOjBjiXiW11cYSBd84mOriQ==
X-Received: by 2002:a92:3642:: with SMTP id d2mr38342564ilf.91.1636082393582; 
 Thu, 04 Nov 2021 20:19:53 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:19:53 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/36] bsd-user/x86_64/target_arch_signal.h: Remove
 target_sigcontext
Date: Thu,  4 Nov 2021 21:18:49 -0600
Message-Id: <20211105031917.87837-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>
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


