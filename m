Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D603FF823
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 01:57:19 +0200 (CEST)
Received: from localhost ([::1]:33674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLwa6-0003uH-FX
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 19:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwR1-0006Ws-Tz
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:47:55 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:34366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwR0-0002uF-A9
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:47:55 -0400
Received: by mail-io1-xd2d.google.com with SMTP id y18so4751319ioc.1
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GiaQIIYvzMX3kBsTWafB+XsF4D6nhHn7w46Aapsrz8s=;
 b=x+M1K4eKph3l0XvH+h6Abr8XnUNreGJ2wQkG3CasgHvN3rn+tUCh0aNzI2CQBYyokO
 hrhwZEgmAiW0yw6WHi7ndtdwAKNEc/u5yR1hJ3VcuPSMpCZMPXd0rZbZ9rj7MkCsyIwg
 RPcgf1c/w3Y0LwkhMY+eB7JCqDF0cyQo599BYcr7Be/QgZ/H84DbVY/S10YW6AYcFf1X
 YNZpwopaBDHtgQMS3kzvO+rCPv5sgnaoYRUhuIHhsg3jkxJ3iFiyDhxyd9Cbn6V1oaqR
 q31bAWMAc0crSjo0eI2l4a70XepZTBmxJEN3WGb3Iac+ushSstg7kM6N158qcPsvvid+
 Gttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GiaQIIYvzMX3kBsTWafB+XsF4D6nhHn7w46Aapsrz8s=;
 b=Fr2ApZeDpNFVduUFixxwhngDSyiI8r2Uwb0lyD++r9aLBlZYOmvEJ+RGZDj8A1+veK
 WVrMmGnu5O0OkNG/4YpVVdmo2hkNMDLJp+/t+6KA8jtfIP9JFPtYjPmQBVFcz5qMnk9u
 +zyzsHLQHEq36MyrV2fD+C73KnCTkYEegMFmDrcNgOh8Hd6GQzzl6GmPqIzGcV/xpUeR
 UVro4q0wU2Olhs5LLgBT9GPFILhJvBRxQ4T28ZAkYgsNYC134ZwkVGKtvx89WcqGJWds
 7EGygN+brtqJeIAQuEh9YUR9KiXQ9xZWV/AJDCUt86cenmULCIBtnY7tOUkvMrS51Q5c
 xSCg==
X-Gm-Message-State: AOAM532ecm5boLsx3Tp6jjQfcOfLvrztcxTGEklxPytkAAFg9keEvl2w
 p0ecZbYrXk16IgD0zN2CzICUSILUn+WeOA==
X-Google-Smtp-Source: ABdhPJySyGT1ZQJMNzUlmkeogr6CSNvlLmPiwK15crD1Etvm6cWzWO1CVL5GME3H/cS/PqBcpQcGow==
X-Received: by 2002:a5d:9145:: with SMTP id y5mr754193ioq.200.1630626472930;
 Thu, 02 Sep 2021 16:47:52 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:47:52 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/43] bsd-user: Fix calculation of size to allocate
Date: Thu,  2 Sep 2021 17:46:55 -0600
Message-Id: <20210902234729.76141-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

It was incorrect to subtract off the size of an unsigned int here.  In
bsd-user fork, this change was made when moving the arch specific items
to specific files.  The size in BSD that's available for the arguments
does not need a return address subtracted from it.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/bsdload.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/bsd-user/bsdload.c b/bsd-user/bsdload.c
index 5282a7c4f2..379015c744 100644
--- a/bsd-user/bsdload.c
+++ b/bsd-user/bsdload.c
@@ -143,10 +143,9 @@ int loader_exec(const char *filename, char **argv, char **envp,
                 struct target_pt_regs *regs, struct image_info *infop,
                 struct bsd_binprm *bprm)
 {
-    int retval;
-    int i;
+    int retval, i;
 
-    bprm->p = TARGET_PAGE_SIZE * MAX_ARG_PAGES - sizeof(unsigned int);
+    bprm->p = TARGET_PAGE_SIZE * MAX_ARG_PAGES;
     for (i = 0; i < MAX_ARG_PAGES; i++) {       /* clear page-table */
         bprm->page[i] = NULL;
     }
-- 
2.32.0


