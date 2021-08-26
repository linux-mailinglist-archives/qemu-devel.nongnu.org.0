Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9013F9044
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:46:20 +0200 (CEST)
Received: from localhost ([::1]:51710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJNCV-0006LW-NS
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMgB-0006Vo-MJ
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:55 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:44654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMg9-00071L-79
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:55 -0400
Received: by mail-io1-xd31.google.com with SMTP id g9so5557087ioq.11
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nPLdJd4yPgwfWlcJvfA8qkUgavJ5wJjc5bjwXrGy+xs=;
 b=deIm1oXX774yImpZBw1ZgSjUe2gH0P5Tb3OsIocyYhVEZ9UeAeo334TeBhdV0vq/gx
 uENF8lIeGsw9ZQFUER/VoK7oNpYCZ2EBK9NmEdTYYioluuLKeDwIFwK1ER2ev8rn6KO3
 jweoZ7o9jJHGvqcqYRHdwR98D0/7ELyXsIKzDN0HDYzXyKpIiy/qg4pzn/yrUWLL8rju
 pk8hRuve/L0NRBbVOfXxyRLWKx5y76AOIB4gjcLISAH7LEt7bA0PtAu2IswA+VLGANqa
 viU2w7szB81DBMuEGlObSZ+SANAIEnQx9TEDCdfZXjAjXJjI9mfczYL5uPJMiazr5DYx
 ubvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nPLdJd4yPgwfWlcJvfA8qkUgavJ5wJjc5bjwXrGy+xs=;
 b=qfWrHQ/dmX2NybQD8FqqQPNuYx4RF8ec5NFILIwQKplqWhnaJWa/KloaqRQlSeLOYj
 xfe8Z6/xnLn7AOXs2sqsa6NWLKhQiQqe99pHm0MLqFBjrYHa0lcFK7NN6IAZa8FScSD0
 kn6Wy57XxjLiumniek0Vq5yviH9AWLBI01eAkQVIJrM/WNIjEjgPs39cTiPgFkjllWt6
 jQ2oa7YC3KEvXto80WZk61eg62hT1h7BJQfUwLtwM7RjMv2/3lnP6vbrHX3/qVaz7XnM
 ccIdnXAPf25FQ+8w73RFIF4gM+e84HH5MdbUcTa6L3NyG76wvRufGhN+0Swk3npopG/p
 s3JQ==
X-Gm-Message-State: AOAM533dj1xD/gHLANp4yLf1RsK8dZer8z9bdyqRXBv8umis2d3N75vQ
 bCa9XZAeDitY6zH0v617seRr2ZQ+f2erRXJp
X-Google-Smtp-Source: ABdhPJx6ivxhIDtM023ymDyqFPETsHB/Mqu1cSt5uuwy+fudl8gkOH8Ju7ftHmaZEgonbcKzVskwuw==
X-Received: by 2002:a02:ac11:: with SMTP id a17mr1779825jao.100.1630012371158; 
 Thu, 26 Aug 2021 14:12:51 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:50 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 32/43] bsd-user: Make cpu_model and cpu_type visible to all
 of main.c
Date: Thu, 26 Aug 2021 15:11:50 -0600
Message-Id: <20210826211201.98877-33-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

cpu_model and cpu_type will be used future commits, so move them from
main() scoped to file scoped.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index f6643896f6..57669ad7b7 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -52,6 +52,8 @@
 int singlestep;
 unsigned long mmap_min_addr;
 uintptr_t guest_base;
+static const char *cpu_model;
+static const char *cpu_type;
 bool have_guest_base;
 unsigned long reserved_va;
 
@@ -198,8 +200,6 @@ static void save_proc_pathname(char *argv0)
 int main(int argc, char **argv)
 {
     const char *filename;
-    const char *cpu_model;
-    const char *cpu_type;
     const char *log_file = NULL;
     const char *log_mask = NULL;
     struct target_pt_regs regs1, *regs = &regs1;
-- 
2.32.0


