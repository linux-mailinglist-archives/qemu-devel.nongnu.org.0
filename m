Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8894A4FD3
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:06:24 +0100 (CET)
Received: from localhost ([::1]:50292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEcwQ-0001n0-Ry
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:06:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcn0-0004cs-C7
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:56:39 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=40554
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcmx-0002am-5F
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:56:37 -0500
Received: by mail-io1-xd2f.google.com with SMTP id d188so18385148iof.7
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q2wkolIh2lCmSomI63wI2LjQYXEA5OUzuuGqVAAxz7A=;
 b=yKlQdzwsPGz6vQuakhUVpN9KSwzkrfpfw4EYDdc1071PU4J6XKgQK14eonBzotg51C
 ADbiYAY+wfsLw0DyjVUrCeUHkbJg1m4VCGK2ydZjOYITR0cUy6Je7xWsDU+c13YeiKVu
 ltqnDfrWvnd3FSR+xdctgC8vUL3LwjA1szES1y505dtDbjTar0vSXKiIfqPgo5r8mBLt
 gfbZnwDYPqx6xIwyoaKvfM2gmvffS6+C7pNVDzEXWa88aiDiYJCaI2GjM20zB978B8as
 pbzEczMBUcmap2uyiGRz5WF9jLXyPy8BqjWkNDXxNTycJGDlvS8ixtcztkNTmKh4YDkp
 qG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q2wkolIh2lCmSomI63wI2LjQYXEA5OUzuuGqVAAxz7A=;
 b=70FYOxqsS9LU5WJ20VUq70ig6uI4jVXrjiIx4O7YAlvC5qRC9HVBavwuLiNVAWuC+R
 jx26V/UEP30QbBht3GuRwyYOa77ciRsrRqdhbG4b9q408Amtd76KDClF3YFxZ8mz7aKh
 ZXxGUTbrD4XW6X8awYh2dNLkYltrGdNE02DYzrqAFOx9Fp1NbF/JHO2IC9uDa7eO12Rv
 nhleiPYo/lM6hblDfolZ0+xMtnU5ajTo0yHaozrDWQrxrPYEFnc9exrP1U0jch2PBMgX
 E+HQnGlLbucaCqRZ0AWuzKA6onAQbkKlngoAaQcxzCWaxVBFllobYCbyBHpf7xgYK7Cp
 +aTg==
X-Gm-Message-State: AOAM533BbMKUxqYqNgcKU5TqM2woIcIpUm2FemwpPM94LF5t0orYeAk2
 UeztF/v4RLIopszV3gr8uykb501GekWRlw==
X-Google-Smtp-Source: ABdhPJyesfyVcY4JMTYc2N4WMT0l2sqT9nb+a272nkK7+XExAIz9EZTEGQ86Cu6/0GDS/u8wzCW1ig==
X-Received: by 2002:a02:29cd:: with SMTP id
 p196mr11947066jap.100.1643658991491; 
 Mon, 31 Jan 2022 11:56:31 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:56:31 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/40] bsd-user: Complete FreeBSD siginfo
Date: Mon, 31 Jan 2022 12:55:57 -0700
Message-Id: <20220131195636.31991-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fill in the missing FreeBSD siginfo fields, and add some comments.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/target_os_siginfo.h | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/bsd-user/freebsd/target_os_siginfo.h b/bsd-user/freebsd/target_os_siginfo.h
index 84944faa4d3..d50a3034a88 100644
--- a/bsd-user/freebsd/target_os_siginfo.h
+++ b/bsd-user/freebsd/target_os_siginfo.h
@@ -71,11 +71,24 @@ typedef struct target_siginfo {
             int32_t _mqd;
         } _mesgp;
 
-        /* SIGPOLL */
+        /* SIGPOLL -- Not really genreated in FreeBSD ??? */
         struct {
             int _band;  /* POLL_IN, POLL_OUT, POLL_MSG */
         } _poll;
 
+        struct {
+            int _mqd;
+        } _mesgq;
+
+        struct {
+            /*
+             * Syscall number for signals delivered as a result of system calls
+             * denied by Capsicum.
+             */
+            int _syscall;
+        } _capsicum;
+
+        /* Spare for future growth */
         struct {
             abi_long __spare1__;
             int32_t  __spare2_[7];
-- 
2.33.1


